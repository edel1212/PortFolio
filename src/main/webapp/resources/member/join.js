
			//비밀번호 재확인
            function isSame(){
                var password = document.getElementById("password").value;
                var passwordCheck = document.getElementById("passwordCheck").value;
                if(password == passwordCheck){
                document.getElementById("pwdValue").innerHTML = '비밀번호가 일치합니다.';
                document.getElementById("pwdValue").style.color = 'blue';
                $(".btn-success").attr("disabled", false);
                }else{
                    document.getElementById("pwdValue").innerHTML = '비밀번호가 일치하지 않습니다.';
                    document.getElementById("pwdValue").style.color = 'red'; 
                    $(".btn-success").attr("disabled", true);
                }
            }


   
 
    		function check() {			
    			var userPwd = document.getElementById("password").value; 
    			var userPwd2 = document.getElementById("passwordCheck").value; 
    				

    			if(userPwd == userPwd2){
    				//alert("회원가입 완료");				
    			}else{
    				alert("비밀번호가 일치하지 않습니다. 다시 입력하세요");
    				document.getElementById("password").style.backgroundColor = "orangered";
    				document.getElementById("passwordCheck").style.backgroundColor = "orangered";
    				$(".btn-success").attr("disabled", true);
    				return false;
    			}
    			return true;			
    		}
            
            
    		//공백 검사
    		function check_onclick() {
		    // 공통입력폼내의 모든 입력오브젝트
		    var inputObjs = $(".commonForm input");
		    // 미입력여부(경우에 따라 사용)
		    var bEmpty = true;
		    var focus;
		 
		    // 각 오브젝트에 대해 입력체크
		    inputObjs.each(function(index) {
		        if ($(this).val() == '') {
		            focus = $(this);
		            bEmpty = false;
		 
		            alert($(this).attr('title') + "는(은) 필수 입력사항입니다.");
		            focus.focus();
		 
		            // 여기서는 each문을 탈출
		            return false;
		        }
		    });
		 
		    // 필수입력사항에 누락이 있으면 진행금지
		    if (!bEmpty) return false;
		 
		    form.submit();
		}
    		

    		
            