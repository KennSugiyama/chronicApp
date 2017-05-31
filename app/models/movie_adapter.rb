class MovieAdapter
  def search(movie_title)
    key = ENV['API_AUTH_KEY']
    request = HTTParty.get("http://www.omdbapi.com/?t=#{movie_title}&apikey=#{key}").parsed_response
  end
end