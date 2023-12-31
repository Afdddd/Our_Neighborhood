<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8" import="com.kh.bbq_reservation.model.vo.BbqReservation"%>
<%
BbqReservation bbq = (BbqReservation)request.getAttribute("bbq");
%>
<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>reservation</title>

    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.0/jquery.min.js"></script>

    <style>
      .outer {
        width: 600px;
        height: 600px;
        margin: auto;
      }

      .seatSlide-outer {
        margin: auto;
        width: 100%;
        overflow-x: hidden;
      }

      .showcase {
        width: 300px;
        background-color: #777;
        background: rgba(0, 0, 0, 0.1);
        border-radius: 5px;
        display: flex;
        justify-content: center;
        margin: auto;
        margin-top: 30px;
        margin-bottom: 30px;
        padding: 5px 10px;
      }

      li {
        display: flex;
        justify-content: center;
        align-items: center;
        margin-left: 10px;
      }

      .availableSeat {
        background-color: #444451;
        width: 15px;
        height: 12px;
        border-radius: 3px;
        cursor: default;
      }

      .selectedSeatIcon {
        background-color: #f4c005;
        width: 15px;
        height: 12px;
        border-radius: 3px;
        cursor: default;
      }

      .occupiedSeat {
        background-color: #fff;
        width: 15px;
        height: 12px;
        border-radius: 8px;
        text-align: center;
      }

      table td {
        height: 40px;
        width: 40px;
      }
      table {
        background-color: #242333;
      }

      .seat {
        background-color: #444451;
        color: white;
        text-align: center;
        border-radius: 8px;
        cursor: pointer;
      }

      .seat-table {
        padding: 30px;
        border-radius: 10px;
        width: 100%;
        height: 100%;
      }

      .seat:hover {
        scale: 1.1;
      }

      .selectedSeat:hover {
        scale: 1.1;
      }

      .selectedSeat {
        background-color: #f4c005;
        color: white;
        text-align: center;
        border-radius: 8px;
        cursor: pointer;
      }

      #usingInfo {
        width: 100%;
        height: 220px;
        padding: 20px;
        background-color: #777;
        background: rgba(0, 0, 0, 0.1);
        border-radius: 5px;
        margin: auto;
        margin-top: 100px;
        margin-bottom: 100px;
      }

      .seatContainer {
        transition: 0.3s ease-out;
        display: flex;
        width: 1020px;
        height: 400px;
        margin: auto;
      }

      .seatSlides {
        padding: 10px;
        float: left;
      }

      #area-menu {
        width: 100%;
        height: 50px;
        margin: auto;
      }

      .menu-btn {
        width: 40%;
        height: 100%;
        text-align: center;
        cursor: pointer;
        color: #333;
        font-weight: bold;
        border: none;
        background-color: white;
      }

      .menu-btn:hover,
      .menu-btn.active {
        border-bottom: 1px solid black;
      }

      #button-right {
        float: right;
      }

      .form-box {
        padding: 10px;
        width: 200px;
        height: 480px;
        border: 1px solid;
        border-radius: 8px;
        position: relative;
        bottom: 250px;
        left: 1400px;
      }
      .resPresent {
        padding: 10px;
        width: 200px;
        height: 480px;
        border: 1px solid;
        border-radius: 8px;
        position: relative;
        bottom: 730px;
        left: 100px;
      }
      .form-box > form {
        box-sizing: border-box;
      }

      #form-name {
        border: 0px;
      }

      button[type="submit"] {
       border: 0px;
       color: white;
       font-size: 18px;
       font-weight: 500;
       width : 70px;
       height : 35px;
       float: right;
       border-radius: 8px;
       background-color: #f4c005;
       margin-left: 10px;
       margin-top: 10px;
       }

       button[type="reset"] {
       border: 0px;
       color: white;
       font-size: 18px;
       font-weight: 500;
       width : 70px;
       height : 35px;
       float: right;
       border-radius: 8px;
       background-color: gray;
       margin-top: 10px;
       }
       
    </style>
  </head>
  <body>
    <!-- boardHeader 인클루드-->

    <%@ include file="/views/common/boardHeader.jsp" %>

    <!-- ======= Breadcrumbs ======= -->
    <div
      class="breadcrumbs d-flex align-items-center"
      style="background-image: url('./resources/img/board/apartmentpic/apartmentpic.jpg')"
    >
      <div
        class="container position-relative d-flex flex-column align-items-center"
        data-aos="fade"
      >
        <h2>바베큐장 예약</h2>
        <ol>
          <li><a href="index.html">메인 페이지</a></li>
          <li>바베큐장</li>
        </ol>
      </div>
    </div>
    <!-- End Breadcrumbs -->

    <div class="outer">
      <div id="usingInfo">
        <h3 align="center">이용안내</h3>
        <br>
        <p>* 예약인원 외의 방문객은 입장불가입니다.</p>
        <p>* 불꽃놀이, 풍등 날리기 등의 화재위험이 있는 행위는 금지합니다.</p>
        <p>* 미성년자는 보호자 동반 없이 이용 할 수 없습니다.</p></p>
      </div>

      <div id="area-menu">
        <button class="menu-btn" id="button-left" onclick="change_btn(event)">
          A구역
        </button>
        <button class="menu-btn" id="button-right" onclick="change_btn(event)">
          B구역
        </button>
      </div>

      <ul class="showcase">
        <li>
          <div class="availableSeat"></div>
          <small class="small">&nbsp;&nbsp;선택가능</small>
        </li>
        <li>
          <div class="selectedSeatIcon"></div>
          <small class="small">&nbsp;&nbsp;선택</small>
        </li>
        <li>
          <div class="occupiedSeat"></div>
          <small class="small">&nbsp;&nbsp;예약됨</small>
        </li>
      </ul>

      <div class="seatSlide-outer">
        <div class="seatContainer">
          <div class="seatSlides">
            <table class="seat-table" id="seat-table1">
              <tbody>
                <tr>
                  <td class="seat allSeat" onclick="change_seat(event);">1</td>
                  <td></td>
                  <td></td>
                  <td></td>
                  <td class="seat allSeat" onclick="change_seat(event);">2</td>
                </tr>
                <tr>
                  <td></td>
                  <td></td>
                  <td class="seat allSeat" onclick="change_seat(event);">3</td>
                  <td></td>
                  <td></td>
                </tr>
                <tr>
                  <td class="seat allSeat" onclick="change_seat(event);">4</td>
                  <td></td>
                  <td></td>
                  <td></td>
                  <td class="seat allSeat" onclick="change_seat(event);">5</td>
                </tr>
              </tbody>
            </table>
          </div>
          <div class="seatSlides">
            <table class="seat-table" id="seat-table2">
              <tbody>
                <tr>
                  <td
                    class="seat allSeat"
                    colspan="2"
                    onclick="change_seat(event);"
                  >6</td>
                  <td></td>
                  <td
                    class="seat allSeat"
                    colspan="2"
                    onclick="change_seat(event);"
                  >7</td>
                </tr>
                <tr>
                  <td></td>
                  <td></td>
                  <td></td>
                  <td></td>
                  <td></td>
                </tr>
                <tr>
                  <td
                    class="seat allSeat"
                    colspan="2"
                    onclick="change_seat(event);"
                  >8</td>
                  <td></td>
                  <td
                    class="seat allSeat"
                    colspan="2"
                    onclick="change_seat(event);"
                  >9</td>
                </tr>
              </tbody>
            </table>
          </div>
        </div>
      </div>
    </div>

    <div class="form-box">
      <form action="<%=contextPath %>/reservation.bq" method="post" onsubmit="return vaildateRes()">
        <script>

          var bbqStatus = "<%=bbq%>";
          console.log(bbqStatus);
         function vaildateRes(){	
           
         
           if(bbqStatus=='null'){
             return true;
           }else{
             alert("이미 예약하셨습니다. 다음에 에약해주세요.");
             return false;
           }
           
                       
         }
         
         </script>
        <input
          type="text"
          id="form-name"
          name="resPlace"
          readonly
          placeholder="자리를 선택해주세요."
          required
        >

        <br><br>
        <p><b>* 예약 날짜</b></p>

        <input
          type="date"
          name="resDate"
          id="resDate"
          data-placeholder="날짜 선택"
          required
        />

        <script>
          let today = new Date();
          let year = today.getFullYear();
          let month = today.getMonth() + 1;
          let day = today.getDate();
          let dateString = year + "-" + month + "-" + day;

          let resDate = document.getElementById("resDate");
          resDate.setAttribute("min", dateString);
        </script>

        <br />
        <br />
        <b>* 예약인 성함</b>
        <br>
        <input type="text" name="resName" required style="width: 180px;"><br><br>

        <p><b>* 예약 인원</b></p>
        <select name="resPeople" id="reservation_person" required>
          <option>1</option>
          <option>2</option>
          <option>3</option>
          <option>4</option>
        </select>
        명<br><br>

        <p><b>예약 메세지</b></p>
        <textarea name="resMsg" style="width: 180px;  resize:none;"> </textarea>
        <button type="submit" class="formSubmit">예약</button>
        <button type="reset">초기화</button>
      </form>
    </div>
    <div class="resPresent" style="height:450px;">
      <h2>예약 현황</h2>
      <br>
      <div class="resResult">
      <br>
      
      <%if(bbq!=null){%>
        이름  &nbsp;&nbsp;<input type="text" name="resName" value="<%=bbq.getResName()%>" style="width:120px;" readonly><br><br>
        날짜  &nbsp;&nbsp;<input type="date" name="resDate" value="<%=bbq.getResDate()%>" style="width:120px;" readonly><br><br>
        좌석  &nbsp;&nbsp;<input type="text" name="resSeat" value="<%=bbq.getResPlace()%>" style="width:120px;" readonly><br><br>
        인원  &nbsp;&nbsp;<input type="text" name="resPeople" value="<%=bbq.getResPeople()%>" style="width:120px;" readonly><br><br>
        예약 메세지:<br>
        <textarea name="resMsg" style="width:170px; resize:none;" readonly ><%=bbq.getResMsg() %></textarea><br><br>
        <button class="btn btn-secondary btn-sm" style="float:right;" onclick="location.href='<%=contextPath%>/resDelete.bbq?bbq=<%=bbq.getResNo()%>';">예약 취소</button>
      <%}else{%>
      	<h4>조회된 예약이 <br> 없습니다.</h4>
      <%} %>
      </div>
      
		
    </div>

    <script>
      let formName = document.getElementById("form-name");
      let reservationPerson = document.getElementById("reservation_person");

      // 구역 클릭
      function change_btn(e) {
        var btns = document.querySelectorAll(".menu-btn");
        btns.forEach(function (btn, i) {
          if (e.currentTarget == btn) {
            btn.classList.add("active");
          } else {
            btn.classList.remove("active");
          }
        });

        if (e.target.id == "button-right") {
          reservationPerson[0].selected = true;
          reservationPerson[0].innerHTML = 5;
          reservationPerson[1].innerHTML = 6;
          reservationPerson[2].innerHTML = 7;
          reservationPerson[3].innerHTML = 8;
        } else if (e.target.id == "button-left") {
          reservationPerson[0].selected = true;
          reservationPerson[0].innerHTML = 1;
          reservationPerson[1].innerHTML = 2;
          reservationPerson[2].innerHTML = 3;
          reservationPerson[3].innerHTML = 4;
        }
      }

      /*
                자리 클릭 이벤트
              */

      function change_seat(e) {
        // console.log(e);

        var btns = document.querySelectorAll(".seat");

        btns.forEach(function (btn, i) {
          if (e.currentTarget == btn) {
            btn.classList.add("selectedSeat");
            formName.value = e.target.innerHTML;
          } else {
            btn.classList.remove("selectedSeat");
          }
        });
      }

      $(function () {
        document.getElementById("button-left").classList.add("active");

        /*
              slide 사이즈 동적으로 구하기
            */
        const outer = document.querySelector(".seatSlide-outer");
        const innerList = document.querySelector(".seatContainer");
        const inners = document.querySelectorAll(".seatSlides");
        let currentIndex = 0; // 현재 슬라이드 화면 인덱스

        inners.forEach((inner) => {
          // inner.style.width = `${outer.clientWidth}px`; // inner의 width를 모두 outer의 width로 만들기
          inner.style.width = "600px";
        });

        // innerList.style.width = `${outer.clientWidth * inners.length}px`; // innerList의 width를 inner의 width * inner의 개수로 만들기
        innerList.style.width = "1200px";
        /* 
              버튼에 이벤트 등록하기
            */
        const buttonLeft = document.querySelector("#button-left");
        const buttonRight = document.querySelector("#button-right");

        buttonLeft.addEventListener("click", () => {
          currentIndex--;
          currentIndex = currentIndex < 0 ? 0 : currentIndex; // index값이 0보다 작아질 경우 0으로 변경
          innerList.style.marginLeft =
            outer.clientWidth * currentIndex * -1 + "px"; // index만큼 margin을 주어 옆으로 밀기
        });

        buttonRight.addEventListener("click", () => {
          currentIndex++;
          currentIndex =
            currentIndex >= inners.length ? inners.length - 1 : currentIndex; // index값이 inner의 총 개수보다 많아질 경우 마지막 인덱스값으로 변경
          innerList.style.marginLeft =
            outer.clientWidth * currentIndex * -1 + "px"; // index만큼 margin을 주어 옆으로 밀기
        });

        $("#resDate").change(function () {
          $("#form-name").val("");

          let seat = $(".allSeat");

          $.ajax({
            url: "<%=contextPath%>/selectRes.bq",
            type: "get",
            data: {
              resDate: $("#resDate").val()
            },
            success: function (result) {
           
              for (let i = 0; i < seat.length; i++) {
                //  전체 테이블 1 2 3 4 5 6 7 8 9

                $(seat[i]).removeClass("occupiedSeat");
                $(seat[i]).addClass("seat");
                $(seat[i]).removeClass("selectedSeat");

                for (let j = 0; j < result.length; j++) {
                  //사용중인 테이블
					
                  if (seat[i].innerText == result[j]) {
                    $(seat[i]).addClass("occupiedSeat");
                    $(seat[i]).removeClass("seat");
                  }
                }
              }
            },
            error: function () {
              console.log("fail");
            }
          });
        });
      });
    </script>

    <!-- 푸터 인클루드-->
    <%@ include file="../common/boardFooter.jsp" %>
  </body>
</html>
