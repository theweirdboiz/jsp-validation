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
 * Servlet implementation class ViewDetailMemberController
 */
@WebServlet("/view-detail-member")
public class ViewDetailMemberController extends HttpServlet {
	private static final long serialVersionUID = 1L;
	@Inject
	private IMemberService memberService;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public ViewDetailMemberController() {
		super();
		// TODO Auto-generated constructor stub
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub

		Long memberId = Long.parseLong(request.getParameter("id"));
		Member member = memberService.findOne(memberId);
		request.setAttribute("member", member);
		RequestDispatcher rd = request.getRequestDispatcher("/views/detail-member.jsp");
		rd.forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
