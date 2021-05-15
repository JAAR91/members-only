class Post < ApplicationRecord
  belongs_to :user
  has_many :comment

  validates :title, presence: true
  validates :body, presence: true, length: { minimum: 10 }
  validates :user_id, presence: true
end
