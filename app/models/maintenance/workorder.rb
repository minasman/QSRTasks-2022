class Workorder < ApplicationRecord
  belongs_to :store
  belongs_to :user
  belongs_to :organization
  belongs_to :equipment
  belongs_to :equipment_area
  belongs_to :equipment_type
  belongs_to :vendor
  has_many_attached :pictures, dependent: :delete_all
  has_many :workorder_updates, dependent: :delete_all
  accepts_nested_attributes_for :workorder_updates

  include PgSearch::Model
  pg_search_scope :search, associated_against: {
    user: [:first_name, :last_name],
    store: [:number, :name],
    equipment: :name,
  }, against: [:team, :level, :id], using: {tsearch: {prefix: true}}

  validate :acceptable_images

  PRIORITY = %w[1 2 3 4 5 6 PM]
  TEAM = %w[Rick David Steve Floyd]

  scope :open, -> { where(status: 'Open') }
  scope :p1_open, -> { where(status: 'Open', level: '1').order(store_id: 'ASC', created_at: 'ASC') }
  scope :p2_open, -> { where(status: 'Open', level: '2').order(store_id: 'ASC', created_at: 'ASC') }
  scope :p3_open, -> { where(status: 'Open', level: '3').order(store_id: 'ASC', created_at: 'ASC') }
  scope :p4_open, -> { where(status: 'Open', level: '4').order(store_id: 'ASC', created_at: 'ASC') }
  scope :p5_open, -> { where(status: 'Open', level: '5').order(store_id: 'ASC', created_at: 'ASC') }
  scope :p6_open, -> { where(status: 'Open', level: '6').order(store_id: 'ASC', created_at: 'ASC') }
  scope :p7_open, -> { where(status: 'Open', level: 'PM').order(store_id: 'ASC', created_at: 'ASC') }
  scope :nolevel_open, -> { where(status: 'Open', level: "") }
  scope :unassigned, -> { where(assigned: nil, status: 'Open') }
  scope :current, -> { where(updated_at: Time.now.beginning_of_year...Time.now) }

  def self.open_wo(user)
    if user.position.department == 'Operations'
      self.where(status: 'Open', store_id: user.stores.ids)
    else
      self.where(status: 'Open')
    end
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

  def self.to_csv(workorders)
    attributes = %w[# Restaurant WO# Submitted Equipment Issue By Team Assigned Vendor Updates Last Priority]
    CSV.generate(headers: true) do |csv|
      csv << attributes
      workorders.each_with_index do |wo, i|
        number = i + 1
        restaurant = wo.store.number
        wonum = wo.id
        submitted = wo.created_at.strftime('%m/%d/%y')
        equipment = wo.equipment.name
        issue = wo.workorder_issue
        by = wo.user.full_name
        team = wo.team.nil? ? 'Not Assigned' : wo.team
        assigned = wo.assigned.nil? ? 'Not Assigned' : User.find(wo.assigned.to_i).full_name
        vendor = wo.vendor_id.nil? ? 'Not Assigned' : Vendor.find(wo.vendor_id).name
        updates = wo.workorder_updates.size
        last = wo.workorder_updates.size > 0 ? wo.workorder_updates.last.created_at.strftime('%m/%d/%y') : 'No Updates'
        priority = wo.level
        csv << [number, restaurant, wonum, submitted, equipment, issue, by, team, assigned, vendor, updates, last, priority ]
      end
    end
  end

  def pictures=(attachables)
    pictures.attach(attachables)
  end

end
