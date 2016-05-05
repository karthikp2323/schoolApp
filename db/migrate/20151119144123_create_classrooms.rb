class CreateClassrooms < ActiveRecord::Migration
  def change
    create_table :classrooms do |t|
      t.string :class_name
      t.string :class_location
      t.string :class_level
      t.references :school, index: true, foreign_key: true
      t.references :school_user, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
