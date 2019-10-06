package com.yoo.mapper;

import org.apache.ibatis.annotations.Param;

import com.yoo.domain.MemberVO;

public interface MemberMapper {

	public MemberVO read(String userid);
		
	//가입
	public void MemberJoin(MemberVO vo);
	
	//권한 부여
	public void AddAuth(MemberVO vo);
	
	//아이디 중복체크
	public int checkOverId(String email);
	
	//이메일 중복 체크
	public int cheakOverEmail(String id);
	
	//선택 사용자 정보
	public MemberVO Memberinfo(String id);
	
	//선택 사용자의 게시글 수 확인
	public int MemberCheackBoard(String id);
		
	//회원정보 수정
	public int MemberUpdate(MemberVO vo);
	
	//회원 탈퇴
	public void MemberDelte(String id);
	
	//권한 삭제
	public void AuthDelete(String id);
	
	//이메일 인증
	public int EmailAuthkey(String authKey);
	
	//아이디찾기
	public String Findid(@Param("username") String username,@Param("useremail") String useremail);
	
	//비밀번호 재성성
	public int SearchPw(@Param("userid") String userid,@Param("useremail") String useremail,@Param("userpw") String userpw);
	
	//이메일 인증 확인
	public String EmailAuthCheck(String id);
	
	
}
