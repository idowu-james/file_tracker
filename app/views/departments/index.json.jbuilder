json.array!(@departments) do |department|
  json.extract! department, :id, :name, :head
  json.url department_url(department, format: :json)
end
