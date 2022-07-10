class Document < ApplicationRecord
  belongs_to :organization

  DOCUMENT_TYPE = %w[Commendation Documentation]
  DOCUMENT_CLASS = %w[Behavior Result]
  DOCUMENT_LEVEL_COMMENDATION = %w[Praise! Cheers! Applause!]
  DOCUMENT_LEVEL_DOCUMENTATION = %w[Major Serious Critical]

  include PgSearch::Model
  pg_search_scope :search, against: [:definition],  using: {tsearch: {prefix: true}}

end
