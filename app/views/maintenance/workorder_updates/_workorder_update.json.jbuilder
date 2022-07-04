json.extract! workorder_update, :id, :user_id, :workorder_id, :current_update, :manager, :signature, :created_at, :updated_at
json.url workorder_update_url(workorder_update, format: :json)
