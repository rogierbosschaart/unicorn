// Configure your import map in config/importmap.rb. Read more: https://github.com/rails/importmap-rails
import "@hotwired/turbo-rails"
import "controllers"
import "@popperjs/core"
import "bootstrap"


// SELECTING MODELS IN DASHBOARD
document.addEventListener("turbo:submit-start", function(event) {
  const form = event.target;
  if (form.closest('[data-turbo-frame="create_panel"], #create_panel')) {
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

// INBOX TABS
window.openTag = function(evt, tagName) {
  let i, tabcontentElements, tablinkElements;
  console.log("Hello");

  // Hide all tab content elements and remove 'active' class from them
  tabcontentElements = document.getElementsByClassName("tabcontent");
  for (i = 0; i < tabcontentElements.length; i++) {
    tabcontentElements[i].style.display = "none";
    tabcontentElements[i].classList.remove("active");
  }

  // Remove 'active' class from all tab link elements
  tablinkElements = document.getElementsByClassName("tablinks");
  for (i = 0; i < tablinkElements.length; i++) {
    tablinkElements[i].classList.remove("active");
  }

  // Get the target tab content element
  const currentTabContentElement = document.getElementById(tagName);

  if (currentTabContentElement) {
    currentTabContentElement.style.display = "block";
    currentTabContentElement.classList.add("active");
  } else {
    // If the content for the tab doesn't exist, log an error and stop.
    // This is a common reason for tabs "not working".
    console.error("Tab content element with ID '" + tagName + "' not found.");
    return; // Exit the function to prevent further errors
  }

  // Add 'active' class to the clicked/current tab link
  if (evt && evt.currentTarget) {
    // This branch is for actual user clicks on a tab button
    evt.currentTarget.classList.add("active");
  } else {
    // This branch handles the initial call (e.g., from turbo:load for the 'All' tab)
    // Find the button that corresponds to the tagName to make it active
    const defaultTabButton = document.querySelector(`.tablinks[onclick*="'${tagName}'"]`);
    if (defaultTabButton) {
      defaultTabButton.classList.add("active");
    } else {
      // Optional: Log if the default button isn't found, though the tab content will still show.
      // console.warn("Default tab button for '" + tagName + "' not found. Ensure onclick attributes are correct.");
    }
  }
}

document.addEventListener("turbo:load", function() {
  // Attempt to open the 'All' tab by default.
  // First, ensure the 'All' tab content element exists.
  if (document.getElementById('All')) {
    openTag(null, 'All');
  } else {
    // Optional: Log if the 'All' tab content is not found on page load.
    // console.warn("Default 'All' tab content (element with ID 'All') not found on turbo:load.");
  }
});
