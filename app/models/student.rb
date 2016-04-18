class Student < ActiveRecord::Base
  belongs_to :school
  belongs_to :parent

  has_many :class_registration, :dependent => :destroy
  accepts_nested_attributes_for :class_registration
end
