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
    <title>유저 토론장</title>
    
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
		margin-top:5px;
		margin-bottom:15px;
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
		width: 600px;
	}
	
	
	</style>

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
                            	유저 토론장 페이지
                        </div>
                        <!-- /.panel-heading -->
                        <div class="panel-body">
                        	<form role="form" action="/board/Umodify" method="post">
                        	
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
					            <input class="form-control" name='title' maxlength="100" value='<c:out value="${board.title }"  />'>
					          </div>
					
					
								<!-- fileResult 부분 -->
								<div class='row'>
									<div class="col-lg-12">
										<div class='panel panel-default'>
											
											<div class="panel-heading">Files</div><!-- /panel-heading -->
										
											<div class="panel-body">
												<div class='form-group uploadDiv'>
													<input type='file' name='uploadFile' multiple='multiple' >
												</div>	
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
					            <textarea id="summernote" class="form-control" rows="3" name='content'  maxlength="2000">${board.content }</textarea>					 
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
									  	<button type="submit" data-oper='modify' class="controller-btn btn btn-default">수정</button>
								  		<button type="submit" data-oper='remove' class="controller-btn btn btn-danger">삭제</button>
									</c:if>						
								</sec:authorize>
								
							  	<button type="submit" data-oper='list' class="controller-btn btn btn-info">목록</button>
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

	<!-- img modal -->
	<!-- bigPictureWrapper -->
	<div class="bigPictureWrapper">
		<div class='bigPicture'>
		</div>
	</div>

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
				formObj.attr("action", "/board/Uremove")
			} else if(operation ==='list'){
				formObj.attr("action","/board/Ulist").attr("method","get");
				var pageNumTag = $("input[name='page']").clone();
				var amountTag = $("input[name='range']").clone();
				var typeTag = $("input[name='type']").clone();
				var keywordTag = $("input[name='keyword']").clone();
				formObj.empty();
				formObj.append(pageNumTag);
				formObj.append(amountTag);
				formObj.append(typeTag);
				formObj.append(keywordTag);

			} else if(operation === 'modify'){
		        
		        console.log("submit clicked");
		        
		        var str = "";
		        
		        $(".uploadResult ul li").each(function(i, obj){
		          
		          var jobj = $(obj);
		          
		          console.dir(jobj);
		          
		          str += "<input type='hidden' name='attachList["+i+"].fileName' value='"+jobj.data("filename")+"'>";
		          str += "<input type='hidden' name='attachList["+i+"].uuid' value='"+jobj.data("uuid")+"'>";
		          str += "<input type='hidden' name='attachList["+i+"].uploadPath' value='"+jobj.data("path")+"'>";
		          str += "<input type='hidden' name='attachList["+i+"].fileType' value='"+ jobj.data("type")+"'>";
		          
		        });
		        
		        formObj.append(str).submit();
	        }
			formObj.submit();
		});//click
		
		
	});//func
	</script>
	
	<script type="text/javascript">

		$(document).ready(function(){
			(function(){
				
		    	var csrfHeaderName = "${_csrf.headerName}";
		    	var csrfTokenValue = "${_csrf.token}";
				
				var bno = '<c:out value="${board.bno}"/>';
				
				$.getJSON("/board/getAttachList", {bno:bno},function(arr){
					
					console.log(arr);
					
					var str = "";
					
					$(arr).each(function(i,attach){
						
						//image type
						if(attach.fileType){
							var fileCallPath = encodeURIComponent(attach.uploadPath+ "/s_"+attach.uuid+"_"+attach.fileName);
							
							str += "<li data-path='"+attach.uploadPath+"' data-uuid='"+attach.uuid+"' data-filename='"+attach.fileName+"' data-type='"+attach.fileType+"'><div>";
							
							str += "<span>"+attach.fileName+"</span>"
							
							str += "<button type='button' data-file=\'"+fileCallPath+"\' data-type='image'";
							
							str += "class='btn file-btn'>X</button></br>"
							
							str += "<img src='/display?fileName="+fileCallPath+"'>";
							
							str += "</div>";
							
							str += "</li>";						
							
						} else {
							
							str += "<li data-path='"+attach.uploadPath+"' data-uuid='"+attach.uuid+"' data-filename='"+attach.fileName+" 'data-type='"+attach.fileType+"'><div>";
														
							str += "<span><img src='/resources/img/attach.png' style='width:20px'>"+attach.fileName+"</span>";
							
							str += "<button type='button' data-file=\'"+fileCallPath+"\' data-type='file'";
							
							str += "class='btn file-btn'>X</button></br>"
							
							
							str += "</div>";
							
							str += "</li>";	
						}
						
						
					});//arr
					$(".uploadResult ul").html(str);
					
		
				});//getJSON
				
			})();//func
			
			//첨부파일 삭제 클릭 시 
			$(".uploadResult").on("click","button",function(e){
				
				console.log("delete click");
				
				if(confirm("진짜 삭제하실껀가요 ?")){
					var targetLi = $(this).closest("li");
					
					var targetFile = $(this).data("file");
				    var type = $(this).data("type");
					
				    $.ajax({
					      url: '/deleteFile',
					      data: {fileName: targetFile, type:type},
					      beforeSend: function(xhr){
								xhr.setRequestHeader(csrfHeaderName,csrfTokenValue);
						  },
					      dataType:'text',
					      type: 'POST',
					        success: function(result){
					           alert("첨부파일 등록이 취소 되었습니다 :D");
					           
					           targetLi.remove();
					         }
					    }); //$.ajax
				}
				
			});//click
			
			  //파일 용량 제한
			  var regex = new RegExp("(.*?)\.(exe|sh|zip|alz)$");
			  var maxSize = 5242880; //5MB
			  
			  function checkExtension(fileName, fileSize){
			    
			    if(fileSize >= maxSize){
			      alert("파일 사이즈 초과");
			      return false;
			    }
			    
			    if(regex.test(fileName)){
			      alert("해당 종류의 파일은 업로드할 수 없습니다.");
			      return false;
			    }
			    return true;
			  }
			
			  $("input[type='file']").change(function(e){

				    var formData = new FormData();
				    
				    var inputFile = $("input[name='uploadFile']");
				    
				    var files = inputFile[0].files;
				    
				    for(var i = 0; i < files.length; i++){

				      if(!checkExtension(files[i].name, files[i].size) ){
				        return false;
				      }
				      formData.append("uploadFile", files[i]);
				      
				    }
				    
				    $.ajax({
				      url: '/uploadAjaxAction',
				      processData: false, 
				      contentType: false,data: 
				      formData,type: 'POST',
				      beforeSend: function(xhr){
							xhr.setRequestHeader(csrfHeaderName,csrfTokenValue);
						},
				      dataType:'json',
				        success: function(result){
				          console.log(result); 
						  showUploadResult(result); //업로드 결과 처리 함수 

				      }
				    }); //$.ajax
				    
				  });    

				function showUploadResult(uploadResultArr){
					 
					   if(!uploadResultArr || uploadResultArr.length == 0){return;}
					   
					   var uploadUL = $('.uploadResult ul');
					   
					   var str = "";
					   
					   $(uploadResultArr).each(function(i, obj){
					     
					   //image type
						if(obj.image){
							var fileCallPath =  encodeURIComponent( obj.uploadPath+ "/s_"+obj.uuid +"_"+obj.fileName);
							str += "<li data-path='"+obj.uploadPath+"'";
							str +=" data-uuid='"+obj.uuid+"' data-filename='"+obj.fileName+"' data-type='"+obj.image+"'"
							str +" ><div>";
							str += "<span> "+ obj.fileName+"</span>";
							str += "<button type='button' data-file=\'"+fileCallPath+"\' "
							str += "data-type='image' class='btn file-btn'>X</button><br>";
							str += "<img src='/display?fileName="+fileCallPath+"'>";
							str += "</div>";
							str +"</li>";
						}else{
							var fileCallPath =  encodeURIComponent( obj.uploadPath+"/"+ obj.uuid +"_"+obj.fileName);			      
						    var fileLink = fileCallPath.replace(new RegExp(/\\/g),"/");
						      
							str += "<li "
							str += "data-path='"+obj.uploadPath+"' data-uuid='"+obj.uuid+"' data-filename='"+obj.fileName+"' data-type='"+obj.image+"' ><div>";
							str += "<span><img src='/resources/img/attach.png' style='width:20px'> "+ obj.fileName+"</span>";
							str += "<button type='button' data-file=\'"+fileCallPath+"\' data-type='file' " 
							str += "class='btn file-btn'>X</button><br>";
							str += "</a>";
							str += "</div>";
							str +"</li>";
						}
					   });
					   
					   uploadUL.append(str);
					 }
			
		});//document
	
	</script>
	
	
	<div class="sub-footer">
		Copyright ©YooGames Corp. All Rights Reserved.
	</div>
	
</body>
</html>