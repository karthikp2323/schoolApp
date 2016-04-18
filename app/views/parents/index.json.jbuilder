json.array!(@parents) do |parent|
  json.extract! parent, :id, :mom_fname, :mom_lname, :dad_fname, :dad_lname, :email_id, :contact, :login_id, :password
  json.url parent_url(parent, format: :json)
end
