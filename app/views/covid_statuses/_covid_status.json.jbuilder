json.extract! covid_status, :id, :organization_id, :first_name, :last_name, :store_id, :status, :user_id, :timecard, :created_at, :updated_at
json.url covid_status_url(covid_status, format: :json)
