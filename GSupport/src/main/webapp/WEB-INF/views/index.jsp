<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>Index</title>
	<link href="./resources/css/index.css" rel="stylesheet">

</head>
<body>

	<!-- navbar -->
	<%@ include file= "./component/navbar.jsp"%>

	<!-- main -->
 
    <div class="header-img">
        <img src="./resources/images/header.jpg" width="100%" height="350px">
    </div>

    <div class="main_list">
			
        <div class="main_title">
            <div class="main_title_2">이달의 가맹점</div>
        </div>
        
        <div class="shop_list_container">
            <div class="shop_list"> 
            
                <div class="shop">
                    <a href='#' class="shop_enter">
                        
                        <div class="thumbnail_box">
                            <div class="shop_img">
                                <img src="./resources/images/gimbab.png" class="shop_img2">
                            </div>
                        </div>
                        
                        <div class="shop_info">
                            <div class="shop_kind">
                                <p>분식</p>
                            </div>
                            <p class="shop_name">김밥천국 <br> 사당역점</p>
                            <div class="price">
                                <div class="shop_text">
                                    <b class="shop_Like">좋아요 :</b>
                                    <span class="shop_like_num">20</span>
                                </div>
                            </div>
                        </div>		
                    </a>
                </div>
                <div class="shop">
                    <a href='#' class="shop_enter">
                        
                        <div class="thumbnail_box">
                            <div class="shop_img">
                                <img src="./resources/images/gimbab.png" class="shop_img2">
                            </div>
                        </div>
                        
                        <div class="shop_info">
                            <div class="shop_kind">
                                <p>분식</p>
                            </div>
                            <p class="shop_name">김밥천국 <br> 사당역점</p>
                            <div class="price">
                                <div class="shop_text">
                                    <b class="shop_Like">좋아요 :</b>
                                    <span class="shop_like_num">20</span>
                                </div>
                            </div>
                        </div>		
                    </a>
                </div>
                <div class="shop">
                    <a href='#' class="shop_enter">
                        
                        <div class="thumbnail_box">
                            <div class="shop_img">
                                <img src="./resources/images/gimbab.png" class="shop_img2">
                            </div>
                        </div>
                        
                        <div class="shop_info">
                            <div class="shop_kind">
                                <p>분식</p>
                            </div>
                            <p class="shop_name">김밥천국 <br> 사당역점</p>
                            <div class="price">
                                <div class="shop_text">
                                    <b class="shop_Like">좋아요 :</b>
                                    <span class="shop_like_num">20</span>
                                </div>
                            </div>
                        </div>		
                    </a>
                </div>
                <div class="shop">
                    <a href='#' class="shop_enter">
                        
                        <div class="thumbnail_box">
                            <div class="shop_img">
                                <img src="./resources/images/gimbab.png" class="shop_img2">
                            </div>
                        </div>
                        
                        <div class="shop_info">
                            <div class="shop_kind">
                                <p>분식</p>
                            </div>
                            <p class="shop_name">김밥천국 <br> 사당역점</p>
                            <div class="price">
                                <div class="shop_text">
                                    <b class="shop_Like">좋아요 :</b>
                                    <span class="shop_like_num">20</span>
                                </div>
                            </div>
                        </div>		
                    </a>
                </div>
                <div class="shop">
                    <a href='#' class="shop_enter">
                        
                        <div class="thumbnail_box">
                            <div class="shop_img">
                                <img src="./resources/images/gimbab.png" class="shop_img2">
                            </div>
                        </div>
                        
                        <div class="shop_info">
                            <div class="shop_kind">
                                <p>분식</p>
                            </div>
                            <p class="shop_name">김밥천국 <br> 사당역점</p>
                            <div class="price">
                                <div class="shop_text">
                                    <b class="shop_Like">좋아요 :</b>
                                    <span class="shop_like_num">20</span>
                                </div>
                            </div>
                        </div>		
                    </a>
                </div>
            </div>
        </div>

    </div>
					
	<!-- footer -->
	<%@ include file= "./component/footer.jsp"%>
	
</body>
</html>