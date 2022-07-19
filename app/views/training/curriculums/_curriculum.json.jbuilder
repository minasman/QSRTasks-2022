json.extract! curriculum, :id, :name, :start_date, :class_type, :organization_id, :current, :created_at, :updated_at
json.url curriculum_url(curriculum, format: :json)
