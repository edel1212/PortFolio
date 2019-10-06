<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원 탈퇴 페이지</title>
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


        <div id="page-wrapper">			
            <div class="row">
                <div class="col-lg-12">
                    <h1 class="page-header"><b><c:out value="${userinfo.userid }"/></b>님의 회원탈퇴</h1>
                </div>
                <!-- /.col-lg-12 -->
            </div>
             <!-- /.row -->        
            <div class="row">
                <div class="col-lg-12">
                    <div class="panel panel-default">
                        <div class="panel-heading">
                            	<b>회원탈퇴</b>
                        </div>
                        <!-- /.panel-heading -->
                        <div class="panel-body">
                        	<form action="/member/customDelete" method="post">                       	
                        	  <input type="hidden" name="${_csrf.parameterName }" value="${_csrf.token }">
							  
							  <input type="hidden" name='userid' value='<c:out value="${userinfo.userid }"/>'>
							  	
					 	  	  <div class="form-group">
					            <label>현재 비밀번호 확인</label>
					            <input type="password" class="form-control" id="password" name="userpw" required  placeholder="비밀번호를 입력해주세요" title="비밀번호" maxlength="40"/>
					          </div>
					          								
	          	
								<button data-oper='modify' class="btn btn-default btn-success">
									회원 탈퇴하기
								</button>
								
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





	<script src="/resources/js/reply.js"></script>

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
	
	<div class="sub-footer">
		Copyright ©YooGames Corp. All Rights Reserved.
	</div>
</body>
</html>