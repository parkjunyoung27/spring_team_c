<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>

<script>
$(function(){
	$(".modifyWrite").hide();
	$(".clear").on("click", function(){
		var txtw = $(this).siblings("#cNum").val();
		if(txtw == "true"){		
			$(this).parents("#commentInfo").siblings(".modifyWrite").show();
			var content = $(this).parents("#commentInfo").siblings("#commentContent").text();
			$(this).parents("#commentInfo").siblings("#commentContent").hide();
			$(this).parents("#commentInfo").siblings(".modifyWrite").find("textarea[name=ccontent]").val(content);
			$(this).siblings("#cNum").val("false");
		}
		else{
			$(this).parents("#commentInfo").siblings(".modifyWrite").hide();
			$(this).parents("#commentInfo").siblings("#commentContent").show();
			$(this).siblings("#cNum").val("true");
		}
	});
});  

function comment_delete(no1, no2, no3){
	var result = confirm("댓글을 삭제하시겠습니까?");
	if(result == true){
		location.href="./comment_delete.do?categoryNo="+no2+"&&board_no="+no3+"&&board_cno="+no1;
	}
}
</script>

<!-- 댓글 부분 -->
<div id="comment"> 
	<p id="commentCount" style="font-weight:700; margin:20px;">${commentTotalCount}개의 댓글</p>
	<c:forEach items="${commentList }" var="cl" >
	<ul>
		<!-- 댓글 리스트 -->
		<li id="commentContainer">	
			<div id="commentbox">
				<div id="commentInfo">
					<p class="commentInfoText">${cl.member_name }</p>
					<span class="commentModify">
					<c:if test="${sessionScope.id eq cl.member_id }">
						<a class="clear">수정하기</a>
					</c:if>
					<c:if test="${sessionScope.id eq cl.member_id || sessionScope.grade eq '3' }">	
						<a href="#" onclick="return comment_delete(${cl.board_cno}, ${param.categoryNo }, ${detail.board_no })">삭제하기</a>
					</c:if>
					<input type="hidden" id="cNum" value="true"/>	
					</span>
					<p class="commentInfoText" style="color: gray; font-size: small;">
					<fmt:formatDate var="now" value="${today}" pattern="yyyyMMdd" />
					<fmt:formatDate var="write_date" value="${cl.comment_date}" pattern="yyyyMMdd" />
						<c:choose>
							<c:when test="${write_date eq now}"><fmt:formatDate value="${cl.comment_date}" pattern="HH:mm"/></c:when>
							<c:otherwise><fmt:formatDate value="${cl.comment_date}" pattern="yyyy.MM.dd"/></c:otherwise>					
						</c:choose>
					</p>					
				</div>
				<p id="commentContent">${cl.comment_content }</p>			
									
				<!-- 댓글내용 수정 -->
				<div class="modifyWrite">
					<form action="./comment_update.do?board_cno=${cl.board_cno }" method="post">
						<textarea name="ccontent" style="width:100%;height:100px;overflow:auto;resize: none;"></textarea>
						<input type="hidden" name="board_no" value="${cl.board_no }">
						<div id="modifyWriteBtn">
							<button>수정취소</button>
							<button>수정하기</button>
						</div>
					</form>
				</div>
			</div>	
		</li>	
	</ul>
	</c:forEach>
	<c:choose>
		<c:when test="${sessionScope.id ne null }">
		<!-- 댓글쓰기 -->
		<c:if test="${param.categoryNo eq 1 && sessionScope.grade > 1}">
		<div id="commentWrite">
			<form action="./commentWrite.do" method="post">
				<textarea id="commentWriteText" name="comment_content" placeholder="댓글을 입력해주세요. 타인을 비방하는 댓글, 욕설, 도배행위 등은 제재대상이 될 수 있습니다."></textarea>
				<input type="hidden" name="board_no" value="${detail.board_no}">
				<input type="hidden" name="categoryNo" value="${param.categoryNo}">
				<button id="commentWriteBtn">등록</button>
			</form>
		</div>
		</c:if>
		<c:if test="${param.categoryNo eq 2 && sessionScope.grade eq 3 || sessionScope.id eq member_id}">
		<div id="commentWrite">
			<form action="./commentWrite.do" method="post">
				<textarea id="commentWriteText" name="comment_content" placeholder="댓글을 입력해주세요. 타인을 비방하는 댓글, 욕설, 도배행위 등은 제재대상이 될 수 있습니다."></textarea>
				<input type="hidden" name="board_no" value="${detail.board_no}">
				<input type="hidden" name="categoryNo" value="${param.categoryNo}">
				<button id="commentWriteBtn">등록</button>
			</form>
		</div>
		</c:if>
		</c:when>
		<c:otherwise>
		댓글 기능을 이용하시려면 로그인해주세요.
		</c:otherwise>
	</c:choose>
	</div>
