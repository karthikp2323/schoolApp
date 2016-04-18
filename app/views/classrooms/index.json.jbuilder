json.array!(@classrooms) do |classroom|
  json.extract! classroom, :id, :class_name, :class_location, :class_level, :school_id, :teacher_id
  json.url classroom_url(classroom, format: :json)
end
