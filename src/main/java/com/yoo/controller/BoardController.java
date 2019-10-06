package com.yoo.controller;

import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.util.List;

import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.yoo.domain.BoardAttachVO;
import com.yoo.domain.BoardVO;
import com.yoo.domain.Pagination;
import com.yoo.service.BoardService;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;

@Controller
@Log4j
@RequestMapping("/board/*")
@AllArgsConstructor
public class BoardController {

	private BoardService service;
	
	private void deleteFiles(List<BoardAttachVO> attachList) {
		if(attachList == null || attachList.size() == 0) {
			return;
		}
		
		log.info("delete attah files..........");
		log.info(attachList);
		
		
		attachList.forEach(attach-> {
			try {
				Path file = Paths.get("c:\\upload\\"+attach.getUploadPath()+"\\"+attach.getUuid()+"_"+attach.getFileName());
				
				Files.deleteIfExists(file);
				
				if(Files.probeContentType(file).startsWith("image")) {
					
					Path thumbNail = Paths.get("c:\\upload\\"+attach.getUploadPath()+"\\s_"+attach.getUuid()+"_"+attach.getFileName());
					
					Files.delete(thumbNail);
				}
				
			} catch (Exception e) {
				log.error("delete file error :" + e.getMessage());
			}//try~catch
			
		});
		
		
	}
	
	//리스트 삭제
	@PostMapping("/remove")
	@PreAuthorize("isAuthenticated()")
	public String remove(@RequestParam("bno") Long bno,RedirectAttributes rttr) {
		log.info("remove: " + bno);
		
		
		//첨부파일도 같이 삭제
		List<BoardAttachVO> attachList = service.getAttachList(bno);
		
		if(service.remove(bno)) {
			
			//delete Attach Files
			deleteFiles(attachList);
			
			rttr.addFlashAttribute("result", "success");
		}
		
		return "redirect:/board/Ulist";
	}
	
	//리스트 이동
	@GetMapping("/Ulist")
	public void Ulist(Model model,@RequestParam(required = false, defaultValue = "1") int page
			, @RequestParam(required = false, defaultValue = "1") int range
			, @RequestParam(required = false, defaultValue = "") String type
			, @RequestParam(required = false) String keyword) {
			
		//Pagination 생성
		Pagination pagination = new Pagination();
		pagination.setKeyword(keyword);
		pagination.setType(type);
		
		//전체 게시글 수
		int listCnt = service.getBoardListCnt(pagination);	
		log.info("총 게시글 값 :" + listCnt);
		
		//객체의 매서드를 실행함!! limit 값을 지정해줄 수 있음
		pagination.pageInfo(page, range, listCnt);
			
		log.info("키워드는 ?-----" +pagination.getKeyword());
		log.info("타입은 ?-----" + pagination.getType());
		
		if(pagination.isPrev() && pagination.getType() != null) {
			if(pagination.getType() == "T" || pagination.getType() == "W" || pagination.getType() == "C") {
				System.out.println("진입 확인!!!!!!!!!!!");
				pagination.setRange(1);
				System.out.println("이건 몇이야??" + pagination.getRange());
			}
		}
		
		model.addAttribute("pagination", pagination);
		
		model.addAttribute("list", service.getList(pagination));
	}
	
	
	//글등록 페이지 이동
	@GetMapping("/Uregister")
	@PreAuthorize("isAuthenticated()")
	public void Uregisger() {
		log.info("regisger page");
	}
	
	//글등록
	@PostMapping("/Uregister")
	@PreAuthorize("isAuthenticated()")
	public String regisger(BoardVO board,RedirectAttributes rttr) {
		log.info("regisger:  "  + board);
		
		log.info("===upload test===");
		
		if(board.getAttachList() != null) {
			board.getAttachList().forEach(attach-> log.info(attach));
		}
		
		log.info("===////upload test///===");
		
		service.register(board);
		
		rttr.addFlashAttribute("result", board.getBno());
		return "redirect:/board/Ulist";
	}
	
	//선택 게시물 조회
	@GetMapping({"/Uget","/Umodify"})
	public void Uget(@RequestParam("bno")Long bno,@ModelAttribute("pagination")Pagination pagination,Model model) {
		log.info("get!!!");
		model.addAttribute("board", service.get(bno));
	}
	
	
	//수정
	@PostMapping("/Umodify")
	@PreAuthorize("principal.username == #board.writer")
	public String Umodify(BoardVO board,@ModelAttribute("pagination")Pagination pagination,RedirectAttributes rttr) {
		log.info("modify: " + board);
		
		if(service.modify(board)) {
			rttr.addFlashAttribute("result", "success");
		}
		
		rttr.addAttribute("page", pagination.getPage());
		rttr.addAttribute("range", pagination.getRange());
		
		//검색 기록 같이 전달  <<-- getListLink()로 대체
//		rttr.addAttribute("type", pagination.getType());
//		rttr.addAttribute("keyword", pagination.getKeyword());
		
		return "redirect:/board/Ulist" + pagination.getListLink();
		
	}
	
