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
                    <h1 class="page-header"><b><c:out value="${userinfo.userid }"/></b>님의 마이 페이지</h1>
                </div>
                <!-- /.col-lg-12 -->
            </div>
             <!-- /.row -->        
            <div class="row">
                <div class="col-lg-12">
                    <div class="panel panel-default">
                        <div class="panel-heading">
                            	회원님의 정보
                        </div>
                        <!-- /.panel-heading -->
                        <div class="panel-body">
                        
					 	  	  <div class="form-group">
					            <label>아이디</label>
					            <input class="form-control" name='userid' readonly="readonly" value='<c:out value="${userinfo.userid }"/>'>
					          </div>
								
							  <div class="form-group">
					            <label>이름</label>
					            <input class="form-control" name='name' readonly="readonly" value='<c:out value="${userinfo.name}"/>'>
					          </div>	
							
							  <div class="form-group">
					            <label>성별</label>
					            <input class="form-control" name='usergender' readonly="readonly" value='<c:out value="${userinfo.usergender }"/>'>  
					          </div>
					          	
					          <div class="form-group">
					            <label>이메일</label>
					            <input class="form-control" name=useremail readonly="readonly" value='<c:out value="${userinfo.useremail }"/>'>  
					          </div>
					
							  <div class="form-group">
					            <label>등록한 게시글 수</label>
					            <input class="form-control" name=regDate readonly="readonly" value='<c:out value="${boardCnt }"/>'>  
					          </div>	
								
							  <div class="form-group">
					            <label>가입 일자</label>				            
					            <input class="form-control" name=regDate readonly="readonly" value='<fmt:formatDate pattern="yyyy-MM-dd" value="${userinfo.regDate }"/>'>  
					             
					          </div>
					          
					          <div class="form-group">
					            <label>최근 개인 정보 수정일자</label>
					           <input class="form-control" name=regDate readonly="readonly" value='<fmt:formatDate pattern="yyyy-MM-dd" value="${userinfo.updateDate }"/>'>   
					          </div>
					          	
					          	<form action="/member/customModify" method="get" style="float: left;">
									<button class="btn btn-default">
										비밀번호 변경
									</button>
								</form>
								<form action="/member/customDeleteForm" method="post" style="float: right;">
									<input type="hidden" name="${_csrf.parameterName }" value="${_csrf.token }">
									<input type="hidden" name='userid' value='<c:out value="${userinfo.userid }"/>'>
									<button class="btn btn-default" style="background-color: red;color: white">
										회원 탈퇴
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