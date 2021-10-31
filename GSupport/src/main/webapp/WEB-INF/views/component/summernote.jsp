<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!-- include libraries(jQuery, bootstrap) -->
<link href="http://netdna.bootstrapcdn.com/bootstrap/3.3.5/css/bootstrap.css" rel="stylesheet">
<script src="http://cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.js"></script> 
<script src="http://netdna.bootstrapcdn.com/bootstrap/3.3.5/js/bootstrap.js"></script> 
<!-- include summernote css/js-->
<link href="https://cdnjs.cloudflare.com/ajax/libs/summernote/0.8.11/summernote-bs4.css" rel="stylesheet">
<script src="https://cdnjs.cloudflare.com/ajax/libs/summernote/0.8.11/summernote-bs4.js"></script>
<!-- include summernote-ko-KR -->
<script src="./resources/js/summernote-ko-KR.js"></script>

<style>
body {
    margin: 0;
    margin-right: 250px;
    margin-left: 250px;
}

.navbar {
    height: 60px;
    background-color: white;
    font-family: 'Jua';
    padding-left: 20px;
    display: table-cell;
    position: fixed;
    top: 0;
    left: 0;
    width: 100%;
    z-index: 99;
}

.note-editor.note-frame {
    border: 1px solid #a9a9a9;
    width: 99.4%;
    margin-bottom:20px;
}
</style>

<script>
$(document).ready(function() {
	  $('#summernote').summernote({
 	    	placeholder: '내용을 입력해 주세요.',
	        minHeight: 370,
	        maxHeight: null,
	        focus: true, 
	        lang : 'ko-KR'
	  });
	});
</script>

<textarea id="summernote" name="board_content">
	<c:if test="${update.board_content ne ''}">
	${update.board_content }
	</c:if>
</textarea>
