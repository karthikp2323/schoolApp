class EventStatus < ActiveRecord::Base
  belongs_to :events
  belongs_to :parent
end
