json.array!(@trackers) do |tracker|
  json.extract! tracker, :id, :nasfile_id, :sender_id, :receiver_id
  json.url tracker_url(tracker, format: :json)
end
