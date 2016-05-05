class AddStudentIdForActivity < ActiveRecord::Migration
  
  def change
  	change_table :activities do |t|
      t.references :student, index: true, foreign_key: true
    end
  end

end
