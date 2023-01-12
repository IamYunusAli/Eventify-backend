class Event < ApplicationRecord
  validates :name, presence: true
  validates :image, presence: true
  validates :category, presence: true
  validates :date , presence: true
  validates :time, presence: true
  validates :description, presence: true
  validates :organizer, presence: true
  validates :location, presence: true
  validates :price, presence: true, numericality: { greater_than_or_equal_to: 0 }
  has_many :reserves, dependent: :destroy
  belongs_to :user
end
