import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="curriculum"
export default class extends Controller {
  static targets = ["links", "template"]

  connect() {
    this.wrapperClass = this.data.get("wrapperClass") || "nested_classes"
  }

  add_class(event) {
    event.preventDefault()
    let content = this.templateTarget.innerHTML.replace(/NEW_RECORD/g, new Date().getTime())
    this.linksTarget.insertAdjacentHTML('beforebegin', content)
  }

  remove_class(event) {
    event.preventDefault()
    let wrapper = event.target.closest("." + this.wrapperClass)
    // New records are simply removed from the page
    if (wrapper.dataset.newRecord == "true") {
      wrapper.remove()
    // Existing records are hidden and flagged for deletion
    } else {
      wrapper.querySelector("input[name*='_destroy']").value = 1
      wrapper.style.display = 'none'
    }
  }
}
