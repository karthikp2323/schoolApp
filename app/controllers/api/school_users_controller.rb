class Api::SchoolUsersController < ApplicationController
  after_action :set_access_control_headers
	

def index
	render json: SchoolUser.where("school_id = ? AND role_id = ?", params[:school_id], 2).order("created_at DESC")
end


def getClassList
    #renders the class list for teacher
    render json: Classroom.where("school_user_id = ? AND school_id =?", params[:user_id], params[:school_id])
    
  end

private

  def set_access_control_headers
   headers['Access-Control-Allow-Origin'] = "http://localhost:8100"
   headers['Access-Control-Request-Method'] = %w{GET POST OPTIONS}.join(",")
  end



end