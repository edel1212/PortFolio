<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>    
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<!DOCTYPE html>
<html lang="en">
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


        <div id="page-wrapper">			
            <div class="row">
                <div class="col-lg-12">
                    <h1 class="page-header"><b><c:out value="${userinfo.userid }"/></b>님의 마이 페이지 수정</h1>
                </div>
                <!-- /.col-lg-12 -->
            </div>
             <!-- /.row -->        
            <div class="row">
                <div class="col-lg-12">
                    <div class="panel panel-default">
                        <div class="panel-heading">
                            	<b>회원님의 정보 변경</b>
                        </div>
                        <!-- /.panel-heading -->
                        <div class="panel-body">
                        	<form action="/member/customModify" method="post">
                        	  <input type="hidden" name="${_csrf.parameterName }" value="${_csrf.token }">
					 	  	  <div class="form-group">
					            <label>아이디</label>
					            <input class="form-control" name='userid' readonly="readonly" value='<c:out value="${userinfo.userid }"/>'>
					          </div>
								
					 	  	  <div class="form-group">
					            <label>변경 하실 비밀번호</label>
					            <input type="password" class="form-control" id="password" name="userpw" required  placeholder="비밀번호를 입력해주세요" title="비밀번호" maxlength="40" minlength="5"/>
					          </div>
					          							
					 	  	  <div class="form-group">
					            <label>비밀번호 재확인</label> <div id="pwdValue"></div>
					           <input type="password" class="form-control" id="passwordCheck" onkeyup="isSame()" required placeholder="비밀번호를 재입력해주세요." title="비밀번호 재입력" maxlength="40" minlength="5"/>
					          </div>
	
									         					          	
								<button data-oper='modify' class="btn btn-default btn-success">
									비밀번호 변경하기
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



	<script src="/resources/member/join.js"></script>

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