$(document).ready(function(){
  $('.ratingW li').click(function(){
          $(".toast").toast({ delay: 1000 });
          $(".toast").toast('show');
  });
});

$(document).on("click", ".ratingW li a", function(){  
    var stars = $('.ratingW').find('li')
    stars.removeClass('on');
    var thisIndex = $(this).parents('li').index();
    for(var i=0; i <= thisIndex; i++){
      stars.eq(i).addClass('on');
    }
    var url = window.location.pathname;
    var bookId = url.substring(url.lastIndexOf('/') + 1);
    $.ajax({
        url:'/books/'+ bookId +'/rates',
        type:'POST',
        dataType:'json',
        data: {
          authenticity_token: $('[name="csrf-token"]')[0].content,
          "rate[star]": thisIndex + 1,
          "rate[user_id]": 1
        },
        success:function(data){
            $('#ratingNoti').addClass("alert-success").removeClass("alert-danger");
            $('#ratingNoti').html("Cam on ban da danh gia");
        },
        error:function(data){
            $('#ratingNoti').addClass("alert-danger").removeClass("alert-success");
            $('#ratingNoti').html("Loi. Khong the danh gia");
        }
    });

  });

