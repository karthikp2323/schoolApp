class HomeController < ApplicationController
  before_action :clear_session, only: [:home, :logout]

  def terms
    render
  end  

  def home

  end

  def teachers

  end

  def parents

  end

  def daycares

  end

  def features

  end

  def login

  	render 
  end

  def logout
  
    redirect_to root_path
  end

  def check_login
    
    role_type = params[:login][:role_type]

    if role_type == "Parent"

      #check whether user has provided username and password
      if params[:username].present? && params[:password].present?
        found_user = Parent.where("login_id = ? AND password = ?", params[:username], params[:password]).first
            if found_user
              session[:parent_id] = found_user.id 
              session[:role_type] = "Parent"
              session[:username] = found_user.dad_fname + " " + found_user.dad_lname
              session[:initials] = found_user.dad_fname[0] + " " + found_user.dad_lname[0]

              redirect_to school_users_schoolUserHomeView_path

              else
                flash[:notice] = "Invalid username/password combination."
                redirect_to home_login_path 
            end
       else
         flash[:notice] = "Invalid username/password combination."
         redirect_to home_login_path 
      end #EOF if for parent credentials check

    elsif role_type == "Student"

         flash[:notice] = "Invalid username/password combination."
         redirect_to home_login_path  

    else # credential check for admin and teacher

        #check whether user has provided username and password
        if params[:username].present? && params[:password].present?
          found_user = SchoolUser.where(:login_id => params[:username]).first
          
          if found_user 
            #decrypt password (bcrypt gem is used)
            authorized_user = found_user.authenticate(params[:password])
          end # EOF if found_user 

        end # EOF if params[:username].present? && params[:password].present?


        if authorized_user #check for authorized_user and store the values into session 
          roles = Role.find(authorized_user.role_id)
          session[:role_type] = roles.role_type
          session[:role_id] = authorized_user.role_id
          session[:user_id] = authorized_user.id
          session[:school_id] = authorized_user.school_id
          session[:username] = authorized_user.first_name + " " +authorized_user.last_name
          session[:initials] = authorized_user.first_name[0] + " " + authorized_user.last_name[0]
              
          if session[:role_type] == "Teacher"
             session[:class_list] = Classroom.where("school_user_id = ? AND school_id =?", session[:user_id], session[:school_id])
            redirect_to(:controller => 'school_users' ,:action => 'schoolUserHomeView')
              
           else
            flash[:notice] = "You are now logged in."
            redirect_to new_activity_path
          end  # EOF if session[:role_type] == "Teacher" 
    
         else 
          flash[:notice] = "Invalid username/password combination."
          redirect_to home_login_path
        end  # EOF if authorized_user 

      
    end #EOF if role_type 
    
  end # EOF def check_login

  def check_login_id

     found_user = SchoolUser.where(:login_id => params[:login_id]).first
          
          if found_user 
           render json: 1
          else
            render json: 0
          end 

  end # EOF check_login_id

 private
    # Use callbacks to share common setup or constraints between actions.
    def clear_session
      session[:school_id] = nil
      session[:parent_id] = nil
      session[:user_id] = nil
      session[:role_type] = nil
      session[:parent_id] = nil
    end


end # EOF home controller
