$(function() {
	
	$("#btn_writeSubmit").on("click", function() {
		
		
		if($("#write_weather").val().length <= 0) {
			alert("날씨가 입력되지 않았습니다.\n날씨를 입력해주세요");
			$("#write_weather").focus();
			return false;
		}
		
		if($("#write_temp").val().length <= 0) {
			alert("기온이 입력되지 않았습니다.\n기온을 입력해주세요");
			$("#write_temp").focus();
			return false;
		}
		
		if($("#write_date").val().length <= 0 ) {
			alert("날짜가 입력되지 않았습니다.\n날짜를 입력해주세요");
			$("#write_date").focus();
			return false;
			
		} 
		if($("#write_date").val().length > 6) {
			alert("날짜를 YYMMDD의 형태로 입력해 주세요.")
			$("#write_date").focus();
			return false; 
		}
		if($("#write_date").val().substring(2,4) > 12) {
			alert("올바른 날짜를 입력해주세요")
			$("#write_date").focus();
			return false; 
		}
		
		if($("#write_date").val().substring(2,4) == 01 || $("#write_date").val().substring(2,4) == 03 ||
			$("#write_date").val().substring(2,4) == 05 || $("#write_date").val().substring(2,4) == 07 || 
				$("#write_date").val().substring(2,4) == 08 || $("#write_date").val().substring(2,4) ==10 ||
					$("#write_date").val().substring(2,4) ==12) {
			if($("#write_date").val().substring(4,6) > 31) {
				alert("올바른 날짜를 입력해주세요")
				$("#write_date").focus();
				return false; 
			}	
		}else if($("#write_date").val().substring(2,4) == 02){
			if($("#write_date").val().substring(0,2) % 4 == 0){
				if($("#write_date").val().substring(4,6) > 29) {
					alert("올바른 날짜를 입력해주세요")
					$("#write_date").focus();
					return false;
				}
			}else{
				if($("#write_date").val().substring(4,6) > 28) {
					alert("올바른 날짜를 입력해주세요")
					$("#write_date").focus();
					return false;
				}
			}
			
		} else {
			if($("#write_date").val().substring(4,6) > 30) {
				alert("올바른 날짜를 입력해주세요")
				$("#write_date").focus();
				return false;
			}
		}		
		
		if($("#write_clothes").val().length <= 0) {
			alert("착용 제품이 입력되지 않았습니다.\n착용 제품을 입력해주세요");
			$("#write_clothes").focus();
			return false;
		}
			
		if($("#write_img").val().length <= 0) {
			var result = confirm("사진이 등록되지 않았습니다." +
			"\n사진을 등록해주세요.");
			return false;
		}
		
		$("#writeForm").attr("action", "writeProcess.mvc");
		$("#writeForm").attr("method", "post");
		$("#writeForm").submit();
	});

});