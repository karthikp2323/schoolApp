class CreatePushNotificationsForParents < ActiveRecord::Migration
  
  def change
    create_table :push_notifications_for_parents do |t|
      
      t.string :devise_type
      t.string :devise_token
      t.references :parent, index: true, foreign_key: true	
      t.timestamps null: false

    end
  end
  
end
