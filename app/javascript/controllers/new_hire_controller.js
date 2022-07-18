import { Controller } from "@hotwired/stimulus"
import { get } from "@rails/request.js"

// Connects to data-controller="new-hire"
export default class extends Controller {
  static targets = ["newHireAge"]

  connect() {
    if (document.getElementById('new_hire_birthdate').value != "") {
      this.confirm_age()
      }
  }

  confirm_age(event) {
    const age = this.newHireAgeTarget
    const birthday = new Date(document.getElementById('new_hire_birthdate').value)
    age.value = parseInt(new Number((new Date().getTime() - birthday.getTime()) / 31536000000))

    if (age < 16) {
      age.addEventListener('invalid', function (event) {
        if (event.target.validity.rangeUnderflow) {
        event.target.setCustomValidity('Applicant Must Be At Least 16 Years Old');
      }
      })
      age.addEventListener('change', function (event) {
      event.target.setCustomValidity('');
      })
    } else {
      age.addEventListener('invalid', function (event) {
        event.target.setCustomValidity('');
      })
    }
  }

  rehire(event) {
    if (document.getElementsByName('new_hire[rehire]')[0].checked) {
      document.getElementById('new_hire_notes').setAttribute("required", "true")
      document.getElementById('new_hire_notes').setAttribute("placeholder", "Was Rehire Approved by Office or DO? Tattoos/Piercings Meet Appearance Guidelines or Approved by DO?")
    } else {
      document.getElementById('new_hire_notes').removeAttribute("required")
      document.getElementById('new_hire_notes').setAttribute("placeholder", "Tattoos/Piercings Meet Appearance Guidelines or Approved by DO?")
    }
  }

  verify_rehire(event) {
    let email = event.target.value
    get(`/verify_rehire?email=${email}`, {
      responseKind: "turbo-stream"
    })
  }

  attended(event) {

  }
}
