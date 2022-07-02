class Organization < ApplicationRecord
  has_many :users
  has_many :positions
  has_many :stores
end
