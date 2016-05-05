class AddEmailForStudent < ActiveRecord::Migration
  
  def change

  	change_table :students do |t|
      t.string :email_id
    end

  end

end
