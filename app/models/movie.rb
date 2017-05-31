class Movie < ApplicationRecord
  validates :title, presence: true

  has_many  :reviews
  has_many  :votes, as: :voteable
end
