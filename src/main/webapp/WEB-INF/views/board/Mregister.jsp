<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
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
		    		    ['fontsize', ['fontsize']],
		    		    ['font', ['bold', 'italic', 'underline', 'clear']],
		    		    ['height', ['height']],
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
                    <h1 class="page-header">공지사항 작성</h1>
                </div>
                <!-- /.col-lg-12 -->
            </div>
             <!-- /.row -->
             
             
            <div class="row">
                <div class="col-lg-12">
                    <div class="panel panel-default">
                        <div class="panel-heading">
                            	욕설 및 비방 글을 작성을 금지합니다.
                        </div>
                        <!-- /.panel-heading -->
                        <div class="panel-body">
					         <form role="form" action="/board/Mregister" method="post">
					         
					         <input type="hidden" name="${_csrf.parameterName }" value="${_csrf.token }">
					         
					          <div class="form-group">
					            <label>작성자</label> <input class="form-control" 
					            name='writer' value='<sec:authentication property="principal.username"/>'
					            readonly="readonly">
					          </div>
					          <div class="form-group">
					            <label>제목</label> <input class="form-control" name='title' maxlength="100">
					          </div>
					
					          <div class="form-group">
					            <label>내용</label>
					            <textarea id="summernote" class="form-control" rows="3" name='content' maxlength="2000"></textarea>
					          </div>				
					          <button type="submit" class="btn btn-default">올리기</button>
					          <button type="reset" class="btn btn-default">초기화</button>
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

    <!-- Page-Level Demo Scripts - Tables - Use for reference -->
    <script>
    $(document).ready(function() {
        $('#dataTables-example').DataTable({
            responsive: trued
        });
    });
    </script>
    
    <div class="sub-footer">
		Copyright ©YooGames Corp. All Rights Reserved.
	</div>
    
</body>
</html>