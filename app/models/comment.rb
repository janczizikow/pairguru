class Comment < ApplicationRecord
  belongs_to :user
  belongs_to :movie

  validates :user, :movie, presence: true, uniqueness: { scope: %i[movie user] }
  validates :rating, presence: true, inclusion: { in: [1, 2, 3, 4, 5] }
end
