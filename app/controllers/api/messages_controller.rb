class Api::MessagesController < ApplicationController
 after_action :set_access_control_headers
 skip_before_action :verify_authenticity_token

	def save_message
 
		begin
			@message = Message.new(message_params)

			if @message.save
				
				if params[:role_type] == "Teacher"
					update_unread_count_for_parent
				elsif params[:role_type] == "Parent"
					update_unread_count_for_school_user	
				end
								
				render json: @message
			end

		rescue Exception => e

			render json: "Error"
			
		end # EOF begin
		
		
	end # EOF def save_message

	def update_unread_count_for_parent
	
			#get the record to increment the unread count 
			@unreadCount = MessagesAndEventsCountForParent.where(:school_user_id => params[:sender_id], :parent_id => params[:receiver_id], :school_id => params[:school_id], :classroom_id => params[:classroom_id]).first
			# if record exists doesn't in count table create a new record
			if @unreadCount == nil
				
				 updateCount = MessagesAndEventsCountForParent.new
				 
				 updateCount.unread_messages = 1
				 updateCount.parent_id = params[:receiver_id]
				 updateCount.school_user_id = params[:sender_id] 
				 updateCount.classroom_id = params[:classroom_id]
				 updateCount.school_id = params[:school_id]

				 updateCount.save
				  
				else
					#increment function
				  @unreadCount.increment!(:unread_messages, 1)
			end # EOF if condition 		

	end # EOF def update_unread_count_for_parent

	def update_unread_count_for_school_user
	
			#get the record to increment the unread count 
			@unreadCount = UnreadCountForSchoolUser.where(:school_user_id => params[:receiver_id], :parent_id => params[:sender_id], :school_id => params[:school_id], :classroom_id => params[:classroom_id]).first
			# if record exists doesn't in count table create a new record
			if @unreadCount == nil
				
				 updateCount = UnreadCountForSchoolUser.new
				 
				 updateCount.unread_messages = 1
				 updateCount.parent_id = params[:sender_id]
				 updateCount.school_user_id = params[:receiver_id] 
				 updateCount.classroom_id = params[:classroom_id]
				 updateCount.school_id = params[:school_id]

				 updateCount.save
				  
				else
					#increment function
				  @unreadCount.increment!(:unread_messages, 1)
			end # EOF if condition 		

	end # EOF def update_unread_count_for_school_user

	def update_unread_record
		
		if params[:role_type] == "Parent"
			@unread = MessagesAndEventsCountForParent.find_by(parent_id: params[:receiver_id], school_user_id: params[:sender_id],school_id: params[:school_id], classroom_id: params[:classroom_id])

			if @unread
				@unread.unread_messages = 0
				@unread.save
			end

			render json: @unread
		elsif params[:role_type] == "Teacher"
			debugger
			@unread = UnreadCountForSchoolUser.find_by(parent_id: params[:sender_id], school_user_id: params[:receiver_id],school_id: params[:school_id], classroom_id: params[:classroom_id])

			if @unread
				@unread.unread_messages = 0
				@unread.save
			end

			render json: @unread
		end
	end

	def details_unread
		if params[:role_type] == "Parent"
			@unread = MessagesAndEventsCountForParent.where(:parent_id => params[:user_id])
			render json: @unread
		elsif params[:role_type] == "Teacher"
			@unread = UnreadCountForSchoolUser.where(:school_user_id => params[:user_id])
			render json: @unread
		end
			
	end


	def get_messages

		@messages = Message.where("(sender_id = ? AND receiver_id = ? OR sender_id = ? AND receiver_id = ?) AND classroom_id = ?", params[:sender_id], params[:receiver_id], params[:receiver_id], params[:sender_id], params[:class_id] )
		render json: @messages
		
	end

	private

	  def message_params
       params.permit(:message_text, :receiver_id, :sender_id, :subject, :classroom_id, :school_id)
      end	

	  def set_access_control_headers
	   headers['Access-Control-Allow-Origin'] = "http://localhost:8100"
	   headers['Access-Control-Request-Method'] = %w{GET POST OPTIONS}.join(",")
	  end

	  
end