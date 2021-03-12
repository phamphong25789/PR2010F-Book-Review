$(document).ready(function(){
  // $('.ratingW li').click(function(){
  //         $(".toast").toast({ delay: 1000 });
  //         $(".toast").toast('show');
  // });

  if($(".rateId").val() !== undefined){
    var stars = $('.ratingW').find('li')
    stars.removeClass('on');
    var thisIndex = Number($(".rateNumber").val()) - 1;
    for(var i=0; i <= thisIndex; i++){
      stars.eq(i).addClass('on');
    }
  }
});

$(document).on("click", ".ratingW li a", function(){
    var currentPath = window.location.pathname;
    var bookId = currentPath.substring(currentPath.lastIndexOf('/') + 1);
    var isUpdate = $(".rateId").val() !== undefined;
    var method = isUpdate ? 'PATCH' : 'POST';
    var route = isUpdate ? '/books/' + bookId + '/rates/' + $(".rateId").val() : '/books/'+ bookId +'/rates';
    var stars = $('.ratingW').find('li');
    stars.removeClass('on');
    var thisIndex = $(this).parents('li').index();
    for(var i=0; i <= thisIndex; i++){
      stars.eq(i).addClass('on');
    }
    $.ajax({
        url: route,
        type: method,
        dataType: 'json',
        data: {
          authenticity_token: $('[name="csrf-token"]')[0].content,
          "rate[star]": thisIndex + 1,
          "rate_id": $(".rateId").val()
        },
        success:function(data){
          alert("Thanks for rating");
            // $('#ratingNoti').addClass("alert-success").removeClass("alert-danger");
            // $('#ratingNoti').html("Cam on ban da danh gia");
            // $('#ratingNoti').addClass("alert-danger").removeClass("alert-success");
            // $('#ratingNoti').html("Loi. Khong the danh gia");
        },
        error:function(data){
          document.location.href="/login";
        }
    });

  });

