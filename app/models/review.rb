class Review < ApplicationRecord
  validates :body, presence: true

  belongs_to :movie
  has_many  :comments
  has_many  :votes, as: :voteable
end
