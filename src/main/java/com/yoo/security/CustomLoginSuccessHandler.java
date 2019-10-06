package com.yoo.security;

import java.io.IOException;


import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;import org.apache.ibatis.executor.ReuseExecutor;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.security.web.authentication.AuthenticationSuccessHandler;
import org.springframework.ui.Model;

import com.yoo.service.MemberService;

import lombok.extern.log4j.Log4j;

@Log4j
public class CustomLoginSuccessHandler implements AuthenticationSuccessHandler {
	
	@Autowired
	MemberService service;
	
	@Override
	public void onAuthenticationSuccess(HttpServletRequest request, HttpServletResponse response,
			Authentication authentication) throws IOException, ServletException {
	
	log.info("Login Success!!!!!!!!!!!!!!!!!!!!");
	
	log.info("@@@@@@@@@@@@"+request.getParameter("username"));
	
	String auth = service.EmailAuthCheck(request.getParameter("username"));
	
	log.info("Auth 값!" + auth);
	
	
	if(auth.equals("1")) {		
		response.sendRedirect("/");
	} else{		
		response.sendRedirect("/member/coustomLogout?email=fail");
	}
	
	}

}
