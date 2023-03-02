package com.kient.controller;

import java.io.IOException;
import java.util.List;

import javax.inject.Inject;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.Gson;
import com.kient.model.Member;
import com.kient.service.IMemberService;

@WebServlet(urlPatterns = { "/add-member" })
public class AddMemberController extends HttpServlet {
	private static final long serialVersionUID = 1L;
	@Inject
	private IMemberService memberService;

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		response.setContentType("application/json");
		Member newMember = new Gson().fromJson(request.getReader(), Member.class);
		System.out.println(newMember.toString());
		memberService.save(newMember);
	}

}
