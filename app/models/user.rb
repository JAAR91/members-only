class User < ApplicationRecord
  has_many :post
  has_many :comment

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
end
