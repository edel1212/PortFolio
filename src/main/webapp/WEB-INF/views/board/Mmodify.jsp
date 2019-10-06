<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>    
<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="description" content="">
    <meta name="author" content="">
    <title>공지사항</title>
    
    <!-- include libraries(jQuery, bootstrap) -->
	<link href="http://netdna.bootstrapcdn.com/bootstrap/3.3.5/css/bootstrap.css" rel="stylesheet">
	<script src="http://cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.js"></script> 
	<script src="http://netdna.bootstrapcdn.com/bootstrap/3.3.5/js/bootstrap.js"></script>
	<!-- include summernote css/js-->
	<link href="https://cdnjs.cloudflare.com/ajax/libs/summernote/0.8.12/summernote-bs4.css" rel="stylesheet">
	<script src="https://cdnjs.cloudflare.com/ajax/libs/summernote/0.8.12/summernote-bs4.js"></script>
	<!-- custom-summernote.css -->
	<link href="/resources/summernote/summernote.css" rel="stylesheet">   
	<!-- custom-summernote.js -->
	<script src="/resources/summernote/summernote.js"></script> 
    
    
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
</head>
<body>

	<%@ include file="../includes/sub-header.jsp" %>

	<script src="/resources/summernote/summernote-ko-KR.js"></script>
	<script>
		
		var csrfHeaderName = "${_csrf.headerName}";
		var csrfTokenValue = "${_csrf.token}";
	
		$(document).ready(function() {
			  $('#summernote').summernote({
		 	    	placeholder: '공지사항을 필독해 주세요',
			        height: 600,
			        focus: true, 
			        lang : 'ko-KR',
		    		toolbar: [
		    		    ['style', ['style']],
		    		    ['font', ['bold', 'italic', 'underline', 'clear']],
		    		    ['fontsize', ['fontsize']],
		    		    ['color', ['color']],
		    		    ['insert', ['link', 'hr']],
		    		    ['view', ['fullscreen', 'codeview']],
		    		  ]
			  });
			  			  
			  $('.dropdown-toggle').dropdown();
			});
	</script>
        <div id="page-wrapper">
            <div class="row">
                <div class="col-lg-12">
                    <h1 class="page-header">게시글 수정</h1>
                </div>
                <!-- /.col-lg-12 -->
            </div>
             <!-- /.row -->
                        
            <div class="row">
                <div class="col-lg-12">
                    <div class="panel panel-default">
                        <div class="panel-heading">
                            	공지 사항을 필독해 주세요.
                        </div>
                        <!-- /.panel-heading -->
                        <div class="panel-body">
                        	<form role="form" action="/board/Mmodify" method="post">
                        	
                        	  <!-- token값 전달 -->
                        	  <input type="hidden" name="${_csrf.parameterName }" value="${_csrf.token }">
                        	
					 	  	  <div class="form-group">
					            <label>게시글 번호</label> 
					            <input class="form-control" name='bno' readonly="readonly" value='<c:out value="${board.bno }"/>'>
					          </div>
								
							  <div class="form-group">
					            <label>작성자</label> 
					            <input class="form-control" name='writer' readonly="readonly" value='<c:out value="${board.writer }"/>'>
					          </div>	
								
					          <div class="form-group">
					            <label>제목</label> 
					            <input class="form-control" name='title' maxlength="100" value='<c:out value="${board.title }" />'>
					          </div>
					
					          <div class="form-group">
					            <label>내용</label>
					            <textarea id="summernote" class="form-control" rows="3" name='content' maxlength="2000">${board.content }</textarea>
					          </div>
					
							    <div class="form-group">
								  <label>작성 일자</label> 
								  <input class="form-control" name='regDate'
								    value='<fmt:formatDate pattern = "yyyy/MM/dd" value = "${board.regdate}" />'  readonly="readonly">            
								 </div>
								
								<div class="form-group">
								  <label>수정 일자</label> 
								  <input class="form-control" name='updateDate'
								    value='<fmt:formatDate pattern = "yyyy/MM/dd" value = "${board.updateDate}" />'  readonly="readonly">            
								</div>
								
								<!-- 페이지 유지를 위함 -->
								<input type="hidden" name="page" value="${pagination.page}">
								<input type="hidden" name="range" value="${pagination.range}">
								
								<!-- 검색결과 유지  -->
								<input type="hidden" name="type" value='<c:out value="${pagination.type}"></c:out>'>
								<input type="hidden" name="keyword" value='<c:out value="${pagination.keyword}"></c:out>'>
								
								<!-- 접근자 제한 -->
								<sec:authentication property="principal" var="pinfo"/>
								
								<sec:authorize access="isAuthenticated()">				
									<c:if test="${pinfo.username eq board.writer }">
									  	<button type="submit" data-oper='modify' class="btn btn-default controller-btn">수정</button>
								  		<button type="submit" data-oper='remove' class="btn btn-danger controller-btn">삭제</button>
									</c:if>						
								</sec:authorize>
								
							  	<button type="submit" data-oper='list' class="btn btn-info">목록</button>
	                    	</form>                               
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
		
		var formObj = $("form");
		
		$('.controller-btn').on("click",function(e){
			
			e.preventDefault();
			
			var operation = $(this).data("oper");
			
			if(operation ==='remove'){
				formObj.attr("action", "/board/Mremove")
			} else if(operation ==='list'){
				formObj.attr("action","/board/Mlist").attr("method","get");
				var pageNumTag = $("input[name='page']").clone();
				var amountTag = $("input[name='range']").clone();
				var typeTag = $("input[name='type']").clone();
				var keywordTag = $("input[name='keyword']").clone();
				formObj.empty();
				formObj.append(pageNumTag);
				formObj.append(amountTag);
				formObj.append(typeTag);
				formObj.append(keywordTag);

			}
	
			formObj.submit();
		});//click
		
		
	});//func
	</script>
	
	<div class="sub-footer">
		Copyright ©YooGames Corp. All Rights Reserved.
	</div>
	
</body>
</html>