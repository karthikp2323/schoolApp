class School < ActiveRecord::Base

	has_many :school_users, :dependent => :destroy
	accepts_nested_attributes_for :school_users
end
