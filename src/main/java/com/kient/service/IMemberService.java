package com.kient.service;

import java.util.List;

import com.kient.model.Member;

public interface IMemberService {
	public Member save(Member member);

	public List<Member> findAll();
	public List<Member> findAllByGender(Byte gender);

	public Member findOne(Long id);

	public Member findByEmail(String email);

}