	@PostMapping("/Uremove")
	@PreAuthorize("principal.username == #writer")
	public String remove(@RequestParam("bno")Long bno,@ModelAttribute("pagination")Pagination pagination,RedirectAttributes rttr,
			String writer) {
		
		log.info("remove!!!");
		
		if(service.remove(bno)) {
			rttr.addFlashAttribute("result", "success");
		}
		
		rttr.addAttribute("page", pagination.getPage());
		rttr.addAttribute("range", pagination.getRange());
		
		//검색 기록 같이 전달 검색 기록 같이 전달  <<-- getListLink()로 대체
//		rttr.addAttribute("type", pagination.getType());
//		rttr.addAttribute("keyword", pagination.getKeyword());
		
		return "redirect:/board/Ulist" + pagination.getListLink();
	}
	
	//file 화면 처리
	@GetMapping(value = "/getAttachList", produces = MediaType.APPLICATION_JSON_UTF8_VALUE)
	@ResponseBody
	public ResponseEntity<List<BoardAttachVO>> getAttachList(Long bno){
		log.info("getAttachList" + bno);
		
		return new ResponseEntity<>(service.getAttachList(bno),HttpStatus.OK);
	}
	
	
	//**********ManagerBoard*************//
	@GetMapping("/Mlist")
	public void Mlist(Model model,@RequestParam(required = false, defaultValue = "1") int page
			, @RequestParam(required = false, defaultValue = "1") int range
			, @RequestParam(required = false, defaultValue = "") String type
			, @RequestParam(required = false) String keyword) {
			
		//Pagination 생성
		Pagination pagination = new Pagination();
		pagination.setKeyword(keyword);
		pagination.setType(type);
		
		//전체 게시글 수
		int listCnt = service.getMBoardListCnt(pagination);	
		System.out.println("총 게시글 값 :" + listCnt);
		
		//객체의 매서드를 실행함!! limit 값을 지정해줄 수 있음
		pagination.pageInfo(page, range, listCnt);
		
		
		
		System.out.println("키워드는 ?-----" +pagination.getKeyword());
		System.out.println("타입은 ?-----" + pagination.getType());
		
		if(pagination.isPrev() && pagination.getType() != null) {
			if(pagination.getType() == "T" || pagination.getType() == "W" || pagination.getType() == "C") {
				System.out.println("진입 확인!!!!!!!!!!!");
				pagination.setRange(1);
				System.out.println("이건 몇이야??" + pagination.getRange());
			}
		}
		
		model.addAttribute("pagination", pagination);
		
		model.addAttribute("list", service.getMList(pagination));
	}

	
	//선택 게시물 조회
	@GetMapping({"/Mget","/Mmodify"})
	public void Mget(@RequestParam("bno")Long bno,@ModelAttribute("pagination")Pagination pagination,Model model) {
		log.info("get!!!");
		model.addAttribute("board", service.Mget(bno));
	}
	
	//글등록 페이지 이동
	@GetMapping("/Mregister")
	@PreAuthorize("isAuthenticated()")
	public void Mregisger() {
		log.info("regisger page");
	}
	
	//글등록
	@PostMapping("/Mregister")
	@PreAuthorize("isAuthenticated()")
	public String Mregisger(BoardVO board,RedirectAttributes rttr) {
		log.info("regisger:  "  + board);
		service.Mregister(board);
		System.out.println("Bno "+board.getBno());
		rttr.addFlashAttribute("result", board.getBno());
		return "redirect:/board/Mlist";
	}
		
	//수정
	@PostMapping("/Mmodify")
	@PreAuthorize("principal.username == #board.writer")
	public String Mmodify(BoardVO board,@ModelAttribute("pagination")Pagination pagination,RedirectAttributes rttr) {
		log.info("modify: " + board);
		
		if(service.Mmodify(board)) {
			rttr.addFlashAttribute("result", "success");
		}
		
		rttr.addAttribute("page", pagination.getPage());
		rttr.addAttribute("range", pagination.getRange());
		
		//검색 기록 같이 전달  <<-- getListLink()로 대체
//		rttr.addAttribute("type", pagination.getType());
//		rttr.addAttribute("keyword", pagination.getKeyword());
		
		return "redirect:/board/Mlist" + pagination.getListLink();
		
	}
	
	@PostMapping("/Mremove")
	@PreAuthorize("principal.username == #writer")
	public String Mremove(@RequestParam("bno")Long bno,@ModelAttribute("pagination")Pagination pagination,RedirectAttributes rttr,
			String writer) {
		
		log.info("remove!!!");
		
		if(service.Mremove(bno)) {
			rttr.addFlashAttribute("result", "success");
		}
		
		rttr.addAttribute("page", pagination.getPage());
		rttr.addAttribute("range", pagination.getRange());
		
		//검색 기록 같이 전달 검색 기록 같이 전달  <<-- getListLink()로 대체
//		rttr.addAttribute("type", pagination.getType());
//		rttr.addAttribute("keyword", pagination.getKeyword());
		
		return "redirect:/board/Mlist" + pagination.getListLink();
	}

	
	@GetMapping("/test")
	public String test() {
		return"/board/test";
	}
	
}


