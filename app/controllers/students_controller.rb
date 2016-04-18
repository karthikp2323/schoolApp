class StudentsController < ApplicationController
  before_action :set_student, only: [:show, :edit, :update]

  # GET /students
  # GET /students.json
  def index

    @registrations = ClassRegistration.includes(:student).where("classroom_id = " + params[:classroomId])
    @classname = params[:classname]
    @classroomId = params[:classroomId]
    @students = []
      @registrations.each do |registration|
        @students.push(registration.student)
    end

    #empty object for creating new student and parent. 
    #This objects binds with the form inputs.
    @parent = Parent.new
    @parent.students.build

  end

  def studentSchoolActivities

    @studentDetails = Student.includes(:parent).where("parent_id = " + session[:parent_id])
    
    @students = []
      @registrations.each do |registration|
        @students.push(registration.student)
      end
    
  end

  # GET /students/1
  # GET /students/1.json
  def show
  end

  # GET /students/new
  def new
    @student = Student.new
    @student.class_registration.build
  
  end

  # GET /students/1/edit
  def edit
   
   @classname = params[:classname]
   @classroomId = params[:classroomId]

   @parentData =  @student.parent
       
        render :json => {
          :student => @student,
          :parent =>  @parentData
        }

  end

  # POST /students
  # POST /students.json
  def create
    @student = Student.new(student_params)

    respond_to do |format|
      if @student.save
        format.html { redirect_to @student, notice: 'Student was successfully created.' }
        format.json { render :show, status: :created, location: @student }
      else
        format.html { render :new }
        format.json { render json: @student.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /students/1
  # PATCH/PUT /students/1.json
  def update
    
    respond_to do |format|
      if @student.update(student_params)
        format.html { redirect_to students_path(:classroomId => params[:classroomId], :classname => params[:classname]), notice: 'Student was successfully updated.' }
        format.json { render :show, status: :ok, location: @student }
      else
        format.html { render :edit }
        format.json { render json: @student.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /students/1
  # DELETE /students/1.json
  def destroy
    
        @student = Student.find(params[:studentId])
        @student.destroy

    respond_to do |format|
      format.html { redirect_to controller: 'students', action: 'index', classroomId: params[:classroomId], notice: 'Student was successfully destroyed.' }
      format.json { head :no_content }
    end

  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_student
      @student = Student.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def student_params
      params.require(:student).permit(:first_name, :last_name, :dob, :emergency_contact, :address_line1, :address_line2, :city, :zip, :state, :country, :school_id, :parent_id)
    end
end
