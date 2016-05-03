class Api::SchoolUsersController < ApplicationController
  after_action :set_access_control_headers
	

def index
		render json: SchoolUser.where("school_id = ? AND role_id = ?", params[:school_id], 2).order("created_at DESC")
	end


def getClassList
    #renders the class list for teacher
    render json: Classroom.where("school_user_id = ? AND school_id =?", params[:user_id], params[:school_id])
    
  end

def get_teacher_list
  

    @classrooms = Classroom.joins(:school_user).where(id: ClassRegistration.select("classroom_id").where(student_id: params[:student_id]))

    @unreadCount = MessagesAndEventsCountForParent.where(parent_id: Student.select("parent_id").where(id: params[:student_id]))

    @classroom = []
    @teacher = []
    @teacherClassroomData = []        
      
      @classrooms.each do |classroom|
        
        @classroom.push(classroom)
        @teacher.push(classroom.school_user) 
        @teacherClassroomData.push(@teacher + @classroom)

        @classroom.clear
        @teacher.clear

      end

          
      render :json => {

        :teacherClassroomData => @teacherClassroomData,
        :unreadCount => @unreadCount

        } 
    
end

private

  def set_access_control_headers
   headers['Access-Control-Allow-Origin'] = "http://localhost:8100"
   headers['Access-Control-Request-Method'] = %w{GET POST OPTIONS}.join(",")
  end



end