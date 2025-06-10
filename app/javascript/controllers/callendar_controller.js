import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  static targets = ["jumpInput", "calendar"]

  connect() {
    this.jumpInput = document.getElementById("calendar-jump")

    if (this.jumpInput) {
      this.jumpInput.addEventListener("change", (e) => {
        const selectedDate = new Date(e.target.value)
        if (isNaN(selectedDate)) return

        const year = selectedDate.getFullYear()
        const month = selectedDate.getMonth() + 1

        const searchParams = new URLSearchParams(window.location.search)
        searchParams.set("month", `${year}-${month.toString().padStart(2, "0")}`)
        window.location.search = searchParams.toString()
      })
    }
  }
}
