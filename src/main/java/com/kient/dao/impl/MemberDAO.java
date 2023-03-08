package com.kient.dao.impl;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import com.kient.dao.IMemberDAO;
import com.kient.model.Member;

public class MemberDAO extends AbstractDAO<Member> implements IMemberDAO {
	PreparedStatement ps;
	ResultSet rs;
	Connection connection;
	StringBuilder sql;

	public MemberDAO() {
		connection = getConnection();
	}

	@Override
	public Member findOne(long id) {
		sql = new StringBuilder("SELECT * FROM member where id=?");
		Member member = null;
		try {
			ps = connection.prepareStatement(sql.toString(), Statement.RETURN_GENERATED_KEYS);
			ps.setLong(1, id);
			rs = ps.executeQuery();
			if (rs.next()) {
				member = new Member(rs.getLong("id"), rs.getString("email"), rs.getString("password"),
						rs.getString("fullname"), rs.getString("dob"), rs.getByte("gender"),
						rs.getString("educational_level"), rs.getString("address"), rs.getString("city"),
						rs.getString("district"), rs.getString("ward"), rs.getString("phone"));
			}
			return member;
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return null;
	}

	@Override
	public List<Member> findAll() {
		sql = new StringBuilder("SELECT * FROM member");
		List<Member> members = new ArrayList<Member>();
		try {
			ps = connection.prepareStatement(sql.toString());
			rs = ps.executeQuery();
			while (rs.next()) {
				members.add(new Member(rs.getLong("id"), rs.getString("email"), rs.getString("password"),
						rs.getString("fullname"), rs.getString("dob"), rs.getByte("gender"),
						rs.getString("educational_level"), rs.getString("address"), rs.getString("city"),
						rs.getString("district"), rs.getString("ward"), rs.getString("phone")));
			}
			return members;
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return null;
	}

	@Override
	public Long save(Member member) {
		sql = new StringBuilder(
				"INSERT INTO member (email, fullname, password, dob, gender,educational_level, address,city,district,ward,phone)");
		sql.append("VALUES(?,?,?,?,?,?,?,?,?,?,?)");
		try {
			Long id = null;
			ps = connection.prepareStatement(sql.toString(), Statement.RETURN_GENERATED_KEYS);
			ps.setString(1, member.getEmail());
			ps.setString(2, member.getFullname());
			ps.setString(3, member.getPassword());
			ps.setString(4, member.getDob());
			ps.setByte(5, member.getGender());
			ps.setString(6, member.getEducationalLevel());
			ps.setString(7, member.getAddress());
			ps.setString(8, member.getCity());
			ps.setString(9, member.getDistrict());
			ps.setString(10, member.getWard());
			ps.setString(11, member.getPhone());
			ps.executeUpdate();
			rs = ps.getGeneratedKeys();
			if (rs.next()) {
				id = rs.getLong(1);
			}
			return id;
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return null;
	}

	@Override
	public Member findByEmail(String email) {
		sql = new StringBuilder("SELECT * FROM member where email=?");
		Member member = null;
		try {
			ps = connection.prepareStatement(sql.toString(), Statement.RETURN_GENERATED_KEYS);
			ps.setString(1, email);
			rs = ps.executeQuery();
			if (rs.next()) {
				member = new Member(rs.getLong("id"), rs.getString("email"), rs.getString("password"),
						rs.getString("fullname"), rs.getString("dob"), rs.getByte("gender"),
						rs.getString("educational_level"), rs.getString("address"), rs.getString("city"),
						rs.getString("district"), rs.getString("ward"), rs.getString("phone"));
			}
			return member;
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return null;
	}

	@Override
	public List<Member> findAllByGender(Byte gender) {
		sql = new StringBuilder("SELECT * FROM member where gender=?");
		List<Member> members = new ArrayList<Member>();
		try {
			ps = connection.prepareStatement(sql.toString());
			ps.setByte(1, gender);
			rs = ps.executeQuery();
			while (rs.next()) {
				members.add(new Member(rs.getLong("id"), rs.getString("email"), rs.getString("password"),
						rs.getString("fullname"), rs.getString("dob"), rs.getByte("gender"),
						rs.getString("educational_level"), rs.getString("address"), rs.getString("city"),
						rs.getString("district"), rs.getString("ward"), rs.getString("phone")));
			}
			return members;
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return null;
	}
}
