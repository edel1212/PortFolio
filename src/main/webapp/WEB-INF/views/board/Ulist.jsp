<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>    
<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="description" content="">
    <meta name="author" content="">
    <title>유저들의 트론장</title>
    <!-- Bootstrap Core CSS -->
    <link href="/resources/boot/vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">
    <!-- MetisMenu CSS -->
    <link href="/resources/boot/vendor/metisMenu/metisMenu.min.css" rel="stylesheet">
    <!-- DataTables CSS -->
    <link href="/resources/boot/vendor/datatables-plugins/dataTables.bootstrap.css" rel="stylesheet">
    <!-- DataTables Responsive CSS -->
    <link href="/resources/boot/vendor/datatables-responsive/dataTables.responsive.css" rel="stylesheet">
    <!-- Custom CSS -->
    <link href="/resources/boot/dist/css/sb-admin-2.css" rel="stylesheet">
    <!-- Custom Fonts -->
    <link href="/resources/boot/vendor/font-awesome/css/font-awesome.min.css" rel="stylesheet" type="text/css">   
    <!-- jquery -->
	<script src="http://code.jquery.com/jquery-latest.js" type="text/javascript"></script> 
</head>
<body>

	<%@ include file="../includes/sub-header.jsp" %>

        <div id="page-wrapper" style="min-height: 0px">
            <div class="row">
                <div class="col-lg-12">
                    <h1 class="page-header"><a href="/board/Ulist">유저들의 토론장</a></h1>
                    <!-- 게시글 작성 btn -->
                    <sec:authorize access="isAuthenticated()">              
                    	<button id='regBtn' type='button' class="btn pull-right" style="margin-bottom: 5px">글쓰기</button>
                    </sec:authorize>
                </div>
                <!-- /.col-lg-12 -->
            </div>
             <!-- /.row -->
             
             
            <div class="row">
                <div class="col-lg-12">
                    <div class="panel panel-default">
                        <div class="panel-heading">
                            	공지사항을 필독해 주세요.
                        </div>
                        <!-- /.panel-heading -->
                        <div class="panel-body">
                            <table width="100%" class="table table-striped table-bordered table-hover" id="dataTables-example">
                                <thead>
                                    <tr>
                                        <th>#번호</th>
                                        <th>제목</th>
                                        <th>작성자</th>
                                        <th>작성일</th>
                                        <th>수정일</th>
                                    </tr>
                                </thead>
                            
                            <c:forEach items="${list}" var="board">
                            	<tr>
                            		<td><c:out value="${board.bno}"/></td>
                            		<td>
                            		<a class="move" href="${board.bno}">
                            			<c:out value="${board.title}"/>
                            			<b style="color:red">[<c:out value="${board.replyCnt}"></c:out>]</b>
                            		</a>
                            		</td>
                            		<td><c:out value="${board.writer}"></c:out></td>
									<td><fmt:formatDate pattern="yyyy-MM-dd" value="${board.regdate}"/> </td>
									<td><fmt:formatDate pattern="yyyy-MM-dd" value="${board.updateDate}"/> </td>
                            	</tr>
                            </c:forEach>
                            
                            </table>
                            <!-- /.table-responsive -->
                            
                            
                 <!-- 검색처리 -->
				<div class="row" style="text-align: right">
					<div class="col-lg-12">
						<form id="serachForm" action="/board/Ulist" method="get">
							<select name="type">
								<option value="" <c:out value="${pagination.type == null? 'selected':''}"></c:out>>
									--
								</option>
								<option value="T" <c:out value="${pagination.type eq 'T' ? 'selected':''}"></c:out>>
									제목
								</option>
								<option value="C" <c:out value="${pagination.type eq 'C' ? 'selected':''}"></c:out>>
									내용
								</option>
								<option value="W" <c:out value="${pagination.type eq 'W' ? 'selected':''}"></c:out>>
									작성자
								</option>
							</select>
							<input type="text" name="keyword" value='<c:out value="${pagination.keyword}"></c:out>' />
							<input type="hidden" name="page" value='<c:out value="${pagination.page}"></c:out>'/>
							<input type="hidden" name="range" value='<c:out value="${pagination.range}"></c:out>'/>
							<button class="btn btn=default">검색</button>
						</form>
					</div>
				</div>
                            
                            
          	<!-- paging-box -->
			<div id="pull-righ" style="text-align: right">
				<ul class="pagination">
					<c:if test="${pagination.prev}">
						<li class="pagiante_button previous">
						<a class="page-link" href="#" onClick="fn_prev('${pagination.page}', '${pagination.range}', '${pagination.rangeSize}')">
							Previous
						</a>
						
						</li>
					</c:if>
		
						
					<c:forEach begin="${pagination.startPage}" end="${pagination.endPage}" var="idx">
						<li class="page-item <c:out value="${pagination.page == idx ? 'active' : ''}"/> ">
						<a class="page-link" href="#" onClick="fn_pagination('${idx}', '${pagination.range}', '${pagination.rangeSize}','${pagination.type}'
						,'${pagination.keyword}')"> 
							${idx} 
						</a>
						</li>
					</c:forEach>
		
						
					<c:if test="${pagination.next}">
						<li class="pagiante_button next">
						<a class="page-link" href="#" onClick="fn_next('${pagination.range}','${pagination.range}', '${pagination.rangeSize}')" >
							Next
						</a>
						</li>
					</c:if>
				</ul>
			</div>
			<!-- /paging-box -->



		    <!-- paging form -->            
			<form id="actionForm" action="/board/Ulist" method="get">
				<input type="hidden" name="page" value="${pagination.page}">
				<input type="hidden" name="range" value="${pagination.range}">
				<input type="hidden" name="type" value='<c:out value="${pagination.type}"></c:out>'>
				<input type="hidden" name="keyword" value='<c:out value="${pagination.keyword}"></c:out>'>
			</form> 

                                  
                            
           <!-- Modal  추가 -->
			<div class="modal fade" id="myModal" tabindex="-1" role="dialog"
				aria-labelledby="myModalLabel" aria-hidden="true">
				<div class="modal-dialog">
					<div class="modal-content">
						<div class="modal-header">
							<button type="button" class="close" data-dismiss="modal"
								aria-hidden="true">&times;</button>
							<h4 class="modal-title" id="myModalLabel">게시글 등록 완료</h4>
						</div>
						<div class="modal-body">처리가 완료되었습니다.</div>
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
                            
                        
                        </div>
                        <!-- /.panel-body -->
                    </div>
                    <!-- /.panel -->
                </div>
                <!-- /.col-lg-12 -->
            </div>
            <!-- /.row -->     
    </div>
    <!-- /#wrapper -->

    <!-- Bootstrap Core JavaScript -->
    <script src="/resources/boot/vendor/bootstrap/js/bootstrap.min.js"></script>

    <!-- Metis Menu Plugin JavaScript -->
    <script src="/resources/boot/vendor/metisMenu/metisMenu.min.js"></script>

    <!-- DataTables JavaScript -->
    <script src="/resources/boot/vendor/datatables/js/jquery.dataTables.min.js"></script>
    <script src="/resources/boot/vendor/datatables-plugins/dataTables.bootstrap.min.js"></script>
    <script src="/resources/boot/vendor/datatables-responsive/dataTables.responsive.js"></script>

    <!-- Custom Theme JavaScript -->
    <script src="/resources/boot/dist/js/sb-admin-2.js"></script>

	<script type="text/javascript">
	$(document).ready(function(){
		
		var result = '<c:out value="${result}"/>';
		
		cheackModal(result);
		
		//앞으로 뒤로가기 시 모달창 제어
		history.replaceState({},null,null);
		
		function cheackModal(result){
			if (result === '' || history.states){
				return;
			}
			
			if(parseInt(result) > 0){
				$(".modal-body").html("게시글" + parseInt(result) + "번이 등록되었습니다.");
			}
			$("#myModal").modal("show");
		}
		
		//////////////////////////
		//게시글 클릭 event
		$("#regBtn").on("click",function(){
			self.location ="/board/Uregister";
		})
		

		/////
		//게시물 클릭시 돌아올때도 리스트 유지
		var actionForm = $("#actionForm");
		$('.move').on("click",function(e){
			
			e.preventDefault();
			actionForm.append("<input type='hidden' name='bno' value='"+$(this).attr("href")+"'>");
			actionForm.attr("action", "/board/Uget");
			actionForm.submit();
		});//click
		
		
		//search
		var serachForm = $("#serachForm");
		
		$("#serachForm button").on("click", function(e){
			
			if(!serachForm.find("option:selected").val()){
				alert("검색 종류를 선택해 주세요");
				return false;
			}
			
			if(!serachForm.find("input[name='keyword']").val()){
				alert("키워드를 입력하세요");
				return false;
			}
			
			//페이지 번호를 1로 
			serachForm.find("input[name='page']").val("1");
			
			e.preventDefault();
			serachForm.submit();
		});//click
		
	});//func
	</script>
	
	
	<script type="text/javascript">
		
	//이전 버튼 이벤트
	function fn_prev(page, range, rangeSize) {
			var page = ((range - 2) * rangeSize) + 1;
			var range = range - 1;		
			var url = "/board/Ulist";
			url = url + "?page=" + page;
			url = url + "&range=" + range;
			location.href = url;

		}



	  //페이지 번호 클릭
		function fn_pagination(page, range, rangeSize, type, keyword) {

			var url = "/board/Ulist";
			
			url = url + "?page=" + page;
			url = url + "&range=" + range;
			url = url + "&type=" + type;
			url = url + "&keyword=" + keyword;
			location.href = url;	

		}



		//다음 버튼 이벤트
		function fn_next(page, range, rangeSize) {
			var page = parseInt((range * rangeSize)) + 1;
			var range = parseInt(range) + 1;
			var url = "/board/Ulist";
			url = url + "?page=" + page;
			url = url + "&range=" + range;
			
			location.href = url;
		}

		
		

	</script>
	
	
	<div class="sub-footer">
		Copyright ©YooGames Corp. All Rights Reserved.
	</div>
	
</body>
</html>