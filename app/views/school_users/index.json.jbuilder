json.array!(@school_users) do |school_user|
  json.extract! school_user, :id, :first_name, :last_name, :email_id, :contact, :login_id, :password, :role_id, :school_id
  json.url school_user_url(school_user, format: :json)
end
