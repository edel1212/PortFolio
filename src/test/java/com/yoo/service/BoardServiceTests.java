package com.yoo.service;

import static org.junit.Assert.assertNotNull;

import org.apache.ibatis.annotations.Mapper;
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
public class BoardServiceTests {

	@Setter(onMethod_ = @Autowired)
	private BoardService service;
	
//	@Test
//	public void testExist() {
//		log.info(service);
//		assertNotNull(service);		
//	}
	
//	@Test
//	public void testRegister() {
//		
//		BoardVO board = new BoardVO();
//		
//		board.setContent("aaaaa");
//		board.setTitle("ttt");
//		board.setWriter("wter");
//		
//		service.register(board);
//		log.info("생성된 게시물 번호:" + board.getBno());		
//	}
	
//	@Test
//	public void getList() {
//		//service.getList().forEach(board ->log.info(board.getBno()));
//	}
	
	@Test
	public void sercnt() {
		
		Pagination pagination = new Pagination();
		
		pagination.setKeyword("a");
		pagination.setType("T");
		
		log.info(service.getBoardListCnt(pagination));
	}
	
//	@Test
//	public void testGet() {
//		log.info(service.get(11L));
//	}
	
//	@Test
//	public void testDelete() {
//		log.info(service.remove(23L));
//	}
	
//	@Test
//	public void testUpdate() {
//		
//		BoardVO board = service.get(1L);
//		
//		if(board == null) {
//			return;
//		}
//		
//		log.info("modify Resulte:" + service.modify(board));
//	}
	
}
