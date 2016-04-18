class CreateActivities < ActiveRecord::Migration
  def change
    create_table :activities do |t|
      t.string :title
      t.text :message
      t.boolean :activity_type
      t.boolean :allow_comment
      
      t.references :classroom, index: true, foreign_key: true
      t.references :school_user, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
