json.array!(@nasfiles) do |nasfile|
  json.extract! nasfile, :id, :file_name, :file_number, :file_sub, :file_volume, :category_id, :file_description
  json.url nasfile_url(nasfile, format: :json)
end
