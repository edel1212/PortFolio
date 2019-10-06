package com.yoo.controller;


import java.io.UnsupportedEncodingException;
import java.security.Principal;

import javax.mail.MessagingException;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.yoo.domain.MemberVO;
import com.yoo.service.MemberService;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;

@Controller
@Log4j
@RequestMapping("/member/*")
@AllArgsConstructor
public class MemberController {

	@Autowired
	private MemberService service;
	
		
	@GetMapping("coustomLogout")
	public void coustomLogout(@RequestParam("email")String logout,Model model) {
		log.info("로그아웃페이지 접속");
		log.info(logout);
		log.info(logout.equals("ok"));
		if (logout.equals("fail")) {
			log.info("++++++++++++++++++++++++++");
			model.addAttribute("mail", "fail");
		}
	}
	

	@GetMapping("/customJoin")
	public void MemberJoin() {
		log.info("join 접속");
	}

	@PreAuthorize("isAnonymous()")
	@PostMapping("/customJoin")
	public String Join(MemberVO vo,Model model,RedirectAttributes rttr) throws UnsupportedEncodingException, MessagingException {
		log.info("넘어오는값 확인 : " + vo );
		service.MemberJoin(vo);
		rttr.addFlashAttribute("result", "회원가입 인증메일을 확인해주세요 :D");
		return "redirect:/";
	}
	
	//중복 체크검사
	@PreAuthorize("isAnonymous()")
	@RequestMapping(value = "idCheck", method = RequestMethod.POST)
	public @ResponseBody int idCheck(@RequestParam("userId") String id) {
		log.info("컨트롤러 접근 확인");
		int checkId = service.userIdCheck(id);
		
		log.info("이거 값 가장 중요" + checkId);
				
		return checkId;
	}
	
	//이메일 중복체크 검사
	@PreAuthorize("isAnonymous()")
	@RequestMapping(value = "emailCheck", method = RequestMethod.POST)
	public @ResponseBody int emailCheck (@RequestParam("userEmail")String email) {
		log.info("이메일 체크 컨트롤러 접근");
		
		int cheackEmail = service.userEmailCheck(email);
		
		return cheackEmail;
	}
	
	//회원가입 폼
	@GetMapping("joinConfirm")
	public String emailConfirm(@RequestParam("authKey")String authKey,RedirectAttributes rttr) {
		
		log.info("이메일 인증 접근 확인");
		
		service.email(authKey);
		rttr.addFlashAttribute("result", "이메일 인증에 성공하셨습니다 :D");
		return "redirect:/";
	}
	
	
	//마이페이지 정보
	@PostMapping("/customMypage")
	@PreAuthorize("isAuthenticated()")
	public void customMypage(Principal principal,Model model) {
		String userid = principal.getName();
		log.info("Mypage id" + userid);  
		model.addAttribute("userinfo", service.Memberinfo(userid));
		model.addAttribute("boardCnt", service.MemberCheackBoard(userid));
	}
	
	
	//수정 페이지 이동
	@GetMapping("/customModify")
	public void customModify(Principal principal,Model model) {
		String userid = principal.getName();
		log.info("Mypage id" + userid);  
		model.addAttribute("userinfo", service.Memberinfo(userid));
		model.addAttribute("boardCnt", service.MemberCheackBoard(userid));
	}
	
	
	//게시글 수정
	@PostMapping("/customModify")
	@PreAuthorize("isAuthenticated()")
	public String customModify(MemberVO vo,RedirectAttributes rttr) {
		service.MemberUpdate(vo);
		rttr.addFlashAttribute("result", "개인정보 수정이 완료되었습니다.");
		return "redirect:/";
	}
	
	
	//회원 탈퇴 이동
	@PostMapping("/customDeleteForm")
	@PreAuthorize("isAuthenticated()")
	public void customDeleteForm(Principal principal,Model model) {
		String userid = principal.getName();
		log.info("Mypage id" + userid);  
		model.addAttribute("userinfo", service.Memberinfo(userid));
	}
	
	//회원 탈퇴
	@PostMapping("/customDelete")
	@PreAuthorize("isAuthenticated()")
	public String customDelte(@RequestParam("userid")String userid,@RequestParam("userpw")String userpw,RedirectAttributes rttr) {
		
		
		if(service.maches(userid, userpw)) {			
			rttr.addFlashAttribute("msg", "DEL");
			service.MemberDelete(userid);
			return "redirect:/member/coustomLogout?email=ok";
		} else {
			rttr.addFlashAttribute("result", "비밀번호가 틀립니다 탈퇴에 실패했습니다.");
			return "redirect:/";
		}


	}
	
	
	//아이디 찾기
	@GetMapping("customFind")
	public void customFindId() {
		log.info("아이디 찾기 접근");
	}
		
	// 아이디 찾기
	@PreAuthorize("isAnonymous()")
	@PostMapping("/userSearch")
	@ResponseBody
	public String userIdSearch(@RequestParam("username") String username, 
			@RequestParam("useremail") String useremail) {
		
		String result = service.Findid(username, useremail);

		return result;
	}



	//비밀번호 찾기
	@PostMapping("/searchPassword")
	@PreAuthorize("isAnonymous()")
	public String passwordSearch(@RequestParam("userid") String userid, 
			@RequestParam("useremail") String useremail,RedirectAttributes rttr) throws UnsupportedEncodingException, MessagingException{
			
		if(service.userIdCheck(userid) == 1) {
			
			int flag = service.SearchPw(userid, useremail);
			
			if(flag == 0) {
				rttr.addFlashAttribute("result", "아이디 및 이메일이 틀립니다.");
				return "redirect:/";			
			} else {
				rttr.addFlashAttribute("result", "이메일로 임시 비밀번호가 전송 되었습니다.");			
				return "redirect:/";
			}
		} else {
			rttr.addFlashAttribute("result", "아이디 및 이메일이 틀립니다.");
			return "redirect:/";
		}
		
	
		
	}
	
	
	
}


