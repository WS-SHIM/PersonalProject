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
	<form method="post" enctype="multipart/form-data">
		<div class="form-group">
		 <label>제목</label><input type="text" name="title" class="form-control" />
		</div>
		
		<div class="form-group">
		<label>작성자</label><input type="text" name="writer" class="form-control" value="${mvo.memName}" readonly/>
		</div>
		
		<div class="form-group">
		<label>내용</label><textarea rows="3" name="content" class="form-control"></textarea>
		</div>
		
		<div class="form-group">
			<label>사진업로드</label><input type="file" name="uploadFile"/>
		</div>
		
		
		<button type="submit" class="btn btn-primary">등록</button>
		<button type="reset" class="btn btn-warning">취소</button>
		<button type="button" class="btn btn-info" onclick="location.href='/board/list'">리스트</button>
	</form>
 </div>
 <div class="panel-footer">Dip.Student.WooSeok</div>
</div>

</body>
</html>