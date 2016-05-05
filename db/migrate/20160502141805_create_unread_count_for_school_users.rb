class CreateUnreadCountForSchoolUsers < ActiveRecord::Migration
  def change
    create_table :unread_count_for_school_users do |t|

      t.integer :unread_messages
      t.integer :unread_events
      t.references :parent, index: true, foreign_key: true	
      t.references :school_user, index: true, foreign_key: true
      t.references :school, index: true, foreign_key: true	
      t.references :classroom, index: true, foreign_key: true	
      t.timestamps null: false

      t.timestamps null: false
    end
  end
end
