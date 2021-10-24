<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>

<script>
$(function(){
	var txtw = 0;
	$(".modifyWrite").hide();
	$("#clear").on("click",function(){
		if(txtw == 0){		
			$(".modifyWrite").show();
			txtw=1;
		}
		else{
			$(".modifyWrite").hide();
			txtw=0;
		}
	});
});  

</script>

<!-- 댓글 부분 -->∂
<div id="comment"> 
	<p id="commentCount" style="font-weight:700; margin:20px;">0개의 댓글</p>
	<ul>
		<!-- 댓글 리스트 -->
		<li id="commentContainer">	
			<div id="commentbox">
				<div id="commentInfo">
					<p class="commentInfoText">닉네임(이름)</p>
					<span class="commentModify">
						<a id="clear">수정하기</a>
						<a href="#">삭제하기</a>
					</span>
					<p class="commentInfoText" style="color: gray; font-size: small;">2021-10-07</p>					
				</div>
				
				<div id="commentContent">댓글 내용 테스트용입니다.</div>			
									
				<!-- 댓글내용 수정 -->
				<div class="modifyWrite">
					<form action="./commentModify" method="post">
						<textarea name="ccontent" id="commentWriteText" placeholder="수정 내용 입력하세요. "></textarea>
						<input type="hidden" name="bno" value="${l.bno }"><input type="hidden" name="cno" value="${l.cno }">
						<div id="modifyWriteBtn">
							<button>수정취소</button>
							<button>수정하기</button>
						</div>
					</form>
				</div>
				
			</div>	
		</li>	
	</ul>
		<!-- 댓글쓰기 -->
		<div id="commentWrite">
			<form action="./commentWrite" method="post">
				<textarea id="commentWriteText" name="commentContent"></textarea>
				<input type="hidden" name="bno" value="${l.bno }">
				<button id="commentWriteBtn">등록</button>
			</form>
		</div>
	</div>		

