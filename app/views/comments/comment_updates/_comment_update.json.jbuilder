json.extract! comment_update, :id, :update_date, :update_time, :update_type, :current_update, :employee_name, :comment_id, :user_id, :created_at, :updated_at
json.url comment_update_url(comment_update, format: :json)
