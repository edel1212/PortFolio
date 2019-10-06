package com.yoo.service;

import java.util.List;

import com.yoo.domain.BoardAttachVO;
import com.yoo.domain.BoardVO;
import com.yoo.domain.Pagination;

public interface BoardService {

	public void register(BoardVO board);
	
	public BoardVO get(Long bno);
	
	public boolean modify(BoardVO board);
	
	public boolean remove(Long bno);
	
	//리스트 불러오기
	public List<BoardVO> getList(Pagination pagination);
	
	//총 게시글 개수 확인
	public int getBoardListCnt(Pagination pagination);
		
	//main 게시글 보여주기
	public List<BoardVO> getMainList();
	
	//첨부파일
	public List<BoardAttachVO> getAttachList(Long bno);
	
	///////////Manager///////////
	
	//등록
	public void Mregister(BoardVO board);
	
	//총 게시글 개수 확인
	public int getMBoardListCnt(Pagination pagination);
	
	//리스트 불러오기
	public List<BoardVO> getMList(Pagination pagination);
	
	//선택 게시물
	public BoardVO Mget(Long bno);
	
	//main 게시글 보여주기
	public List<BoardVO> getMainMList();
	
	//수정
	public boolean Mmodify(BoardVO board);
	
	//삭제
	public boolean Mremove(Long bno);
	
}
