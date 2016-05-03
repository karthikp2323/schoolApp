class Api::HomeController < ApplicationController
after_action :set_access_control_headers

def attempt_login
	
	if params[:username].present? && params[:password].present?
      found_user = SchoolUser.where(:login_id => params[:username]).first
      if found_user 
        #decrypt password (bcrypt gem is used)
        authorized_user = found_user.authenticate(params[:password])
          if authorized_user
          roles = Role.find(authorized_user.role_id)
          role_type = roles.role_type

          render json: {
            :authorized_user => authorized_user, 
            :role_type => role_type
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


private

  def set_access_control_headers
   headers['Access-Control-Allow-Origin'] = "http://localhost:8100"
   headers['Access-Control-Request-Method'] = %w{GET POST OPTIONS}.join(",")
  end

end