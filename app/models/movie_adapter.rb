class MovieAdapter
  def search(movie_title)
    movie = movie_title

    request = HTTParty.get("http://www.omdbapi.com/?t=#{movie}&apikey=c173dc09").parsed_response
  end
end