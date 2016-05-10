class CreatePushNotificationsForSchoolUsers < ActiveRecord::Migration
  
  def change
    create_table :push_notifications_for_school_users do |t|
      t.string :devise_type
      t.string :devise_token
      t.references :school_user, index: true, foreign_key: true		
      t.timestamps null: false
    end
  end
  
end
