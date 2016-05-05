class AddProfileImageToSchoolUser < ActiveRecord::Migration
  
  def self.up
    change_table :school_users do |t|
      t.attachment :image
    end
  end

  def self.down
    remove_attachment :school_users, :image
  end

end
