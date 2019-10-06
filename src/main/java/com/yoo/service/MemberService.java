package com.yoo.service;

import java.io.UnsupportedEncodingException;

import javax.mail.MessagingException;

import org.apache.ibatis.annotations.Param;

import com.yoo.domain.MemberVO;

public interface MemberService {

	//가입
	public void MemberJoin(MemberVO vo) throws MessagingException,UnsupportedEncodingException;
	
	//아이디 중복체크
	public int userIdCheck(String id);
	
	//이메일 중복 체크
	public int userEmailCheck(String email);
	
	//회원정보 불러오기
	public MemberVO Memberinfo(String id);
	
	//회원이 작성한 게시글 수 확인
	public int MemberCheackBoard(String id);
	
	//회원정보 수정
	public int MemberUpdate(MemberVO vo);
		
	//회원정보 삭제
	public void MemberDelete(String id);
	
	//변경시 비밀번호 대조
	public boolean maches(String id,String pw);
		
	//이메일 인증될시 변경
	public void email(String authkey);
	
	//아이디찾기
	public String Findid(@Param("username") String username,@Param("useremail") String useremail);
	
	//비밀번호 재설정
	public int SearchPw(@Param("userid") String userid,@Param("useremail") String useremail) throws MessagingException,UnsupportedEncodingException;
	
	//이메일 인증 확인
	public String EmailAuthCheck(String id);
	
}
