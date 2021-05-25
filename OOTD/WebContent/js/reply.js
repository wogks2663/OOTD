// DOM(Document Object Model)이 준비 되었다면
$(document).ready(function() {
	// 땡큐 Ajax
	$("#thank").click(function() {	
		if($("#detailLoginchk").val()){
			var class1 = $(this).attr('class');
			if(class1=='far fa-heart'){
				$.ajax({			
					url: "recommend.ajax",
					type: "post",
					data: { "recommend": "recommend", no : $("#no").val() },
					dataType: "json",
					success: function(data, status, xhr) {
						alert("좋아요가 반영 되었습니다.");
						$("#thank > .recommend").text(" (" + data.recommend + ")");		
						$("#thank").attr('class', 'fas fa-heart');		
					},			
					error: function(xhr, status, error) {
						alert(xhr.statusText + ", " + status + ", " + error);
					}
				});
				
			} else {
				$.ajax({			
					url: "recommend_minus.ajax",
					type: "post",
					data: { "recommend": "recommend", no : $("#no").val() },
					dataType: "json",
					success: function(data, status, xhr) {
						alert("좋아요가 취소 되었습니다.");
						$("#thank > .recommend").text(" (" + data.recommend + ")");		
						$("#thank").attr('class', 'far fa-heart');		
					},			
					error: function(xhr, status, error) {
						alert(xhr.statusText + ", " + status + ", " + error);
					}
				});
			}	
		} else{
			alert("좋아요는 로그인해야지만 가능합니다.\n 로그인해주세요");
			return false;
		}
	}).hover(function() {
		$(this).css({cursor: "pointer"});
	});
	
	
	// 댓글 쓰기 메뉴에 마우스 호버(enter, out) 이벤트 처리 - 수정됨
	$("#replyWrite").hover(function() {
		$(this).css("cursor", "pointer");
	});
	
	// 댓글 쓰기가 클릭되었을 때 이벤트 처리 - 추가됨
	$(document).on("click", "#replyWrite", function() {
		console.log(".replyWrite click : visible - " 
					+ $(".replyForm").is(":visible")
					+ ", hidden - " + $("#replyForm").is(":hidden")
					+ ", length - " + $("#replyForm").length);
		if($(".replyForm").css("display") == "block") {
			var $next = $(this).parent().next();
			if(! $($next).is(".replyForm")) {
				$(".replyForm").slideUp(300);
				
			}
			setTimeout(function(){
				$(".replyForm").insertBefore("#replyTitle").slideDown(300);
				$(".replyForm").insertBefore("#replyList").slideDown(300);
				
			}, 300);		
		} else {
			$(".replyForm").insertBefore("#replyTitle").slideDown(300);
			$(".replyForm").insertBefore("#replyList").slideDown(300);
		}
		$(".replyForm").find("form")
			.attr("class", "replyWriteForm").removeAttr("data-no");
		$(".replyContent").val("");
	});
	
	
	
	// 댓글 쓰기 폼이 submit 될 때
	$(document).on("submit", ".replyWriteForm", function() {
	
		if($("#replyContent").val().length <= 5) {
			alert("댓글은 5자 이상 입력해야 합니다.");
			return false;
		}
		
		var params = $(this).serialize();
		
		$.ajax({
			url: "replyWrite.ajax",
			type: "post",
			data: params,
			dataType: "json",
			success: function(resultData, status, xhr) {		
				
				var replyTable = null;				
				if($("#replyTable").length == 1) {
					$(".notReply").css({"display":"none"});
					
				} 
				$("#replyTable").empty();
				replyTable = $("#replyTable");
				
				$.each(resultData, function(index, value) {		
					var date = new Date(value.reg_date);
					var strDate = date.getFullYear() + "-" + ((date.getMonth() + 1 < 10) 
							? "0" + (date.getMonth() + 1) : (date.getMonth() + 1)) + "-"  
							+ date.getDate() + "-" + ((date.getHours() < 10) 
							? "0" + date.getHours() : date.getHours()) + ":" 
							+ (date.getMinutes() < 10 ? "0" + date.getMinutes() 
							: date.getMinutes()) + ":" + (date.getSeconds() < 10 
							? "0" + date.getSeconds() : date.getSeconds());				
										
					var result = 
						"<div class='reply_" + value.no + "'>" 
						+ "<div>"
						+ "	<div class='replyUser'>"
						+ "		<span class='member'>" + value.writer + "</span>"
						+ "	</div>"
						+ "	<div class='replyModify'>"
						+ "		<span class='replyDate'>" + strDate + "</span>"
						+ "		<a href='#' class='modifyReply' data-no='" + value.no + "'>"
						+ "			<img src='images/reply_btn_modify.gif' alt='댓글 수정하기'/>"
						+ "		</a>"
						+ "		<a href='#' class='deleteReply' data-no='" + value.no + "'>"
						+ "			<img src='images/reply_btn_delete.gif' alt='댓글 삭제하기'/>"
						+ "		</a>"
						+ "		<a href=\"javascript:reportReply('div_" + value.no + "');\">"
						+ "			<img src='images/reply_btn_notify.gif' alt='신고하기'/>"
						+ "		</a>"
						+ "	</div>"
						+ "	<div class='replyContent' id='div_" + value.no + "'>"
						+ "		<pre><span>" + value.reply + "</span></pre>"
						+ "	</div>"
						+ "</div>"
					+ "</div>";
					$("#replyTable").append(result);								
				});				
				$(".replyForm").slideUp(300).add("#replyContent").val("");
			},
			error: function(xhr, status, error) {
				alert("ajax 실패 : " + status + " - " + xhr.status);
			}
		});
		
		// 폼이 submit 되는 것을 취소한다.
		return false;
	});
	
	
	// 댓글 수정 버튼이 클릭되면
	$(document).on("click", ".modifyReply", function() {	
		var $next = $(this).parent().next();
		if($($next.children()[1]).attr("id") == undefined) {
			console.log(".modifyReply click : visible - " 
					+ $(".replyForm").is(":visible")
					+ ", hidden - " + $("#replyForm").is(":hidden")
					+ ", length - " + $("#replyForm").length);
			var reply = $next.first().text();			
			
			if($(".replyForm").css("display") == 'block') {
				$(".replyForm").slideUp(300);
			}
			setTimeout(function() {				
				$("#replyContent").val($.trim(reply));
				$(".replyForm").appendTo($next)
					.slideDown(300);
			}, 300);
			$(".replyForm").find("form")
				.attr({"class": "replyUpdateForm", "data-no": $(this).attr("data-no") });
		}		
		return false;
	});
	
	
	$(document).on("submit", ".replyUpdateForm", function() {	
		if($("#replyContent").val().length <= 5) {
			alert("댓글은 5자 이상 입력해야 합니다.");
			return false;
		}
		
		var params = $(this).serialize() + "&replyNo=" + $(this).attr("data-no");	
		var updateForm;
		
		$.ajax({
			url: "replyUpdate.ajax",
			type: "post",
			data: params,
			dataType: "json",
			success: function(resultData, status, xhr) {		
				$updateForm = $(".replyForm");
				console.log("update - before empty() : " + $updateForm.length);
				$("#replyTable").empty();
				$.each(resultData, function(index, value) {
					var date = new Date(value.reg_date);
					var strDate = date.getFullYear() + "-" + ((date.getMonth() + 1 < 10) 
							? "0" + (date.getMonth() + 1) : (date.getMonth() + 1)) + "-"  
							+ date.getDate() + "-" + ((date.getHours() < 10) 
							? "0" + date.getHours() : date.getHours()) + ":" 
							+ (date.getMinutes() < 10 ? "0" + date.getMinutes() 
							: date.getMinutes()) + ":" + (date.getSeconds() < 10 
							? "0" + date.getSeconds() : date.getSeconds());			
								
					var result = 
						"<div class='reply_" + value.no + "'>" 
						+ "<div>"
						+ "	<div class='replyUser'>"
						+ "		<span class='member'>" + value.writer + "</span>"
						+ "	</div>"
						+ "	<div class='replyModify'>"
						+ "		<span class='replyDate'>" + strDate + "</span>"
						+ "		<a href='#' class='modifyReply' data-no='" + value.no + "'>"
						+ "			<img src='images/reply_btn_modify.gif' alt='댓글 수정하기'/>"
						+ "		</a>"
						+ "		<a href='#' class='deleteReply' data-no='" + value.no + "'>"
						+ "			<img src='images/reply_btn_delete.gif' alt='댓글 삭제하기'/>"
						+ "		</a>"
						+ "		<a href=\"javascript:reportReply('div_" + value.no + "');\">"
						+ "			<img src='images/reply_btn_notify.gif' alt='신고하기'/>"
						+ "		</a>"
						+ "	</div>"
						+ "	<div class='replyContent' id='div_" + value.no + "'>"
						+ "		<pre><span>" + value.reply + "</span></pre>"
						+ "	</div>"
						+ "</div>"
					+ "</div>";
					
					$("#replyTable").append(result);					
				});				
				console.log("update after empty() : .replyForm - " 
						+ $(".replyForm").length 
						+ ", $updateFrom : " + $updateForm.length);
				$(".replyForm").find("form")
					.attr({"class": "replyWriteForm", "data-no": ""});
			},
			error: function(xhr, status, error) {
				alert("ajax 실패 : " + status + " - " + xhr.status);
			}
		});		
		return false;
	});
	
	
	//댓글 삭제 버튼이 클릭되면
	$(document).on("click", ".deleteReply", function() {	
		var no = $(this).attr("data-no");
		var writer = $(this).parent().prev().find(".member").text();
		var list_no = $("input[name=no]").val();
		var result = confirm(writer + "님이 작성한 " + no +"번 댓글을 삭제하시겠습니까?");
		
		var params = "replyNo=" + no + "&list_no=" + list_no;	
		if(result) {
			$.ajax({
				url: "replyDelete.ajax",
				type: "post",
				data: params,
				dataType: "json",
				success: function(resultData, status, xhr) {	
					$(".replyForm").find("form")
						.attr("class", "replyWriteForm").removeAttr("data-no")
						.find("#replyContent").val("");
					$("#replyTable").empty();
					$.each(resultData, function(index, value) {
						// 날짜 데이터를 출력 포맷에 맞게 수정
						var date = new Date(value.reg_date);
						var strDate = date.getFullYear() + "-" + ((date.getMonth() + 1 < 10) 
								? "0" + (date.getMonth() + 1) : (date.getMonth() + 1)) + "-"  
								+ date.getDate() + "-" + ((date.getHours() < 10) 
								? "0" + date.getHours() : date.getHours()) + ":" 
								+ (date.getMinutes() < 10 ? "0" + date.getMinutes() 
								: date.getMinutes()) + ":" + (date.getSeconds() < 10 
								? "0" + date.getSeconds() : date.getSeconds());
											
						var result = 
							"<div class='reply_" + value.no + "'>" 
						+ "<div>"
						+ "	<div class='replyUser'>"
						+ "		<span class='member'>" + value.writer + "</span>"
						+ "	</div>"
						+ "	<div class='replyModify'>"
						+ "		<span class='replyDate'>" + strDate + "</span>"
						+ "		<a href='#' class='modifyReply' data-no='" + value.no + "'>"
						+ "			<img src='images/reply_btn_modify.gif' alt='댓글 수정하기'/>"
						+ "		</a>"
						+ "		<a href='#' class='deleteReply' data-no='" + value.no + "'>"
						+ "			<img src='images/reply_btn_delete.gif' alt='댓글 삭제하기'/>"
						+ "		</a>"
						+ "		<a href=\"javascript:reportReply('div_" + value.no + "');\">"
						+ "			<img src='images/reply_btn_notify.gif' alt='신고하기'/>"
						+ "		</a>"
						+ "	</div>"
						+ "	<div class='replyContent' id='div_" + value.no + "'>"
						+ "		<pre><span>" + value.reply + "</span></pre>"
						+ "	</div>"
						+ "</div>"
					+ "</div>";
						
						// 댓글 테이블의 기존 내용을 삭제하고 다시 추가한다.
						$("#replyTable").append(result);					
					});
				},
				error: function(xhr, status, error) {
					alert("ajax 실패 : " + status + " - " + xhr.status);
				}
			});
		}
		// 앵커 태그에 의해 페이지가 이동되는 것을 취소한다.
		return false;
	});	
});

/* 아래는 신고하기 버튼을 임시로 연결한 함수 */
function reportReply(elemId) {
	var result = confirm("이 댓글을 신고하시겠습니까?");
	if(result == true) {
		alert("report - " + result);
	}	
}
