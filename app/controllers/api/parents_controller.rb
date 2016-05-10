class Api::ParentsController < ApplicationController
after_action :set_access_control_headers
skip_before_action :verify_authenticity_token, only: [:check_login]


	def check_login
		
		begin
			if params[:username].present? && params[:password].present?
	        	found_user = Parent.where("login_id = ? AND password = ?", params[:username], params[:password]).first
	        	if found_user

	        		found_user = found_user.to_json(:only => [:id, :mom_fname, :mom_lname, :dad_fname, :dad_lname, :login_id, :email_id, :contact], :methods => [:image_url])
      			    parsedActivities = JSON.parse(found_user)
      
	        		render json: parsedActivities
	        	else
	        		render json: "Invalid Credentials"
	        	end	
	        end

		rescue Exception => e
			render json: e.message
		end
			
	end

	def getChildList
		
		begin
			@parent_kids = Student.where("parent_id = ?", params[:parent_id])
			render json: @parent_kids	
		rescue Exception => e
			render json: e.message
		end
	end


	private


	  def set_access_control_headers
	   headers['Access-Control-Allow-Origin'] = "http://localhost:8100"
	   headers['Access-Control-Request-Method'] = %w{GET POST OPTIONS}.join(",")
	  end

end