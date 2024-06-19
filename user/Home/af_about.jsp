<%@ page language="java" contentType ="text/html" pageEncoding="utf-8" %>

<!DOCTYPE html>
<html>
<head>
<title>내방어때?</title>
<!-- for-mobile-apps -->
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<script type="application/x-javascript"> addEventListener("load", function() { setTimeout(hideURLbar, 0); }, false);
      function hideURLbar(){ window.scrollTo(0,1); } </script>
      <script src="dist/timepicker-ui.umd.js"></script>
<!-- //for-mobile-apps -->
<link href="/css/bootstrap.css" rel="stylesheet" type="text/css" media="all" />
<link href="/css/style.css" rel="stylesheet" type="text/css" media="all" />
<link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet" />
<!-- js -->
<script src="/js/jquery-1.11.1.min.js"></script>
<!-- //js -->
<!-- login-pop-up -->
<script src="/js/menu_jquery.js"></script>
<!-- //login-pop-up -->
<!-- animation-effect -->
<link href="css/animate.min.css" rel="stylesheet"> 
<script src="/js/wow.min.js"></script>
<script type="text/javascript" src="https://openapi.map.naver.com/openapi/v3/maps.js?ncpClientId=62krrn2cvz&submodules=geocoder"></script>
<script>
 new WOW().init();
</script>
<!-- //animation-effect -->
<link href='//fonts.googleapis.com/css?family=Open+Sans:400,300,300italic,400italic,600,600italic,700,700italic,800,800italic' rel='stylesheet' type='text/css'>
<link href='//fonts.googleapis.com/css?family=Oswald:400,300,700' rel='stylesheet' type='text/css'>
</head>
   
<body>
<!-- header -->
   <div class="header-top">
      <div class="container">
         <div class="header-top-left animated wow slideInLeft" data-wow-delay=".5s">
            <p>자취방 대여 필요할 때 내방어때?</p>
         </div>
         <div class="header-top-left1 animated wow slideInLeft" data-wow-delay=".7s">
            <h1>담당자 연락처 010-4072-6238 <span class="glyphicon glyphicon-earphone" aria-hidden="true"></span></h1>
         </div>
         <div class="header-top-right">
            <div class="logoutContainer_logout">
               <form action="/jsp/logout.jsp">
                  <input type="submit" id="logoutButton" value="Logout">
               </form>
            </div>
         </div>
         <div class="clearfix"> </div>
      </div>
      <div class="header-top-right">
      
         <div class="dropdown">
            
            <button class="dropbtn">개인정보 관리</button>
            
            <div class="dropdown-content">
            
               <a href="modInfo.jsp">개인정보 변경</a>
               
               <a href="/user/Home/check_reser.jsp">예약 내역확인</a>
                    <a href="room_regis_check.jsp">내방 관리</a>
                    <a href="af_report.jsp">신고 내역</a> 
            </div>
         </div>
      
      </div>
   </div>
