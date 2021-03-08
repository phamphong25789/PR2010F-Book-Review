// This file is automatically compiled by Webpack, along with any other files
// present in this directory. You're encouraged to place your actual application logic in
// a relevant structure within app/javascript and only use these pack files to reference
// that code so it'll be compiled.

import Rails from "@rails/ujs"
import Turbolinks from "turbolinks"
import * as ActiveStorage from "@rails/activestorage"
import "channels" // This file will contain your custom CSS
import 'bootstrap';

import "@fortawesome/fontawesome-free/js/all";
import '../stylesheets/application';

require('admin-lte');
require('packs/comment.js');
require('packs/rating.js');
require('packs/states.js');
require('packs/customPopover.js');

//= require ckeditor/init
require("jquery");

Rails.start()
Turbolinks.start()
ActiveStorage.start()
