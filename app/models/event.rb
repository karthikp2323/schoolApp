class Event < ActiveRecord::Base
  belongs_to :school_user
  belongs_to :classroom
  
  
end
 