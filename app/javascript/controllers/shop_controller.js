import { Controller } from "@hotwired/stimulus"
import { get } from "@rails/request.js"


// Connects to data-controller="shop"
export default class extends Controller {
  static targets = ["managerList"]

  connect() {
  }

  manager(e) {
    let store = document.getElementById("shop_store_id").value
    let manager_list = e.target.selectedOptions[0].value
    let target = this.managerListTarget.id
    get(`/shops/manager_list?target=${target}&store=${store}`, {
      responseKind: "turbo-stream"
    })
  }
}
