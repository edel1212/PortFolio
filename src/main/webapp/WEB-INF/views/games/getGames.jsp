<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link href="../../resources/css/games.css" rel="stylesheet">
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
                    <h1 class="page-header"><c:out value="${list.title }"></c:out></h1>
                    <a style="color:red;" href="/member/customJoin"><b style="color:red;">※회원만 다운로드 링크를 볼 수 있습니다.</b></a>
                </div>
                <!-- /.col-lg-12 -->
            </div>
             <!-- /.row -->        
            <div class="row">
                <div class="col-lg-12">
                    <div class="panel panel-default">
                        <div class="panel-heading">
                            	<span><c:out value="${list.genre }"></c:out> </span>
                            	<sec:authorize access="isAuthenticated()">
                            		<a class="right download"  target="_blank" href="<c:out value="${list.downlink}"></c:out>">다운로드</a>
                      			</sec:authorize>
                        </div>
                        <!-- /.panel-heading -->
                        <div class="panel-body">
                        
					 	  	 <div class="form-group">
					            <label>소개 영상</label>
					            <div class="youtube">
					            <iframe width="100%" height="720" src="<c:out value="${list.youtube }"></c:out>" 
					            frameborder="0" allow="accelerometer; autoplay; encrypted-media; gyroscope; picture-in-picture"></iframe>
					            </div>
					          </div>
					          
					           <div class="form-group">
					            <label>게임 소개</label>
								<p><c:out value="${list.info }"></c:out>
								</p>
					          </div>
	                                                   
                        </div>
                        <!-- /.panel-body -->
                    </div>
                    <!-- /.panel -->                 
                </div>
                <!-- /.col-lg-12 -->
            </div>
            <!-- /.row -->                            
</div>	
	
	<div class="sub-footer">
		Copyright ©YooGames Corp. All Rights Reserved.
	</div>
</body>
</html>