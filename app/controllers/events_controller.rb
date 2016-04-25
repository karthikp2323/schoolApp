class EventsController < ApplicationController
  before_action :set_event, only: [:edit, :update, :destroy]

  # GET /events
  # GET /events.json
  def index
    
    # if (params[:start] && params[:end])
    #   puts '#' * 100

    #   if session[:role_type]  == "Admin"
    #     eventsList1 = Event.where(event_date: params[:start]..params[:end], school_id: session[:school_id])
    #   else
    #     eventsList1 = Event.where(school_user_id: session[:user_id],event_date: params[:start]..params[:end], school_id: session[:school_id])  
    #   end

    #   eventsList = Array.new
    
    #   eventsList1.each do |event|
    #     events = OpenStruct.new
    #     events.id = event.id
    #     events.event_title = event.event_title
    #     events.event_description = event.event_description
    #     events.event_time = event.event_time
    #     events.event_location = event.event_location
    #     events.school_user_id = event.school_user_id
    #     events.classroom_id = event.classroom_id
    #     events.date = event.event_date.to_s + " " + event.event_time.to_s
        
    #     events.date = Time.parse(events.date)
    #     eventsList.push(events)
    #     @eventsList = eventsList
    #   end
         
    # end

    if (params[:start] && params[:end])

      if session[:role_type]  == "Admin"
        eventsList1 = Event.where(event_date: params[:start]..params[:end], school_id: session[:school_id])
      else
        eventsList1 = Event.where(school_user_id: session[:user_id],event_date: params[:start]..params[:end], school_id: session[:school_id])  
      end         
    else
      if session[:role_type]  == "Admin"
        eventsList1 = Event.where(school_id: session[:school_id])
      else
        eventsList1 = Event.where(school_user_id: session[:user_id], school_id: session[:school_id])
      end         
    end
    
    eventsList = Array.new
    
    eventsList1.each do |event|
      events = OpenStruct.new
      events.id = event.id
      events.event_title = event.event_title
      events.event_description = event.event_description
      events.event_time = event.event_time
      events.event_location = event.event_location
      events.school_user_id = event.school_user_id
      events.classroom_id = event.classroom_id
      events.date = event.event_date.to_s + " " + event.event_time.to_s
      
      events.date = Time.parse(events.date)
      eventsList.push(events)
      @eventsList = eventsList
    end
    
  end

  # GET /events/1
  # GET /events/1.json
  def show
   
    begin

      if session[:role_type] == "Admin" || session[:role_type] == "Teacher"

          @event = Event.find(params[:id])
          @school_user = @event.school_user
          method(:getEventDetails).call  
            

          else # Event detail for Parent
          

      end 

    rescue Exception => e
      
    end
  end  # EOF method show

  def getEventDetails
      

           @eventObj = OpenStruct.new
           
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
                   FROM `event_statuses` WHERE event_id = " + params[:id].to_s
            records_array = ActiveRecord::Base.connection.exec_query(sql)
            @eventObj.acceptedCount = records_array.rows[0][1]
            @eventObj.declinedCount = records_array.rows[0][0] 



  end


  def eventUserDetailList

    begin
      selectedOption = params[:selectedOption]
      if selectedOption == 'Invited'
           
           sql = "SELECT DISTINCT p.id, p.dad_fname, p.dad_lname
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


  # GET /events/new
  def new
    @event = Event.new
  end

  # GET /events/1/edit
  def edit
  end

  # POST /events
  # POST /events.json
  def create
    @event = Event.new(event_params)

    respond_to do |format|
      if @event.save
        format.html { redirect_to @event, notice: 'Event was successfully created.' }
        format.json { render :show, status: :created, location: @event }
      else
        format.html { render :new }
        format.json { render json: @event.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /events/1
  # PATCH/PUT /events/1.json
  def update
    respond_to do |format|
      if @event.update(event_params)
        format.html { redirect_to @event, notice: 'Event was successfully updated.' }
        format.json { render :show, status: :ok, location: @event }
      else
        format.html { render :edit }
        format.json { render json: @event.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /events/1
  # DELETE /events/1.json
  def destroy
    @event.destroy
    respond_to do |format|
      format.html { redirect_to events_url, notice: 'Event was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_event
      @event = Event.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def event_params
      params.require(:event).permit(:event_title, :event_description, :event_time, :event_location, :school_users_id, :classroom_id)
    end
end
