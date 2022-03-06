<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<!-- jQuery library -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>

</head>
<body>

	<h1>AJAX 개요</h1>
	
	<p>
		Asynchronous JavaScript And XML 의 약자로 <br>
		서버로부터 데이터를 가져와 전체 페이지를 새로 고치지 않고
		일부만 로드해 내용물만 바꿀수 있는 기법 <br><br>
		
		
		참고로, 우리가 그동안 기존에 a 태그를 이용해서 요청 및 form 을 통해 요청한 방식은 동기식 요청이였음 <br>
		=> 응답페이지가 돌아와야 그 결과를 볼 수 있는것 (== 페이지 화면이 한번 깜빡거린다.) <br><br>
		
		비동기식 요청을 보내기 위해서는 AJAX 라는 기술이 필요함 <br><br>
		
		* 동기식 / 비동기식 요청 차이 <br>
		- 동기식 : 요청 처리 후 그에 해당하는 응답 페이지가 돌아와야만 그 다음 작업이 가능 <br>
				 만약  서버에서 응답페이지를 돌려주는 시간이 지연되면 무작정 기다려야 함 (흰 페이지) <br>
				 전체 페이지가 리로드됨(새로고침, 즉, 페이지가 기본적으로 한번 깜빡거리면서 넘어감) <br><br>
				 
		- 비동기식 : 현재 페이지는 그대로 유지하면서 중간중간마다 추가적인 요청을 보내줄 수 있고 <br>
				   요청을 한다고 해서 다른 페이지로 넘어가지는 않음 (현재페이지 그대로 유지) <br>
				   요청을 보내놓고 그에 해당되는 응답이 돌아올 때 까지
				   현재 페이지에서 다른 작업을 할 수 있음 (즉, 페이지가 깜빡거리지 않음) <br>
		예) NAVER 아이디 중복체크 기능, 댓글, 실시간 검색어 등등, 검색어 자동완성 등 <br><br>
		
		* 비동기식의 단점 <br>
		- 현재 페이지에 지속적으로 리소스가 쌓임 => 페이지가 현저히 속도가 느려질 수 있음 <br>
		- 페이지 내 복잡도가 기하급수적으로 증가 => 에러 발생 시 디버깅이 어려움 <br>
		- 요청 후 돌아온 응답데이터를 가지고 현재 페이지에서 새로운 요소를 동적으로 만들어서 뿌려줘야함
		 => DOM 요소를 새로이 만들어내는 구문을 잘 익혀둬야 함 <br><br>
				 
		* AJAX 구현방식 : JavaScript 방식 / jQuery 방식 <br>
		=> jQuery 가 코드가 간결하고 사용하기 쉽다. <br><br>
	</p>
	
	<pre>
		* jQuery 에서의 AJAX 통신
		
		[ 표현법 ]
		$.ajax({
			속성명 : 속성값,
			속성명 : 속성값,
			속성명 : 속성값, 
			...
		});
		
		=> AJAX 기술이 가능하게 하는 객체를 매개변수로 넘긴다고 생각하자.
		
		* 주요 속성
		- url : 요청할 url (필수로 작성) => form 태그의 action 속성
		- type/method : 요청 전송 방식 (get / post, 생략 시 기본값은 get) => form 태그의 method 속성
		- data : 요청 시 전달할 값 (*{키:밸류, 키:밸류, ...}*) => form 태그 안에 input 태그로 입력한 값
		- success : ajax 통신 성공 시 실행할 함수를 정의
		- error : ajax 통신 실패 시 실행할 함수를 정의
		- complete : ajax 통신 성공이든 실패든간에 무조건 끝나면 실행할 함수 정의
		
		* 부수적인 속성
		- async : 서버와의 비동기 처리 방식 설정 여부 (기본값 true) 
		- contentType : request 의 데이터 인코딩 방식 정의 (보내는 측의 데이터 인코딩) 
		- dataType : 서버에서 response 로 오는 데이터의 데이터 형 설정, 값이 없다면 스마트하게 판단함
					xml : 트리 형태의 구조
					json : 맵 형태의 데이터 구조 (일반적인 데이터 구조)
					script : javascript 및 일반 String 형태의 데이터
					html : html 태그 자체를 return 하는 방식
					text : String 데이터
		- accept : 파라미터의 타입을 설정 (사용자 특화 된 파라미터 타입 설정 가능) 
		- beforeSend : ajax 요청을 하기 전 실행되는 이벤트 callback 함수 
		 				(데이터 가공 및 header 관련 설정) 
		- cache : 요청 및 결과값을 scope 에서 갖고 있지 않도록 하는 것 (기본값 true) 
		- contents : jQuery 에서 response 의 데이터를 파싱하는 방식 정의
		- context : ajax 메소드 내 모든 영역에서 파싱 방식 정의
		- crossDomain : 타 도메인 호출 가능 여부 설정 (기본값 false) 
		- dataFilter : response 를 받았을 때 정상적인 값을 return 할 수 있도록 데이터와 데이터 타입 설정
		- global : 기본 이벤트 사용 여부 (ajaxStart, ajaxStop) 
				   (버퍼링 같이 시작과 끝을 나타낼 때, 선처리 작업) 
		- password : 서버에 접속 권한 (비밀번호) 가 필요한 경우
		- processData : 서버로 보내는 값에 대한 형태 설정 여부 (기본 데이터를 원하는 경우 false 설정) 
		- timeout : 서버 요청 시 응답 대기 시간 (milisecond)
	</pre>
	
	<hr>
	
	<h1>jQuery 방식을 이용한 AJAX 테스트</h1>
	
	<h3>1. 버튼 클릭시 get 방식으로 서버에 데이터 전송 및 응답</h3>
	
	입력 : <input type="text" id="input1">
	<button id="btn1">전송</button>
	<br>
	
	응답 : <label id="output1">현재 응답 없음</label>
	
	<script>
		$(function(){
			
			$("#btn1").click(function(){
				
				// 동기식 통신 : location.href="요청url?쿼리스트링";
				
				// 비동기식 통신
				$.ajax({
					url : "jqAjax1.do", 
					data : {input : $("#input1").val()},
					type : "get", 
					success : function(result) {
						$("#output1").text(result);
					},
					error : function() {
						alert("ajax 통신 실패");
					}, 
					complete : function() {
						alert("성공이든 실패든간에 실행");
					}
				});
			});
			// 404 : 요청은 성공적으로됨, 아직 응답이 없어서 뜬 것임!!
		});
	</script>
	
	<hr>
	
	<h3>2. 버튼 클릭시 post 방식으로 서버에 데이터 전송 및 응답</h3>
	
	이름 : <input type="text" id="input2_1"> <br>
	나이 : <input type="number" id="input2_2"> <br>
	<button onclick="test2();">전송</button>
	
	<br>
	
	응답 : <label id="output2">현재 응답 없음</label>
	
	<script>
		function test2() {
			
			$.ajax({
				url : "jqAjax2.do",
				data : {
					name : $("#input2_1").val(), 
					age : $("#input2_2").val()
				},
				type : "post", 
				success : function(result) {
					
					// JSONArray 로 넘겼을 경우
					// $("#output2").text("이름 : " + result[0] + ", 나이 : " + result[1]);
					// console.log(result);
					// 배열 형태로 넘겼을 때 가공된 것을 눈에 보여지게 하는것은 뷰단의 역할 (언빡싱)
					
					// JSONObject 로 넘겼을 경우
					// 자바스크립트객체에서 속성값에 접근하려면 두가지방법
					// 객체명.속성명, 객체명["속성명"]
					$("#output2").text("이름 : " + result.name + ", 나이 : " + result.age);
					console.log(result);
					// 객체 형태로 넘겼을 때 가공된 것을 눈에 보여지게 하는것은 뷰단의 역할 (언빡싱)
					
					// + 위의 인풋태그 초기화 되는 효과
					$("#input2_1").val("");
					$("#input2_2").val("");
				}, 
				error : function() {
					alert("ajax 실패");
				}
			});
			
		}
	</script>
	
	<hr>
	
	<h3>3. 서버로 데이터 전송 후, 조회된 객체를 응답데이터로 받기</h3>
	
	회원번호 입력 : <input type="number" id="input3">
	<button onclick="test3();">조회</button>
	
	<div id="output3"></div>
	
	<div>---- ArrayList 로 받기 ----</div>
	
	<div id="output4"></div>
	
	<script>
		function test3() {
			
			$.ajax({
				url : "jqAjax3.do", 
				data : { no : $("#input3").val() }, 
				success : function(result) {
					
					// VO 객체 하나만 보낸 케이스
					/*
					var resultStr = "회원번호 : " + result.memberNo + "<br>"
								  + "이름 : " + result.memberName + "<br>"
								  + "나이 : " + result.age + "<br>"
								  + "성별 : " + result.gender;
					
					$("#output3").html(resultStr);
					*/
					
					// ArrayList 로 VO 여러개 묶어서 보낸 케이스
					// => 반복문으로 문자열을 연이어서 만들기 (누적)
					var resultStr2 = "";
					
					for(var i = 0; i < result.length; i++) {
						resultStr2 += result[i].memberNo + " 번째 회원 정보 <br>" 
									+ "이름 : " + result[i].memberName + ", "
									+ "나이 : " + result[i].age + ", "
									+ "성별 : " + result[i].gender + "<br>"
					}
					
					$("#output4").html(resultStr2);
					
				}, 
				error : function() {
					alert("ajax 실패");
				}
			});
		}
	</script>

</body>
</html>













