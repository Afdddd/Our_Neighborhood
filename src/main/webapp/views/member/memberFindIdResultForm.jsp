<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<% 
String memberId   = (String)request.getAttribute("foundId");
%>
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>Document</title>
  <style>
    .wrap {
    width : 1200px;
    height : 600px;
    margin : auto;
    border : 1px solid lightgray;
}

.findForm {
    width : 600px;
    margin : auto;
    margin-top : 0px;
    padding-top : 30px;

}
.findForm_1 {
    text-align : center;
}

.findForm_2>form {
    width : 350px;
    margin : auto;
    
}

.findForm_2 table {
    width : 100%;
}

.findForm_2 table input,
.findForm_2 table button {
    width : 100%;
    height : 40px;
    box-sizing : border-box;
    border-radius : 5px;
}

.findForm_2 table input {
    border : 1px solid lightgray;
    padding : 10px;
    font-size : 16px;
}


.findForm_2 .etc {
    padding-top : 10px;
    color : gray;
}

.findForm_2 .etc>a {
    color : gray;
    text-decoration : none;
}
.breadcrumbs ol li a {
    color: #f4c005;
}


</style>
</head>
<body>

<!-- boardHeader 인클루드-->

 <%@ include file="../common/boardHeader.jsp" %>
  


  <main id="main">

    <!-- ======= Breadcrumbs ======= -->
    <div class="breadcrumbs d-flex align-items-center" style="background-image: url('assets/img/chuncheonlakecity_940x350.jpg');">
      <div class="container position-relative d-flex flex-column align-items-center" data-aos="fade">
        <h2>아이디 찾기</h2>
        <ol>
            <li><a href="index.html">Home</a></li>
        </ol>
        </div>
    </div><!-- End Breadcrumbs -->

    <!-- ======= Contact Section ======= -->
    <section id="contact" class="contact">
      
      
        <div class="wrap">
         
        <div align="center">
          <br><br><br><br>
          <img src="<%= contextPath %>/resources/img/ONlogo-yellow.png" width="200px" height="200px">
          </div>
          <div class="container" data-aos="fade-up" data-aos-delay="100">
        
            <div class="findForm">

                <div class="findForm_2">
                  <form method="post">
                    <div class="findForm_2">
                      &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<b>회원님의 정보와 일치하는 아이디입니다.</b><br>
                      <br><br>
                      <input type="text" class="form-control" 
                             id="memberId" name="memberId"  readonly value="<%= memberId %>">
                  </form>
                </div>
                
    
            </div>
    
        </div>
        
            </form>
          </div><!-- End Contact Form -->

        </div>

      </div>
    </section><!-- End Contact Section -->

  </main><!-- End #main -->

  

  <!-- 푸터 인클루드-->
  <%@ include file="../common/boardFooter.jsp" %>

</body>

</html>