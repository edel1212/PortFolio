<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<!-- jquery -->
<script src="http://code.jquery.com/jquery-latest.js" type="text/javascript"></script> 
</head>
<body>
Loading....
	
	
<div style="opacity: 0">
     <form name="logoutform" role="form" action="/customLogout" method="post">
     	<fieldset>                     	
    			<a href="index.html" class="btn btn-lg btn-block logout-btn" style="background-color: red;color:white">로그아웃</a>
     	</fieldset>
    		<input type="hidden" name="${_csrf.parameterName }" value="${_csrf.token }">
     </form>
</div>
	
	

<c:if test="${ msg == 'DEL'}">
	<script type="text/javascript">
		$(document).ready(function(){
			alert("계정 탈퇴가 완료되었습니다.");
			$("form").submit();
		})
	</script>
</c:if>


<c:if test="${ mail == 'fail'}">
	<script type="text/javascript">
	$(document).ready(function(){
		alert("이메일 인증이 안된 계정입니다. 이메일을 인증해 주세요.");
		$("form").submit();
	})
</script>
</c:if>

    
</body>
</html>