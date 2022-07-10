json.extract! document, :id, :organization_id, :documentation_type, :documentation_class, :level, :definition, :description, :points, :created_at, :updated_at
json.url document_url(document, format: :json)
