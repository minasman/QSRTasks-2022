class Reward < ApplicationRecord
  belongs_to :organization

  include PgSearch::Model
  pg_search_scope :search, against: [:name],  using: {tsearch: {prefix: true}}

end
