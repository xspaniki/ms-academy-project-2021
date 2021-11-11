// This file is automatically compiled by Webpack, along with any other files
// present in this directory. You're encouraged to place your actual application logic in
// a relevant structure within app/javascript and only use these pack files to reference
// that code so it'll be compiled.

import Rails from "@rails/ujs"
import Turbolinks from "turbolinks"
import * as ActiveStorage from "@rails/activestorage"
import "channels"

require("bootstrap/dist/js/bootstrap")
require("jquery")
require("@nathanvda/cocoon")
require("select2")

Rails.start()
Turbolinks.start()
ActiveStorage.start()

$(document).ready(function() {
  // init select 2 for organizations in users form
  $('.js-data-example-ajax').select2({
    ajax: {
      url: 'http://localhost:3000/organizations',
      dataType: 'json'
    }
  });

  // handle fake import btn
  $('#import-btn').on('click', function(event) {
    event.preventDefault();
    $('#export-wrapper input#file').click();
  })

  // submit import form
  $('#export-wrapper input#file').on('change', function(event) {
    $(this).closest('form').submit();
  })
});
