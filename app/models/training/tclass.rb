class Tclass < ApplicationRecord
  belongs_to :curriculum
  has_and_belongs_to_many :users
  belongs_to :instructor, class_name: 'User'

  validates :name, :duration, :location, :instructor, :capacity, :class_date, :class_time, presence: true
  validates :capacity, :duration, numericality: true
end
