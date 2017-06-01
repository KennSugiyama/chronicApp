module ApplicationHelper
  def movie_title_search(request)
    if Movie.all.select{|movie| movie.title == request["Title"]}.empty?
      movie = Movie.create(title: request["Title"])
    else
      movie = Movie.find_by(title: request["Title"])
    end
  end
end
