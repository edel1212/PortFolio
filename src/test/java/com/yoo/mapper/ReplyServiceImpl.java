package com.yoo.mapper;

import org.junit.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.yoo.domain.ReplyVO;

import lombok.Setter;
import lombok.extern.log4j.Log4j;

@Service
@Log4j
public class ReplyServiceImpl {

	@Setter(onMethod_ = @Autowired )
	private ReplyMapper mapper;
	
	@Test
	public int regiger(ReplyVO vo) {
		
		log.info("register : " + vo);
		
		return mapper.insert(vo);
		
	}
	
}
