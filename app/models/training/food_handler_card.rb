class FoodHandlerCard < ApplicationRecord
  belongs_to :organization
  belongs_to :store
  belongs_to :user

  has_one_attached :picture, dependent: :delete_all

  validate :acceptable_images

  def acceptable_images
    return unless picture.attached?
    acceptable_types = ["image/jpeg", "image/png", "application/pdf"]
    unless acceptable_types.include?(picture.content_type)
      errors.add(:picture, "Pictures Must Be JPEG or PNG")
    end
  end
end
