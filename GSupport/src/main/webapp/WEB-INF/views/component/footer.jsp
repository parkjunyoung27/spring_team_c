<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!-- Footer -->
    <div class="footer">

        <div class="footer_content"> 
            
            <div class="manual_info"> 
                
                <div class="cs_service">
                    <strong class="cs_service_title">고객센터&ensp;: </strong>
                    <strong><a alt="고객 상담" class="cs_consultant">카톡 실시간 상담</a></strong>
                    <div class="service_time">
                        <div class="time_box">
                            <p class="sc_text">운영시간 : 평일 09:00 ~ 18:00(주말, 공휴일 휴무)</p>
                            <p class="sc_text">점심시간 : 13:00 ~ 14:00</p>
                        </div>
                        <p class="sc_text">문의는 운영시간 내 <a style="text-decoration: none" href="https://open.kakao.com/o/g0vNOhHd">카카오 실시간 채팅</a>으로 가능합니다.</p>
                        <div class="sc_button">
                            <a href="./board.do?categoryNo=2" type="button" class="sc_btn">자주 묻는 질문</a>
                        </div>
                    </div>
                </div>
                
                <div class="footer_menu">
                    <div class="menu_box">
                        <strong class="menu_title">이용안내</strong>
                        <ul class="menu_list">
                            <li class="footer_menu_item">
                                <a href="./about.do" class="footer_menu_link">About</a>
                            </li>
                            <li class="footer_menu_item">
                                <a href="./about1.do" class="footer_menu_link">가맹점 등록방법</a>
                            </li>
                            <li class="footer_menu_item">
                                <a href="./about2.do" class="footer_menu_link">가맹점 예약방법</a>
                            </li>
                        </ul>
                    </div>
                    <div class="menu_box">
                        <strong class="menu_title">고객지원</strong>
                        <ul class="menu_list">
                            <li class="footer_menu_item">
                                <a href="./board.do?categoryNo=0" class="footer_menu_link">공지사항</a>
                            </li>
                            <li class="footer_menu_item">
                                <a href="./board.do?categoryNo=2" class="footer_menu_link">문의사항</a>
                            </li>
                            <c:if test="${sessionScope.grade gt 1 }">
                            <li class="footer_menu_item">
                                <a href="./board.do?categoryNo=1" class="footer_menu_link">가맹점 게시판</a>
                            </li>
                            </c:if>
                        </ul>
                    </div>
                </div>
                
            </div>
                
            <div class="notice_info"> 
                    <p> made by TeamC</p>
            </div>
        
        </div>
        
    </div>    