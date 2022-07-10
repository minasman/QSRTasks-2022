class Position < ApplicationRecord
  belongs_to :organization
  has_many :users
  has_many :documentations
end
