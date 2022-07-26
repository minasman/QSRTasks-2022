class WorkorderUpdate < ApplicationRecord
  belongs_to :user
  belongs_to :workorder
  has_many_attached :pictures, dependent: :delete_all

  validate :acceptable_images

  def acceptable_images
    return unless pictures.attached?
    acceptable_types = ["image/jpeg", "image/png"]
    pictures.each do |p|
      unless acceptable_types.include?(p.content_type)
        errors.add(:pictures, "Pictures Must Be JPEG or PNG")
      end
    end
  end

end
