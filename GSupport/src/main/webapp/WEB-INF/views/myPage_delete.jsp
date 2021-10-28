<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<script
	src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>

<title>My Page Delete</title>
<link href="./resources/css/index.css" rel="stylesheet">
<link href="./resources/css/myPage.css" rel="stylesheet">
<link href="./resources/css/base.css" rel="stylesheet">


<style>

.customer-content-detail {
	line-height: 1.6;
	text-align: center;
}

.a10{
	color:black;
	font-weight:800;
}
</style>
<script type="text/javascript">
	function mypageDelete() {
		
		var email = '<%=(String) session.getAttribute("member_id")%>';

			alert("잠시만 기다려주세요. 회원 탈퇴를 위한 인증 메일을 발송하고 있습니다.")
			
			$.ajax({
				type : 'get',
				dataType : 'text',
				data : 'email=' + email,
				url : '${pageContext.request.contextPath}/mailCheck.do',

				success : function(data) {

					sessionStorage.setItem("sentCode", data);

					var typeCode = prompt("이메일로 발송된 인증번호를 입력해주세요.", "");

					console.log(typeCode);

					if (typeCode != null) {
						if (data == typeCode) {
							document.getElementById("myPage_delete_form").submit();
							alert("인증완료. 탈퇴 되었습니다.")
							return true;

						} else {
							var tryCount = 0;
							while (true) {

								var typeCode = prompt(
										"인증 번호가 일치하지 않습니다. 다시 입력해주세요.", "");

								if (data == typeCode) {
									document.getElementById("myPage_delete_form").submit();
									alert("인증완료. 탈퇴 되었습니다.");
									return true;

								}
								else {
									tryCount++;
								}
								if (tryCount > 3) {
									alert("3회 이상 틀렸습니다. 다시 진행해주세요.")
									location.reload();
									break;
								}
							}
						}
					}
				}
			});

		
	}

	function move() {
		location.href = "./index.do";
	}
</script>
</head>
<body>

	<!-- Navbar -->
	<%@ include file="./component/navbar.jsp"%>

	<!-- Mypage menu -->
	<div class="container">
		<%@ include file="./myPage_menu.jsp"%>

		<!-- Mypage Content -->
		<div class="column middle">
			<div class="customer-content">
				<div class="customer-content-section">

					<div class="customer-content-header">
						<h1>회원 탈퇴</h1>
					</div>
					<div class="customer-account-container">

						<div class="customer-content-detail">
							<p>
								탈퇴신청시 아래 사항을 확인하시기 바랍니다. <br> 회원탈퇴 후 재가입 시에는 신규가입으로 처리되며,<br>
								탈퇴하신 ID는 다시 사용하실 수 없습니다. <br> 회원탈퇴 후 재가입은 탈퇴일로부터 30일 이후
								가능합니다. <br>
							</p>
							<form id="myPage_delete_form"action="./myPage_delete.do" method="post">
							</form>
								<button onclick="mypageDelete()" class="button_submit">회원 탈퇴하기</button>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>


	<!-- footer -->
	<%@ include file="./component/footer.jsp"%>
</body>
</html>