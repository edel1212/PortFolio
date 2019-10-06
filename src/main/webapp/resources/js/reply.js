console.log("reply Module/...........");

var replyService = (function(){
	
	function add(reply,callback){
		console.log("reply..........");
		
		$.ajax({
			type : 'post',
			url : '/replies/new',
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
	

	function getList(param, callback,error){
		
		var bno = param.bno;
		var page = param.page || 1;
		
		$.getJSON("/replies/pages/" + bno + "/"  +page + ".json",
			function(data){
			if(callback){
				callback(data);
			}
			if(error){
				error();
			}
			
		});//getJSON
		
	}//getList

	

	
	function remove(rno,replyer,callback,error){
		$.ajax({
			type : 'delete', //메서드 명을 따르는구sk
			url : '/replies/' + rno,
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
	
	
	function update(reply,callback,error){
		console.log("RNO: ㅁㅁㅁㅁ" + reply.rno);
		
		$.ajax({
			type:'put',
			url:'/replies/' + reply.rno,
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
	
	function get(rno,callback,error){
		
		$.get("/replies/" + rno + ".json",function(result){
			if(callback){
				callback(result);
			}
		}).fail(function(xhr,status,err){
			if(error){
				error();
			}
		})
		
	};//get
	
	function displayTime(timeValue){
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
		add:add,
		getList:getList,
		remove:remove,
		update:update,
		get:get,
		displayTime:displayTime
	};
})();//var replyService


////////////////////////////////////////////////////////////////////////////////////////////
//Manger
var MreplyService = (function(){
	
	function add(reply,callback){
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
	

	function getList(param, callback,error){
		
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

	

	
	function remove(rno,replyer,callback,error){
		$.ajax({
			type : 'delete', //메서드 명을 따르는구sk
			url : '/m/replies/' + rno,
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
	
	
	function update(reply,callback,error){
		console.log("RNO: ㅁㅁㅁㅁ" + reply.rno);
		
		$.ajax({
			type:'put',
			url:'/m/replies/' + reply.rno,
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
	
	function get(rno,callback,error){
		
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
	
	function displayTime(timeValue){
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
		add:add,
		getList:getList,
		remove:remove,
		update:update,
		get:get,
		displayTime:displayTime
	};
})();//var replyService


