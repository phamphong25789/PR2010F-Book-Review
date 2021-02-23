	$(document).ready(function(){
		// debugger
		$("#btn_comment").click(function(){
			$("#div01").toggle("slow");	
		});
		$("#cmt_submit").click(function(){
			var btn1 = $("#review_id").val();
			var btn2 = $("#content").val();
			if(btn2 != ""){
				$.ajax({
					url: "/comments",
					type: "POST",
					dataType: "json",
					data: {
						authenticity_token: $('[name="csrf-token"]')[0].content,
						"comment[review_id]": btn1,
						"comment[content]": btn2,
						"comment[user_id]": 1
					},
					success: function(data){
						var x = data['created_at'];
						$("#content").val("");
						$("#CommentContainer").prepend("Content: " +data.content+"<br>"+"User: "+"<%= @review.comments.last.user.name %>" + "<br>" + "Posted: "+ "<br>");
						// alert(xhr.status);
					},
					error: function(data){
						alert("Comment khong hop le!");
					}
				});

				$("#content_last_comment").show();

			}else{
				alert("You need to enter comments before submitting");
			}
		});
	});
