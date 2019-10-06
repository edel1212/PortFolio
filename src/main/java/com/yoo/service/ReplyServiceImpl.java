package com.yoo.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.yoo.domain.Pagination;
import com.yoo.domain.ReplyVO;
import com.yoo.mapper.BoardMapper;
import com.yoo.mapper.ReplyMapper;

import lombok.Setter;
import lombok.extern.log4j.Log4j;

@Service
@Log4j
public class ReplyServiceImpl implements ReplyService {

	@Setter(onMethod_ = @Autowired )
	private ReplyMapper mapper;
	
	@Setter(onMethod_ = @Autowired)
	private BoardMapper boardMapper;
	
	
	
	@Override
	public int register(ReplyVO vo) {
		log.info("register" + vo);
		
		boardMapper.addUpdateRepyCnt(vo.getBno());
		
		return mapper.insert(vo);
	}

	@Override
	public ReplyVO get(Long rno) {
		log.info("Get: " + rno);
		return mapper.read(rno);
	}

	@Override
	public int modify(ReplyVO vo) {
		log.info("modify:" + vo);
		return mapper.update(vo);
	}

	
	
	@Override
	public int remove(Long rno) {
		log.info("remove" + rno);
		
		ReplyVO vo = mapper.read(rno);
		
		boardMapper.removeUpdateRepyCnt(vo.getBno());
		return mapper.delete(rno);
	}

	@Override
	public List<ReplyVO> getList(Pagination pagination, Long bno) {
		log.info("get Reply List of a Board : " + bno);
		return mapper.getListWithPaging(pagination, bno);
	}

	
	//Manager/////////////////////////////////////////////////
	@Override
	public int Mregister(ReplyVO vo) {
		
		boardMapper.MaddUpdateRepyCnt(vo.getBno());
		return mapper.Minsert(vo);
	}

	@Override
	public List<ReplyVO> getMList(Pagination pagination, Long bno) {
		
		return mapper.getMListWithPaging(pagination, bno);
	}

	@Override
	public int Mmodify(ReplyVO vo) {
		
		return mapper.Mupdate(vo);
	}

	@Override
	public int Mremove(Long rno) {
		
		ReplyVO vo = mapper.Mread(rno);
		
		boardMapper.MremoveUpdateRepyCnt(vo.getBno());
		return mapper.Mdelete(rno);
	}

	@Override
	public ReplyVO Mget(Long rno) {
		
		return mapper.Mread(rno);
	}

}
