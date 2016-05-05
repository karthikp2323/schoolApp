class CreateSchools < ActiveRecord::Migration
  def change
    create_table :schools do |t|
      t.string "school_name", :limit => 100
      t.string "address_line1", :limit => 100
      t.string "address_line2", :limit => 100
      t.string "city", :limit => 100
      t.string "zip", :limit => 100
      t.string "state", :limit => 100
      t.string "country", :limit => 100
      t.string "fax", :limit => 15
      t.string "contact", :limit => 15
      t.string "working_hours", :limit => 50
      t.string "contact_person", :limit => 100
      t.string "email_id", :limit => 100
      
      t.timestamps 
    end
  end
end
