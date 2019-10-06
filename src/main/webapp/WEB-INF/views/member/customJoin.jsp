<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>   
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %> 
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<!-- Bootstrap Core CSS -->
<link href="../resources/boot/vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">

<!-- MetisMenu CSS -->
<link href="../resources/boot/vendor/metisMenu/metisMenu.min.css" rel="stylesheet">

<!-- Custom CSS -->
<link href="../resources/boot/dist/css/sb-admin-2.css" rel="stylesheet">

<!-- Custom Fonts -->
<link href="../resources/boot/vendor/font-awesome/css/font-awesome.min.css" rel="stylesheet" type="text/css">

<!-- jquery -->
<script src="http://code.jquery.com/jquery-latest.js" type="text/javascript"></script> 

<!-- join.js -->
<script src="../../resources/member/join.js" type="text/javascript"></script>

</head>
<body>


<%@ include file="../includes/sub-header.jsp" %>



        <div class="row">
            <div class="col-md-4 col-md-offset-4">
                <div class="login-panel panel panel-default">
                    <div class="panel-heading">
                        <h3 class="panel-title">회원가입 페이지</h3>
                    </div>
                    <div class="panel-body">
						<form action="/member/customJoin" name="joinform" method = "post" class="commonForm" onsubmit="return">
								<input type="hidden" name="${_csrf.parameterName }" value="${_csrf.token }">
							    <div class="join-container">
							    	<label for="user_id"><b>아이디</b></label>
							    	<!-- 아이디체크 -->
							    	<div class="check_font" id="id_check"></div>
									<input type="text" class="form-control" id="user_id" name="userid" onkeyup="idcheack()" style="width:100%" placeholder="아이디를 입력해주세요" title="아이디" maxlength="20" minlength="5" required/>
									
									<label for="name"><b>이름</b></label>
									<input type="text" name="name" required style="width:100%" placeholder="이름을 입력해 주세요" title="이름" maxlength="20"/>
							    	
							    	<label for="gender"><b>성별</b></label> 
									<select name ="usergender" style="width:100%;height:41px;">
										<option value="남자">남</option>
										<option value="여자">여</option>
									</select>
									
									<label for="email"><b>이메일</b> <b style="color:red;margin-left:10px;">※회원 가입 시 이메일 인증이 필요합니다!</b></label>
									<!-- 이메일 체크 -->
							    	<div class="check_font" id="email_check"></div>
									<input type="email" id="user_email" name="useremail" onkeyup="emailcheack()" required style="width:100%;height: 41px" placeholder="이메일을 입력해주세요." title="이메일" maxlength="40"/>
							    	
							    	<label for="pw"><b>비밀번호</b></label>
									<input type="password" id="password" name="userpw" required style="width:100%" placeholder="비밀번호를 입력해주세요" title="비밀번호" maxlength="40" minlength="5"/>	
							    	<label for="check-pw"><b>비밀번호 재확인</b></label> <div id="pwdValue"></div>
									<input type="password" id="passwordCheck" onkeyup="isSame()" required style="width:100%" placeholder="비밀번호를 재입력해주세요." title="비밀번호 재입력" maxlength="40" minlength="5"/>
												
									<p>
										<input type="submit" value="가입하기" onclick="return check(),check_onclick()" class="btn btn-lg btn-success btn-block">
									</p>
								</div>	
							</form>
                    </div>
                </div>
            </div>
        </div>


	<div class="sub-footer">
		Copyright ©YooGames Corp. All Rights Reserved.
	</div>



<script type="text/javascript">

var csrfHeaderName ="${_csrf.headerName}"; 
var csrfTokenValue="${_csrf.token}";


var idflag = true;

var emailflag = true;

var pwflag = true;

//Ajax spring security header...
$(document).ajaxSend(function(e, xhr, options) { 
    xhr.setRequestHeader(csrfHeaderName, csrfTokenValue); 
  }); 

//아이디 중복 검사
	function idcheack() {
		var user_id = $('#user_id').val();
		//alert(user_id);
			$.ajax({
				url : '/member/idCheck?userId='+ user_id,
				type : 'POST',
				dataType: "json",
				success : function(data) {
					console.log(data);
					if(data == 0){
						$("#id_check").text("사용가능한 아이디 입니다. :p");
						$("#id_check").css("color", "blue");
						idflag = true;
						if(emailflag == true && pwflag == true){
							//alert("트루 접근");
							$(".btn-success").attr("disabled", false);
						} else if(emailflag == false || pwflag == false){
							$(".btn-success").attr("disabled", true);
						} 

					} else if(data == 1){
						$("#id_check").text("사용중인 아이디 입니다 :p");
						$("#id_check").css("color", "red");
						idflag = false;
						$(".btn-success").attr("disabled", true);
						
					}
					
					}, error : function(error) {
							console.log("실패" + error);
					}
			});//ajax
  
		
		
		};

	//이메일 중복 검사
	function emailcheack() {
		var userEmail = $('#user_email').val();
		//alert(user_id);
			$.ajax({
				url : '/member/emailCheck?userEmail='+ userEmail,
				type : 'POST',
				dataType: "json",
				success : function(data) {
					console.log(data);
					if(data == 0){
						$("#email_check").text("사용가능한 이메일 입니다. :p");
						$("#email_check").css("color", "blue");
						emaulflag = true;
						if(idflag == true && pwflag == true){
							$(".btn-success").attr("disabled", false);
						} else if (idflag == false || pwflag == false){
							$(".btn-success").attr("disabled", true);						
						}
					} else if(data > 1){
						emaulflag = false;
						$("#email_check").text("사용중인 이메일 입니다 :p");
						$("#email_check").css("color", "red");
						$(".btn-success").attr("disabled", true);
						
					}
					
					}, error : function(error) {
							console.log("실패" + error);
					}
			});//ajax
  
		
		
		};

		
        function isSame(){
            var password = document.getElementById("password").value;
            var passwordCheck = document.getElementById("passwordCheck").value;
            if(password == passwordCheck){
	            document.getElementById("pwdValue").innerHTML = '비밀번호가 일치합니다.';
	            document.getElementById("pwdValue").style.color = 'blue';
	            pwflag = true;
	            if(idflag == true && emailflag == true){            	
            		$(".btn-success").attr("disabled", false);
	            } else if (idflag == false || emailflag == false){
	            	$(".btn-success").attr("disabled", true);
	            }
            }else{
                document.getElementById("pwdValue").innerHTML = '비밀번호가 일치하지 않습니다.';
                document.getElementById("pwdValue").style.color = 'red';
                pwflag = false;
                $(".btn-success").attr("disabled", true);
            }
        }

</script>
</body>
</html>