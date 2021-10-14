<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!--폰트 어썸 사용  -->
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.2.0/css/all.min.css" integrity="sha512-6c4nX2tn5KbzeBJo9Ywpa0Gkt+mzCzJBrE1RB6fmpcsoN+b/w/euwIMuQKNyUoU/nToKN3a8SgNOtPrbW12fug==" crossorigin="anonymous" />

<script>
    $(function () {
        $(".left_sub_menu").hide();
        $(".has_sub").click(function () {
            $(".left_sub_menu").fadeToggle(300);
        });
        // 왼쪽메뉴 드롭다운
        $(".sub_menu ul.small_menu").hide();
        $(".sub_menu ul.big_menu").click(function () {
            $("ul", this).slideToggle(300);
        });
        // 외부 클릭 시 좌측 사이드 메뉴 숨기기
        $('.overlay').on('click', function () {
            $('.left_sub_menu').fadeOut();
            $('.hide_sidemenu').fadeIn();
        });
    });
</script>

    <div id="wrapper">
        <div class="topbar" style="position: absolute; top:0;">
            <!-- 왼쪽 메뉴 -->
            <div class="left side-menu">
                <div class="sidebar-inner">
                    <div id="sidebar-menu">
                        <ul>
                            <li class="has_sub">
                            	<a href="javascript:void(0);" class="waves-effect">
                               		<i class="fas fa-bars"></i>
                            	</a>
                            </li>
                        </ul>
                    </div>
                </div>
            </div>
            <!-- 왼쪽 서브 메뉴 -->
            <div class="left_sub_menu">
                <div class="sub_menu">
                    
                    <h2>${sessionScope.name}님</h2>
                    
                    <ul class="big_menu">
                        <li onclick="location.href='./adminMain.do'">대시보드<i class="arrow fas fa-angle-right"></i></li>
                    </ul>
                    
                    <ul class="big_menu">
                        <li>가맹점 관리 <i class="arrow fas fa-angle-right"></i></li>
                        <ul class="small_menu">
                            <li onclick="location.href='./adminShopNow.do'">가맹점 현황</li>
                            <li onclick="location.href='./adminShopReserve.do'">가맹점 예약관리</li>
                        </ul>
                    </ul>
                    
                    <ul class="big_menu">
                        <li>이용자 관리<i class="arrow fas fa-angle-right"></i></li>
                        <ul class="small_menu">
                            <li onclick="location.href='./adminMember.do'">이용자 현황</li>
                        </ul>
                    </ul>
                    
                    <ul class="big_menu">
                        <li>게시판 관리<i class="arrow fas fa-angle-right"></i></li>
                        <ul class="small_menu">
                            <li onclick="location.href='./adminBoard.do?boardNo=0'">공지사항 관리</li>
                            <li onclick="location.href='./adminBoard.do?boardNo=1'">가맹점 게시판 관리</li>                            
                            <li onclick="location.href='./adminBoard.do?boardNo=2'">이용자 게시판 관리</li>                            
                        </ul>
                    </ul>
                    
                    <ul class="big_menu">
                       <li onclick="location.href='./adminLog.do'">로그 관리<i class="arrow fas fa-angle-right"></i></li>
                    </ul>
                    
                    <ul class="big_menu">
                       <li onclick="location.href='./adminAnalytics.do'">구글 통계<i class="arrow fas fa-angle-right"></i></li>
                    </ul>
                    
                </div>
            </div>
            <div class="overlay"></div>
        </div>