import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  static targets = ["post"]

  connect() {
    this.modal = new bootstrap.Modal(this.element)
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
