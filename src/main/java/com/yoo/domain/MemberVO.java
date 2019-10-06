package com.yoo.domain;

import java.util.Date;
import java.util.List;

import lombok.Data;

@Data
public class MemberVO {

	private String userid;
	private String userpw;
	private String name;
	private String useremail;
	private String usergender;
	private boolean enabled;
	
	private Date regDate;
	private Date updateDate;
	private List<AuthVO> authList;
	
	//메일 접속시 권한 확인
	private String Authkey;
	
}
