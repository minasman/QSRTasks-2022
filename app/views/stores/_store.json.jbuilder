json.extract! store, :id, :name, :number, :street, :city, :state, :zip, :phone, :email, :safe, :headset, :store_type, :active, :organization_id, :created_at, :updated_at, :ipad
json.url store_url(store, format: :json)
