class Api::HomeController < ApplicationController
after_action :set_access_control_headers
skip_before_action :verify_authenticity_token, only: [:save_devise_information]

def attempt_login
	
	if params[:username].present? && params[:password].present?
      found_user = SchoolUser.where(:login_id => params[:username]).first
      if found_user 
        #decrypt password (bcrypt gem is used)
        authorized_user = found_user.authenticate(params[:password])
          if authorized_user
          roles = Role.find(authorized_user.role_id)
          role_type = roles.role_type
          school_name = School.find(authorized_user.school_id)

          authorized_user = authorized_user.to_json(:only => [:id, :first_name, :last_name, :email_id, :contact, :login_id, :role_id, :school_id], :methods => [:image_url])
          parsedActivities = JSON.parse(authorized_user)
      

          render json: {
            :authorized_user => parsedActivities, 
            :role_type => role_type,
            :school => school_name
          }

          else
          render json: "Invalid Credentials"
          end  

        else
        render json: "Invalid Credentials"

      end# end of if found_user 
        
    else
    render json: "Provide username and password"
    
  end #end of if params
  
end #end of def attempt_login

def save_devise_information

    begin
      
      if params[:role_type] == "Teacher"
          
          @deviseInformation =   PushNotificationsForSchoolUser.find_by(devise_token: params[:devise_token]);

          if @deviseInformation == nil
            
             @deviseInformation = PushNotificationsForSchoolUser.new
             @deviseInformation.devise_type = params[:devise_type]
             @deviseInformation.devise_token = params[:devise_token]
             @deviseInformation.school_user_id = params[:user_id]
             @deviseInformation.save

           elsif @deviseInformation.school_user_id != params[:user_id].to_i
             @deviseInformation.school_user_id = params[:user_id]
             @deviseInformation.save

          end
         

          render json: "Devise information saved"

      elsif params[:role_type] == "Parent"

        @deviseInformation =   PushNotificationsForParent.find_by(devise_token: params[:devise_token]);

        if @deviseInformation == nil

          @deviseInformation = PushNotificationsForParent.new
          @deviseInformation.devise_type = params[:devise_type]
          @deviseInformation.devise_token = params[:devise_token]
          @deviseInformation.parent_id = params[:user_id]
          @deviseInformation.save
          

          elsif @deviseInformation.parent_id != params[:user_id].to_i
             @deviseInformation.parent_id = params[:user_id]
             @deviseInformation.save

          end

        

          render json: "Devise information saved"
      end #EOF if params[:role_type]

    rescue Exception => e
          render json: e.message
    end #EOF begin
  
end


private

  def set_access_control_headers
   headers['Access-Control-Allow-Origin'] = "http://localhost:8100"
   headers['Access-Control-Request-Method'] = %w{GET POST OPTIONS}.join(",")
  end

end