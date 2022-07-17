import { Controller } from "@hotwired/stimulus"
import { get, post, put, patch, destroy } from "@rails/request.js"


// Connects to data-controller="background"
export default class extends Controller {
  static targets = ["received", "approved", "notApproved"]

  connect() {
  }

  check_background(event) {
    const received = this.receivedTarget.checked
    const approved = this.approvedTarget.checked
    const notApproved = this.notApprovedTarget.checked
    const target = event.path[2].id
    const row = event.path[2].firstElementChild.innerText

    get(`/update_background?target=${target}&row=${row}&received=${received}&approved=${approved}&not_approved=${notApproved}`, {
      responseKind: "turbo-stream"
    })

  }
}
