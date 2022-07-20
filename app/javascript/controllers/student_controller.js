import { Controller } from "@hotwired/stimulus"
import { get } from "@rails/request.js"


// Connects to data-controller="student"
export default class extends Controller {
  static targets = ["class_id", "tclasses"]
  static values = {
    id: String
  }
  connect() {
  }

  get_tclasses(event) {
    const curriculum = event.target.selectedOptions[0].value
    console.log(this.tclassesTarget)
    const id = this.idValue
    get(`/get_classes?curriculum=${curriculum}&id=${id}`, {
      responseKind: "turbo-stream"
    })
  }

  register(event) {
    const id = this.idValue
    let r_classes = []
    for (let i in this.class_idTargets) {
      if (this.class_idTargets[i].checked) {
        r_classes.push(this.class_idTargets[i].value)
      }
    }
    get(`/register?rclasses=${r_classes}&id=${id}`, {
      responseKind: "turbo-stream"
    })
  }
}
