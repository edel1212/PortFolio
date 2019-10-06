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

    <!-- jquery -->
	<script src="http://code.jquery.com/jquery-latest.js" type="text/javascript"></script> 
	<style type="text/css">
	.uploadResult {
		width: 100%;
		background-color: #f7f7f7;
	}
	
	.uploadResult ul {
		overflow: hidden;
	}
	
	.uploadResult ul li {
		padding: 10px;
		margin-top:10px;
		margin-bottom:30px;
		font-size: 20px;
    	font-weight: bold;
    	box-sizing: border-box;
    	
	}
	
	
	.uploadResult ul li span{
		display: inline-block;
		font-size:20px;
		margin-left:20px;
		cursor: pointer;
	}
	
	.file-btn{
		color:red;
		font-weight: bolder;
		background: none;
	}
	
	.uploadResult ul li img {
		width: 150px;
		cursor: pointer;
	}
	
	body,html{
		height: 100%;
	}
	
	.bigPictureWrapper{
		position: fixed;
		display:none;
		justify-content: center;
		text-align: center;
		align-items: center;
		top:0%;
		width:100%;
		height:100%;
		z-index: 100;
		background-color: rgba(0,0,0,0.8);
		
		
	}
	
	.bigPicture{
		position: relative;
		display: flex;
		justify-content: center;
		align-items: center;
	}
	
	.bigPicture img{
		width: auto;
	}
	
	.board-contents>ul{
		background-color: #3333330a;
		box-sizing: border-box;
		padding: 15px;
	}
	
	.board-contents>ul>li{
		display: inline-block;
	    margin: 0 10px;
	}

	
	</style>
