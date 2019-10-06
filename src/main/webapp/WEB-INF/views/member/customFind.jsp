<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
</head>
<body>
<%@ include file="../includes/sub-header.jsp" %>

<div style="width:100%;">
        <div class="row">
            <div class="col-md-4 col-md-offset-4">
                <div class="login-panel panel panel-default">
                    <div class="panel-heading">
                        <h3 class="panel-title">아이디 / 비밀번호 찾기</h3>
                    </div>
                    
                    <div class="panel-heading">
                       	<div style="margin-bottom: 10px;"
							class="custom-control custom-radio custom-control-inline">
							<input type="radio" class="custom-control-input" id="search_1" name="search_total" onclick="search_check(1)" checked="checked">
							<label class="custom-control-label font-weight-bold text-white"	for="search_1">아이디 찾기</label>
						</div>
						<div class="custom-control custom-radio custom-control-inline">
							<input type="radio" class="custom-control-input" id="search_2" name="search_total" onclick="search_check(2)"> 
							<label class="custom-control-label font-weight-bold text-white" for="search_2">비밀번호 찾기</label>
						</div>
                    </div>
                    
                    <div class="panel-body">
		                <div id="searchI">
							<div class="form-group">
								 <label for="username"><b>이름</b></label>
								<div>
									<input class="form-control" type="text" name="username" id="username" placeholder="이름을 입력해주세요."maxlength="40" required/> 
								</div>
							</div>
 							<div class="form-group">
						        <label for="email"><b>이메일</b></label>
								<input type="email" class="form-control" name="useremail" id="useremail" placeholder="이메일을 입력해주세요." maxlength="40" required/>   
					     	</div> 
							<div class="form-group">
								<button id="searchBtn" type="button" onclick="idSearch_click()" class="btn btn-success btn-block">아이디 확인</button>
							<a class="btn btn-danger btn-block"	href="${pageContext.request.contextPath}">취소</a>
							</div>				
						</div>
						<!-- /searchI -->
						
						
						<div id="searchP" style="display: none;">
							<form class="pwfind" action="/member/searchPassword" method="post" onsubmit="return check()" >
								<input type="hidden" name="${_csrf.parameterName }" value="${_csrf.token }">
								<div class="form-group">
									 <label for="userid"><b>아이디</b></label>
									<div>
										<input class="form-control pwid" type="text" name="userid" placeholder="아이디를 입력해주세요."maxlength="40" required/> 
									</div>
								</div>
	 							<div class="form-group">
							        <label for="email"><b>이메일</b></label>
									<input type="email" class="form-control pwemail" name="useremail" placeholder="이메일을 입력해주세요." maxlength="40" required/>   
						     	</div> 
								<div class="form-group">
									<button id="searchBtn2" type="button" class="btn btn-success btn-block">비밀번호 재발급</button>
									<a class="btn btn-danger btn-block"	href="${pageContext.request.contextPath}">취소</a>
								</div>
							</form>					
						</div>
						<!-- /searchP -->
					</div>

                    
                    
          
                </div>
            </div>
        </div>
    </div>

           <!-- Modal  추가 -->
			<div class="modal fade" id="myModal" tabindex="-1" role="dialog"
				aria-labelledby="myModalLabel" aria-hidden="true">
				<div class="modal-dialog">
					<div class="modal-content" style="text-align: center">
						<div class="modal-header">
							<button type="button" class="close" data-dismiss="modal"
								aria-hidden="true">&times;</button>
							<h4 class="modal-title" id="myModalLabel"><b>회원님의 아이디?</b></h4>
						</div>
						<div class="modal-body"><h2 id="id_value"  style="margin: 20px 10px"></h2> </div>
						<div class="modal-footer">
							<button type="button" class="btn btn-default"
								data-dismiss="modal">닫기</button>
						</div>
					</div>
					<!-- /.modal-content -->
				</div>
				<!-- /.modal-dialog -->
			</div>
			<!-- /.modal -->






    <!-- jQuery -->
    <script src="../resources/boot/vendor/jquery/jquery.min.js"></script>
			     
    <!-- Bootstrap Core JavaScript -->
    <script src="../resources/boot/vendor/bootstrap/js/bootstrap.min.js"></script>

    <!-- Metis Menu Plugin JavaScript -->
    <script src="../resources/boot/vendor/metisMenu/metisMenu.min.js"></script>

    <!-- Custom Theme JavaScript -->
    <script src="../resources/boot/dist/js/sb-admin-2.js"></script>


	<div class="sub-footer">
		Copyright ©YooGames Corp. All Rights Reserved.
	</div>


	<!-- Cheak box 변화 및 btn 클릭 -->
	<script type="text/javascript">
	function search_check(num) {
		if (num == '1') {
			document.getElementById("searchP").style.display = "none";
			document.getElementById("searchI").style.display = "";	
		} else {
			document.getElementById("searchI").style.display = "none";
			document.getElementById("searchP").style.display = "";
		}
	}
	
	$("#searchBtn").on("click",function(){
		$("#myModal").modal("show");
	})
	
	$("#searchBtn2").on("click",function(){
		//alert("!1");
		$(".pwfind").submit();
	})
	
	</script>


	<!-- Ajax -->
	<script type="text/javascript">	
	var csrfHeaderName ="${_csrf.headerName}"; 
    var csrfTokenValue="${_csrf.token}";
	
	
	//Ajax spring security header...
	$(document).ajaxSend(function(e, xhr, options) { 
		xhr.setRequestHeader(csrfHeaderName, csrfTokenValue); 
	}); 
	
		var idV = "";
		
		var idSearch_click = function(){
			$.ajax({
				type:"POST",
				url:"${pageContext.request.contextPath}/member/userSearch?username="
						+$('#username').val()+"&useremail="+$('#useremail').val(),
				success:function(data){
					if(data == 0){
						$('#id_value').text("회원 정보를 확인해주세요!");	
					} else {
						$('#id_value').text(data);
						// 아이디값 별도로 저장
						idV = data;
					}
				}
			});
		}
	
	</script>
	
	<!-- input 컨트롤 -->
	<script type="text/javascript">
	
	$(document).ready(function(){
		
		var bEmpty = $("input").val();
		
		
		
		//$(".btn-success").attr("disabled", true);
		
		
		
		
	});


    
    
	//공백 검사
	function check() {
	
		var inputcheackpw = $(".pwid").val();
		var inputcheackemail = $(".pwemail").val();
		
		if(inputcheackpw != "" && inputcheackemail != ""){
			console.log("둘다 있어");   	
			console.log(inputcheackemail);   	
			console.log(inputcheackpw);   	
			return true;
			
		} else {
			console.log("둘다 없어!!!!"); 
			console.log(inputcheackemail);   	
			console.log(inputcheackpw);
			alert("회원정보를 입력해주세요 :D");
			return false;			
		}
		
			
	    	
	
	


	
	}

	
	</script>
	
</body>
</html>