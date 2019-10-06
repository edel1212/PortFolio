package com.yoo.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.yoo.domain.BoardVO;
import com.yoo.domain.Pagination;

public interface BoardMapper {

	//전체 리스트 불러오기
	public List<BoardVO> getList();
	
	//페이징처리
	public List<BoardVO> getListWithPaging(Pagination pagination);
	
	//총 게시글 개수 확인
	public int getBoardListCnt(Pagination pagination);
	
	//글 작성
	public void insert(BoardVO board);
	
	//글작성 bno확인 가능하게끔
	public void insertSelectKey(BoardVO board);
	
	//선택 게시물 조회
	public BoardVO read(Long bno);
	
	//delete
	public int delete(Long bno);
	
	//update
	public int update(BoardVO board);
	
	//updateReplyCnt
	public int addUpdateRepyCnt(@Param("bno")Long bno);
	
	//removeupdateReplyCnt
	public int removeUpdateRepyCnt(@Param("bno")Long bno);
	
	//main 게시글 보여주기
	public List<BoardVO> getMailLst();
	
	
	//Manager
	//총 게시글 개수 확인
	public int getMBoardListCnt(Pagination pagination);
	
	//페이징처리
	public List<BoardVO> getMListWithPaging(Pagination pagination);
	
	//선택 게시물 조회
	public BoardVO Mread(Long bno);
	
	//updateReplyCnt
	public int MaddUpdateRepyCnt(@Param("bno")Long bno);
	
	//removeupdateReplyCnt
	public int MremoveUpdateRepyCnt(@Param("bno")Long bno);
	
	//메인 리스트
	public List<BoardVO> getMainMList();
	
	//글 작성
	public void Minsert(BoardVO board);
	
	//수정
	public int Mupdate(BoardVO board);
	
	//삭제
	public int Mdelete(Long bno);
}