</head>
<body>

	<%@ include file="../includes/sub-header.jsp" %>

        <div id="page-wrapper">			
            <div class="row">
                <div class="col-lg-12">
                    <h1 class="page-header">유저들의 토론장</h1>
                </div>
                <!-- /.col-lg-12 -->
            </div>
             <!-- /.row -->        
            <div class="row">
                <div class="col-lg-12">
                    <div class="panel panel-default">
                        <div class="panel-heading">
                            	유저 토론장 페이지
                        </div>
                        <!-- /.panel-heading -->
                        <div class="panel-body">
                        
					 	  	  <div class="form-group">
					            <label>게시글 번호</label> 
					            <input class="form-control" name='bno' readonly="readonly" value='<c:out value="${board.bno }"/>'>
					          </div>
								
							  <div class="form-group">
					            <label>작성자</label> <input class="form-control" name='writer' readonly="readonly" value='<c:out value="${board.writer }"/>'>
					          </div>	
								
					          <div class="form-group">
					            <label>제목</label> <input class="form-control" name='title' readonly="readonly" value='<c:out value="${board.title }"/>'>
					          </div>
					
								<!-- fileResult 부분 -->
								<div class='row'>
									<div class="col-lg-12">
										<div class='panel panel-default'>
											
											<div class="panel-heading">Files</div><!-- /panel-heading -->
										
											<div class="panel-body">
												<div class="uploadResult">
													<ul>
													
													</ul>
												</div>
												<!-- /uploadResult -->	
											</div>
											<!-- /panel-body -->
										
										</div>
										<!-- /panel panel-default -->
									</div>
								</div>
								<!-- /row -->
					
					          <div class="form-group">
					            <label>내용</label>
					            <div class="board-contents">
					            	<ul>
					            	
					            	</ul>					            
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
	                        <form id="operForm" action="/board/Umodufy" method="get">
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

	
	<!-- img modal -->
	<!-- bigPictureWrapper -->
	<div class="bigPictureWrapper">
		<div class='bigPicture'>
		</div>
	</div>

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
	
	<script type="text/javascript">
	$(document).ready(function(){
		
		var operForm = $("#operForm");
		
		$("button[data-oper='modify']").on("click",function(e){
			operForm.attr("action","/board/Umodify").submit();
		});//modify click
		
		$("button[data-oper='list']").on("click",function(e){
			operForm.find("#bno").remove();
			operForm.attr("action","/board/Ulist").submit();
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
			
			//New 등록
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
				
				replyService.add(reply,function(result){
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
				replyService.get(rno,function(reply){
					modalInputReply.val(reply.reply);
					modalInputReplyer.val(reply.replyer);
					modalInputReplyDate.val(replyService.displayTime(reply.replyDate))
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
				
				replyService.update(reply,function(result){
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
				
				replyService.remove(rno,originalReplyer,function(result){
					alert("삭제가 완료 되었습니다. :D");
					modal.modal("hide");
					showList(-1);
				})
				
			});//remove click
		
		
			function showList(page){
				
				replyService.getList({
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
							str += "<small class='pull-right text-muted'>"+replyService.displayTime(list[i].replyDate)+"</small></div>";
							str += "<p>"+list[i].reply+"</p></div></li>";
						}//for
						replyUL.html(str);
					});//list
				
			}
			
			
			
			replyService.getList({bno:bnoValue, page:1}, function(list){
			    
				  for(var i = 0,  len = list.length||0; i < len; i++ ){
				    console.log(list[i]);
				  }
			})
			
			
						
			
		});//fun
	</script>
	
	<!-- 첨부파일 불러오기 -->
	<script type="text/javascript">
		$(document).ready(function(){
			
			(function(){
				   var bno = '<c:out value="${board.bno}"/>';
				    
				     $.getJSON("/board/getAttachList", {bno: bno}, function(arr){
				    
				      console.log(arr);
				      
				      var str = "";
				      
				      $(arr).each(function(i, attach){
				    	  
				    	  //image type
				    	  if(attach.fileType){
				    		  
				    		  var fileCallPath =  encodeURIComponent( attach.uploadPath+ "/s_"+attach.uuid +"_"+attach.fileName);
				    		  
				    		  str += "<li data-path='"+attach.uploadPath+"' data-uuid='"+attach.uuid+"' data-filename='"+attach.fileName+"' data-type='"+attach.fileType+"' ><div>";
				    		  str += "<img src='/display?fileName="+fileCallPath+"' style='width:auto;cursor:pointer;margin-bottom:10px'>";
				              str += "</div>";
				              str +"</li>";
				              str +"<hr/>";
				              str +"<hr/>";
				    		  
				    	  } 
				    	  	    	  
				      });//each
				      
				    	  $(".board-contents ul").html(str);
				      
				    }); //end getjson
				})();//function
				
			(function(){
				   var bno = '<c:out value="${board.bno}"/>';
				    
				     $.getJSON("/board/getAttachList", {bno: bno}, function(arr){
				    
				      console.log(arr);
				      
				      var str = "";
				      
				      $(arr).each(function(i, attach){
				    	  
				    	  //image type
				    	  if(!attach.fileType){
				    		  str += "<li data-path='"+attach.uploadPath+"' data-uuid='"+attach.uuid+"' data-filename='"+attach.fileName+"' data-type='"+attach.fileType+"' ><div>";
				              str += "<span><img src='/resources/img/attach.png' style='width:20px'> "+ attach.fileName+"</span><br/>";
				              str += "</a>";
				              str += "</div>";
				              str +"</li>"; 
				    	  }
				    	  	    	  
				      });//each
				      
				    	  $(".uploadResult ul").html(str);
				      
				    }); //end getjson
				})();//function
				
				//첨부파일 클릭 시
				$('.uploadResult').on("click","li",function(e){
					
					console.log("view image");
					
					var liObj = $(this);
					
					var path = encodeURIComponent(liObj.data("path")+"/"+ liObj.data("uuid") + "_"+ liObj.data("filename"));
					
					if(liObj.data("type")){
						//파일 경로의 경우 함수로 전달하면 오류 발생함으로 replace사용
						showImage(path.replace(new RegExp(/\\/g),"/"));
	
					} else {
						//download
						self.location = "/download?fileName="+path 
					}
					
				});//click
				
				//이미지 클릭 시
				$('.board-contents').on("click","li",function(e){
					
					console.log("view image");
					
					var liObj = $(this);
					
					var path = encodeURIComponent(liObj.data("path")+"/"+ liObj.data("uuid") + "_"+ liObj.data("filename"));
					
					if(liObj.data("type")){
						//파일 경로의 경우 함수로 전달하면 오류 발생함으로 replace사용
						showImage(path.replace(new RegExp(/\\/g),"/"));
	
					} else {
						//download
						self.location = "/download?fileName="+path 
					}
					
				});//click
				
				//이미지 확대창 닫기
				$('.bigPictureWrapper').on("click",function(e){
					
					
					$(".bigPicture").css({width:"0%",height:'0%'});
					
					setTimeout(function(){
						$('.bigPictureWrapper').hide();
					});//setTimeout
					
				});//click
				
				function showImage(fileCallpath){
					//alert(fileCallpath);
					
					$(".bigPictureWrapper").css("display","flex").show();
					
					$(".bigPicture").html("<img src='/display?fileName="+fileCallpath+"'>").css({width:"100%",height:'100%'});
	
				}
				
				
		});//
	</script>
	
	<div class="sub-footer">
		Copyright ©YooGames Corp. All Rights Reserved.
	</div>
	
</body>
</html>