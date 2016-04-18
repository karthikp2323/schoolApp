json.array!(@activities) do |activity|
  json.extract! activity, :id, :title, :message, :type, :allow_comment, :classroom_id, :school_users_id
  json.url activity_url(activity, format: :json)
end
