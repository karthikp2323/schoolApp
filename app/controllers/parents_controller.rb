class ParentsController < ApplicationController
  before_action :set_parent, only: [:show, :edit, :update, :destroy]

  
  def parentlogin
    render
  end

  def check_parentlogin
    
    #check whether user has provided username and password
    if params[:username].present? && params[:password].present?
      found_user = Parent.where("login_id = ? AND password = ?", params[:username], params[:password]).first
          if found_user
            session[:parent_id] = found_user.id 
            session[:role_type] = "Parent"
            
            
            redirect_to school_users_schoolUserHomeView_path
          end
      

    end #EOF def check_parentlogin

  def parentHomeView
    
  end


  end
  # GET /parents
  # GET /parents.json
  def index
    @parents = Parent.all
  end

  # GET /parents/1
  # GET /parents/1.json
  def show
  end

  # GET /parents/new
  def new

    #@url_back = request.fullpath
    @parent = Parent.new
    @parent.students.build

    @classregistration = Classroom.new

    @classroomId = params[:classroomId]
    @classname = params[:classname]
    #@student.class_registration.build


  end

  # GET /parents/1/edit
  def edit
  end

  # POST /parents
  # POST /parents.json
  def create
      #@classregistration = ClassRegistration.new(class_registration_params) 
      
   begin 
    randNum = Random.new
    
    @parent = Parent.new(parent_params)
    
    @parent.login_id = parent_params[:dad_fname] + parent_params[:dad_lname] + randNum.rand(999).to_s
    @parent.password = parent_params[:dad_fname][0..3] + parent_params[:dad_lname] + randNum.rand(999).to_s

 
   
      if @parent.save

        
        #Registering student
        studentId = Student.select("id").where("parent_id = "+ @parent.id.to_s)

        #Create and save userid and password for student if access is granted.
        if parent_params[:students_attributes]["0"]["IsLogIn"] == "1"

          studentLoginObj = Studentlogindetail.new
          studentLoginObj.login_id = parent_params[:students_attributes]["0"][:first_name] + parent_params[:students_attributes]["0"][:last_name] + randNum.rand(999).to_s
          studentLoginObj.password = parent_params[:students_attributes]["0"][:first_name][0..3] + parent_params[:students_attributes]["0"][:last_name] + randNum.rand(999).to_s
          studentLoginObj.student_id = studentId[0].id
          studentLoginObj.save
          
            
            if studentLoginObj.save
              
              @studentObj = OpenStruct.new
              @studentObj.login_id = studentLoginObj.login_id
              @studentObj.password = studentLoginObj.password
              @studentObj.first_name = parent_params[:students_attributes]["0"][:first_name]
              @studentObj.last_name = parent_params[:students_attributes]["0"][:last_name]
              @studentObj.email_id = parent_params[:students_attributes]["0"][:email_id]  

            end #EOF if studentLoginObj.save

        end  #EOF if params[:IsLogIn] = 1


        regObj = ClassRegistration.new
        regObj.student_id = studentId[0].id
        regObj.classroom_id = params[:classroomId]
        regObj.save  

          #if student is regestered send an email confirmation to parent
          if regObj.save
            
            @parentObj = OpenStruct.new
            @parentObj.login_id = @parent.login_id
            @parentObj.password = @parent.password
            @parentObj.first_name = parent_params[:dad_fname]
            @parentObj.last_name = parent_params[:dad_lname]
            @parentObj.email_id = parent_params[:email_id]
            
            begin
              if parent_params[:students_attributes]["0"]["IsLogIn"] == "1"
                UserMailer.registration_confirmation(@studentObj).deliver
              end
              UserMailer.registration_confirmation(@parentObj).deliver
            rescue Exception => e
              @errors = e.message
            end
            
           
          end # // EOF if regObj.save
        @studentData =  @parent.students
       
        render :json => {
          :parent => @parent,
          :student =>  @studentData
        }
      
      else 
        render json: "Error"
      end # // EOF if @parent.save
    

    rescue Exception => e
        
    end  # // EOF begin

  end  # // EOF def create

  # PATCH/PUT /parents/1
  # PATCH/PUT /parents/1.json
  def update
    
    
      begin
        @parent.update(parent_params)
        @studentData =  @parent.students

        render :json => {
                :parent => @parent,
                :student =>  @studentData
              }

      rescue Exception => e
        @error = e.message

        render json: @error
      end # EOF beging
   
  end # EOF def update

  # DELETE /parents/1
  # DELETE /parents/1.json
  def destroy
    @parent.destroy
    respond_to do |format|
      format.html { redirect_to parents_url, notice: 'Parent was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_parent
      @parent = Parent.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def parent_params
      params.require(:parent).permit(:id, :mom_fname, :mom_lname, :dad_fname, :dad_lname, :email_id, :contact, :login_id, :password,students_attributes: [:id,:first_name, :last_name, :dob, :emergency_contact, :address_line1, :address_line2, :city, :zip, :state, :country, :email_id, :IsLogIn ])
        
    end

    def class_registration_params
      params.require(:class_registration).permit(:student_id)
    end
end
