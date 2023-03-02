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

import com.kient.model.Member;
import com.kient.service.IMemberService;

/**
 * Servlet implementation class ViewListMemberController
 */
@WebServlet("/view-members")
public class ViewListMemberController extends HttpServlet {
	private static final long serialVersionUID = 1L;
	@Inject
	private IMemberService memberService;

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		List<Member> members = memberService.findAll();
		request.setAttribute("members", members);
		RequestDispatcher rd = request.getRequestDispatcher("/views/members.jsp");
		rd.forward(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
