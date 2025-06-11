import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  static targets = ["jump"]

  connect() {
    flatpickr(this.jumpTarget, {
      dateFormat: "Y-m-d",
      allowInput: true,
      onChange: this.onDateChange.bind(this)
    })
  }

  onDateChange(selectedDates) {
    if (selectedDates.length === 0) return;

    const selectedDate = selectedDates[0];
    const year = selectedDate.getFullYear();
    const month = (selectedDate.getMonth() + 1).toString().padStart(2, "0");

    const url = new URL(window.location.href);
    url.searchParams.set("month", `${year}-${month}`);
    window.location.href = url.toString();
  }
}