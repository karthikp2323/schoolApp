class AddSchoolIdToActivities < ActiveRecord::Migration
  
  def change
  	change_table :activities do |t|
  	t.references :school, index: true, foreign_key: true
	end
  end

end
