import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="new-payment"
export default class extends Controller {
  connect() {
    this.modal = new bootstrap.Modal('#paymentModal', {})
  }

  open() {
    this.modal.show()
  }

  close(event) {
    if (event.detail.success) {
      this.modal.hide()
    }
  }
}
