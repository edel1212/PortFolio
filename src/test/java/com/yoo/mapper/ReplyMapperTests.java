package com.yoo.mapper;

import java.util.List;
import java.util.stream.IntStream;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.yoo.domain.Pagination;
import com.yoo.domain.ReplyVO;

import lombok.Setter;
import lombok.extern.log4j.Log4j;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration("file:src/main/webapp/WEB-INF/spring/root-context.xml")
@Log4j
public class ReplyMapperTests {

	private Long[] bnoArr = {181L,180L,179L,178L,177L};
	
	@Setter(onMethod_ =  @Autowired)
	private ReplyMapper mapper;
	
//	@Test
//	public void testMapper() {
//		log.info(mapper);
//	}
	
//	@Test
//	public void testCreate() {
//		
//		IntStream.rangeClosed(1, 10).forEach(i -> {
//			
//			ReplyVO vo = new ReplyVO();
//			
//			vo.setBno(bnoArr[i % 5]);
//			vo.setReply("댓글 테스트: " + i);
//			vo.setReplyer("replyer:" + i);
//			
//			mapper.insert(vo);
//			
//		});
//		
//	}
	
//	@Test
//	public void testRead() {
//		
//		Long targetRno = 5L;
//		
//		ReplyVO vo = mapper.read(targetRno);
//		
//		log.info(vo);
//		
//	}
	
//	@Test
//	public void testDelete(){
//		Long targetRno = 1L;
//		
//		mapper.delete(targetRno);
//	}
//	
	
	@Test
	public void testUpdate() {
		
		
		Long targetRno = 9L;
		
		ReplyVO vo = mapper.read(targetRno);
		
		int count = mapper.update(vo);
		
		log.info("uuuu :  " + count);
		
	}
	
//	@Test
//	public void  testList() {
//		
//		Pagination pagination = new Pagination();
//		
//		List<ReplyVO> replies = mapper.getListWithPaging(pagination, bnoArr[0]);
//		
//		replies.forEach(reply -> log.info(reply));
//		
//	}
	
	
}
