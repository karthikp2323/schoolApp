class CreateClassRegistrations < ActiveRecord::Migration
  def change
    create_table :class_registrations do |t|
      t.references :classroom, index: true, foreign_key: true
      t.references :student, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
