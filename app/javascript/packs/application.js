// This file is automatically compiled by Webpack, along with any other files
// present in this directory. You're encouraged to place your actual application logic in
// a relevant structure within app/javascript and only use these pack files to reference
// that code so it'll be compiled.

import Rails from "@rails/ujs"
import Turbolinks from "turbolinks"
import * as ActiveStorage from "@rails/activestorage"
import "channels"

Rails.start()
Turbolinks.start()
ActiveStorage.start()

import 'bootstrap'
import 'autosize'

document.addEventListener("turbolinks:load", () => {
  $('[data-toggle="tooltip"]').tooltip();
  $('[data-toggle="popover"]').popover();
  autosize(document.querySelectorAll('textarea'));
})

document.addEventListener('turbolinks:load', function() {
  var fileInput = document.querySelector('.custom-file-input');
  var fileLabel = document.querySelector('.custom-file-label');
  fileInput.addEventListener("change", (e) => {fileLabel.textContent = e.target.value.replace(/^.*[\\\/]/, ''); });
}, false);