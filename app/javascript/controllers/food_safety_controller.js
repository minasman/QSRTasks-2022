import { Controller } from "@hotwired/stimulus"
import SignaturePad from 'signature_pad'
import { get } from "@rails/request.js"

// Connects to data-controller="food-safety"
export default class extends Controller {
  static targets = ["info", "managerList"]
  connect() {
  }

  toggle(event) {
    event.target.parentElement.nextElementSibling.classList.toggle("hide")
    if (event.target.parentElement.nextElementSibling.classList.contains("hide")) {
      event.target.innerText = "SEE INFO"
    } else {
      event.target.innerText = "X"
    }
  }

  manager(event) {
    let form = document.getElementById("audit-form")
    form.classList.remove("hide")
    let store = document.getElementById("food_safety_audit_store_id").value
    let manager_list = event.target.selectedOptions[0].value
    let target = this.managerListTarget.id
    const shopButtons = document.getElementsByClassName('shopRadioButton')
    for (let i = 0; i < shopButtons.length; i++) {
      shopButtons[i].addEventListener('change', this.score)
    }
    get(`/food_safety_audits/manager_list?target=${target}&store=${store}`, {
      responseKind: "turbo-stream"
    })
  }

  score(event) {
    let scoredButtons = document.getElementsByClassName('shopRadioButton')
    document.getElementById('score').style.display = 'block'
    let critical = false
    let possiblePoints = 0
    let achievedPoints = 0
    for (let i = 0; i < scoredButtons.length; i++) {
      if (scoredButtons[i].checked === true) {
        if (parseInt(scoredButtons[i].value) > 0) {
          achievedPoints = achievedPoints + parseInt(scoredButtons[i].value)
          possiblePoints = possiblePoints + parseInt(scoredButtons[i].value)
        } else if (parseInt(scoredButtons[i].value) === 0) {
          possiblePoints = possiblePoints + parseInt(scoredButtons[i - 1].value)
        } else if (scoredButtons[i].value === 'critical') {
          critical = true
        } else {

        }
      }
    }
    document.getElementById('score').innerHTML = `${possiblePoints} Points Possible & ${achievedPoints} Points Achieved<br>Score: ${(parseFloat(achievedPoints / possiblePoints) * 100).toFixed(2)}% - Critical: ${critical ? "TRUE - Unacceptable Visit" : "False"}`
    document.getElementById('food_safety_audit_score').value = `${(parseFloat(achievedPoints / possiblePoints) * 100).toFixed(2)}`
    document.getElementById('food_safety_audit_critical').value = `${critical}  `
  }
}
