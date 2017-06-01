module ApplicationHelper
  def movie_title_search(request)
    Movie.find_or_create_by(title: request["Title"], genre: request["Genre"], year: request["Year"], actors: request["Actors"], director: request["Director"])
  end
end








