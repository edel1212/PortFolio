<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8" name="viewport" content="width=device-width, initial-scale=1">
<title>Insert title here</title>
<link rel="stylesheet" href="../../resources/css/global.css">
<link rel="stylesheet" href="../../resources/css/main_navi.css">
<link rel="stylesheet" href="../../resources/css/footer.css">
<link rel="stylesheet" href="../../resources/css/main.css">
<!-- Link Swiper's CSS -->
<link rel="stylesheet" href="../../resources/swiper/swiper.min.css">
<!-- jquery -->
<script src="http://code.jquery.com/jquery-latest.js" type="text/javascript"></script> 
<!-- isotope.js -->
<script src="../../resources/isotope/jquery.isotope.js" type="text/javascript"></script>  
<script src="../../resources/isotope/mainisotope.js" type="text/javascript"></script>
<!-- main.js -->
<script src="../../resources/js/main.js" type="text/javascript"></script>
<!-- font -->
<link href="https://fonts.googleapis.com/css?family=Noto+Sans+KR:400,500,700,900&display=swap&subset=korean" rel="stylesheet">	
</head>
<body>
	<div class="main-nav">
		<div class="main-nav-contents">
			<div class="left row-align">
				<h1 class="main-logo">
					<a href="/">
						<img alt="logo" src="../../resources/img/logo.png">
					</a>
				</h1>
				<ul class="row-align mobile-left">
					<li><a href="/board/Ulist">토론장</a></li>
					<li><a href="#">이벤트</a></li>
					<li><a href="/board/Mlist">공지사항</a></li>
				</ul>
			</div>
			<div class="right row-align">
			
			
				<!-- 로그인 성공시 접근 -->
			
	 			<sec:authorize access="isAuthenticated()">
		 			<ul class="row-align">
						<li class="user-menu"><a href="#">내 계정 ▽</a>
							<ul class="sub-menu">
								<li style="text-align: center">
								<form class="mypage-form" role="form" method='post' action="/member/customMypage">								
											<a href="index.html" class="mypage-btn">마이페이지</a>
										<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />
									</form>		
								</li>
								<li style="text-align: center">							
										<form class="logout-form" role="form" method='post' action="/customLogout">								
											<a href="index.html" class="logout-btn">로그아웃</a>
										<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />
									</form>						
								</li>						
							</ul>
						</li>
					</ul>
	 			</sec:authorize>
	 			
	 			
	 			
	 			
				<sec:authorize access="isAnonymous()">
					<ul class="row-align">
						<li><a href="/member/customLogin">로그인</a></li>
						<li><a href="/member/customJoin">회원가입</a></li>	
					</ul>	
	 			</sec:authorize>
			</div>
		</div><!-- /main-nav-contents -->
		
		<!-- 
		<div class="mobile-main-nav-contents">
			<span><img alt="menu" src="../../resources/img/mobile.png"></span>
			<h1 class="main-logo">
				<a href="/">
					<img alt="logo" src="../../resources/img/logo.png">
				</a>
			</h1>
		</div>
		 -->
	</div><!-- main-nav -->
	
<script type="text/javascript">

$(".mypage-btn").on("click", function(e){
	
	e.preventDefault();
	$(".mypage-form").submit();
});

$(".logout-btn").on("click", function(e){
	
	e.preventDefault();
	$(".logout-form").submit();
});
</script>

