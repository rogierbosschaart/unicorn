import { Controller } from "@hotwired/stimulus"
import flatpickr from "flatpickr"
import monthSelectPlugin from "flatpickr/dist/plugins/monthSelect"

import "flatpickr/dist/flatpickr.min.css"
import "flatpickr/dist/plugins/monthSelect/style.css"

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
