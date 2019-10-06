  package com.yoo.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.yoo.domain.BoardAttachVO;
import com.yoo.domain.BoardVO;
import com.yoo.domain.Pagination;
import com.yoo.mapper.BoardAttachMapper;
import com.yoo.mapper.BoardMapper;
import com.yoo.mapper.ReplyMapper;

import lombok.AllArgsConstructor;
import lombok.Setter;
import lombok.extern.log4j.Log4j;

@Log4j
@Service
@AllArgsConstructor
public class BoardServiceImpl implements BoardService {

	@Setter(onMethod_ = @Autowired )
	private BoardMapper mapper;
	
	@Setter(onMethod_ =  @Autowired)
	private ReplyMapper Replymapper;
	
	@Setter(onMethod_ = @Autowired)
	private BoardAttachMapper attachMapper;
	
	@Transactional
	@Override
	public void register(BoardVO board) {
		
		log.info("게시글 작성@@@:" + board);
		
		mapper.insertSelectKey(board);

		if(board.getAttachList() == null || board.getAttachList().size() <= 0) {
			return;
		}
		
		board.getAttachList().forEach(attach->{
			attach.setBno(board.getBno());
			attachMapper.insert(attach);
		});
		
		
	}

	@Transactional
	@Override
	public BoardVO get(Long bno) {
		log.info("get bno: " + bno);
		return mapper.read(bno);
	}
	
	@Transactional
	@Override
	public boolean modify(BoardVO board) {
		log.info("modify : ..." + board);
		attachMapper.deleteAll(board.getBno());
		
		boolean modifyResult = mapper.update(board) == 1;
		
		if(modifyResult && board.getAttachList() != null &&board.getAttachList().size() >0) {
				board.getAttachList().forEach(attach-> {
				attach.setBno(board.getBno());
				attachMapper.insert(attach);
			});
		}
		
		return modifyResult;
	}

	@Transactional
	@Override
	public boolean remove(Long bno) {
		log.info("delete: ..." + bno);
		
		Replymapper.deleteBno(bno);
		
		attachMapper.deleteAll(bno);
		
		return mapper.delete(bno) == 1;
	}

	@Transactional
	@Override
	public List<BoardVO> getList(Pagination pagination) {
		
		return mapper.getListWithPaging(pagination);
	}

	@Transactional
	@Override
	public int getBoardListCnt(Pagination pagination) {
		return mapper.getBoardListCnt(pagination);
	}

	@Transactional
	@Override
	public List<BoardVO> getMainList() {
		
		return mapper.getMailLst();
	}

	@Transactional
	@Override
	public List<BoardAttachVO> getAttachList(Long bno) {
		log.info("첨부파일 접근 bno" + bno);
		return attachMapper.findByBno(bno);
	}
	
	
	////////////////////Manager
	@Transactional
	@Override
	public int getMBoardListCnt(Pagination pagination) {
		
		return mapper.getMBoardListCnt(pagination);
	}

	@Transactional
	@Override
	public List<BoardVO> getMList(Pagination pagination) {		
		return mapper.getMListWithPaging(pagination);
	}

	@Transactional
	@Override
	public BoardVO Mget(Long bno) {	
		return mapper.Mread(bno);
	}

	@Transactional
	@Override
	public List<BoardVO> getMainMList() {

		return mapper.getMainMList();
	}

	@Transactional
	@Override
	public void Mregister(BoardVO board) {

		mapper.Minsert(board);
		
	}

	@Transactional
	@Override
	public boolean Mmodify(BoardVO board) {

		return mapper.Mupdate(board) == 1;
	}

	@Transactional
	@Override
	public boolean Mremove(Long bno) {

		Replymapper.MdeleteBno(bno);	
		
		return mapper.Mdelete(bno) == 1;
	}


}
