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
    
    <title>공지 사항</title>
    
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
                    <h1 class="page-header">공지사항</h1>
                </div>
                <!-- /.col-lg-12 -->
            </div>
             <!-- /.row -->        
            <div class="row">
                <div class="col-lg-12">
                    <div class="panel panel-default">
                        <div class="panel-heading">
                            	공지사항을 필독 해주세요.
                        </div>
                        <!-- /.panel-heading -->
                        <div class="panel-body">
                        
					 	  	  <div class="form-group">
					            <label>게시글 번호</label> <input class="form-control" name='bno' readonly="readonly" value='<c:out value="${board.bno }"/>'>
					          </div>
								
							  <div class="form-group">
					            <label>작성자</label> <input class="form-control" name='writer' readonly="readonly" value='<c:out value="${board.writer }"/>'>
					          </div>	
								
					          <div class="form-group">
					            <label>제목</label> <input class="form-control" name='title' readonly="readonly" value='<c:out value="${board.title }"/>'>
					          </div>
					
					          <div class="form-group">
					            <label>내용</label>
					        	<div class="board-contents">					            
					            	${board.content }
					            </div>
					          </div>
					
							<!-- 작성자만 보이게끔 -->
							<sec:authentication property="principal" var="pinfo"/>
							
							<sec:authorize access="isAuthenticated()">
							
								<c:if test="${pinfo.username eq board.writer }">
									<button data-oper='modify' class="btn btn-default">
										수정
									</button>
								</c:if>
							
							</sec:authorize>
											
							<button data-oper='list' class="btn btn-info">
									목록
							</button>
	                        
	                        <!-- btn으로 controll하기 위함 --> 
	                        <form id="operForm" action="/board/Mmodufy" method="get">
	                        	<input type="hidden" id="bno" name="bno" value='<c:out value="${board.bno}"/>'>
	                        	<input type="hidden" name="page" value='<c:out value="${pagination.page}"/>'>
								<input type="hidden" name="range" value="${pagination.range}">
								<input type="hidden" name="type" value='<c:out value="${pagination.type}"></c:out>'>
								<input type="hidden" name="keyword" value='<c:out value="${pagination.keyword}"></c:out>'>
	                        </form> 
	                                                   
                        </div>
                        <!-- /.panel-body -->
                    </div>
                    <!-- /.panel -->                 
                </div>
                <!-- /.col-lg-12 -->
            </div>
            <!-- /.row -->     
            
            
            
		    <!-- Reply_box -->
			<div class='row'>
				<div class='col-lg-12'>
					<div class='panel panel-default'>
						<div class='panel-heading'>
							<i class='fa fa-comments fa-fw'></i>
							댓글
							<!-- 로그인시만 보이게 -->			
							<sec:authorize access="isAuthenticated()">						
								<button id='addReplyBtn' class='btn btn-primary btn-xs pull-right'>댓글 쓰기</button>
							</sec:authorize>
						</div>
						<!-- /panel-heading  -->
						
						<div class='panel-body'>
							<ul class='chat'>
								<li class="left clear-fix" data-rnp='12'>
									<div>
										<div class='header'>
											<strong class='primery-font'>회원만 댓글을 남길 수 있습니다.</strong>
											<small class='pull-right text-muted'>20XX-XX-XX XX:XX</small>
										</div>
										<!-- /header -->
										<p>댓글이 업습니다! 댓글을 남겨주세요.</p>
									</div>
								</li>
								<!-- clear-fix -->
							</ul>
							<!-- /chat -->
						</div>
						<!-- /panel-body -->
						
						<!-- .chat panelt 추가 -->
						<div class='panel-footer'>
						
						</div>
						<!-- /panel-footer -->
						
						
					</div>
					<!-- /panel panel-default -->
				</div>
				<!-- /col-lg-12 -->
			</div>
			<!-- /row -->          
    </div>
    <!-- /#wrapper -->



	<!-- Reply Modal -->
	 <!-- Modal -->
	<div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
	    <div class="modal-dialog">
	        <div class="modal-content">
	            <div class="modal-header">
	                <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
	                <h4 class="modal-title" id="myModalLabel">Reply</h4>
	            </div>
	            <div class="modal-body">
	               <!-- /form-group -->
	               <div class="form-group">
	               		<label>작성자</label>
	               		<input class="form-control" name="replyer" value="replyer" readonly="readonly"/>
	               </div>

	               <div class="form-group">
	               		<label>댓글</label>
	               		<input class="form-control" name="reply" value="New Reply!!" maxlength="1000"/>
	               </div>

	               <!-- /form-group -->
	               <div class="form-group">
	               		<label>작성 일자</label>
	               		<input class="form-control" name="replyDate" value="" />
	               </div>
	               <!-- /form-group -->                              
	            </div>
	            <!-- /modal-body -->
	            <div class="modal-footer">
	                <button type="button" id="modalModBtn" class="btn btn-waring">수정</button>
	                <button type="button" id="modalRemoveBtn" class="btn btn-danger">삭제</button>
	                <button type="button" id="modalRegisterBtn" class="btn btn-primary">등록</button>
	                <button type="button" id="modalCloseBtn" class="btn btn-default">Close</button>
	            </div>
	        </div>
	        <!-- /.modal-content -->
	    </div>
	    <!-- /.modal-dialog -->
	</div>
	<!-- /.modal -->

	<script src="/resources/js/mreply.js"></script>

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
		
		var operForm = $("#operForm");
		
		$("button[data-oper='modify']").on("click",function(e){
			operForm.attr("action","/board/Mmodify").submit();
		});//modify click
		
		$("button[data-oper='list']").on("click",function(e){
			operForm.find("#bno").remove();
			operForm.attr("action","/board/Mlist").submit();
		});//modify click		
		
	});//func
	</script>
	
	<!-- 댓글 관련 script -->
	<script type="text/javascript">
		$(document).ready(function(){
					
			var bnoValue = '<c:out value="${board.bno}"/>';

			var replyUL = $('.chat');
			
			showList(1);
			
			
			var modal = $(".modal");
			var modalInputReply = modal.find("input[name='reply']");
			var modalInputReplyer = modal.find("input[name='replyer']");
			var modalInputReplyDate = modal.find("input[name='replyDate']");
			
			var modalModBtn = $("#modalModBtn");
			var modalRemoveBtn = $("#modalRemoveBtn");
			var modalRegisterBtn = $("#modalRegisterBtn");
			
			
			var replyer = null;
		
				
		    <sec:authorize access="isAuthenticated()">
		    
		   	 replyer = '<sec:authentication property="principal.username"/>';   
		    
			</sec:authorize>
			
			var csrfHeaderName ="${_csrf.headerName}"; 
		    var csrfTokenValue="${_csrf.token}";
			
			
			//Ajax spring security header...
		   $(document).ajaxSend(function(e, xhr, options) { 
		        xhr.setRequestHeader(csrfHeaderName, csrfTokenValue); 
		      }); 
			
			//등록버튼 클릭시 modal
			$("#addReplyBtn").on("click",function(e){
				modal.find("input").val("");
				modal.find("input[name='replyer']").val(replyer);
				modalInputReplyDate.closest("div").hide();
				modal.find("button[id != 'modalCloseBtn']").hide();
				
				modalRegisterBtn.show();
				$(".modal").modal("show");
				
			});// addReplyBtn click 
			
			
			//등록
			modalRegisterBtn.on("click",function(e){
				var reply = {				
					reply: modalInputReply.val(),
					replyer: modalInputReplyer.val(),
					bno:bnoValue				
				}
				
				ManagerReply.Madd(reply,function(result){
					alert("등록이 완료 되었습니다. :D");
					modal.find("input").val("");
					modal.modal("hide");
					//showList(1);
					showList(-1);
				});//addService
			});//modalRegisterBtn click Event
			
			//취소
			$("#modalCloseBtn").on("click",function(e){
				modal.modal("hide");
			});//close click event
			
			
			//댓글 클릭 이밴트
			$(".chat").on("click","li",function(e){
				var rno = $(this).data("rno");
				console.log(rno);
				ManagerReply.Mget(rno,function(reply){
					modalInputReply.val(reply.reply);
					modalInputReplyer.val(reply.replyer);
					modalInputReplyDate.val(ManagerReply.MdisplayTime(reply.replyDate))
					.attr("readonly","readonly");
					modal.data("rno",reply.rno);
					
					modal.find("button[id != 'modalCloseBtn']").hide();
					modalModBtn.show();
					modalRemoveBtn.show();
					$(".modal").modal("show");
				});//get
				
			});//chat click
			
			
			//수정
			modalModBtn.on("click",function(e){
				
				var originalReplyer = modalInputReplyer.val();
							
				var reply = {
						rno:modal.data("rno") ,
						reply : modalInputReply.val(),
						replyer : originalReplyer};
				
				if(!replyer){
					alert("로그인 후 삭제가 가능합니다.");
					modal.modal("hide");
					return;
				}
				
				
				
				console.log("Original Replyer : " + originalReplyer);
				
				if(replyer != originalReplyer){
					  alert("자신이 작성한 댓글만 수정이 가능합니다.");
			   		  modal.modal("hide");
			   		  return;
					}
				
				ManagerReply.Mupdate(reply,function(result){
					alert("수정이 완료 되었습니다 :D");
					modal.modal("hide");
					showList(-1);
				}); //reply var		
			});//modify click
			
			//삭제
			modalRemoveBtn.on("click",function(e){
				var rno = modal.data("rno");
				
				console.log("RNO : " + rno);
				console.log("Replyer : " + replyer);
				
				if(!replyer){
					alert("로그인 후 삭제가 가능합니다.");
					modal.modal("hide");
					return;
				}
				
				var originalReplyer = modalInputReplyer.val();
				
				console.log("Original Replyer : " + originalReplyer);
				
				if(replyer != originalReplyer){
				  alert("자신이 작성한 댓글만 삭제가 가능합니다.");
		   		  modal.modal("hide");
		   		  return;
				}
				
				ManagerReply.Mremove(rno,originalReplyer,function(result){
					alert("삭제가 완료 되었습니다. :D");
					modal.modal("hide");
					showList(-1);
				})
				
			});//remove click
		
			
			//리스트
			function showList(page){
				
				ManagerReply.MgetList({
					bno:bnoValue,
					page: page ||1}, function(list){
						
						var str ="";
						if(list == null ||list.lenght ==1){
							relpyUL.html("");
							return;
						}
						
						for(var i = 0, len = list.length || 0; i < len; i++){
							str +="<li class='left clearfix' data-rno='"+list[i].rno+"'>";
							str +="  <div><div class='header'><strong class='primary-font'>"+list[i].replyer+"</strong>"; 
							str += "<small class='pull-right text-muted'>"+ManagerReply.MdisplayTime(list[i].replyDate)+"</small></div>";
							str += "<p>"+list[i].reply+"</p></div></li>";
						}//for
						replyUL.html(str);
					});//list
				
			}
			
			
			
			ManagerReply.MgetList({bno:bnoValue, page:1}, function(list){
			    
				  for(var i = 0,  len = list.length||0; i < len; i++ ){
				    console.log(list[i]);
				  }
			})
			
			
						
			
		});//fun
	</script>
	
	
	
	<div class="sub-footer">
		Copyright ©YooGames Corp. All Rights Reserved.
	</div>
	
</body>
</html>