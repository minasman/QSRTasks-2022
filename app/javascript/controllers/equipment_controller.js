import { Controller } from "@hotwired/stimulus"
import { get } from "@rails/request.js"

// Connects to data-controller="equipment"
export default class extends Controller {
  static targets = ["equipmentArea", "equipmentChoice"]

  connect() {
  }

  store(e) {
    document.getElementById("workorder_equipment_area_id").removeAttribute("disabled")
  }

  equipment_type(e) {
    let store = document.getElementById("workorder_store_id").value
    let equipment_area = e.target.selectedOptions[0].value
    let target = this.equipmentAreaTarget.id
    this.equipmentAreaTarget.removeAttribute("disabled")
    get(`/workorders/equipment_types?target=${target}&equipment_area=${equipment_area}&store=${store}`, {
      responseKind: "turbo-stream"
    })
  }

  equipment_choice(e) {
    let store = document.getElementById("workorder_store_id").value
    let equipment_type = e.target.selectedOptions[0].value
    let target = this.equipmentChoiceTarget.id
    this.equipmentChoiceTarget.removeAttribute("disabled")
    get(`/workorders/equipment_choices?target=${target}&equipment_type=${equipment_type}&store=${store}`, {
      responseKind: "turbo-stream"
    })
  }

  add_equipment(e) {
    let equipment_type = e.target.selectedOptions[0].value
    let target = this.equipmentAreaTarget.id
    this.equipmentAreaTarget.removeAttribute("disabled")
    get(`/equipment/add_equipment?target=${target}&equipment_area=${equipment_type}`, {
      responseKind: "turbo-stream"
    })
  }

  store_choice(e) {
    let mylist = document.getElementsByName("equipment[store_list][store_id][]")
    for (let i = 1; i < mylist.length; i++ ) {
      mylist[i].checked = true
    }
  }
}
