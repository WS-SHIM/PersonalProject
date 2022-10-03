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
 <c:if test="${!empty mvo}">
	<c:if test="${mvo.memID == 'admin'}">
		<div class="panel-heading">
			<button onclick="location.href='/board/register2'" type="button" class="btn btn-primary pull-right">게시글 작성</button>
		</div>
	</c:if>
<div class="container-sm">
	<div class="font-weight-bold mt-2 mb-2">
		<h3 class="text-info">추천맛집 리스트</h3>
	</div>
	<div class="row card-deck mt-3" style="height:300px;">
	<c:forEach items="${list}" var="board">
	
		<div class="col-sm-3 card border-0" style="height:100%;">
			<div class="wapper h-50 w-100">
				<img class="card-img-top" src="${contextPath}/resources/upload/${board.fileName}" style="height:200px;width:250px;object-fit: cover;">
			</div>
			
			<div class="card-body p-1" style="text-align:left">
				<h4 class="title"><a href='<c:out value="/board/get2?bno=${board.bno}"/>'><c:out value="${board.title}"/></a></h4>
				<p>${board.menu}</p>
				<p>${board.address}</p>
			</div>
		</div>
	</c:forEach>
	</div>
</div>


<!-- 페이지 처리 -->
<div class='pull-right'>
<ul class="pagination">
<!-- 이전페이지 버튼 -->
<c:if test="${pageMaker.prev}">
  <li class="paginate_button previous"><a href="${pageMaker.startPage -1}">Previous</a></li>
</c:if>
<!-- 각 번호 페이지 버튼 -->
<c:forEach var="num" begin="${pageMaker.startPage}" end="${pageMaker.endPage}">
 <li class="paginate_button ${pageMaker.cri.pageNum == num ? 'active' : ''}"><a href="${num}">${num}</a></li>
</c:forEach>
<!-- 다음페이지 버튼 -->
<c:if test="${pageMaker.next}">
 <li class="paginate_button next"><a href="${pageMaker.endPage +1}">Next</a></li>
</c:if>
</ul>
</div>
<br><br><br>
<div class="panel-footer">Dip.Student.WooSeok</div>
</div>
<!-- end Pagination -->
<form id="actionForm" action="/board/list" method="get">
	<input type="hidden" name="pageNum" value="${pageMaker.cri.pageNum}">
	<input type="hidden" name="amount" value="${pageMaker.cri.amount}">
	<input type="hidden" name="keyword" value="${pageMaker.cri.keyword}">
	<input type="hidden" name="type" value="${pageMaker.cri.type}">
</form>
</c:if>
<c:if test="${empty mvo}">
<div style="text-align: center; font-size: 2.0em; padding : 200px 0"  >
로그인 후 이용가능합니다. <br><br><br>
<a href="/memLoginForm.do">로그인으로 이동</a>
</div>
</c:if>


<script type="text/javascript">
var actionForm = $("#actionForm");
$(".paginate_button a").on("click", function(e) {
	e.preventDefault();
	actionForm.find("input[name='pageNum']").val($(this).attr("href"));
	actionForm.submit();
});
</script>
</body>
</html>