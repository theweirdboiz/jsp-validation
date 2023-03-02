package com.kient.dao;

import java.util.List;

import com.kient.model.Member;

public interface IMemberDAO {
	public List<Member> findAll();

	public Member findOne(long id);

	public Long save(Member member);

	public Member findByEmail(String email);
}
