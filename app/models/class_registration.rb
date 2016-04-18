class ClassRegistration < ActiveRecord::Base
  belongs_to :classroom
  belongs_to :student
  
  
end
