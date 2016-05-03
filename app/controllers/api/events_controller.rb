class Api::EventsController < ApplicationController
after_action :set_access_control_headers
skip_before_action :verify_authenticity_token, only: [:create, :updateEventStatus]


#GET Events
def getEvent

begin
  
  user_role = params[:user_role]
  
  case user_role
  when "Admin"
    @events = Event.all  
  when "Teacher"
    @events = Event.where("school_user_id = ?", params[:user_id])  
  when "Parent"
    @events = Event.where(classroom_id: ClassRegistration.select("classroom_id").where(student_id: Student.select("id").where(parent_id: params[:user_id])))
  end
  
  render json: @events

rescue Exception => e
  render json: e.message 
end
  

end

#GET Events for a particular class
def getEventForClass
       
  @events = Event.where("classroom_id = ?", params[:classroom_id])
	render json: @events

end

def getEventForParent

begin
  
  sql = "SELECT DISTINCT e.id, e.event_title, e.event_description, e.event_date, e.event_time, e.event_location, e.school_user_id, e.classroom_id 
        from events e 
        left join event_statuses s
        on e.id = s.event_id
        where e.classroom_id in (select classroom_id from class_registrations where student_id in" + params[:student_Ids] + ")"    
  
  records_array = ActiveRecord::Base.connection.exec_query(sql)
  @events = records_array
  render json: @events
rescue Exception => e
  render json: e.message
end
  

end

def getEventDetail
  
  #An OpenStruct is a data structure, similar to a Hash, 
  #that allows the definition of arbitrary attributes with their accompanying values. 
  #This is accomplished by using Ruby’s metaprogramming to define methods on the class itself.
  begin
    if params[:role_type] == "Parent"

    @eventObj = OpenStruct.new
    @event = Event.find(params[:eventId])
    
    @eventObj.id = @event.id
    @eventObj.event_title = @event.event_title
    @eventObj.event_description = @event.event_description
    @eventObj.event_date = @event.event_date
    @eventObj.event_time = @event.event_time
    @eventObj.event_location = @event.event_location
    @eventObj.school_user_id = @event.school_user_id
    @eventObj.classroom_id = @event.classroom_id
    @eventObj.event_status_id = :null
    #checks and gets the event accepted status of a parent
    eventStatusCheck = EventStatus.where("event_id= ? AND parent_id = ? ", params[:eventId], params[:parent_id] ) 
      if eventStatusCheck.length > 0

          @eventObj.eventAddedToCalendar = true;
          @eventObj.parent_id = eventStatusCheck[0].parent_id
          @eventObj.event_status_id = eventStatusCheck[0].id
        else
          #checks and gets the declined event status of a parent
        eventStatusCheck = EventStatus.where("event_id= ? AND parent_id_declined = ? ", params[:eventId], params[:parent_id]) 
        if eventStatusCheck.length > 0
           @eventObj.eventAddedToCalendar = false;
           @eventObj.parent_id_declined = eventStatusCheck[0].parent_id_declined
           @eventObj.event_status_id = eventStatusCheck[0].id
        end 
      end  # End logic for params[:role_type] == "Parent"
    
    else #Event detail for Teacher
      @eventObj = OpenStruct.new
      @event = Event.find(params[:eventId])
      
      @eventObj.id = @event.id
      @eventObj.event_title = @event.event_title
      @eventObj.event_description = @event.event_description
      @eventObj.event_date = @event.event_date
      @eventObj.event_time = @event.event_time
      @eventObj.event_location = @event.event_location
      @eventObj.school_user_id = @event.school_user_id
      @eventObj.classroom_id = @event.classroom_id
    
    #This query is performed in order to eliminate 
    #duplicate parent id that can be caused due to twin children 
     
      sql = "SELECT  COUNT(DISTINCT p.id)
             FROM class_registrations c
             JOIN students s
             ON s.id = c.student_id
             JOIN parents p
             ON p.id = s.parent_id
             WHERE c.classroom_id = " + @event.classroom_id.to_s
              
      records_array = ActiveRecord::Base.connection.exec_query(sql)
      @eventObj.invitationCount = records_array.rows 

      sql = "SELECT COUNT(parent_id_declined) as declineCount, 
             COUNT(parent_id) as acceptedCount 
             FROM `event_statuses` WHERE event_id = " + params[:eventId].to_s
      records_array = ActiveRecord::Base.connection.exec_query(sql)
      @eventObj.acceptedCount = records_array.rows[0][1]
      @eventObj.declinedCount = records_array.rows[0][0]
    #EventStatus.select(:parent_id).where("event_id =?", params[:eventId] ).count
    
    #@acceptedCount = ClassRegistration.joins(student: [parent: :comment]).includes(student: [parent: :comment]).where("classroom_id =?", 2 )

    end 
    render json: @eventObj

  rescue Exception => e
    render json: e.message
  end
  
 
