import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  static values = { date: String }

  open(event) {
    const date = event.currentTarget.dataset.listingModalDateValue

    fetch(`/listings_for_date?date=${date}`, {
      headers: { Accept: "text/vnd.turbo-stream.html" }
    })
    .then(response => response.text())
    .then(html => { Turbo.renderStreamMessage(html) })
  }

  close(event) {
    document.getElementById("listing-modal-container").innerHTML = ""
  }
}
