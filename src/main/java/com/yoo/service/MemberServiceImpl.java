package com.yoo.service;

import java.io.UnsupportedEncodingException;

import javax.mail.MessagingException;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.yoo.domain.MemberVO;
import com.yoo.mail.MailUtils;
import com.yoo.mail.TempKey;
import com.yoo.mapper.MemberMapper;

import lombok.AllArgsConstructor;
import lombok.Setter;
import lombok.extern.log4j.Log4j;

@Log4j
@Service
@AllArgsConstructor
public class MemberServiceImpl implements MemberService {
	
	@Setter(onMethod_ = @Autowired )
	private PasswordEncoder pwencoder;
	
	@Setter(onMethod_ = @Autowired )
	private MemberMapper mapper;
	
	@Setter(onMethod_ = @Autowired )
	private JavaMailSender mailSender;
	
	//회원가입
	@Transactional
	@Override
	public void MemberJoin(MemberVO vo) throws MessagingException,UnsupportedEncodingException{
		
		//비밀번호 난수화
		String uupw = pwencoder.encode(vo.getUserpw());	
		//권한 설정
		vo.setUserpw(uupw);
		
		//메일보내기
		String authkey = new TempKey().getKey(50, false);
		
		vo.setAuthkey(authkey);
		

		// mail 작성 관련   
		MailUtils sendMail = new MailUtils(mailSender);
		sendMail.setSubject("[Yoo Games] 회원가입 인증 이메일");
		sendMail.setText(new StringBuffer().append("<h1>[이메일 인증]</h1>")
				.append("<p>아래 링크를 클릭하시면 이메일 인증이 완료됩니다.</p>")
				.append("<a href='http://dbwjdghman.cafe24.com/member/joinConfirm?authKey=")
				.append(authkey)
				.append("' target='_blenk'>이메일 인증 확인</a>")
				.toString());
		sendMail.setFrom("Manager","관리자");
		sendMail.setTo(vo.getUseremail());
		sendMail.send();

		
		////
		mapper.MemberJoin(vo);
		mapper.AddAuth(vo);
	}

	//아이디체크
	@Transactional
	@Override
	public int userIdCheck(String id) {		
		return mapper.checkOverId(id);
	}

	//회원정보
	@Transactional
	@Override
	public MemberVO Memberinfo(String id) {
		log.info("접근 되는 아이디?:" + id);
		return mapper.Memberinfo(id);
	}

	//게시글 수 확인
	@Transactional
	@Override
	public int MemberCheackBoard(String id) {
		
		return mapper.MemberCheackBoard(id);
	}

	//회원정보 수정
	@Transactional
	@Override
	public int MemberUpdate(MemberVO vo) {
		
		String uupw = pwencoder.encode(vo.getUserpw());
		
		vo.setUserpw(uupw);
		
		return mapper.MemberUpdate(vo);
	}

	@Transactional
	@Override
	public void MemberDelete(String id) {
		
		mapper.AuthDelete(id);
		mapper.MemberDelte(id);
	}

	@Transactional
	@Override
	public boolean maches(String id,String pw) {
		
		//bcryptPasswordEncoder
		
		log.info(pwencoder);
		
		MemberVO vo = mapper.Memberinfo(id);
		//기존 가지고있던 DB password
		String dbPassword = vo.getUserpw();
		//새로 들어온 pw를 코드화
		//String encodedPassword = pwencoder.encode("123");
		
		boolean isMatched = pwencoder.matches(pw, dbPassword);
		
		log.info("접근확인    :  maches" );
		log.info("접근확인  rawpw  :  " + dbPassword );
		//log.info("접근확인   encode :  " + encodedPassword);
		log.info(isMatched);
		
		
		return pwencoder.matches(pw, dbPassword);
	}

	
	@Transactional
	@Override
	public void email(String authKey) {
		
		mapper.EmailAuthkey(authKey);
		
	}

	//아이디찾기
	@Transactional
	@Override
	public String Findid(String username, String useremail) {
		
		String result = "";
		
		try {
			result = mapper.Findid(username, useremail);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return result;
		
	}

	//비밀번호 재설정
	@Transactional
	@Override
	public int SearchPw(String userid, String useremail) throws MessagingException,UnsupportedEncodingException {
		
		MemberVO vo = mapper.Memberinfo(userid);
		
		String key = new TempKey().getKey(6, false);
				
		//비밀번호 난수화
		String uupw = pwencoder.encode(key);
		

		// mail 작성 관련   
		MailUtils sendMail = new MailUtils(mailSender);
		sendMail.setSubject("[Yoo Games]"+ vo.getUserid() + "님의 임시 비밀번호 입니다.");
		sendMail.setText(new StringBuffer().append("<h1>임시 비밀번호</h1>")
				.append(key)
				.toString());
		sendMail.setFrom("Manager","관리자");
		sendMail.setTo(vo.getUseremail());
		sendMail.send();

		return mapper.SearchPw(userid, useremail,uupw);
		
		
	}

	//이메일 확인체크
	@Transactional
	@Override
	public String EmailAuthCheck(String id) {
		
		return mapper.EmailAuthCheck(id);
	}

	//이메일 중복 체크
	@Transactional
	@Override
	public int userEmailCheck(String email) {
		log.info("메일 인증 service 접근");
		return mapper.cheakOverEmail(email);
	}



}
