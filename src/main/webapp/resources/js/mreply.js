console.log("reply Module/...........");

////////////////////////////////////////////////////////////////////////////////////////////
//Manger
var ManagerReply = (function(){
	 
	function Madd(reply,callback){
		console.log("reply..........");
		
		$.ajax({
			type : 'post',
			url : '/replies/Mnew',
			data : JSON.stringify(reply),
			contentType : "application/json; charset=utf-8",
			success : function(result, status, xhr) {
				if (callback) {
					callback(result);
				}
			},
			error : function(xhr, status, er) {
				if (error) {
					error(er);
				}
			}
		}) //ajax		
	}//add method
	

	function MgetList(param, callback,error){
		
		var bno = param.bno;
		var page = param.page || 1;
		
		$.getJSON("/replies/Mpages/" + bno + "/"  +page + ".json",
			function(data){
			if(callback){
				callback(data);
			}
			if(error){
				error();
			}
			
		});//getJSON
		
	}//getList

	

	
	function Mremove(rno,replyer,callback,error){
		$.ajax({
			type : 'delete', //메서드 명을 따르는구sk
			url : '/replies/m/' + rno,
			 data:  JSON.stringify({rno:rno, replyer:replyer}),		      
		     contentType: "application/json; charset=utf-8",
			success : function(deleteResult,status,xhr){
				if(callback){
					callback(deleteResult);
				}
			},
			error: function(xhr,status,er){
				if (error) {
					error(er);
				}
			}
		});//ajax
	}//remove
	
	
	function Mupdate(reply,callback,error){
		console.log("RNO: ㅁㅁㅁㅁ" + reply.rno);
		
		$.ajax({
			type:'put',
			url:'/replies/m/' + reply.rno,
			data: JSON.stringify(reply),
			contentType:"application/json; charset=utf-8",
			success: function(reslut,status,xhr){
				if (callback){
					callback(reslut);
				}
			
			}, 
			error: function(xhr,status,er){
				if(error){
					error(er);
				}
			}
		});//ajax	
	};//update
	
	function Mget(rno,callback,error){
		
		$.get("/replies/m/" + rno + ".json",function(result){
			if(callback){
				callback(result);
			}
		}).fail(function(xhr,status,err){
			if(error){
				error();
			}
		})
		
	};//get
	
	function MdisplayTime(timeValue){
		var today = new Date();
		
		var gap = today.getTime() - timeValue;
		
		var dateObj = new Date(timeValue);
		var str="";
		
		if(gap < (1000*60*60*24)){
			var hh = dateObj.getHours();
			var mi = dateObj.getMinutes();
			var ss = dateObj.getSeconds();
			
			return [(hh > 9 ? '':'0') + hh,':',(mi > 9 ? '' : '0')+ mi,':',(ss > 9 ? '':'0')+ss].join('');
		} else {
			var yy = dateObj.getFullYear();
			var mm = dateObj.getMonth()+1;
			var dd = dateObj.getDate();
			return [yy,'/',(mm > 9 ? '' : '0')+mm,'/',(dd > 9 ? '' : '0')+dd].join('');
		}
		
	}
	
	return {
		Madd:Madd,
		MgetList:MgetList,
		Mremove:Mremove,
		Mupdate:Mupdate,
		Mget:Mget,
		MdisplayTime:MdisplayTime
	};
})();//var replyService


