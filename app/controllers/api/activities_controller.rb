class Api::ActivitiesController < ApplicationController
after_action :set_access_control_headers
skip_before_action :verify_authenticity_token, only: [:create]


#Gets the list of activities
def getActivities
    
    begin
      
      role_type = params[:role_type]
      
      case role_type
      
      when "Admin"
        @activitiesForAdmin = Activity.where(school_id: params[:school_id]).order("created_at DESC").page(params[:page]).per_page(7)
        render json: @activitiesForAdmin
      
      when "Parent"

        if params[:last_activity_id] != nil
          
          
           @activities = Activity.where("(classroom_id IN (SELECT `class_registrations`.`classroom_id` FROM `class_registrations`
                                  WHERE `class_registrations`.`student_id` = ?) AND activities.id < ?) and (student_id is null or student_id = ?)", params[:student_id],params[:last_activity_id], params[:student_id])
                                   .joins('left join students on activities.student_id = students.id')
                                   .order("created_at DESC").page(params[:page]).per_page(10)
                 

          return_activities
        elsif params[:first_activity_id] != nil
          
          
          @activities = Activity.where("(classroom_id IN (SELECT `class_registrations`.`classroom_id` FROM `class_registrations`
                                  WHERE `class_registrations`.`student_id` = ?) AND activities.id > ?) and (student_id is null or student_id = ?)", params[:student_id],params[:first_activity_id], params[:student_id])
                                   .joins('left join students on activities.student_id = students.id')
                                   .order("created_at DESC")

          return_activities
        else
            
            @activities = Activity.where("classroom_id IN (SELECT `class_registrations`.`classroom_id` FROM `class_registrations`
                                           WHERE `class_registrations`.`student_id` = ?) and student_id is null or student_id = ?", params[:student_id], params[:student_id])
                                   .joins('left join students on activities.student_id = students.id')
                                   .order("created_at DESC").page(params[:page]).per_page(10)
            return_activities
          
        end
        
      when "Teacher"

        if params[:last_activity_id] != nil
            @activities = Activity.where("classroom_id = ? AND school_user_id = ? AND activities.id < ?", params[:class_id], params[:user_id], params[:last_activity_id])
                                            .joins('left join students on activities.student_id = students.id')
                                            .order("created_at DESC").page(params[:page]).per_page(10)  

            return_activities
        elsif params[:first_activity_id] != nil

             @activities = Activity.where("classroom_id = ? AND school_user_id = ? AND activities.id > ?", params[:class_id], params[:user_id], params[:first_activity_id])
                                            .joins('left join students on activities.student_id = students.id')
                                            .order("created_at DESC")

             return_activities
           else 

            @activities = Activity.where("classroom_id = ? AND school_user_id = ?", params[:class_id], params[:user_id])
                                            .joins('left join students on activities.student_id = students.id').order("created_at DESC").page(params[:page]).per_page(10)  
            
            return_activities
          
        end
        
        #Activity.where("classroom_id = ? AND school_user_id = ?", params[:class_id], params[:user_id]).order("created_at DESC")
        #@model.to_json(:only => [:id,:name,:homephone,:cellphone], :methods => [:avatar_url])
      end

    
    
    rescue Exception => e
        render json: e.message
    end

end

  

def create
    
 result = { status: "failed" }
    begin
      
      @activity = Activity.new
      if params[:image] != " "
        params[:image] = parse_image_data(params[:image]) if params[:image]
        @activity.image = params[:image]
      end
      
      if params[:student_id] != " "
        @activity.student_id = params[:student_id]
      end

      @activity.title = params[:title]
      @activity.message = params[:message]
      @activity.classroom_id = params[:classroom_id]
      @activity.school_user_id = params[:school_user_id]
      @activity.school_id = params[:school_id]
      if @activity.save
        result[:status] = "success"
      end
      rescue Exception => e
        Rails.logger.error "#{e.message}"

        render json: e.message
    end

    render json: result.to_json
      ensure
        clean_tempfile


end

def load_activities_for_parent(option, value)

     @activities = Activity.where("classroom_id IN (SELECT `class_registrations`.`classroom_id` FROM `class_registrations`
                                  WHERE `class_registrations`.`student_id` = ?) and student_id is null AND "+ option +"or student_id = ?", params[:student_id],value, params[:student_id])
                                   .joins('left join students on activities.student_id = students.id')
                                   .order("created_at DESC").page(params[:page]).per_page(10)
                 

end

def parse_image_data(image_data)
  
    #imageDetails = image_data.split(" \" ")
    @tempfile = Tempfile.new('RackMultipart')
    @tempfile.binmode
    @tempfile.write Base64.decode64(image_data)
    @tempfile.rewind

    uploaded_file = ActionDispatch::Http::UploadedFile.new(
      tempfile: @tempfile,
      filename: params[:fileName]
    )

   uploaded_file.content_type = "image/jpeg"
    uploaded_file
  end

  def clean_tempfile
    if @tempfile
      @tempfile.close
      @tempfile.unlink
    end
  end
  
def return_activities
    
      studentList = []
            
      @activities.each do |activity|
        studentList.push(activity.student) 
      end

      @activities = @activities.to_json(:only => [:id, :title, :message, :student_id, :created_at], :methods => [:image_url])
      parsedActivities = JSON.parse(@activities)
            #render json: @activitiesForTeacher.to_json(:only => [:id, :title, :message, :created_at], :methods => [:image_url])  
            
          render :json => {
                 :activities => parsedActivities,
                 :students =>  studentList
          }

  end  

private

  def event_params
       params.require(:activity).permit(:title, :message, :activity_type, :allow_comment, :classroom_id, :school_user_id, :image)
    end

  def set_access_control_headers
   headers['Access-Control-Allow-Origin'] = "http://localhost:8100"
   headers['Access-Control-Request-Method'] = %w{GET POST OPTIONS}.join(",")
  end

end