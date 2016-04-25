class SchoolUsersController < ApplicationController
  before_action :set_school_user, only: [:show, :edit, :update, :destroy]
  after_action :set_access_control_headers

  # GET /school_users
  # GET /school_users.json
  def index
    #if access_allowed?
    @school_users = SchoolUser.where("school_id = ? AND role_id = ?", session[:school_id], 2).order("created_at DESC").page(params[:page]).per_page(7)
      
      #empty object for creating new school user. 
      #This objects binds with the form inputs.
      @school_user = SchoolUser.new

      #empty object for creating new school user. 
      #This objects binds with the form inputs.
      @classroom = Classroom.new
    
    respond_to do |format|
      format.html
      format.json {render json: @school_users.select(:id)}
    end
  #end
    
  end

  #get classroomlist and childrenlist for parents
  def schoolUserHomeView
    
    if session[:parent_id]
      @parent_kids = Student.where("parent_id = ?", session[:parent_id])

    else
     
    end 
    @school_user = SchoolUser.new   
    @activity = Activity.new #For creating new activity
    @classroom_id = params[:class_id]
    @classname = params[:classname]
    @activities = Activity.where("classroom_id = ? AND school_user_id = ?", params[:class_id], session[:user_id]).order("created_at DESC").page(params[:page]).per_page(10)
  end
  
  def listTeachers
    #@school_users = SchoolUser.where(:role_id => 2)
  end

  # GET /school_users/1 
  # GET /school_users/1.json
  def show
  end

  # GET /school_users/new
  def new
    @school_user = SchoolUser.new

    #respond_to do |format|
      #format.html
      render json: @school_users
    #end

  end

  # GET /school_users/1/edit
  def edit
    render json: @school_user
  end

  # POST /school_users
  # POST /school_users.json
  def create
    
     if params[:school_user][:id] != ""
          
           @school_user = SchoolUser.find(params[:school_user][:id])

           begin
             @school_user.update(school_user_params)
             render json: @school_user
           rescue Exception => e
             error = e.message
             render json: error
           end

      else
        
          randNum = Random.new 

          @school_user = SchoolUser.new(school_user_params)
          
          @school_user.login_id = school_user_params[:first_name] + school_user_params[:last_name] + randNum.rand(999).to_s
          @school_user.password = school_user_params[:first_name][0..3] + school_user_params[:last_name] + randNum.rand(999).to_s
              
          #respond_to do |format|
            if @school_user.save

              begin
                UserMailer.registration_confirmation(@school_user).deliver
              rescue Exception => e
                error = e.message
              end # EOF begin
        
             render json: @school_user
             
            else
            
          end # EOF if @school_user.save
    end

  end # EOF def create

  # PATCH/PUT /school_users/1
  # PATCH/PUT /school_users/1.json
  def update
    respond_to do |format|
      if @school_user.update(school_user_params)
        format.html { redirect_to @school_user, notice: 'School user was successfully updated.' }
        format.json { render :show, status: :ok, location: @school_user }
      else
        format.html { render :edit }
        format.json { render json: @school_user.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /school_users/1
  # DELETE /school_users/1.json
  def destroy
    @school_user.destroy
    respond_to do |format|
      format.html { redirect_to school_users_url, notice: 'School user was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private

  def set_access_control_headers
   headers['Access-Control-Allow-Origin'] = "http://localhost:8100"
   headers['Access-Control-Request-Method'] = %w{GET POST OPTIONS}.join(",")
  end
    # Use callbacks to share common setup or constraints between actions.
    def set_school_user
      @school_user = SchoolUser.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def school_user_params
      params.require(:school_user).permit(:first_name, :last_name, :email_id, :contact, :login_id, :password, :role_id  , :school_id )
    end



end
