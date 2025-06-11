import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  static targets = ["date", "month"]

  connect() {
    if (this.hasDateTarget) {
      flatpickr(this.dateTarget, {
        locale: "en",
        dateFormat: "Y-m-d",
        allowInput: true,
      });
    }

    if (this.hasMonthTarget) {
      flatpickr(this.monthTarget, {
        locale: "en",
        dateFormat: "Y-m",
        plugins: [new monthSelectPlugin({
          shorthand: true,
          dateFormat: "Y-m",
          altFormat: "F Y",
        })],
      });
    }
  }
}
