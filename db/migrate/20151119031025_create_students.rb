class CreateStudents < ActiveRecord::Migration
  def change
    create_table :students do |t|
      t.string :first_name
      t.string :last_name
      t.date :dob
      t.string :emergency_contact
      t.string :address_line1
      t.string :address_line2
      t.string :city
      t.string :zip
      t.string :state
      t.string :country
      t.references :school, index: true, foreign_key: true
      t.references :parent, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
