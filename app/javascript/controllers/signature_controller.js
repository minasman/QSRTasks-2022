import { Controller } from "@hotwired/stimulus"
import SignaturePad from 'signature_pad'

// Connects to data-controller="signature"
export default class extends Controller {
  connect() {
    function doMouseUp() {
      document.getElementById('workorder_update_signature').value = signaturePad.toDataURL("image/jpeg")
    }
    let wrapper = document.getElementById("signature-pad")
    let canvas = wrapper.querySelector("canvas")
    let signaturePad = new SignaturePad(canvas, {
      backgroundColor: 'rgb(255, 255, 245)'
    })
    canvas.addEventListener("touchend", doMouseUp)
    canvas.addEventListener("pointerup", doMouseUp)  }
}
