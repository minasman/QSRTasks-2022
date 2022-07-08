import { Controller } from "@hotwired/stimulus"
import SignaturePad from 'signature_pad'

// Connects to data-controller="safe-audit"
export default class extends Controller {
  connect() {
    var wrapper = document.getElementById("signature-pad")
    var canvas = wrapper.querySelector("canvas")
    var signaturePad = new SignaturePad(canvas, {
      backgroundColor: 'rgb(255, 255, 255)'
    })
    canvas.addEventListener('mouseup', handleMouseUp)
    canvas.addEventListener('touchend', handleMouseUp)
    function handleMouseUp() {
      document.querySelector('#safe_audit_signature').value = signaturePad.toDataURL("image/jpeg")
    }
  }

  updateTotal() {
    let safeCount = isNaN(parseFloat(document.getElementById('safeControl').innerText.substring(1))) ? 0.00 : parseFloat(document.getElementById('safeControl').innerText.substring(1))
    const totalSafe = isNaN(parseFloat(document.getElementById('totalSafe').innerText.substring(1))) ?  0.00 : parseFloat(document.getElementById('totalSafe').innerText.substring(1))
    const safeVariance = safeCount - totalSafe
    //const safeVariance = isNaN(parseFloat(document.getElementById('safeVariance').innerText.substring(1))) ?  0.00 : parseFloat(document.getElementById('safeVariance').innerText.substring(1))
    document.getElementById('safeVariance').innerText = `$${ safeVariance }`
  }

  store(event) {
    let safeCount = document.getElementById('safeControl')
    const store = document.getElementById('safe_audit_store_id').value
    fetch(`/stores/${store}.json`)
    .then(response => response.json())
    .then(function (myJson) {
      safeCount.innerText = `$${parseFloat(myJson.safe).toFixed(2)}`
      if (myJson.store_type == 'WM') {
        document.getElementById('headsets').classList.add('hidden')
      } else {
        document.getElementById('headsets').classList.remove('hidden')
      }
    }).then(this.updateTotal())
  }

  headset(event) {
    const store = parseInt(document.getElementById('safe_audit_store_id').value)

    let working = isNaN(parseInt(document.getElementById('safe_audit_working_headset').value)) ? 0 : parseInt(document.getElementById('safe_audit_working_headset').value)
    let nonworking = isNaN(parseInt(document.getElementById('safe_audit_non_working_headset').value)) ? 0 : parseInt(document.getElementById('safe_audit_non_working_headset').value)
    let totalHeadset = document.getElementById('safe_audit_total_headset')
    totalHeadset.value = working + nonworking
    if (parseInt(totalHeadset.value) > 0) {
      fetch(`/stores/${store}.json`)
      .then((response) => response.json())
      .then(function (myJson) {
        if (parseInt(myJson.headset) > 0) {
          document.getElementById('safe_audit_missing_headset').value = parseInt(myJson.headset) - parseInt(totalHeadset.value)
        }
      });
    }
  }

  totalDrawer(event) {
    const totalSafe = document.getElementById('totalSafe')
    const drawerCount = isNaN(parseInt(document.getElementById("safe_audit_drawer").value)) ? 0 : document.getElementById('safe_audit_drawer').value
    const drawerCash = isNaN(parseInt(document.getElementById("safe_audit_drawer_amount").value)) ? 0 : document.getElementById('safe_audit_drawer_amount').value
    const drawerTotal = document.getElementById('totalDrawers')

    let lineTotal = parseInt(drawerCount) * parseInt(drawerCash)
    let originalValue
    if ((this.data.get("drawer") == "0")) {
      originalValue = 0
    } else {
      originalValue = parseFloat(this.data.get("drawer"))
    }

    if ((drawerCash == "") || (drawerCount == "")) {
      drawerTotal.innerText = "$0"
      totalSafe.innerText = "$0"
      document.getElementById('safeVariance').innerText = "$0"
    } else {
      const safeControl = isNaN(parseFloat(document.getElementById('safeControl').innerText.substring(1)).toFixed(2)) ? 0.00 : parseFloat(document.getElementById('safeControl').innerText.substring(1)).toFixed(2)

      drawerTotal.innerText = `$${parseFloat(lineTotal).toFixed(2)}`
      this.data.set("drawer", lineTotal)

      totalSafe.innerText = `$${((parseFloat(totalSafe.innerText.substring(1)) - originalValue) + parseFloat(lineTotal)).toFixed(2)}`

      this.updateTotal()

      document.querySelector('#safe_audit_totalSafe').value = totalSafe.innerText.substring(1)
      document.querySelector('#safe_audit_safeVariance').value = document.getElementById('safeVariance').innerText.substring(1)
    }
  }

