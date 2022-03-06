package com.kh.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class JqAjaxController
 */
@WebServlet("/jqAjax1.do")
public class JqAjaxController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public JqAjaxController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		// GET 방식 => 인코딩 X
		
		// 값 뽑기
		// reqeust.getParameter
		String str = request.getParameter("input");
		
		System.out.println("ㅎㅇㅎㅇ");
		
		System.out.println("요청 시 전달값 : " + str);
		
		System.out.println("입력된 값 : " + str + ", 길이 : " + str.length());
		
		// 응답
		
		// 1) 혹시라도 응답데이터에 한글이 있을 경우를 대비해서
		// 항상 응답 데이터에 대해서 인코딩 을 설정
		response.setContentType("text/html; charset=UTF-8");
		
		// 2) 응답 : response.getWriter()
		//			=> jsp 와의 통로를 열어준다 (자바 코드안에 html 코드를 넣을 때 썼음)
		response.getWriter().print("입력된 값 : " + str + ", 길이 : " + str.length());
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
