json.extract! workorder, :id, :store_id, :user_id, :organization_id, :equipment_id, :equipment_area_id, :equipment_type_id, :workorder_issue, :status, :assigned, :level, :team, :vendor_id, :created_at, :updated_at
json.url workorder_url(workorder, format: :json)
