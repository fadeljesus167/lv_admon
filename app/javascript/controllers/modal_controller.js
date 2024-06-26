import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="modal"
export default class extends Controller {
  connect() {
    this.modal = new bootstrap.Modal(`#${this.element.id}`, {})
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
