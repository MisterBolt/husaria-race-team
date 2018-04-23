class Event < ApplicationRecord
  belongs_to :user
  has_and_belongs_to_many :users, autosave: true

  validates :name, presence: true
  validates :location, presence: true
  validates :start, presence: true
end
