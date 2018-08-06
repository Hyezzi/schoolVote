json.extract! router, :id, :name, :placename, :latitude, :longitude, :created_at, :updated_at
json.url router_url(router, format: :json)
