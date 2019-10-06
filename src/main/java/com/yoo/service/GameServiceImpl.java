package com.yoo.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.yoo.domain.GameVO;
import com.yoo.mapper.GameMapper;

import lombok.AllArgsConstructor;
import lombok.Setter;

@Service
@AllArgsConstructor
public class GameServiceImpl implements GameService {

	@Setter(onMethod_ = @Autowired )
	private GameMapper mapper;
	
	@Override
	public GameVO read(Long bno) {
		
		return mapper.read(bno);
	}

}
