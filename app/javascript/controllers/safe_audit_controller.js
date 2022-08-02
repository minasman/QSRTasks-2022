import { Controller } from "@hotwired/stimulus"
import SignaturePad from 'signature_pad'
import { get } from "@rails/request.js"

// Connects to data-controller="safe-audit"
export default class extends Controller {
  static targets = ["managerList", "hundred", "hundredValue", "fifty", "fiftyValue", "twenty", "twentyValue", "ten", "tenValue", "five", "fiveValue", "two", "twoValue", "one", "oneValue", "quarter", "quarterValue", "dime", "dimeValue", "nickel", "nickelValue", "penny", "pennyValue", "dollarCoin", "dollarCoinValue", "halfDollar", "halfDollarValue", "miscCoin", "miscCoinValue", "gc", "gcValue", "gcr", "gcrValue", "receipt", "receiptValue", "changer", "changerValue", "other", "otherValue", "drawer", "drawerValue", "drawerAmount"]

  connect() {

    function doMouseUp() {
      document.getElementById('safe_audit_signature').value = signaturePad.toDataURL("image/jpeg")
    }
    let wrapper = document.getElementById("signature-pad")
    let canvas = wrapper.querySelector("canvas")
    let signaturePad = new SignaturePad(canvas, {
      backgroundColor: 'rgb(255, 255, 245)'
    })
    canvas.addEventListener("touchend", doMouseUp)
    canvas.addEventListener("pointerup", doMouseUp)
    this.run_total()
  }

  manager(e) {
    let store = document.getElementById("safe_audit_store_id").value
    let manager_list = e.target.selectedOptions[0].value
    let target = this.managerListTarget.id
    get(`/safe_audits/manager_list?target=${target}&store=${store}`, {
      responseKind: "turbo-stream"
    })
  }

  updateTotal() {
    let safeCount = isNaN(parseFloat(document.getElementById('safeControl').innerText.substring(1))) ? 0.00 : parseFloat(document.getElementById('safeControl').innerText.substring(1))
    const totalSafe = isNaN(parseFloat(document.getElementById('totalSafe').innerText.substring(1))) ?  0.00 : parseFloat(document.getElementById('totalSafe').innerText.substring(1))
    const safeVariance = safeCount - totalSafe
    document.getElementById('safeVariance').innerText = `$${ safeVariance }`
  }

