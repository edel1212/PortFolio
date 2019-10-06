package com.yoo.aop;

import java.util.Arrays;

import org.aspectj.lang.ProceedingJoinPoint;
import org.aspectj.lang.annotation.AfterThrowing;
import org.aspectj.lang.annotation.Around;
import org.aspectj.lang.annotation.Aspect;
import org.aspectj.lang.annotation.Before;
import org.springframework.stereotype.Component;

import lombok.extern.log4j.Log4j;

@Aspect
@Log4j
@Component
public class LogAdvice {

	@Before( "execution(* com.yoo.service.*ServiceImpl*.*(..))")
	public void logBefore() {
		
		log.info("=================");
		
	}

		
	@AfterThrowing(pointcut = "execution(* com.yoo.service.*ServiceImpl*.*(..))",
			throwing = "exception")
	public void logException(Exception exception) {
		
		log.info("Exception");
		log.info("오류내용 :  " + exception);
		
	}
	
	  @Around("execution(* com.yoo.service.*ServiceImpl*.*(..))")
	  public Object logTime( ProceedingJoinPoint pjp) {
	    
	    long start = System.currentTimeMillis();
	    
	    log.info("Target: " + pjp.getTarget());
	    log.info("Param: " + Arrays.toString(pjp.getArgs()));
	    
	    
	    //invoke method 
	    Object result = null;
	    
	    try {
	      result = pjp.proceed();
	    } catch (Throwable e) {
	      // TODO Auto-generated catch block
	      e.printStackTrace();
	    }
	    
	    long end = System.currentTimeMillis();
	    
	    log.info("TIME: "  + (end - start));
	    
	    return result;
	  }
	
}
