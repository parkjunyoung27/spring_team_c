<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!-- include libraries(jQuery, bootstrap) -->
<link href="https://stackpath.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css" rel="stylesheet">
<script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>

<!-- include summernote css/js -->
<link href="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote.min.css" rel="stylesheet">
<script src="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote.min.js"></script>


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
