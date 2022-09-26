<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>오늘 뭐먹지?</title>
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/handlebars.js/4.0.11/handlebars.min.js"></script>
<script src="//dapi.kakao.com/v2/maps/sdk.js?appkey=3991ef6aea5096bb617fa9b3c7a2a715&libraries=services"></script>
</head>
<body>
<div class="container">
 <%@ include file="../include/nav.jsp" %>
 <div class="panel-heading">
   <div class="panel-body">
   <h3 style="text-align: center">상세보기</h2>
   <table border="1" cellspacing="0" cellpadding="0" width="90%">
            <tr width="90%">
                <td width="10%" align="center">번호</td>
                <td width="50%" align="center">${get.bno}</td>
            </tr>
            <tr>
                <td align="center">작성자</td>
                <td align="center">${get.writer}</td>
            </tr>
            <tr>
                <td align="center">제목</td>
                <td style="width: 95%;" align="center">${get.title}</td>
            </tr>
            <tr>
                <td align="center">내용</td>
                <td style="width: 100%;height: 400px;">${get.content}</td>
            </tr>
            <tr>
                <td align="center">등록일</td>
                <td align="center"><fmt:formatDate pattern = "yyyy/MM/dd" value="${get.regDate}"/></td>
            </tr>
            <tr>
            	<td align="center">수정일</td>
                <td align="center"><fmt:formatDate pattern = "yyyy/MM/dd" value="${get.regDate}"/></td>
            </tr>
	</table>   
	<c:if test="${mvo.memName  == get.writer}">
	 <button class="btn btn-primary" onclick="location.href='/board/modify?bno=<c:out value="${get.bno}"/>'">수정</button>
	</c:if>
     <button class="btn btn-info" onclick="location.href='/board/list'">리스트</button>
   
  </div>
 </div>
 <div id="nav">
  <%@ include file="../reply/reply.jsp" %>
 </div>
</div>
</body>
</html>