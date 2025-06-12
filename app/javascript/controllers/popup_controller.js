import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  connect() {
    this.autoClose = setTimeout(() => this.close(), 4000)
  }

  close() {
    this.element.remove()
    clearTimeout(this.autoClose)
  }
}
