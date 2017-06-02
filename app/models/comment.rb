class Comment < ApplicationRecord
  validates :body, presence: true

  belongs_to :review
  belongs_to :user

  has_many  :votes, as: :voteable
end
