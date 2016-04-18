class Comment < ActiveRecord::Base
  belongs_to :activity
  belongs_to :parent
  belongs_to :school_users
end
