import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="inbox"
export default class extends Controller {
  connect() {

  }

  openTag(evt, tagName) {
        var i, tabcontent, tablinks;
        tabcontent = document.getElementsByClassName("tabcontent");
        for (i = 0; i < tabcontent.length; i++) {
          tabcontent[i].style.display = "none";
          tabcontent[i].classList.remove("active");
        }
        tablinks = document.getElementsByClassName("tablinks");
        for (i = 0; i < tablinks.length; i++) {
          tablinks[i].className = tablinks[i].className.replace(" active", "");
        }
        document.getElementById(tagName).style.display = "block";
        document.getElementById(tagName).classList.add("active"); 
        if (evt && evt.currentTarget) {
          evt.currentTarget.className += " active";
        } else {
          const defaultButton = document.querySelector(`.tablinks[onclick*="'${tagName}'"]`);
          if (defaultButton) {
            defaultButton.className += " active";
          }
        }
      }
      // document.addEventListener("DOMContentLoaded", function() {
      //   openTag(null, 'All');
      // });
}
