// Configure your import map in config/importmap.rb. Read more: https://github.com/rails/importmap-rails
import "@hotwired/turbo-rails"
import "controllers"
import "@popperjs/core"
import "bootstrap"
import flatpickr from "flatpickr"
import CalendarController from "./calendar_controller"
application.register("calendar", CalendarController)

document.addEventListener("turbo:load", () => {
  flatpickr(".date-picker", {
    locale: "en", // или просто не указывать — английский по умолчанию
    dateFormat: "Y-m-d",
    allowInput: true,
  });

  flatpickr(".month-picker", {
    locale: "en",
    dateFormat: "Y-m",
    plugins: [new monthSelectPlugin({
      shorthand: true,
      dateFormat: "Y-m",
      altFormat: "F Y",
    })],
  });
});
