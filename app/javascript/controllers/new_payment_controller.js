import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="new-payment"
export default class extends Controller {
  connect() {
    //console.log("Hello World")
    this.modal = new bootstrap.Modal('#myModal', {})
  }

  open() {
    // if (!this.modal.isOpened){
    //   this.modal.show()
    // }

    this.modal.show()
  }

  close(event) {
    if (event.detail.success) {
      this.modal.hide()
    }
  }
}
