class Parent < ActiveRecord::Base
	has_many :students, :dependent => :destroy
	accepts_nested_attributes_for :students
	has_many :event_status
	has_many :comment
end
