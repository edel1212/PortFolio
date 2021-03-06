package com.yoo.mapper;

import java.util.List;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.yoo.domain.BoardVO;
import com.yoo.domain.Pagination;

import lombok.Setter;
import lombok.extern.log4j.Log4j;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration("file:src/main/webapp/WEB-INF/spring/root-context.xml")
@Log4j
public class BoardMapperTests {

	@Setter(onMethod_ = @Autowired )
	private BoardMapper mapper;
	
//	@Test
//	public void testGetList() {
//		mapper.getList().forEach(board-> log.info(board));
//	}
	
//	@Test
//	public void testInsert() {
//		BoardVO board = new BoardVO();
//		
//		board.setTitle("새로작성하는 글 mapper");
//		board.setContent("새로작성하는 내용 mapper");
//		board.setWriter("newbie");
//		
//		
//		mapper.insert(board);
//		log.info(board);
//		
//	}
	
	
//	@Test
//	public void testInsert() {
//		BoardVO board = new BoardVO();
//		
//		board.setTitle("새로작성하는 글 mapper");
//		board.setContent("새로작성하는 내용 mapper");
//		board.setWriter("newbie");
//		
//		
//		mapper.insertSelectKey(board);
//		log.info(board);
//		
//	}
	
	
	
//	@Test
//	public void testRead() {
//		BoardVO board = mapper.read(22L);
//		log.info(board);
//	}
	
	
//	@Test
//	public void testDelete() {
//		
//		log.info("Delete Count : " + mapper.delete(21L));
//		
//	}

//	@Test
//	public void testUpdate() {
//		
//		BoardVO board = new BoardVO();
//		
//		board.setBno(20L);
//		board.setTitle("수정된제목");
//		board.setContent("수정된 내용");
//		board.setWriter("user00");
//		
//		int count = mapper.update(board);
//		log.info("update Count:" + count);
//		
//	}
	
//	@Test
//	public void testSerch() {
//		Pagination pagi = new Pagination();
//		
//		pagi.setKeyword("a");
//		pagi.setType("T");
//		
//		List<BoardVO> list = mapper.getListWithPaging(pagi);
//		
//		list.forEach(board->log.info(board));
//	}
	
	@Test
	public void testSearchCnt() {
		Pagination pagi = new Pagination();
		
		pagi.setKeyword("a");
		pagi.setType("T");
		
		log.info(mapper.getBoardListCnt(pagi));
		
	}
	
}
