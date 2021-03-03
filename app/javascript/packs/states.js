import $ from 'jquery'
import 'select2/dist/css/select2.css'
import 'select2'
$(document).on("turbolinks:load",function(){
  $('.book_category').select2();
  $('.book_author').select2();
});
