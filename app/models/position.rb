class Position < ApplicationRecord
  belongs_to :organization
  has_many :users
  has_many :documentations
  has_many :rewards
end
