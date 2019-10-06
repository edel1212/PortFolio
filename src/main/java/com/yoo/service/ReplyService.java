package com.yoo.service;

import java.util.List;

import com.yoo.domain.Pagination;
import com.yoo.domain.ReplyVO;

public interface ReplyService {
	
	//등록
	public int register(ReplyVO vo);
	
	//선택가져오기
	public ReplyVO get(Long rno);
	
	//수정
	public int modify(ReplyVO vo);
	
	//삭제
	public int remove(Long rno);
	
	//리스트
	public List<ReplyVO> getList(Pagination pagination,Long bno);
	
	
	/////Manager Reply
	//등록
	public int Mregister(ReplyVO vo);
	
	//리스트
	public List<ReplyVO> getMList(Pagination pagination,Long bno);
	
	//수정
	public int Mmodify(ReplyVO vo);
	
	//삭제
	public int Mremove(Long rno);
	
	//선택가져오기
	public ReplyVO Mget(Long rno);
}
