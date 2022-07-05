import { Controller } from "@hotwired/stimulus"
import SignaturePad from 'signature_pad'

// Connects to data-controller="show-signature"
export default class extends Controller {
  connect() {
    console.log('Show connected')

    const id = this.data.get('id')
    const signature = this.data.get('signature')
    var wrapper = document.getElementById(`signature-pad${id}`)
    var canvas = wrapper.querySelector("canvas")
    var signaturePad = new SignaturePad(canvas)
    signaturePad.fromDataURL(signature);
    signaturePad.off()
  }

  showSig(event) {
    if (event.currentTarget.nextElementSibling.style.display === "none") {
      event.currentTarget.nextElementSibling.style.display = "block"
    } else {
      event.currentTarget.nextElementSibling.style.display = "none"
    }
  }
}
