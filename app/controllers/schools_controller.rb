class SchoolsController < ApplicationController
  before_action :set_school, only: [:show, :edit, :update, :destroy]
  #before_action :authenticate_user!, except:[:new]
  # GET /schools
  # GET /schools.json
  def index
    @schools = School.all
  end

  # GET /schools/1
  # GET /schools/1.json
  def show
     #@schools = School.find(params[:id])
     render
  end

  # GET /schools/new
  def new

    @school = School.new
    @school.school_users.build 
  end

  # GET /schools/1/edit
  def edit
  end

  # POST /schools
  # POST /schools.json
  def create
    
    @school = School.new(school_params)
    @school_user = SchoolUser.new(school_params[:school_users_attributes]["0"])


    respond_to do |format|
      if @school.save

              found_user = SchoolUser.where(:login_id => school_params[:school_users_attributes]["0"]["login_id"]).first
              if found_user 
                
                #decrypt password (bcrypt gem is used)
                authorized_user = found_user.authenticate(school_params[:school_users_attributes]["0"]["password"])
              end # EOF if found_user 

              if authorized_user
                
                session[:role_type] = "Admin"
                session[:role_id] = authorized_user.role_id
                session[:user_id] = authorized_user.id
                session[:school_id] = authorized_user.school_id
                session[:username] = authorized_user.first_name + " " +authorized_user.last_name

              end  # EOF if authorized_user
    
        format.html { redirect_to new_activity_path}
        format.json { render :show, status: :created, location: @school }

              begin
                UserMailer.registration_confirmation(@school_user).deliver
              rescue Exception => e
                error = e.message
              end
      else
        format.html { render :new }
        format.json { render json: @school.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /schools/1
  # PATCH/PUT /schools/1.json
  def update
    respond_to do |format|
      if @school.update(school_params)
        format.html { redirect_to @school, notice: 'School was successfully updated.' }
        format.json { render :show, status: :ok, location: @school }
      else
        format.html { render :edit }
        format.json { render json: @school.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /schools/1
  # DELETE /schools/1.json
  def destroy
    @school.destroy
    respond_to do |format|
      format.html { redirect_to schools_url, notice: 'School was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_school
      @school = School.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white
    private     
    def school_params
    params.require(:school).permit(:school_name,:address_line1, :address_line2, :city, :zip, 
      :state, :country, :fax, :contact, :working_hours, :contact_person, :email_id, 
      school_users_attributes: [:id, :first_name, :last_name, :email_id, :contact, :login_id, :role_id, :password]  )

    end



end
