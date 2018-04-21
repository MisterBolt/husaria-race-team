class Event < ApplicationRecord
  has_and_belongs_to_many :users

  validates :name, presence: true
  validates :location, presence: true
  validates :start, presence: true


end
