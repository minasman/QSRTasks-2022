class CovidStatus < ApplicationRecord
  belongs_to :organization
  belongs_to :store
  belongs_to :user

  validates :store_id, :timecard, :first_name, :last_name, :status, presence: true
  validate :covid_pic_attached

  has_many_attached :pictures, dependent: :delete_all

  before_save :format_content
  validate :acceptable_images


  def full_name
    first_name + ' ' + last_name
  end

  def format_content
    self.first_name = first_name.strip.titleize
    self.last_name = last_name.strip.titleize
  end

  def acceptable_images
    return unless pictures.attached?
    acceptable_types = ["image/jpeg", "image/png"]
    pictures.each do |p|
      unless acceptable_types.include?(p.content_type)
        errors.add(:pictures, "Pictures Must Be JPEG or PNG")
      end
    end
  end

  def covid_pic_attached
    if status.in? ['Fully Vaccinated', 'Partially Vaccinated'] and !pictures.attached?
      errors.add(:status, "You must submit a photo of your proof of vaccination")
    end
  end
end
