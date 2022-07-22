import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="toggle"
export default class extends Controller {
  static targets = [ "content" ]

  toggle(event) {
    this.contentTarget.classList.toggle("hide")
  }
}
