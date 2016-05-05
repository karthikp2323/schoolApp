class ModifyEvent < ActiveRecord::Migration
  
  def change
  	change_table :events do |t|
      t.date :event_end_time
      t.references :school, index: true, foreign_key: true
    end
  end

end
