class Document < ApplicationRecord
  belongs_to :organization
  belongs_to :documentation
end