  subtotal(event) {
    let totalSafe = document.getElementById('totalSafe')
    let safeCount = totalSafe.innerText.length == 0 ? 0.00 : parseFloat(totalSafe.innerText.substring(1))
    let lineTotal
    let lineQuantity = event.target.value
    let lineValue = event.target.id

    let originalValue
    if (this.data.get("total") == "0" ) {
      originalValue = 0
    } else {
      originalValue = parseFloat(this.data.get("total"))
    }

    if (totalSafe.innerText == '$NaN') {
      totalSafe.innerText = `$${parseFloat(originalValue).toFixed(2)}`
    }

    if (lineValue == 'safe_audit_hundred') {
      lineTotal = (parseInt(lineQuantity) * 100).toFixed(2)
    } else if (lineValue == 'safe_audit_fifty') {
      lineTotal =(parseInt(lineQuantity) * 50).toFixed(2)
    } else if (lineValue == 'safe_audit_twenty') {
      lineTotal = (parseInt(lineQuantity) * 20).toFixed(2)
    } else if (lineValue == 'safe_audit_ten') {
      lineTotal = (parseInt(lineQuantity) * 10).toFixed(2)
    } else if (lineValue == 'safe_audit_five') {
      lineTotal = (parseInt(lineQuantity) * 5).toFixed(2)
    } else if (lineValue == 'safe_audit_two') {
      lineTotal = (parseInt(lineQuantity) * 2).toFixed(2)
    } else if (lineValue == 'safe_audit_one') {
      lineTotal = (parseInt(lineQuantity) * 1).toFixed(2)
    } else if (lineValue == 'safe_audit_quarter') {
      lineTotal = (parseFloat(parseInt(lineQuantity) * 10).toFixed(2))
    } else if (lineValue == 'safe_audit_dime') {
      lineTotal = (parseFloat(parseInt(lineQuantity) * 5).toFixed(2))
    } else if (lineValue == 'safe_audit_nickel') {
      lineTotal = (parseFloat(parseInt(lineQuantity) * 2).toFixed(2))
    } else if (lineValue == 'safe_audit_penny') {
      lineTotal = (parseFloat(parseInt(lineQuantity) * 0.5).toFixed(2))
    } else if (lineValue == 'safe_audit_dollarCoin') {
      lineTotal = (parseFloat(parseInt(lineQuantity) * 1).toFixed(2))
    } else if (lineValue == 'safe_audit_halfDollar') {
      lineTotal = (parseFloat(parseInt(lineQuantity) * 0.5).toFixed(2))
    } else if (lineValue == 'safe_audit_giftCertificate') {
      lineTotal = (parseFloat(parseInt(lineQuantity)).toFixed(2))
    } else if (lineValue == 'safe_audit_giftCertificateRedeemed') {
      lineTotal = (parseFloat(parseInt(lineQuantity)).toFixed(2))
    }
    event.target.parentElement.nextElementSibling.nextElementSibling.children[0].innerText = `$${lineTotal}`

    this.data.set("total", lineTotal)

    totalSafe.innerText = `$${((safeCount - originalValue) + parseFloat(lineTotal)).toFixed(2)}`

    document.getElementById('safeVariance').innerText = `$${(parseFloat(totalSafe.innerText.substring(1)) - parseFloat(document.getElementById('safeControl').innerText.substring(1))).toFixed(2)}`

    document.querySelector('#safe_audit_totalSafe').value = totalSafe.innerText.substring(1)

    document.querySelector('#safe_audit_safeVariance').value = document.getElementById('safeVariance').innerText.substring(1)
  }

  moveSubtotal(event) {
    let totalSafe = document.getElementById('totalSafe')
    let lineQuantity = event.target.value
    if (parseFloat(lineQuantity) > 0) {
      event.target.parentElement.nextElementSibling.nextElementSibling.children[0].innerText = `$${parseFloat(lineQuantity).toFixed(2)}`
    } else {
      lineQuantity = 0
      event.target.parentElement.nextElementSibling.nextElementSibling.children[0].innerText = `$${parseFloat(lineQuantity).toFixed(2)}`
    }
    let originalValue
    if (this.data.get("total") == "0") {
      originalValue = 0
    } else {
      originalValue = parseFloat(this.data.get("total"))
    }
    this.data.set("total", lineQuantity)
    totalSafe.innerText = `$${((parseFloat(totalSafe.innerText.substring(1)) - originalValue) + parseFloat(lineQuantity)).toFixed(2)}`
    document.getElementById('safeVariance').innerText = `$${(parseFloat(totalSafe.innerText.substring(1)) - parseFloat(document.getElementById('safeControl').innerText.substring(1))).toFixed(2)}`
    document.querySelector('#safe_audit_totalSafe').value = totalSafe.innerText.substring(1)
    document.querySelector('#safe_audit_safeVariance').value = document.getElementById('safeVariance').innerText.substring(1)
  }

}
