class User < ApplicationRecord
  validates :username , presence: true, length: {maximum: 20 , minimum: 4}
  has_many :events
  has_many :reserves
end
