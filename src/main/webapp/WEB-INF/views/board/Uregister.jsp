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
    

    <!-- MetisMenu CSS -->
    <link href="/resources/boot/vendor/metisMenu/metisMenu.min.css" rel="stylesheet">
    <!-- DataTables CSS -->
    <link href="/resources/boot/vendor/datatables-plugins/dataTables.bootstrap.css" rel="stylesheet">
    <!-- DataTables Responsive CSS -->
    <link href="/resources/boot/vendor/datatables-responsive/dataTables.responsive.css" rel="stylesheet">
    <!-- Custom CSS -->
    <link href="/resources/boot/dist/css/sb-admin-2.css" rel="stylesheet">   
    
    <style type="text/css">
	.uploadResult {
		width: 100%;
		background-color: #f7f7f7;
		padding: 25px 0 0px 50px;
	}
	
	.uploadResult ul {
		overflow: hidden;
		text-align: center;
		justify-content: center;
		align-items: center;
	}
	
	.uploadResult ul li {
		float:left;
		padding: 10px;
		font-size: 20px;
    	font-weight: bold
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
		width: 200px;
	}
	
	
	.bigPictureWrapper{
		position: absolute;
		display:none;
		justify-content: center;
		text-align: center;
		align-items: center;
		top:0%;
		width:100%;
		height:100%;
		background-color: gray;
		z-index: 100;
		background: rgba(255,255,255,0,0.5);
		
		
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
                    <h1 class="page-header">토론장 게시판 글 작성</h1>
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
					         <form role="form" action="/board/Uregister" method="post">
					         
					         <input type="hidden" name="${_csrf.parameterName }" value="${_csrf.token }">
					         
					          <div class="form-group">
					            <label>작성자</label> <input class="form-control" 
					            name='writer' value='<sec:authentication property="principal.username"/>'
					            readonly="readonly">
					          </div>
					          <div class="form-group">
					            <label>제목</label> <input class="form-control" name='title' maxlength="100">
					          </div>
								
								<!-- 파일 첨부 -->
								<div class='row'>
									<div class='col-lg-12'>
										<div class='panel panel-default'>									
											<div class='panel-heading'>첨부 파일</div><!-- File Attach -->							
											<div class='panel-body'>
												<input type="file" name='uploadFile' multiple>
											</div>
											<!-- panel-body -->										
											<div class='uploadResult'>
												<ul>
												
												</ul>
											</div>
											<!-- uploadResult -->
										</div>
										<!-- panel panel-default -->
									</div>
								</div>
								<!-- /.row -->	
														
					          <div class="form-group">
					            <label>내용</label>
					            <textarea id="summernote" class="form-control" rows="3" name='content'></textarea>
					          </div>				
					          <button type="submit" class="btn btn-default sucess">올리기</button>
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

    <!-- fileupload -->
    <script>
    $(document).ready(function(){
    	  	
   	var formObj = $("form[role='form']");
   	//게시글 등록 시 
   	$("button[type='submit']").on("click",function(e){
	e.preventDefault();
	console.log("submit clecked");
	
	var str = "";
	
	$(".uploadResult ul li").each(function(i , obj){
		
   	  var jobj = $(obj);
      
      console.dir(jobj);
      console.log("-------------------------");
      console.log(jobj.data("filename"));
      
      
      str += "<input type='hidden' name='attachList["+i+"].fileName' value='"+jobj.data("filename")+"'>";
      str += "<input type='hidden' name='attachList["+i+"].uuid' value='"+jobj.data("uuid")+"'>";
      str += "<input type='hidden' name='attachList["+i+"].uploadPath' value='"+jobj.data("path")+"'>";	      
      str += "<input type='hidden' name='attachList["+i+"].fileType' value='"+ jobj.data("type")+"'>";
      
		
	});//each
	console.log(str);
	formObj.append(str).submit();
	
	});//click
        
    	//파일 예외 변수 생성 처리
    	var regex = new RegExp("(.*?)\(exe|sh|zip|alz)");
		var maxSize = 5248800; //5MB
		
		function checkExtension(fileName,fileSize){
			
			if(fileSize >= maxSize){
				alert("파일 사이즈 초과");
				return false;
			}
			
			if(regex.test(fileName)){
				alert("해당 종류의 파일은 업로드 할 수 없습니다.");
				return false;
			}
			return true;
		}
    	
    	//시큐리티 file post전송시 필요
    	var csrfHeaderName = "${_csrf.headerName}";
    	var csrfTokenValue = "${_csrf.token}";
		
		//input file 변경시
		$("input[type='file']").change(function(e){
			
			var formData = new FormData();
			
			var inputFile = $("input[name='uploadFile']");
			
			var files = inputFile[0].files;
			
			console.log(files);
			
			//add filed to formdata
			for(var i = 0; i <files.length; i++){
				
				if(!checkExtension(files[i].name,files[i].size)){
					return false;
				}
				
				formData.append("uploadFile", files[i]);
			}
			
			
			$.ajax({
				url:'/uploadAjaxAction',
				processData:false,
				contentType:false,
				beforeSend: function(xhr){
					xhr.setRequestHeader(csrfHeaderName,csrfTokenValue);
				},
				data: formData,
				type:'POST',
				dataType:'json',
				success: function(result){
					console.log(result);
					
					showUploadResult(result);
									
				}
			});//ajax
			
		})
		
		//썸네일 이미지
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
		
		
		//deldete click
		$(".uploadResult").on("click","button",function(e){
			
			console.log("delete!!");
					      
		    var targetFile = $(this).data("file");
		    var type = $(this).data("type");
		    
		    var targetLi = $(this).closest("li");
		    
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
			
		});//
		
    });
    </script>
    
    <div class="sub-footer">
		Copyright ©YooGames Corp. All Rights Reserved.
	</div>
    
</body>
</html>