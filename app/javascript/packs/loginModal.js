$('.login-btn').on('click', function(e){
	e.preventDefault();
	console.log(e);
	$.ajax({
		url:'/login',
		type:'POST',
		dataType:'json',
		data: {
			authenticity_token: $('[name="csrf-token"]')[0].content,
			"session[email]": $('#session_email').val(),
			"session[password]": $('#session_password').val()
		},
		success:function(data){
			location.reload();
		},
		error:function(){
			$(".loginError").html("");
			$(".loginError").append("<span style='color: red;'>Invalid email/password combination</span>");
		}
	});
});