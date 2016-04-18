class AddIsloginStudent < ActiveRecord::Migration
  
  def change
  	
  	change_table :students do |t|
      t.boolean :IsLogIn
    end

  end

end
