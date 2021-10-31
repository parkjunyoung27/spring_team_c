<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="icon" href="${pageContext.request.contextPath}/resources/images/favicon.png">
<script src="//code.jquery.com/jquery-1.11.0.min.js"></script>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.2.0/css/bootstrap.min.css">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.2.0/css/bootstrap-theme.min.css">
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.2.0/js/bootstrap.min.js"></script>
<script type="text/javascript">

$(function(){
    $("#popbutton").click(function(){
        $('div.modal').modal({remote : 'adminBoard.do'});
    });
    
    $(".modal").click(function(e){
    	if($(e.target).attr("class") == "modal fade in"){
    		location.reload();    		
    	}
    });
}) 

</script>
</head>
<body>
<button class="btn btn-default" id="popbutton">button</button><br/>
<div class="modal fade">
  <div class="modal-dialog">
    <div class="modal-content">
        <!-- remote ajax call이 되는영역 -->
    </div>
  </div>
</div>
</body>
</html>


<!-- //window.open("/GSupport/admin/adminBoard.do", "G새창", "width=800, height=700, toolbar=no, menubar=no, scrollbars=no, resizable=yes" ); -->