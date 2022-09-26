package com.dip.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.dip.entity.Member;
import com.dip.mapper.MemberMapper;

import lombok.Setter;

@Service
public class MemberServiceImpl implements MemberService {
	
	@Setter(onMethod_= @Autowired)
	private MemberMapper mapper;
	
	@Override
	public Member registerCheck(String memID) {
		return mapper.registerCheck(memID);
	}

	@Override
	public int register(Member m) {
		return mapper.register(m);
	}

	@Override
	public Member memLogin(Member mvo) {
		return mapper.memLogin(mvo);
	}

	@Override
	public int memUpdate(Member mvo) {
		return mapper.memUpdate(mvo);
	}

	@Override
	public Member getMember(String memID) {
		return mapper.getMember(memID);
	}

	@Override
	public Member NameCheck(String memID) {
		return mapper.NameCheck(memID);
	}

}
