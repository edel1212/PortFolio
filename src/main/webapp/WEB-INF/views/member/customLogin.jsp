<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
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

<script type="text/javascript">

	var msg = "<c:out value="${error}"></c:out>"
	
	if(msg != ""){
		alert(msg);
	}
	
	
</script>

<!-- 아이디 저장 -->
<script type="text/javascript">

	var csrfHeaderName ="${_csrf.headerName}"; 
	var csrfTokenValue="${_csrf.token}";
		
	//Ajax spring security header...
	$(document).ajaxSend(function(e, xhr, options) { 
	    xhr.setRequestHeader(csrfHeaderName, csrfTokenValue); 
	  }); 

	$(document).ready(function(){
	       $(document).ready(function(){
	    	    var userInputId = getCookie("userInputId");//저장된 쿠기값 가져오기
	    	    $("input[name='username']").val(userInputId); 
	    	     
	    	    if($("input[name='username']").val() != ""){ // 그 전에 ID를 저장해서 처음 페이지 로딩
	    	                                           // 아이디 저장하기 체크되어있을 시,
	    	        $("#idSaveCheck").attr("checked", true); // ID 저장하기를 체크 상태로 두기.
	    	    }
	    	     
	    	    $("#idSaveCheck").change(function(){ // 체크박스에 변화가 발생시
	    	        if($("#idSaveCheck").is(":checked")){ // ID 저장하기 체크했을 때,
	    	            var userInputId = $("input[name='username']").val();
	    	            setCookie("userInputId", userInputId, 7); // 7일 동안 쿠키 보관
	    	            alert("기억된 아이디는 7일동안 기억됩니다.")
	    	        }else{ // ID 저장하기 체크 해제 시,
	    	            deleteCookie("userInputId");
	    	        }
	    	    });
	    	     
	    	    // ID 저장하기를 체크한 상태에서 ID를 입력하는 경우, 이럴 때도 쿠키 저장.
	    	    $("input[name='username']").keyup(function(){ // ID 입력 칸에 ID를 입력할 때,
	    	        if($("#idSaveCheck").is(":checked")){ // ID 저장하기를 체크한 상태라면,
	    	            var userInputId = $("input[name='username']").val();
	    	            setCookie("userInputId", userInputId, 7); // 7일 동안 쿠키 보관
	    	        }
	    	    });
	    	});	
	});//docu
	
	//////////////////////////////////////////
	
	function setCookie(cookieName, value, exdays){
	    var exdate = new Date();
	    exdate.setDate(exdate.getDate() + exdays);
	    var cookieValue = escape(value) + ((exdays==null) ? "" : "; expires=" + exdate.toGMTString());
	    document.cookie = cookieName + "=" + cookieValue;
	}
	 
	function deleteCookie(cookieName){
	    var expireDate = new Date();
	    expireDate.setDate(expireDate.getDate() - 1);
	    document.cookie = cookieName + "= " + "; expires=" + expireDate.toGMTString();
	}
	 
	function getCookie(cookieName) {
	    cookieName = cookieName + '=';
	    var cookieData = document.cookie;
	    var start = cookieData.indexOf(cookieName);
	    var cookieValue = '';
	    if(start != -1){
	        start += cookieName.length;
	        var end = cookieData.indexOf(';', start);
	        if(end == -1)end = cookieData.length;
	        cookieValue = cookieData.substring(start, end);
	    }
	    return unescape(cookieValue);
	}
	
</script>


<%@ include file="../includes/sub-header.jsp" %>

<div style="width:100%;">
        <div class="row">
            <div class="col-md-4 col-md-offset-4">
                <div class="login-panel panel panel-default">
                    <div class="panel-heading">
                        <h3 class="panel-title">로그인 페이지</h3>
                    </div>
                    <div class="panel-body">
                        <form role="form" method="post" action="/login">
                            <fieldset>
                                <div class="form-group">
                                    <input class="form-control" placeholder="Id" name="username" type="text" autofocus>
                                </div>
                                <div class="form-group">
                                    <input class="form-control" placeholder="Password" name="password" type="password" value="">
                                </div>
                                <div class="checkbox" style="overflow: hidden;">
                                    <label>
                                        <input id="idSaveCheck" type="checkbox">아이디 기억하기
                                    </label>
                                     <label class="right">
                                        <a href="/member/customFind">아이디 찾기 / 비밀번호찾기</a>                               
                                    </label>
                                </div>
                                <!-- Change this to a button or input when using this as a form -->
                                <a href="/" class="btn btn-lg btn-success btn-block">Login</a>
                                <input type="hidden" name="${_csrf.parameterName }" value="${_csrf.token }">
                            </fieldset>
                        </form>
                    </div>
                </div>
            </div>
        </div>
    </div>

    <!-- jQuery -->
    <script src="../resources/boot/vendor/jquery/jquery.min.js"></script>
			     
    <!-- Bootstrap Core JavaScript -->
    <script src="../resources/boot/vendor/bootstrap/js/bootstrap.min.js"></script>

    <!-- Metis Menu Plugin JavaScript -->
    <script src="../resources/boot/vendor/metisMenu/metisMenu.min.js"></script>

    <!-- Custom Theme JavaScript -->
    <script src="../resources/boot/dist/js/sb-admin-2.js"></script>

	<script type="text/javascript">
		$(".btn-success").on("click",function(e){
			e.preventDefault();
			$("form").submit();
		});//click
	</script>

	<div class="sub-footer">
		Copyright ©YooGames Corp. All Rights Reserved.
	</div>

</body>
</html>