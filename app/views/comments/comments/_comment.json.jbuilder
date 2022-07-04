json.extract! comment, :id, :visit_date, :visit_time, :comment_type, :source, :urgent, :case_number, :first_issue, :first_issue_comment, :second_issue, :second_issue_comment, :third_issue, :third_issue_comment, :contact_type, :visit_type, :employee_named, :status, :organization_id, :store_id, :user_id, :guest_id, :created_at, :updated_at
json.url comment_url(comment, format: :json)
