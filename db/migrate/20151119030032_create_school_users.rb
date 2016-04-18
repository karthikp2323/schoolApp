class CreateSchoolUsers < ActiveRecord::Migration
  def change
    create_table :school_users do |t|
      t.string :first_name
      t.string :last_name
      t.string :email_id
      t.string :contact
      t.string :login_id
      t.string :password
      t.references :role, index: true, foreign_key: true
      t.references :school, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
