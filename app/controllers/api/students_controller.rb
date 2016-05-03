class Api::StudentsController < ApplicationController
 after_action :set_access_control_headers

	def getStudentsForClass
			
		@registrations = ClassRegistration.includes(:student).where("classroom_id = " + params[:classroomId])

		@unreadCount = UnreadCountForSchoolUser.where(school_user_id: Classroom.select("school_user_id").where(id: params[:classroomId]), classroom_id: params[:classroomId] )

		@student = []
		@parent = []
		@studentParentData = [];
      	@registrations.each do |registration|
      		
        	@student.push(registration.student)
        	@parent.push(registration.student.parent)
        	
        	
        	@studentParentData.push(@student + @parent)
        	
        	@student.clear
        	@parent.clear
    	end


    	
       
        render :json => {
        	:studentParentData => @studentParentData,
        	:unreadCount => @unreadCount
        	} 
		
	end

	private

	  def set_access_control_headers
	   headers['Access-Control-Allow-Origin'] = "http://localhost:8100"
	   headers['Access-Control-Request-Method'] = %w{GET POST OPTIONS}.join(",")
	  end

	  
end