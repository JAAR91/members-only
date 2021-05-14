class User < ApplicationRecord
  has_many :post
  
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

         
end
