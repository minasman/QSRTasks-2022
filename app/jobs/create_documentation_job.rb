class CreateDocumentationJob < ApplicationJob
  queue_as :low

  def perform(employee, new_params, document)
    flow_document = Documentation.new(new_params)
    flow_document.employee_named = employee
    flow_document.position = employee.position
    flow_document.description = "Initial Named Employee: #{document.employee_named.full_name} at #{document.store.number}: #{document.description}"
    if flow_document.save
      updated_points = employee.accumulated_points + flow_document.points
      employee.update(accumulated_points: updated_points)
    end
  end
end
