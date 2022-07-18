import { Controller } from "@hotwired/stimulus"
import { get } from "@rails/request.js"

// Connects to data-controller="attend"
export default class extends Controller {
  static targets = ["attended"]

  connect() {
  }

  attended(event) {
    const attended = this.attendedTarget.checked
    const target = event.path[2].id
    const row = event.path[2].firstElementChild.innerText

    get(`/attended?target=${target}&row=${row}&attended=${attended}`, {
      responseKind: "turbo-stream"
    })
  }

  comment_update(event) {
    const update = event.target.value
    const target = event.target.id
    const row = event.path[2].firstElementChild.innerText

    console.log(event.target.id)
    console.log(row)
    get(`/comment_update?target=${target}&row=${row}&update=${update}`, {
     responseKind: "turbo-stream"
   })
  }
}
