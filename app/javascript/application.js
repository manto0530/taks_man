// Configure your import map in config/importmap.rb. Read more: https://github.com/rails/importmap-rails
import "@hotwired/turbo-rails";
import "controllers";
import 'bootstrap';
import 'bootstrap.min';
import 'jquery';
import 'popper.js';

import "./stylesheets/application"

document.addEventListener('turbolinks:load', () => {
  $('[data-toggle="tooltip"]').tooltip()
  $('[data-toggle="popover"]').popover()
})
