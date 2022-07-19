class Curriculum < ApplicationRecord
  belongs_to :organization
  has_many :tclasses, inverse_of: :curriculum, dependent: :delete_all
  accepts_nested_attributes_for :tclasses, reject_if: :all_blank, allow_destroy: true
  validates :name, :class_type, :start_date, presence: true

  CLASS_TYPE = ['In Person', 'In Store', 'Online', 'Zoom', 'Other']

  def klass_info
    "#{name} - #{start_date ? start_date.strftime('%m/%d/%Y') : ''} - #{class_type}"
  end

  def self.is_current
    current_curriculum = []
    where(current: true).order(name: 'ASC', start_date: 'ASC').each do |c|
      current = true
      c.tclasses.order(id: 'ASC').each do |t|
        if t.class_date >= Date.today
          current_curriculum << c
          current = true
        else
          current = false
        end
      end
      c.update(current: false) unless current
    end
    current_curriculum.flatten.uniq
  end
end
