package com.kh.controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.json.simple.JSONObject;

import com.google.gson.Gson;
import com.kh.model.vo.Member;

/**
 * Servlet implementation class JqAjaxController3
 */
@WebServlet("/jqAjax3.do")
public class JqAjaxController3 extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public JqAjaxController3() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		// GET 방식

		// request 값뽑기
		int memberNo = Integer.parseInt(request.getParameter("no"));
		
		// DB 로 부터 데이터를 조회했다라는 가정하에 Member 객체에 값을 담기
		Member m = new Member(memberNo, "고길동", 50, "남성");
		
		// m 을 응답
		// 형식, 인코딩 지정
		// response.setContentType("text/html; charset=UTF-8");
		// response.getWriter().print(m);
		// 내부적으로 toString() 메소드가 호출되어 문자열 형태로 값이 넘어감
		
		/*
		// JSON 이용
		// 자바 객체 => 자바스크립트 객체로 변환 (JSONObject)
		// JSONObject 객체 생성
		JSONObject jObj = new JSONObject(); // {}
		jObj.put("memberNo", m.getMemberNo()); // { memberNo : 1 }
		jObj.put("memberName", m.getMemberName()); // { memberNo : 1, memberName : "고길동" }
		jObj.put("age", m.getAge()); // { memberNo : 1, memberName : "고길동", age : 50 }
		jObj.put("gender", m.getGender()); // { memberNo : 1, memberName : "고길동", age : 50, gender : "남성" }
		
		// 응답으로 넘기기
		response.setContentType("application/json; charset=UTF-8");
		response.getWriter().print(jObj);
		*/
		
		// ------ JSON 은 정석 방법 ------
		
		// GSON : Google JSON 라이브러리
		// GSON 라이브러리를 연동해야지만 사용가능
		// https://mvnrepository.com/artifact/com.google.code.gson/gson/2.8.2 에서 다운로드
		
		// 형식, 인코딩 지정 => application/json;
		response.setContentType("application/json; charset=UTF-8"); 
		
		// Gson 객체 생성
		// Gson gson = new Gson();
		
		// gson.toJson() 메소드를 호출
		// [ 표현법 ] toJson(응답할 객체, 응답할 스트림)
		// gson.toJson(m, response.getWriter());
		// => response.getWriter() 라는 통로로 m 이라는 객체를 응답하겠다.
		// 단, 명시적으로 키값을 제시 안했기 때문에, 키값은 자동적으로 필드명이 된다!!!
		
		// new Gson().toJson(m, response.getWriter());
		
		// VO 객체 하나만 응답시 JSONObject{} 형태로 만들어져서 응답
		// ArrayList 응답시 JSONArray[] 형태로 만들어져서 응답
		
		// 여러개의 객체가 들어있는 ArrayList 넘기기
		
		// ArrayList<Member>
		ArrayList<Member> list = new ArrayList<>();
		list.add(new Member(1, "고길동", 50, "남성"));
		list.add(new Member(2, "박말똥", 20, "여성"));
		list.add(new Member(3, "김개똥", 14, "남성"));
		
		// response.setContentType("application/json; charset=UTF-8");
		// 위에서 이미 호출
		
		// Gson 객체 생성 후 응답 보내기
		new Gson().toJson(list, response.getWriter());
		// => list 라는 변수를 response.getWriter() 라는 통로로 보내겠다.
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
