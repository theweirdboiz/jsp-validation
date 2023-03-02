package com.kient.service.impl;

import java.util.List;

import javax.inject.Inject;

import com.kient.dao.IMemberDAO;
import com.kient.model.Member;
import com.kient.service.IMemberService;

public class MemberService implements IMemberService {
	@Inject
	private IMemberDAO memberDAO;

	@Override
	public Member save(Member member) {
		Long memberId = memberDAO.save(member);
		return memberDAO.findOne(memberId);
	}

	@Override
	public List<Member> findAll() {
		return memberDAO.findAll();
	}

	@Override
	public Member findOne(Long id) {
		return memberDAO.findOne(id);
	}

	@Override
	public Member findByEmail(String email) {
		// TODO Auto-generated method stub
		return memberDAO.findByEmail(email);
	}

}
