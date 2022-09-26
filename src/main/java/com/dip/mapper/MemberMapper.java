package com.dip.mapper;

import org.apache.ibatis.annotations.Mapper;

import com.dip.entity.Member;

@Mapper
public interface MemberMapper {	 
	public Member registerCheck(String memID);
	public Member NameCheck(String memName);
	public int register(Member m); //회원등록( 성공1, 실패0 )
	public Member memLogin(Member mvo); // 로그인체크
	public int memUpdate(Member mvo); // 수정하기
	public Member getMember(String memID);
}
