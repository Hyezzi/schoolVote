json.extract! vote_log, :id, :studentID, :name, :image, :created_at, :updated_at
json.url vote_log_url(vote_log, format: :json)
