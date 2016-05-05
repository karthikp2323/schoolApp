class AddProfileImageToParent < ActiveRecord::Migration
  
  def self.up
    change_table :parents do |t|
      t.attachment :image
    end
  end

  def self.down
    remove_attachment :parents, :image
  end

end
