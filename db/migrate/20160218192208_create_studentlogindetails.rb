class CreateStudentlogindetails < ActiveRecord::Migration
  
  def change
   
    create_table :studentlogindetails do |t|
      t.string :login_id		
      t.string :password_digest	
      t.references :student, index: true, foreign_key: true

      t.timestamps null: false
    end
   
   end
  
end
