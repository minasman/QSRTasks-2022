import { Controller } from "@hotwired/stimulus"
import { get } from "@rails/request.js"


// Connects to data-controller="student"
export default class extends Controller {
  static targets = ["class_id"]
  connect() {
  }

  get_tclasses(event) {
    const curriculum = event.target.selectedOptions[0].value
    get(`/get_classes?curriculum=${curriculum}`, {
      responseKind: "turbo-stream"
    })
  }

  register(event) {
    let r_classes = []
    for (let i in this.class_idTargets) {
      if (this.class_idTargets[i].checked) {
        r_classes.push(this.class_idTargets[i].value)
      }
    }
    get(`/register?classes=${r_classes}`, {
      responseKind: "turbo-stream"
    })
  }
}
