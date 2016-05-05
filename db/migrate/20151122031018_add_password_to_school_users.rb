class AddPasswordToSchoolUsers < ActiveRecord::Migration
  
  def up
  	remove_column "school_users", "password"
  	add_column "school_users", "password_digest", :string
  end

def down
	add_column "school_users", "password"
	remove_column "school_users", "password_digest"

end
end
