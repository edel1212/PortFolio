<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>  
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>  
<!-- header -->
<%@include file="includes/header.jsp" %>	
	<!-- -----------main banner------------------ -->	
	<div class="main-banner">
		  <!-- Swiper -->
	  <div class="swiper-container">
	    <div class="swiper-wrapper">
	      <div class="swiper-slide m1">
	      	<div class="main-banner-icon">
	      		<a href="/games/5">
	      			<img alt="m1뮤주라" src="../resources/img/m1-icon.png">
	      		</a>
	      	</div>
	      	<h2 class="main-text">전설을 다시 <br/>플레이 해보세요!</h2>
	      	<div class="main-button">
	      		<a href="/games/5">
	      			자세히보기
	      		</a>
	      	</div>
	      </div>
	      <div class="swiper-slide m2">
	      	<div class="main-banner-icon">
	      		<a href="/games/16">
	      			<img alt="m2하트골드" src="../resources/img/m2-icon.png">
	      		</a>
	      	</div>
	      	<h2 class="main-text">다시 시작 되는<br>모험 이야기.</h2>
	      	<div class="main-button">
	      		<a href="/games/16">
	      			자세히보기
	      		</a>
	      	</div>
	      </div>
	      <div class="swiper-slide m3">
	      	<div class="main-banner-icon">
	      		<a href="/games/17">
	      			<img alt="m3화이트데이" src="../resources/img/m3-icon.png">
	      		</a>	
	      	</div>
	      	<h2 class="main-text">사탕을 전해주려다<br>공포가 시작된다.</h2>
	      	<div class="main-button">
	      		<a href="/games/17">
	      			자세히보기
	      		</a>	
	      	</div>
	      </div>
	    </div>
	    <!-- Add Pagination -->
	    <div class="swiper-pagination swiper-pagination-white"></div>
	    <!-- Add Arrows -->
	    <div class="swiper-button-next swiper-button-white"></div>
	    <div class="swiper-button-prev swiper-button-white"></div>
	  </div> 
	</div><!-- /main-banner -->
	<!-- Swiper JS -->
	<script src="../resources/swiper/swiper.min.js"></script>
	<!-- Initialize Swiper -->
	<script src="../resources/swiper/mainswiper.js"></script>
	
	<!-- -----------/main banner------------------ -->	
	
	
	<!-----------  wrap -------------------->
	<div class="wrap">
		<div class="contents-haed">
			<h2 class="left">게임 모음</h2>
		</div>
		<!-- /contents-haed -->
		
		<div class="filter">
			<a href="#" data-filter="*" class='current'>#전체</a>
			<a href="#" data-filter=".RPG">#RPG</a>
			<a href="#" data-filter=".SRPG">#SRPG</a>
			<a href="#" data-filter=".ACTION">#액션</a>
			<a href="#" data-filter=".casual">#캐주얼</a>
			<a href="#" data-filter=".sport">#스포츠</a>
			<a href="#" data-filter=".fly">#비행</a>
		</div>
				

		<ul class="game-List">
			<li class="RPG">
				<a href="/games/1"> 
					<div class="game-image">
						<img src="../resources/img/slide1.jpg" alt="환세취호전">
					</div>
					<div class="game-intro">
						<h3>환세취호전</h3>
						<p>맹호 스페셜~ </p>
						<div class="bar"></div>
						<span class="iconDesktop"></span><span>RPG</span>
					</div>
				</a>
			</li>
			
			<li class="ACTION">
				<a href="/games/2">
					<div class="game-image">
						<img src="../resources/img/slide2.jpg" alt="록맨x4">
					</div>
					<div class="game-intro">
						<h3>록맨x4</h3>
						<p>시작은 역시 버섯 부터</p>
						<div class="bar"></div>
						<span class="iconDesktop"></span><span>액션</span>
					</div>
				</a>
			</li>
			
			<li class="fly ACTION">
				<a href="/games/3">
					<div class="game-image">
						<img src="../resources/img/slide3.jpg" alt="텐가이">
					</div>
					<div class="game-intro">
						<h3>텐가이</h3>
						<p>↑↑↓↓↓↑↑↑↑↑↑↑</p>
						<div class="bar"></div>
						<span class="iconDesktop"></span><span>비행 액션</span>
					</div>
				</a>
			</li>
					
			<li class="casual">
				<a href="/games/4">
					<div class="game-image">
						<img src="../resources/img/slide4.jpg" alt="스노우브라더스2">
					</div>
					<div class="game-intro">
						<h3>스노우브라더스2</h3>
						<p>싹 쓸 이~</p>
						<div class="bar"></div>
						<span class="iconDesktop"></span><span>캐쥬얼</span>
					</div>
				</a>
			</li>
			
			<li class="RPG">
				<a href="/games/5">
					<div class="game-image">
						<img src="../resources/img/slide5.jpg" alt="시간의 오카리나">
					</div>
					<div class="game-intro">
						<h3>젤다의전설 시간의 오카리나</h3>
						<p>초록색 옷이 젤다죠?</p>
						<div class="bar"></div>
						<span class="iconDesktop"></span><span>RPG</span>
					</div>
				</a>
			</li>
			
			<li class="sport">
				<a href="/games/6">
					<div class="game-image">
						<img src="../resources/img/slide6.jpg" alt="슬램덩크:슈퍼슬램">
					</div>
					<div class="game-intro">
						<h3>슬램덩크:슈퍼슬램</h3>
						<p>왼손은 거들 뿐.</p>
						<div class="bar"></div>
						<span class="iconDesktop"></span><span>스포츠</span>
					</div>
				</a>
			</li>
			
			<li class="SRPG">
				<a href="/games/7">
					<div class="game-image">
						<img src="../resources/img/slide7.jpg" alt="파이어 엠블램">
					</div>
					<div class="game-intro">
						<h3>파이어 엠블램: 트라키아</h3>
						<p>극악 난이도로 유명한 게임</p>
						<div class="bar"></div>
						<span class="iconDesktop"></span><span>SRPG</span>
					</div>
				</a>
			</li>			
			
			<li class="RPG casual">
				<a href="/games/8">
					<div class="game-image">
						<img src="../resources/img/slide8.jpg" alt="슈퍼마리오 RPG">
					</div>
					<div class="game-intro">
						<h3>슈퍼마리오 RPG</h3>
						<p>마리오 RPG의 시초 작품</p>
						<div class="bar"></div>
						<span class="iconDesktop"></span><span>RPG 캐쥬얼</span>
					</div>
				</a>
			</li>				

			<li class="action">
				<a href="/games/9">
					<div class="game-image">
						<img src="../resources/img/slide9.jpg" alt="킹오브98">
					</div>
					<div class="game-intro">
						<h3>킹오브 파이터즈 98</h3>
						<p>아 ... 히카리가 ..</p>
						<div class="bar"></div>
						<span class="iconDesktop"></span><span>액션</span>
					</div>
				</a>
			</li>
			
			<li class="action">
				<a href="/games/10">
					<div class="game-image">
						<img src="../resources/img/slide10.jpg" alt="메탈슬러그3">
					</div>
					<div class="game-intro">
						<h3>메탈슬러스 3</h3>
						<p>헤비머신건</p>
						<div class="bar"></div>
						<span class="iconDesktop"></span><span>액션</span>
					</div>
				</a>
			</li>

			<li class="action">
				<a href="/games/11">
					<div class="game-image">
						<img src="../resources/img/slide11.jpg" alt="블러디로어2">
					</div>
					<div class="game-intro">
						<h3>블러드로어2</h3>
						<p>A A A A A ↓</p>
						<div class="bar"></div>
						<span class="iconDesktop"></span><span>액션</span>
					</div>
				</a>
			</li>
			
			<li class="RPG">
				<a href="/games/12">
					<div class="game-image">
						<img src="../resources/img/slide12.jpg" alt="젤다의전설 뮤쥬라의 가면">
					</div>
					<div class="game-intro">
						<h3>젤다의전설 뮤쥬라의 가면</h3>
						<p>숲속에서 습격을 당했다 ..</p>
						<div class="bar"></div>
						<span class="iconDesktop"></span><span>RPG</span>
					</div>
				</a>
			</li>
			
			<li class="casual">
				<a href="/games/13">
					<div class="game-image">
						<img src="../resources/img/slide13.jpg" alt="소닉3">
					</div>
					<div class="game-intro">
						<h3>소닉3 & 너클즈</h3>
						<p>서커스맵에서 80%가 접게되는 게임</p>
						<div class="bar"></div>
						<span class="iconDesktop"></span><span>캐쥬얼</span>
					</div>
				</a>
			</li>

			<li class="casual">
				<a href="/games/14">
					<div class="game-image">
						<img src="../resources/img/slide14.jpg" alt="닌자베이스볼">
					</div>
					<div class="game-intro">
						<h3>닌자베이스볼 베트맨</h3>
						<p>일명 야구왕이라 불리는 게임</p>
						<div class="bar"></div>
						<span class="iconDesktop"></span><span>캐쥬얼</span>
					</div>
				</a>
			</li>
			
			<li class="fly">
				<a href="/games/15">
					<div class="game-image">
						<img src="../resources/img/slide15.jpg" alt="1945 3">
					</div>
					<div class="game-intro">
						<h3>스트라이커즈 1945</h3>
						<p>슈팅게임의 1인자</p>
						<div class="bar"></div>
						<span class="iconDesktop"></span><span>비행</span>
					</div>
				</a>
			</li>
			
			<li class="casual">
				<a href="/games/16">
					<div class="game-image">
						<img src="../resources/img/slide16.jpg" alt="하트골드">
					</div>
					<div class="game-intro">
						<h3>포켓몬스터 하트골드</h3>
						<p>리메이크된 전설</p>
						<div class="bar"></div>
						<span class="iconDesktop"></span><span>케쥬얼</span>
					</div>
				</a>
			</li>
			
			<li class="action">
				<a href="/games/17">
					<div class="game-image">
						<img src="../resources/img/slide17.jpg" alt="화이트데이">
					</div>
					<div class="game-intro">
						<h3>화이트데이</h3>
						<p>공포가 시작된다..</p>
						<div class="bar"></div>
						<span class="iconDesktop"></span><span>액션/공포</span>
					</div>
				</a>
			</li>
							
		</ul>
		<!-- /game-List -->
		
		
		<!-- notice//user board -->
		<div class="notice-board board left">
			<div class="contents-haed">
				<h2 class="left">공지사항</h2>
				<p class="right more"><a href="/board/Mlist">더 보기</a></p>
				
			</div>
			<!-- /contents-haed -->
				<ul>
					<c:forEach items="${Mlist}" var="mboard">
						<li>
							<a href="/board/Mget?page=1&range=1&type=&keyword=&bno=${mboard.bno}">
							<div class="list-title">-<c:out value="${mboard.title}"/></div>                     	
                            	<b class="list-cnt">[<c:out value="${mboard.replyCnt}"></c:out>]</b>
                            	<b style="text-align: right"></b>
                            	<b class="list-date"><fmt:formatDate pattern="yyyy-MM-dd" value="${mboard.updateDate}"/></b>
                            </a>
                        </li>
					</c:forEach>
				</ul>
		</div>
		<!-- /notice-board -->
		
		<div class="user-board board right">
			<div class="contents-haed">
				<h2 class="left">유저 토론장</h2>
				<p class="right"><a href="/board/Ulist" class="more">더 보기</a></p>
			</div>
			<!-- /contents-haed -->
				<ul>
					<c:forEach items="${list}" var="board">
						<li>
							<a href="/board/Uget?page=1&range=1&type=&keyword=&bno=${board.bno}">
                            	<div class="list-title">-<c:out value="${board.title}"/></div>
                            	<b class="list-cnt">[<c:out value="${board.replyCnt}"></c:out>]</b>
                            	<b class="list-date"><fmt:formatDate pattern="yyyy-MM-dd" value="${board.updateDate}"/></b>
                            </a>
                        </li>
					</c:forEach>
				</ul>
		</div>
		<!-- /user-board -->
	</div>
	<!--------------------- /wrap -------------------->

	<c:if test="${result != null}">
		<script>
			$(document).ready(function(){
				
				var result = '<c:out value="${result}"/>';
				
				alert(result);
				
			});//docu
		</script>
	</c:if>

<!-- footer -->
<%@include file="includes/footer.jsp" %>