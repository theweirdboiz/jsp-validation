package com.kient.controller;

import java.io.IOException;
import java.io.PrintWriter;
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
		List<Member> members = null;
		String gender = request.getParameter("gender");
		request.setCharacterEncoding("UTF-8");

		response.setContentType("application/json");
		response.setCharacterEncoding("UTF-8");
		if (gender == "" | gender == null) {
			members = memberService.findAll();

		} else {
			if (gender.equals("1") | gender.equals("0")) {
				members = memberService.findAllByGender(Byte.parseByte(gender));
			} else {
				members = memberService.findAll();
			}
		}
		PrintWriter out = response.getWriter();
		String json = new Gson().toJson(members);
		
		RequestDispatcher rd = request.getRequestDispatcher("/views/members.jsp");
		rd.forward(request, response);
		out.println(json);
		out.close();
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
