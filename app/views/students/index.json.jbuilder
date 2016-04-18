json.array!(@students) do |student|
  json.extract! student, :id, :first_name, :last_name, :dob, :emergency_contact, :address_line1, :address_line2, :city, :zip, :state, :country, :school_id, :parent_id
  json.url student_url(student, format: :json)
end
