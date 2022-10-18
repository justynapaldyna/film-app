json.extract! movie, :id, :title, :description, :movie_length, :director, :language, :rating, :created_at, :updated_at
json.url movie_url(movie, format: :json)
