class Api::ActivitiesController < ApplicationController
after_action :set_access_control_headers
skip_before_action :verify_authenticity_token, only: [:create]


#Gets the list of activities
def getActivities
    
    if params[:role_id] == "1"

     render json: Activity.order("created_at DESC")
      else 
        
      render json: Activity.where("classroom_id = ? AND school_user_id = ?", params[:class_id], params[:user_id]).order("created_at DESC").to_json(:only => [:id, :title, :message, :created_at], :methods => [:image_url])
      #Activity.where("classroom_id = ? AND school_user_id = ?", params[:class_id], params[:user_id]).order("created_at DESC")
      #@model.to_json(:only => [:id,:name,:homephone,:cellphone], :methods => [:avatar_url])

    end

end

  

def create
    
 result = { status: "failed" }
    begin
      params[:image] = parse_image_data(params[:image]) if params[:image]

      @activity = Activity.new
      @activity.image = params[:image]
      @activity.title = params[:title]
      @activity.message = params[:message]
      @activity.classroom_id = params[:classroom_id]
      @activity.school_user_id = params[:school_user_id]
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

  def event_params
       params.require(:activity).permit(:title, :message, :activity_type, :allow_comment, :classroom_id, :school_user_id, :image)
    end

  def set_access_control_headers
   headers['Access-Control-Allow-Origin'] = "http://localhost:8100"
   headers['Access-Control-Request-Method'] = %w{GET POST OPTIONS}.join(",")
  end

end