end

def eventUserDetailList

    begin
      selectedOption = params[:selectedOption]
      if selectedOption == 'Invited'
           
           sql = "SELECT DISTINCT p.id, p.dad_fname
           FROM class_registrations c
           JOIN students s
           ON s.id = c.student_id
           JOIN parents p
           ON p.id = s.parent_id
           WHERE c.classroom_id= " + params[:classroom_id].to_s
           records_array = ActiveRecord::Base.connection.exec_query(sql)  
           @userList = records_array      

        elsif selectedOption == 'Accepted'
           @userList = Parent.joins(:event_status).where("event_id =?", params[:eventId])
        
        else

           sql = "SELECT * 
                  FROM parents
                  JOIN event_statuses
                  ON parents.id = event_statuses.parent_id_declined
                  WHERE event_statuses.event_id = " + params[:eventId].to_s
           records_array = ActiveRecord::Base.connection.exec_query(sql)
           @userList = records_array
      end
      
      render json: @userList
    rescue Exception => e
      render json: e.message
    end
    
end # EOF method eventUserDetailList

def create
	result = { status: "failed" }
	
	@event = Event.new
      @event.event_title = params[:event_title]
      @event.event_description = params[:event_description]
      @event.event_date = params[:event_date]
      @event.event_time = params[:event_time]
      @event.event_location = params[:event_location]
      @event.school_user_id = params[:user_id]
      @event.classroom_id = params[:classroom_id]
      
      if @event.save
        result[:status] = "success"
        render json: result.to_json
      else
        result[:status] = "Erros"
        render json: result.to_json
      end

      rescue Exception => e
	       Rails.logger.error "#{e.message}"
	       render json: e.message

      
end


def updateEventStatus

  begin

    updateAction = params[:actionPerformed]
  case updateAction
    when "declineJoinedEvent"  
      sql = "update event_statuses 
             set parent_id_declined="  + params[:parent_id] + ", parent_id = null 
             where event_statuses.id = " + params[:event_status_id] + "&& event_id=" + params[:event_id];
         
      ActiveRecord::Base.connection.execute(sql)

    when "joinDeclinedEvent"
      sql = "update event_statuses 
             set parent_id_declined=null, parent_id = " + params[:parent_id] + "
             where event_statuses.id = " + params[:event_status_id] + " && event_id=" + params[:event_id];
         
      ActiveRecord::Base.connection.execute(sql)
      
    when "decline"
      @event_statuses = EventStatus.new(event_id: params[:event_id], parent_id_declined: params[:parent_id] )
      @event_statuses.save

    when "join"
      @event_statuses = EventStatus.new(event_id: params[:event_id], parent_id: params[:parent_id] )
      @event_statuses.save

        
    
  end
     render json: true
  rescue Exception => e
     render json: e.message
  end
	
end

private
	
  def event_status_params
      params.require(:event_status).permit(:event_id, :parent_id, :parent_id_declined)
    end		
  

  def set_access_control_headers
   headers['Access-Control-Allow-Origin'] = "http://localhost:8100"
   headers['Access-Control-Request-Method'] = %w{GET POST OPTIONS}.join(",")
  end

end