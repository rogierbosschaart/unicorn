// Configure your import map in config/importmap.rb. Read more: https://github.com/rails/importmap-rails
import "@hotwired/turbo-rails"
import "controllers"
import "@popperjs/core"
import "bootstrap"

document.addEventListener("turbo:submit-start", function(event) {
  const form = event.target;
  // Only target forms inside the create_panel turbo frame
  if (form.closest('[data-turbo-frame="create_panel"], #create_panel')) {
    // Find the value from the model-selector controller
    const selector = document.querySelector('[data-controller="model-selector"] [data-model-selector-target="hidden"]');
    if (selector) {
      let hidden = form.querySelector('input[name="selected_model_ids"]');
      if (!hidden) {
        hidden = document.createElement('input');
        hidden.type = 'hidden';
        hidden.name = 'selected_model_ids';
        form.appendChild(hidden);
      }
      hidden.value = selector.value;
    }
  }
});

 window.addEventListener("models:selected", function(event) {
        var input = document.querySelector(
          '.form-container input[name="selected_model_ids"]'
        );
        if (input) {
          input.value = event.detail.ids.join(",");
        }
      });

