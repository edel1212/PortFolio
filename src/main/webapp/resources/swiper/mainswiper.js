	    var swiper = new Swiper('.swiper-container', {
	      spaceBetween: 30,
	      effect: 'fade',
	      on:{
	    	  slideChangeTransitionStart:function(){
	    		  //사라짐
	    		  $(".main-banner-icon").css({left:'21%',top:'17%',opacity:0});
	    		  $(".main-text").css({left:'22%',top:'52%',opacity:0});
	    		  $(".main-button").css({left:'22%',top:'79%',opacity:0});
	    		  //$(".swiper-slide").css({backgroundPosition: '0px 0px'});
	    	  },
	    	  slideChangeTransitionEnd:function(){
	    		  //생성
	    		  $(".main-banner-icon").stop().animate({opacity:1,left:'19%',top:'17%'},600,function(){
	    			  $(".main-text").stop().animate({opacity:1,left:'21%',top:'52%'},600,function(){
	    				  $(".main-button").stop().animate({opacity:1,left:'21%',top:'79%'},600,function(){
	    					 // $(".swiper-slide").stop().animate({'background-position-x': '0px','background-position-y': '-15px'}, 1200);
	    				  })
	    			  })  
	    		  }); 		 	    		  
	    	  }
	      },
	      autoplay: {
	          delay: 5500,
	          disableOnInteraction: false,
	        },
	      speed : 1500,
	      loop: true,
	      pagination: {
	        el: '.swiper-pagination',
	        clickable: true,
	      },	      
	      navigation: {
	        nextEl: '.swiper-button-next',
	        prevEl: '.swiper-button-prev',
	      },
	    });
	    
	    
	    