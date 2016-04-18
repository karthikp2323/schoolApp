class Message < ActiveRecord::Base
  belongs_to :parent
  belongs_to :school_users
end
