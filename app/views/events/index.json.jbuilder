json.array!(@eventsList) do |event|
  json.extract! event, :id, :event_title, :event_description, :event_time, :school_user_id, :event_location, :classroom_id
  json.start event.date
  
  json.url event_url(event.id, format: :html)
end

