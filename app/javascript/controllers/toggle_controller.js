import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="toggle"
export default class extends Controller {
  static targets = [ "content" ]

  toggle(event) {
    this.contentTarget.classList.toggle("hide")
    if (event.target.innerText == "X") {
      event.target.innerText = "+"
    } else {
      event.target.innerText = "X"
    }
  }
}
