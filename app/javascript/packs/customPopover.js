import $ from 'jquery'
$(function () {
  $('[data-toggle="popover"]').popover({
    content: function() {
            var bookId = $(this).attr("id");
            return $('#popover-' + bookId).html();
        }
  })
})
