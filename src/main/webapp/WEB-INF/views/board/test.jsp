<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
   <!-- include libraries(jQuery, bootstrap) -->
	<link href="http://netdna.bootstrapcdn.com/bootstrap/3.3.5/css/bootstrap.css" rel="stylesheet">
	<script src="http://cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.js"></script> 
	<script src="http://netdna.bootstrapcdn.com/bootstrap/3.3.5/js/bootstrap.js"></script>
	<!-- include summernote css/js-->
	<link href="http://cdnjs.cloudflare.com/ajax/libs/summernote/0.8.12/summernote.css" rel="stylesheet">
	<script src="http://cdnjs.cloudflare.com/ajax/libs/summernote/0.8.12/summernote.js">
	<!-- custom-summernote.css -->
	<link href="/resources/summernote/summernote.css" rel="stylesheet">   
	<!-- custom-summernote.js -->
	<script src="/resources/summernote/summernote.js"></script>   
</head>
<body>
		<script src="/resources/summernote/summernote-ko-KR.js"></script>
		
		<script>
			$(document).ready(function() {
				  $('#summernote').summernote({
			 	    	placeholder: '공지사항을 필독해 주세요',
				        height: 600,
				        focus: true, 
				        lang : 'ko-KR',
			    		toolbar: [
			    		    ['style', ['style']],
			    		    ['font', ['bold', 'italic', 'underline', 'clear']],
			    		    ['color', ['color']],
			    		    ['insert', ['link', 'picture', 'hr']],
			    		    ['view', ['fullscreen', 'codeview']],
			    		  ]
				  });
				  $('.dropdown-toggle').dropdown();
				});
		</script>
					          <div class="form-group">
					            <label>내용</label>
					            <textarea id="summernote" class="form-control" rows="3" name='content'></textarea>
					          </div>
</body>
</html>