</div>
   <div class="header-nav">
      <div class="container">
         <nav class="navbar navbar-default">
            <!-- Brand and toggle get grouped for better mobile display -->
            <div class="navbar-header">
               <button type="button" class="navbar-toggle collapsed" data-toggle="collapse"
                  data-target="#bs-example-navbar-collapse-1">
                  <span class="sr-only">Toggle navigation</span>
                  <span class="icon-bar"></span>
                  <span class="icon-bar"></span>
                  <span class="icon-bar"></span>
               </button>
               <div class="logo animated wow slideInLeft" data-wow-delay=".5s">
                  <a class="navbar-brand" href="/user/Home/af_Logout.jsp">내방어때? <span>자취방대여플랫폼</span></a>
               </div>
            </div>

            <!-- Collect the nav links, forms, and other content for toggling -->
            <div class="collapse navbar-collapse nav-wil" id="bs-example-navbar-collapse-1">
               <ul class="nav navbar-nav">
                  <li><a href="/user/Home/af_Logout.jsp">Home</a></li>
                  <li class="active"><a href="/user/Home/af_about.jsp">방 등록</a></li>
                  <li><a href="/user/Home/af_codes.jsp">방 검색 및 예약</a></li>
                  <li><a href="/user/Home/af_blog.jsp">공지사항</a></li>
                  <li><a href="/user/Home/af_contact.jsp">1:1문의 내역</a></li>
               </ul>

               
            </div><!-- /.navbar-collapse -->

         </nav>
      </div>
   </div>
   <!-- //header -->
   <!-- banner -->
    <div class="about_banner-bottom">
        <div class="about_banner-bottom-grids">
            <div class="container">
                <div class="list-layer">
                    <form class="form-horizontal" id="my-form" action="../room/Registration/registration.jsp" name="my" enctype="multipart/form-data">
                        <table class="table table-bordered">
                            <colgroup>
                                <col width="136px"/>
                                <col width="778px"/>
                            </colgroup>
                            <thead></thead>
                            <tbody>
                                <tr>
                                    <th>호스트 정보</th>
                                    <td>
                                        <div class="form-layer mb_24">
                                            <span class="form-title">아이디</span>
                                            <span class="form-body">
                                                <input class="form-control normal-size" type="text" name="user_id" placeholder="아이디를 입력하세요." / required="required">
                                            </span>
                                        </div>

                                        <div class="form-layer mb_24">
                                            <div>
                                                <span class="form-title">휴대폰 번호</span>
                                                <span class="form-body">
                                                    <div class="select-style small-size">
                                                        <select name="phone1">
                                                            <option value="010">010</option>
                                                            <option value="011">011</option>
                                                            <option value="016">016</option>
                                                            <option value="017">017</option>
                                                            <option value="018">018</option>
                                                            <option value="019">019</option>
                                                        </select>
                                                    </div>
                                                    <input class="form-control small-size" type="text" name="phone2" value="" required="required" minlength="4" maxlength="4">
                                                    <input class="form-control small-size" type="text" name="phone3" value="" required="required" minlength="4" maxlength="4">
                                                </span>
                                            </div>
                                    </td>
                                </tr>
                                <tr>
                                    <th>예약 정산<br/>입금 계좌 정보</th>
                                    <td>
                                        <div class="form-layer mb_24">
                                            <span class="form-title">거래 은행</span>
                                            <span class="form-body">
                                                <div class="select-style normal-size">
                                                    <select name="bank_select">
                                                        <option value="">선택</option>
                                                        <option value="한국은행">한국은행</option>
                                                        <option value="산업은행">산업은행</option>
                                                        <option value="기업은행">기업은행</option>
                                                        <option value="국민은행">국민은행</option>
                                                        <option value="외환은행">외환은행</option>
                                                        <option value="수협중앙회">수협중앙회</option>
                                                        <option value="수출입은행">수출입은행</option>
                                                        <option value="농협중앙회">농협중앙회</option>
                                                        <option value="단위농협(축협)">단위농협(축협)</option>
                                                        <option value="우리은행">우리은행</option>
                                                        <option value="SC제일은행">SC제일은행</option>
                                                        <option value="한국씨티은행">한국씨티은행</option>
                                                        <option value="새마을금고">새마을금고</option>
                                                        <option value="신협중앙회">신협중앙회</option>
                                                        <option value="우체국">우체국</option>
                                                        <option value="하나은행">하나은행</option>
                                                        <option value="신한은행">신한은행</option>
                                                        <option value="대구은행">대구은행</option>
                                                        <option value="부산은행">부산은행</option>
                                                        <option value="광주은행">광주은행</option>
                                                        <option value="제주은행">제주은행</option>
                                                        <option value="전북은행">전북은행</option>
                                                        <option value="경남은행">경남은행</option>
                                                        <option value="상호저축은행">상호저축은행</option>
                                                        <option value="산림조합중앙회">산림조합중앙회</option>
                                                        <option value="케이뱅크">케이뱅크</option>
                                                        <option value="카카오뱅크">카카오뱅크</option>
                                                    </select>
                                                </div>
                                            </span>
                                        </div>
                                        <div class="form-layer mb_24">
                                            <span class="form-title">예금주 성</span>
                                            <span class="form-body">
                                                <input class="form-control middle-size" name="account_holder" type="text" placeholder="성을 입력하세요."  required/>
                                            </span>
                                            <span class="form-title">예금주 이름</span>
                                            <span class="form-body">
                                                <input class="form-control middle-size" name="account_holder2" type="text" placeholder="이름을 입력하세요."  required/>
                                            </span>
                                        </div>
                                        <div class="form-layer mb_08">
                                            <span class="form-title">계좌 번호</span>
                                            <span class="form-body">
                                                <input class="form-control normal-size" name="account_num" type="text" placeholder="숫자만 입력하세요." required/>
                                            </span>
                                        </div>
                                    </td>
                                </tr>
                                <tr>
                                    <th>방 등록 사진</th>
                                    <td>
                                        <label>사진 업로드</label>
                                        <input type="file" id="updatefile" name="img" required>
                                    </td>
                                </tr>
                                <tr>
                                    <th>방 위치 및 옵션</th>
                                    <td>
                                        <div class="form-layer mb_24">
                                            <span class="form-title">옵션</span>
                                            <label class="checkbox-inline icon-label">
                                                <input type="checkbox" value="com" name="option">컴퓨터</label>
                                            <label class="checkbox-inline icon-label">
                                                <input type="checkbox" value="micro"name="option">전자레인지</label>
                                            <label class="checkbox-inline icon-label">
                                                <input type="checkbox" value="airfy" name="option">에어프라이기</label>
                                            <label class="checkbox-inline icon-label">
                                                <input type="checkbox" value="tv" name="option">TV</label>
                                            <label class="checkbox-inline icon-label">
                                                <input type="checkbox" value="laund" name="option">세탁기</label>
                                            <label class="checkbox-inline icon-label">
                                                <input type="checkbox" value="aircon" name="option">에어컨</label>
                                            <label class="checkbox-inline icon-label">
                                                <input type="checkbox" value="refri" name="option">냉장고</label>
                                            <label class="checkbox-inline icon-label">
                                                <input type="checkbox" value="wifi" name="option">wi-fi</label>
                                            <label class="checkbox-inline icon-label">
                                                <input type="checkbox" value="tableware" name="option">식기</label>
                                            <label class="checkbox-inline icon-label">
                                                <input type="checkbox" value="kitchen" name="option">주방도구</label>
                                            <label class="checkbox-inline icon-label">
                                                <input type="checkbox" value="tow" name="option">수건</label>
                                            <label class="checkbox-inline icon-label">
                                                <input type="checkbox" value="bed" name="option">침대</label>
                                            <label class="checkbox-inline icon-label">
                                                <input type="checkbox" value="desk" name="option">책상</label>
                                            <label class="checkbox-inline icon-label">
                                                <input type="checkbox" value="drawer" name="option">서랍장</label>
                                            <br>
                                        </div>
                                        <div class="form-layer mb_24">
                                            <span class="form-title">방 주소</span>
                                            <span class="form-body">
                                                <input class="form-control normal-size" id="input_roadAddress" type="text" name="address1" readonly="readonly" placeholder="등록할 방 주소를 입력하세요." required/>
                                                <button type="button" class="btn btn-yeogi btn-normal-layer" id="postCode" onclick="daumPostCode()">주소 검색</button>
                                                   <input type="hidden" id ="entX" name="entX" value="none">
                                                   <input type="hidden"  id ="entY"name="entY" value="none">
                                            </span>
                                        </div>
                                        <div class="form-layer newline">
                                            <span class="form-body">
                                                <input class="form-control normal-size" id="input_addrDetail" type="text" name="address2" placeholder="나머지 주소를 입력하세요." value=""/>
                                            </span>
                                        </div>

                                    </td>
                                </tr>
                                <script>
                                        function daumPostCode(){
                                            var pop = window.open("jusoPopup.jsp", "pop", "width=570,height=420, scrollbars=yes, resizable=yes");
                                        }
                                        function jusoCallBack(roadFullAddr, roadAddrPart1, addrDetail, roadAddrPart2, engAddr, jibunAddr, zipNo, admCd, rnMgtSn, bdMgtSn
                                   , detBdNmList, bdNm, bdKdcd, siNm, sggNm, emdNm, liNm, rn, udrtYn, buldMnnm, buldSlno, mtYn, lnbrMnnm, lnbrSlno, emdNo,entX,entY,juso_list) {
                                        document.getElementById("input_roadAddress").value = roadAddrPart1;
                                        document.getElementById("input_addrDetail").value = addrDetail;

                                        var utmk = new naver.maps.Point(entX,entY);
                                        var utmktocooord =naver.maps.UTMKCoord.fromCoordToLatLng(utmk);
                                        document.getElementById("entX").value = utmktocooord.y;
                                        document.getElementById("entY").value = utmktocooord.x;
                                    
                                        
                                   }
                                        </script>
                                <tr>
                                    <th>예약 가능시간</th>
                                    <td>
                                    <div class="form-layer mb_24">
                                            <span class="form-date">날 짜</span>
                                            <span class="form-body">
                                                <input type='date' id="startday" name="startday"/> ~ <input type='date' id="lastday" name="lastday"/>
                                            </span>
                                        </div>
                                        <script>
                                            document
                                                .getElementById('currentDate')
                                                .value = new Date()
                                                .toISOString()
                                                .substring(0, 10);
                                        </script>
                                        <div class="form-layer mb_24">
                                            <div class="starttime">
                                                <span class="form-clock">시작 시간</span>
                                                <span class="form-body">
                                                    <input type="time" id="startime" name="startime" required="required"></span>
                                            </div>
                                            <br>
                                            <br>
                                            <div class="endtime">
                                                <span class="form-lastclock">종료 시간</span>
                                                <span class="form-body">
                                                    <input type="time" id="lastime" name="lastime" required="required"></span>
                                            </div>
                                        </div>
                                    </td>
                                </tr>
                                <tr>
                                    <th>가 격</th>
                                    <td>
                                        <div class="form-price">
                                            <span class="price-body">
                                                <input class="form-control middle-size" type="text" name="price" placeholder="가격을 입력하세요." value="" / required style="text-align:right";> 
                                                <p style = "padding-top : 1%;">원</p>
                                            </span>
                                        </div>
                                    </td>
                                </tr>
                                <tr>
                                    <th>이용시 주의사항</th>
                                    <td>
                                        <ul class="hide_type_half" style="list-style: none;">
                                            <li>
                                                <p>흡연 가능여부 :</p>
                                                <input type="radio" id="tmino_35" name="smoke" class="inp_radio" value="true">
                                                <label for="tmino_35" class="label_radio">가능</label>
                                                &nbsp;&nbsp;&nbsp;
                                                <input type="radio" id="tmino_36" name="smoke" class="inp_radio" value="false">
                                                <label for="tmino_36" class="label_radio">불가능</label>
                                            </li>
                                            <li>
                                                <p>음주 가능여부 :</p>
                                                    <input type="radio" id="tmino_37" name="drink" class="inp_radio" value="true">
                                                    <label for="tmino_38" class="label_radio">가능</label>
                                                    &nbsp;&nbsp;&nbsp;
                                                    <input type="radio" id="tmino_38" name="drink" class="inp_radio" value="false">
                                                    <label for="tmino_39" class="label_radio">불가능</label>
                                            </li>
                                            <br>
                                            <textarea style="height: 200px; width:750px; resize: none;" name="jeondal" placeholder="사용자에게 전달할 내용을 적어주세요." maxlength="50"></textarea>
                                        </ul>
                                    </td>
                                </tr>
                            </tbody>
                        </table>
                        <div class="submit-layer">
                            <button class="btn btn-yeogi btn-submit" type="submit">등록하기</button>
                        </div>
                    </form>
                </div>
            </div>
        </div>
    </div>
    <!-- footer -->
    <div class="footer">
        <h3 style="color:'white'">Our Manager</h3>
        <div class="dealer-grid">
            <div class="dealer-grid-first">
                <img src="/images/ksh.jpg" alt=" " class="img-responsive" />
                <h4>SangHyeok Kang</h4>
                <div class="f_detail">
                    <p>H.P 010-4072-6238</p>
                    <p>
                        18. 동의대학교 ICT공과대학 창의소프트웨어공학부 입학 <br>
                        19. 제 21대 컴퓨터소프트웨어공학과 학생회 홍보부장 <br>
                        21. 대한민국 육군 병장 만기전역 <br>
                    </p>
                </div>
            </div>
            <div class="dealer-grid-second">
                <img src="/images/sjs.jpg" alt=" " class="img-responsive" />
                <h4>JunSeop Song</h4>
                <div class="s_detail">
                    <p>H.P 010-2358-1817</p>
                    <p>
                        18. 동의대학교 ICT공과대학 창의소프트웨어공학부 입학 <br>
                        20. 대한민국 육군 병장 만기전역 <br>
                        21. 제 23대 컴퓨터소프트웨어공학과 학생회 홍보부장 <br>
                        22. 제 24대 컴퓨터소프트웨어공학과 학생회 부학회장 <br>
                    </p>
                </div>
            </div>
            <div class="dealer-grid-third">
                <img src="/images/kms.jpg" alt=" " class="img-responsive" />
                <h4>MinSeung Kim</h4>
                <p>H.P 010-4503-2737</p>
                <p>
                    18. 동의대학교 ICT공과대학 창의소프트웨어공학부 입학 <br>
                    20. 대한민국 해병대 병장 만기전역 <br>
                </p>
            </div>
            <div class="dealer-grid-fourth">
                <img src="/images/ksc.jpg" alt=" " class="img-responsive" />
                <h4>SungChan Kim</h4>
                <p>H.P 010-9440-7438</p>
                    <p>
                        18. 동의대학교 ICT공과대학 창의소프트웨어공학부 입학 <br>
                        19. 제 21대 컴퓨터소프트웨어공학과 학생회 기획부장 <br>
                        21. 대한민국 해군 병장 만기전역
                    </p>
            </div>               
        </div>
    </div>
    <!-- //footer -->
    <!-- for bootstrap working -->
    <script src="js/bootstrap.js"></script>
    <!-- //for bootstrap working -->
</body>
</html>