package com.yoo.security;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.core.userdetails.UsernameNotFoundException;

import com.yoo.domain.MemberVO;
import com.yoo.mapper.MemberMapper;
import com.yoo.security.domain.CustomUser;

import lombok.Setter;
import lombok.extern.log4j.Log4j;

@Log4j
public class CustomUserDetailsService implements UserDetailsService{

	@Setter(onMethod_ = @Autowired )
	private MemberMapper mamberMapper;

	@Override
	public UserDetails loadUserByUsername(String username) throws UsernameNotFoundException {
		log.warn("Load User By UserName : " + username);
		
		// userName 은 userid라는 뜻임
		MemberVO vo = mamberMapper.read(username);
		
		log.warn("queried bt member: ======" + vo);
		
		return vo == null ? null : new CustomUser(vo);
	}
	
	
	
}
