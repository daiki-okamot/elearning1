class Comment < ApplicationRecord
  belongs_to :movie
  belongs_to :user

  validates :body, presence: true, length: { maximum: 140 }
end
