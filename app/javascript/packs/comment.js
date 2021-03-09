	$(document).ready(function(){
		// debugger
		$("#btn_comment").click(function(){
			$("#div01").toggle("slow");	
		});
		$("#cmt_submit").click(function(){
			var btn1 = $("#user_id").val();
			var btn2 = $("#content").val();
			var btn3 = $("#targetable_type").val();
			var btn4 = $("#targetable_id").val();
			var btn5 = $("#user_name").val();

			if(btn2 != ""){
				$.ajax({
					url: "/comments",
					type: "POST",
					dataType: "json",
					data: {
						authenticity_token: $('[name="csrf-token"]')[0].content,
						"comment[user_id]": btn1,
						"comment[content]": btn2,
						"comment[targetable_type]": btn3,
						"comment[targetable_id]": btn4
					},
					success: function(data){
						var x = data['created_at'];
						$("#content").val("");
						$("#CommentContainer").prepend("Content: " +data.comment.content+"<br>"+"User: "+ data.user + "<br>" + "Posted: "+ "Just now<br>"
							+
							"<button id='reply_comment' class='btn btn-primary'>Reply</button>");
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

// Xử lý reply comment 

	$(document).ready(function(){
		let current_appear = 1;
		$(".reply_cmt").click(function(){
			if(current_appear == 1){
				$(this).siblings().show("slow");
				current_appear = 2;
			}else if(current_appear == 2){
				$(this).siblings().hide("slow");
				current_appear = 1
			}
// --------------------------------------------------------------------------------
				// Xu ly logic de lay gia tri cua o input
				let id_button_reply = $(this).attr("id");
				let list_children = document.getElementById(id_button_reply).parentNode.children;
				let user_id_reply = list_children[1].value;
				let targetable_type_reply = list_children[3].value;
				let targetable_id_reply = list_children[4].value;
				
				list_children[6].onclick = function(){
					let content_reply = list_children[2].value;
					if (content_reply != "") {
						// Ajax start
						$.ajax({
					url: "/comments",
					type: "POST",
					dataType: "json",
					data: {
						authenticity_token: $('[name="csrf-token"]')[0].content,
						"comment[user_id]": user_id_reply,
						"comment[content]": content_reply,
						"comment[targetable_type]": targetable_type_reply,
						"comment[targetable_id]": targetable_id_reply
					},
					success: function(data){
						var x = data['created_at'];
						list_children[2].value = "";
						$(list_children[0]).append("Content: " +data.comment.content+"<br>"+"User: "+ data.user + "<br>" + "Posted: "+ "Just now<br>"+"<hr>");

						// alert(xhr.status);
					},
					error: function(data){
						alert("Comment khong hop le!");
					}
				});

				$("#content_last_comment").show();
						// Ajax end
					}else{
						alert("Đã có giá trị content đâu!!!!");
					}
				};
			});
	});