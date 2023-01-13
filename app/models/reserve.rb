class Reserve < ApplicationRecord
  validates :name, presence: true
  validates :date, presence: true
  validates :city, presence: true
  belongs_to :user
  belongs_to :event, class_name: "Event"
end
