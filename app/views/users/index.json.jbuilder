json.array!(@users) do |user|
  json.extract! user, :id, :name, :position, :hiring_date, :birth_date
  json.url user_url(user, format: :json)
end
