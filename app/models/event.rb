class Event < ApplicationRecord
  has_many :reserves
  belongs_to :user
end
