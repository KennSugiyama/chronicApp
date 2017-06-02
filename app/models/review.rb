class Review < ApplicationRecord
  validates :body, presence: true

  belongs_to :movie
  belongs_to :user
  has_many  :comments, as: :commentable
  has_many  :votes, as: :voteable
end
