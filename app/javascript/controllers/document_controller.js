import { Controller } from "@hotwired/stimulus"
import { get } from "@rails/request.js"


// Connects to data-controller="document"
export default class extends Controller {
  static targets = ["employeeList", "levelList"]

  connect() {
  }

  employee(e) {
    let store = document.getElementById("documentation_store_id").value
    let employee_list = e.target.selectedOptions[0].value
    let target = this.employeeListTarget.id
    get(`/documentations/employee_list?target=${target}&store=${store}`, {
      responseKind: "turbo-stream"
    })
  }

  document_level(e) {
    let type = document.getElementById("document_documentation_type").value
    let target = this.levelListTarget.id
    get(`/documents/level_list?target=${target}&type=${type}`, {
      responseKind: "turbo-stream"})
  }
}
