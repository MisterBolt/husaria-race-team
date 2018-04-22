class Event < ApplicationRecord
  belongs_to :user, class_name: "User", foreign_key: "user_id"
  has_and_belongs_to_many :users

  validates :name, presence: true
  validates :location, presence: true
  validates :start, presence: true
end
