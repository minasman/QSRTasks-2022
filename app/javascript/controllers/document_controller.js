import { Controller } from "@hotwired/stimulus"
import { get } from "@rails/request.js"


// Connects to data-controller="document"
export default class extends Controller {
  static targets = ["documentType", "employeeList", "levelList", "documentList", "docKlassList"]

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
    let type = this.documentTypeTarget.value
    this.levelListTarget.selected = ''
    this.docKlassListTarget.value = ''
    document.getElementById("documentation_document_id").value = ''
    let target = this.levelListTarget.id
    get(`/documents/level_list?target=${target}&type=${type}`, {
      responseKind: "turbo-stream"})
  }

  document_klass(e) {
    this.docKlassListTarget.value = ''
    document.getElementById("documentation_document_id").value = ''
  }

  document_level_document(e) {
    let type = document.getElementById(e.path[0].id).value
    this.levelListTarget.selected = ''
    this.docKlassListTarget.value = ''
    let target = this.levelListTarget.id
    get(`/documents/level_list?target=${target}&type=${type}`, {
      responseKind: "turbo-stream"})
  }

  document_list(e) {
    let type = document.getElementById("documentation_documentation_type").value
    let level = document.getElementById("documentation_level").value
    let klass = document.getElementById("documentation_documentation_class").value
    let target = this.documentListTarget.id
    get(`/documentations/document_list?target=${target}&type=${type}&level=${level}&klass=${klass}`, {
      responseKind: "turbo-stream"})
  }
}
