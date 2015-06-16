json.array!(@offices) do |office|
  json.extract! office, :id, :name, :department_id
  json.url office_url(office, format: :json)
end
