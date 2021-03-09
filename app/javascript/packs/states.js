import $ from 'jquery'
import 'select2/dist/css/select2.css'
import 'select2'
$(document).on("turbolinks:load",function(){
  $('.book_category').select2({tags: true});
  $('.book_author').select2();
});
