<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>오늘 뭐 먹지?</title>
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
		<form role="form" action="/board/modify" method="post">
		
		<input type='hidden' name='pageNum' value='<c:out value="${cri.pageNum }"/>'>
        <input type='hidden' name='amount' value='<c:out value="${cri.amount }"/>'>
		
		
		  <div class="form-group">
            <label>번호</label> <input class="form-control" name='bno' value='<c:out value="${get.bno}"/>' readonly="readonly">
          </div>
			
          <div class="form-group">
            <label>제목</label> <input class="form-control" name='title' value='<c:out value="${get.title}"/>'>
          </div>

          <div class="form-group">
            <label>내용</label>
            <textarea class="form-control" rows="3" name='content'><c:out value="${get.content}"/></textarea>
          </div>

          <div class="form-group">
            <label>작성자</label> <input class="form-control" name='writer' value='<c:out value="${get.writer}"/>' readonly="readonly">
          </div>
          
           <div class="form-group">
			  <label>등록일</label> 
			  <input class="form-control" name='regDate' value='<fmt:formatDate pattern = "yyyy/MM/dd" value = "${get.regDate}" />'  readonly="readonly">            
			</div>
		
			<div class="form-group">
			  <label>수정일</label> 
			  <input class="form-control" name='updateDate' value='<fmt:formatDate pattern = "yyyy/MM/dd" value = "${get.updateDate}" />'  readonly="readonly">            
			</div>
          
		<button type="submit" class="btn btn-primary">수정</button>
		<button type="submit" class="btn btn-danger" onclick="location.href='/board/remove?bno=${get.bno}'">삭제</button>
		<button type="button" class="btn btn-info" onclick="location.href='/board/list'">리스트</button>
		</form>
  </div>
 </div>
 <div class="panel-footer">Dip.Student.WooSeok</div>
</div>

</body>
</html>