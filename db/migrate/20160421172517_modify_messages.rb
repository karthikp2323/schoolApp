class ModifyMessages < ActiveRecord::Migration
  
  def up
  	
	  remove_foreign_key :messages, column: :parent_id
	  remove_foreign_key :messages, column: :school_user_id
	  remove_column "messages", "parent_id"
	  remove_column "messages", "school_user_id"
	  add_column "messages", "receiver_id", :integer
	  add_column "messages", "sender_id", :integer
	  add_column "messages", "subject", :string
	  add_index "messages", "receiver_id"
	  add_index "messages", "sender_id"
	  add_reference :messages, :school, index: true, foreign_key: true
	  add_reference :messages, :classroom, index: true, foreign_key: true

    
  		
  end

  def down
  		
  end

end
