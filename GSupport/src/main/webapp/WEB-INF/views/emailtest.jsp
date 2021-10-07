<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<script type="text/javascript">
	/* 인증번호 이메일 전송 */
	function mailCheck() {

		var email = $("#email").val(); // 입력한 이메일

		$.ajax({
			type : 'get',
			dataType : 'text',
			data : 'email='+email,
			url : '${pageContext.request.contextPath}/mailCheck.do'

		});

}
</script>

<body>
	<header>
		<!-- navbar -->
		<%@ include file="./component/navbar.jsp"%>
	</header>



		<h2>회 원 가 입</h2>
		<br>
		<p id="joinErr"></p>

		<div id="join_email" class="join_p">
			<span class="jtitle">이메일</span> <input type="email" name="email"
				id="email">
				<button onclick="mailCheck()">인증번호 전송</button>
		</div>


	<footer>
		<%@ include file="./component/footer.jsp"%>
	</footer>

</body>
</html>