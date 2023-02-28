// Entry point for the build script in your package.json
import "@hotwired/turbo-rails"
import "./controllers"
import $ from 'jquery';
import 'jquery-ui/ui/widgets/datepicker.js';

$(document).on('turbo:load', function() {
  $('.datepicker').datepicker({
    dateFormat: 'mm/dd/yy'
  })
})
