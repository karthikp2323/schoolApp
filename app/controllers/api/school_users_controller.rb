class Api::SchoolUsersController < ApplicationController
  after_action :set_access_control_headers
	skip_before_action :verify_authenticity_token, only: [:update_user]

def index
		render json: SchoolUser.where("school_id = ? AND role_id = ?", params[:school_id], 2).order("created_at DESC")
	end


def getClassList
    #renders the class list for teacher
    render json: Classroom.where("school_user_id = ? AND school_id =?", params[:user_id], params[:school_id])
    
  end

def get_teacher_list
  

    @classrooms = Classroom.joins(:school_user).where(id: ClassRegistration.select("classroom_id").where(student_id: params[:student_id]))

    @unreadCount = MessagesAndEventsCountForParent.where(parent_id: Student.select("parent_id").where(id: params[:student_id]))

    @classroom = []
    @teacher = []
    @teacherClassroomData = []        
      
      @classrooms.each do |classroom|
        
        @classroom.push(classroom)
        @teacher.push(classroom.school_user) 
        @teacherClassroomData.push(@teacher + @classroom)

        @classroom.clear
        @teacher.clear

      end

          
      render :json => {

        :teacherClassroomData => @teacherClassroomData,
        :unreadCount => @unreadCount

        } 
    
end

def update_user
  
  begin
    
    if params[:role_type] == "Teacher"
        
        @user = SchoolUser.find(params[:user_id])
        params[:image] = parse_image_data(params[:image]) if params[:image]
        @user.image = params[:image]
        
        if @user.save
          @user = @user.to_json(:only => [:id], :methods => [:image_url])
          parsedActivities = JSON.parse(@user)

          render json: parsedActivities
        end

      elsif params[:role_type] == "Parent"
        
        @user = Parent.find(params[:user_id])
        params[:image] = parse_image_data(params[:image]) if params[:image]
        @user.image = params[:image]
        
        if @user.save

          @user = @user.to_json(:only => [:id], :methods => [:image_url])
          parsedActivities = JSON.parse(@user)

          render json: parsedActivities
        end

    end

  rescue Exception => e
       render json: e.message
  end #EOF begin

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

private

  def set_access_control_headers
   headers['Access-Control-Allow-Origin'] = "http://localhost:8100"
   headers['Access-Control-Request-Method'] = %w{GET POST OPTIONS}.join(",")
  end



end