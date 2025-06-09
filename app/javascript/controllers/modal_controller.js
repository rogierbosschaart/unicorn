import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  static targets = ["post"]

  connect() {
    console.log(this.postTarget)
  }

  open() {
    if (!this.element.classList.contains('show')) {
      this.postTarget.show()
    }
  }

  close(event) {
    if (event.detail.success) {
      this.postTarget.hide()
    }
  }
}