  store(event) {
    let safeCount = document.getElementById('safeControl')
    const store = document.getElementById('safe_audit_store_id').value
    fetch(`/stores/${store}.json`)
    .then(response => response.json())
    .then(function (myJson) {
      safeCount.innerText = `$${parseFloat(myJson.safe).toFixed(2)}`
      document.getElementById('headsets').classList.remove('hidden')
    }).then(this.updateTotal())
    document.getElementById("safe-audit-form").classList.toggle('hide')
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

  run_total(event) {
    let hundred = this.hundredTarget
    let hundredValue = this.hundredValueTarget
    let fifty = this.fiftyTarget
    let fiftyValue = this.fiftyValueTarget
    let twenty = this.twentyTarget
    let twentyValue = this.twentyValueTarget
    let ten = this.tenTarget
    let tenValue = this.tenValueTarget
    let five = this.fiveTarget
    let fiveValue = this.fiveValueTarget
    let two = this.twoTarget
    let twoValue = this.twoValueTarget
    let one = this.oneTarget
    let oneValue = this.oneValueTarget
    let quarter = this.quarterTarget
    let quarterValue = this.quarterValueTarget
    let dime = this.dimeTarget
    let dimeValue = this.dimeValueTarget
    let nickel = this.nickelTarget
    let nickelValue = this.nickelValueTarget
    let penny = this.pennyTarget
    let pennyValue = this.pennyValueTarget
    let dollarCoin = this.dollarCoinTarget
    let dollarCoinValue = this.dollarCoinValueTarget
    let halfDollar = this.halfDollarTarget
    let halfDollarValue = this.halfDollarValueTarget
    let miscCoin = this.miscCoinTarget
    let miscCoinValue = this.miscCoinValueTarget
    let gc = this.gcTarget
    let gcr = this.gcrTarget
    let gcValue = this.gcValueTarget
    let gcrValue = this.gcrValueTarget
    let receipt = this.receiptTarget
    let receiptValue = this.receiptValueTarget
    let changer = this.changerTarget
    let changerValue = this.changerValueTarget
    let other = this.otherTarget
    let otherValue = this.otherValueTarget
    let drawer = this.drawerTarget
    let drawerValue = this.drawerValueTarget
    let drawerAmount = this.drawerAmountTarget
    const totalSafe = document.getElementById('totalSafe')
    const safeControl = document.getElementById('safeControl')
    const safeVariance = document.getElementById('safeVariance')

    let drawerTotal = isNaN(parseFloat(drawer.value) * parseFloat(drawerAmount.value)) ? 0 : (parseFloat(drawer.value) * parseFloat(drawerAmount.value)).toFixed(2)
    let hundredTotal = isNaN(parseFloat(hundred.value) * 100) ? 0 : (parseFloat(hundred.value) * 100).toFixed(2)
    let fiftyTotal = isNaN(parseFloat(fifty.value) * 50) ? 0 : (parseFloat(fifty.value) * 50).toFixed(2)
    let twentyTotal = isNaN(parseFloat(twenty.value) * 20) ? 0 : (parseFloat(twenty.value) * 20).toFixed(2)
    let tenTotal = isNaN(parseFloat(ten.value) * 10) ? 0 : (parseFloat(ten.value) * 10).toFixed(2)
    let fiveTotal = isNaN(parseFloat(five.value) * 5) ? 0 : (parseFloat(five.value) * 5).toFixed(2)
    let twoTotal = isNaN(parseFloat(two.value) * 2) ? 0 : (parseFloat(two.value) * 2).toFixed(2)
    let oneTotal = isNaN(parseFloat(one.value) * 1) ? 0 : (parseFloat(one.value)).toFixed(2)
    let quarterTotal = isNaN(parseFloat(quarter.value) * 10) ? 0: (parseFloat(quarter.value) * 10).toFixed(2)
    let dimeTotal = isNaN(parseFloat(dime.value) * 5) ? 0 : (parseFloat(dime.value) * 5).toFixed(2)
    let nickelTotal = isNaN(parseFloat(nickel.value) * 2) ? 0 : (parseFloat(nickel.value) * 2).toFixed(2)
    let pennyTotal = isNaN(parseFloat(penny.value) * 0.5) ? 0 : (parseFloat(penny.value) * 0.5).toFixed(2)
    let dollarTotal = isNaN(parseFloat(dollarCoin.value) * 1) ? 0 : (parseFloat(dollarCoin.value)).toFixed(2)
    let halfDollarTotal = isNaN(parseFloat(halfDollar.value) * 0.5) ? 0 : (parseFloat(halfDollar.value) * 0.5).toFixed(2)
    let miscCoinTotal = isNaN(parseFloat(miscCoin.value)) ? 0 : (parseFloat(miscCoin.value)).toFixed(2)
    let gcTotal = isNaN(parseFloat(gc.value) * 1) ? 0 : (parseFloat(gc.value)).toFixed(2)
    let gcrTotal = isNaN(parseFloat(gcr.value) * 1) ? 0 : (parseFloat(gcr.value)).toFixed(2)
    let receiptTotal = isNaN(parseFloat(receipt.value)) ? 0 : (parseFloat(receipt.value)).toFixed(2)
    let changerTotal = isNaN(parseFloat(changer.value)) ? 0 : (parseFloat(changer.value)).toFixed(2)
    let otherTotal = isNaN(parseFloat(other.value) * 0.5) ? 0 : (parseFloat(other.value)).toFixed(2)

    drawerValue.innerText = `$${drawerTotal}`
    hundredValue.innerHTML = `<h5 class="mt-2 mt-md-0">$${hundredTotal}</h5>`
    fiftyValue.innerHTML = `<h5 class="mt-2 mt-md-0">$${fiftyTotal}</h5>`
    twentyValue.innerHTML = `<h5 class="mt-2 mt-md-0">$${twentyTotal}</h5>`
    tenValue.innerHTML = `<h5 class="mt-2 mt-md-0">$${tenTotal}</h5>`
    fiveValue.innerHTML = `<h5 class="mt-2 mt-md-0">$${fiveTotal}</h5>`
    twoValue.innerHTML = `<h5 class="mt-2 mt-md-0">$${twoTotal}</h5>`
    oneValue.innerHTML = `<h5 class="mt-2 mt-md-0">$${oneTotal}</h5>`
    quarterValue.innerHTML = `<h5 class="mt-2 mt-md-0">$${quarterTotal}</h5>`
    dimeValue.innerHTML = `<h5 class="mt-2 mt-md-0">$${dimeTotal}</h5>`
    nickelValue.innerHTML = `<h5 class="mt-2 mt-md-0">$${nickelTotal}</h5>`
    pennyValue.innerHTML = `<h5 class="mt-2 mt-md-0">$${pennyTotal}</h5>`
    dollarCoinValue.innerHTML = `<h5 class="mt-2 mt-md-0">$${dollarTotal}</h5>`
    halfDollarValue.innerHTML = `<h5 class="mt-2 mt-md-0">$${halfDollarTotal}</h5>`
    miscCoinValue.innerHTML = `<h5 class="mt-2 mt-md-0">$${miscCoinTotal}</h5>`
    gcValue.innerHTML = `<h5 class="mt-2 mt-md-0">$${gcTotal}</h5>`
    gcrValue.innerHTML = `<h5 class="mt-2 mt-md-0">$${gcrTotal}</h5>`
    receiptValue.innerHTML = `<h5 class="mt-2 mt-md-0">$${receiptTotal}</h5>`
    changerValue.innerHTML = `<h5 class="mt-2 mt-md-0">$${changerTotal}</h5>`
    otherValue.innerHTML = `<h5 class="mt-2 mt-md-0">$${otherTotal}</h5>`

    let safeTotalValue = parseFloat(parseFloat(drawerTotal) + parseFloat(hundredTotal) + parseFloat(fiftyTotal) + parseFloat(twentyTotal) + parseFloat(tenTotal) + parseFloat(fiveTotal) + parseFloat(twoTotal) + parseFloat(oneTotal) + parseFloat(quarterTotal) + parseFloat(dimeTotal) + parseFloat(nickelTotal) + parseFloat(pennyTotal) + parseFloat(dollarTotal) + parseFloat(halfDollarTotal) + parseFloat(miscCoinTotal) + parseFloat(gcTotal) + parseFloat(gcrTotal) + parseFloat(receiptTotal) + parseFloat(changerTotal) + parseFloat(otherTotal)).toFixed(2)

    totalSafe.innerText = `$${safeTotalValue}`
    safeVariance.innerText = `$${(parseFloat(safeTotalValue - safeControl.innerText.substring(1)).toFixed(2)).toFixed(2)}`

    document.querySelector('#safe_audit_total_safe').value = safeTotalValue
    document.querySelector('#safe_audit_safe_variance').value = document.getElementById('safeVariance').innerText.substring(1)
  }

}
