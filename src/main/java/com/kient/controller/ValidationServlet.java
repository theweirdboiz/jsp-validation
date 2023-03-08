package com.kient.controller;

import java.io.IOException;
import java.io.PrintWriter;

import javax.inject.Inject;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.kient.model.Member;
import com.kient.service.IMemberService;

/**
 * Servlet implementation class ValidationEmailServlet
 */
@WebServlet("/validation")
public class ValidationServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	@Inject
	private IMemberService memberService;

	public ValidationServlet() {
		super();
		// TODO Auto-generated constructor stub
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
//		String email = request.getParameter("email");
//		String password = request.getParameter("password");

//		Member member = memberService.findByEmail(email);
//		response.setContentType("text/html");
//		PrintWriter pw = response.getWriter();
//		boolean result = member != null ? true : false;
//		pw.println(result);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		String dobPattern = "^(0[1-9]|1[012])/(0[1-9]|[12][0-9]|[3][01])/\\d{4}$";
		String type = request.getParameter("type");
		response.setHeader("Cache-Control", "private, no-store, no-cache, must-revalidate");
		Member member = null;
		PrintWriter pw = null;
		switch (type) {
		case "email":
			String email = request.getParameter("email");
			member = memberService.findByEmail(email);
			response.setContentType("text/plain");
			pw = response.getWriter();
			if (member == null) {
				pw.println(1);
			} else {
				pw.println(0);
			}
			break;
		case "password":
			String password = request.getParameter("password");
			pw = response.getWriter();
			if (password.length() >= 8) {
				pw.println(1);
			} else {
				pw.println(0);
			}
			break;
		case "repassword":
			password = request.getParameter("password");
			String repassword = request.getParameter("repassword");
			response.setContentType("text/html");
			pw = response.getWriter();
			if (password.equals(repassword)) {
				pw.println(1);
			} else {
				pw.println(0);
			}
			break;
		case "dob":
			response.setContentType("text/html");
			String dob = request.getParameter("dob");
			pw = response.getWriter();
			if (dob.matches(dobPattern)) {
				pw.println(1);

			} else {
				pw.println(0);
			}
			break;
		default:
			break;
		}
//		doGet(request, response);
	}

}
