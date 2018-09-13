class Comment < ApplicationRecord
  belongs_to :user
  belongs_to :movie

  validates :user, :movie, uniqueness: true
  validates :rating, presence: true, inclusion: { in: [1, 2, 3, 4, 5] }
end
