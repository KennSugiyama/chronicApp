class MovieAdapter
  def search(movie_title)
    movie = movie_title
    key = ENV['API_AUTH_KEY']
    request = HTTParty.get("http://www.omdbapi.com/?t=#{movie}&apikey=#{key}").parsed_response
  end
end