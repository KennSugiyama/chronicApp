
#Creates movie with a review
Movie.create!(title:"movie1").reviews.create!(body:"this is a review")
Movie.create!(title:"movie2").reviews.create!(body:"this is a review")
Movie.create!(title:"movie3").reviews.create!(body:"this is a review")
Movie.create!(title:"movie4").reviews.create!(body:"this is a review")
Movie.create!(title:"movie5").reviews.create!(body:"this is a review")


# Comment.create!(body:"This is a body")



#Create votes for movies
30.times do
  movie = Movie.all.sample
  movie.votes.create(point:rand(0...5))
end

#Create votes on Reviews
30.times do
  review = Review.all.sample
  review.votes.create(point:rand(0...1))
end

#Create Comments on Reviews
30.times do
  review = Review.all.sample
  review.comments.create(body:"This is a comment")
end

#Create votes on Comments
30.times do
  comment = Comment.all.sample
  comment.votes.create(point:rand(0...1))
end



# create random score for movie
# movie.votes.create(point:rand(0...5))
# test.sum(:point)
# test.average(:point)

# review = movie.reviews.create!(body:"this is a review")