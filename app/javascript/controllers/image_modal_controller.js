import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="image-modal"
export default class extends Controller {
  connect() {
    this.modal = new bootstrap.Modal('#imageModal', {})
  }

  open() {
    this.modal.show()
  }
}
