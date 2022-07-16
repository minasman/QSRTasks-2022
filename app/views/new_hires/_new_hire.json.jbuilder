json.extract! new_hire, :id, :organization_id, :store_id, :user_id, :first_name, :last_name, :email, :phone, :social, :rate, :birthdate, :position_id, :referred_by, :rehire, :notes, :hear, :attended, :requirements, :background_received, :background_ok, :comments, :background_na, :created_at, :updated_at
json.url new_hire_url(new_hire, format: :json)
