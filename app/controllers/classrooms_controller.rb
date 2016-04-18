class ClassroomsController < ApplicationController
  before_action :set_classroom, only: [:show, :edit, :update, :destroy]

  # GET /classrooms
  # GET /classrooms.json
  def index
    # displays the class list when admin clicks on class list from side bar to view classes.
    @classrooms = Classroom.where(school_id: session[:school_id]).joins(:school_user).page(params[:page])

    #empty object for creating new class
    #This objects binds with the form inputs.
    @classroom = Classroom.new

    #empty object for creating new class
    #This objects binds with the form inputs.
    @parent = Parent.new
    @parent.students.build

    
  end

  def getClassesForTeacher

    @classrooms = Classroom.joins(:school_user).where("school_user_id = " + params[:user_id])
    
    render json: @classrooms
  end

  def getStudentsList

    sql = "SELECT  s.id, s.first_name, s.last_name, p.id, p.dad_fname, p.dad_lname
          FROM parents p
          JOIN students s
          ON s.parent_id = p.id
          JOIN class_registrations c
          ON c.student_id = s.id
          WHERE c.classroom_id= " + params[:classroomId];

    records_array = ActiveRecord::Base.connection.exec_query(sql)


    render json: records_array.rows

  end
  # GET /classrooms/1
  # GET /classrooms/1.json
  def show

  end

  # GET /classrooms/new
  def new
    @user_id = params[:user_id]
    @classroom = Classroom.new
  end

  # GET /classrooms/1/edit
  def edit
   # @user_id = params[:user_id]
  end

  # POST /classrooms
  # POST /classrooms.json
  def create
   
   if params[:classroom][:id] != ""
     @classroom = Classroom.find(params[:classroom][:id])

        begin
          @classroom.update(classroom_params)
          render json: @classroom
        rescue Exception => e
          error = e.message
          render json: error
        end
   else
      begin
        @classroom = Classroom.new(classroom_params)
        if @classroom.save
            render json: @classroom
          else
            raise "An error occured"  
        end
      rescue Exception => e
        @error = e.message
        render json: @error
      end
      
        #@user_id = params[:school_user_id]
      
   end #EOF if
      
    
  end # EOF def create

  # PATCH/PUT /classrooms/1
  # PATCH/PUT /classrooms/1.json
  def update

    respond_to do |format|
      if @classroom.update(classroom_params)
        format.html { redirect_to @classroom, notice: 'Classroom was successfully updated.' }
        format.json { render :show, status: :ok, location: @classroom }
      else
        format.html { render :edit }
        format.json { render json: @classroom.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /classrooms/1
  # DELETE /classrooms/1.json
  def destroy
    @classroom.destroy
    respond_to do |format|
      format.html { redirect_to classrooms_url, notice: 'Classroom was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_classroom
      @classroom = Classroom.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def classroom_params
      params.require(:classroom).permit(:class_name, :class_location, :class_level, :school_id, :school_user_id)
    end
end
