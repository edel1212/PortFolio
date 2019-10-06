package com.yoo.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.yoo.domain.Pagination;
import com.yoo.domain.ReplyVO;

public interface ReplyMapper {

	//댓글 추가
	public int insert(ReplyVO vo);
	
	//번호 확인
	public ReplyVO read(Long rno);
	
	//삭제
	public int delete (Long rno);
	
	//같이 삭제
	public int deleteBno(Long bno);
				
	//수정
	public int update(ReplyVO reply);
	
	//페이징
	public List<ReplyVO> getListWithPaging(@Param("pagination") Pagination pagination
			,@Param("bno")Long bno);
		
	
	
	//////////Manager
	//등록
	public int Minsert(ReplyVO vo);
	
	//리스트
	public List<ReplyVO> getMListWithPaging(@Param("pagination") Pagination pagination
			,@Param("bno")Long bno);
	
	
	//삭제
	public int Mdelete (Long rno);
	//같이 삭제
	public int MdeleteBno(Long bno);
				
	//수정
	public int Mupdate(ReplyVO reply);
	
	//번호 확인
	public ReplyVO Mread(Long rno);
	
}
