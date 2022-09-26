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
	<c:if test="${!empty mvo}">
		<div class="panel-heading">
			<button onclick="location.href='/board/register'" type="button" class="btn btn-primary pull-right">게시글 작성</button>
		</div>
	</c:if>
<table class="table table-bordered table-hover">
 <thead>
  <tr>
   <th>번호</th>
   <th>제목</th>
   <th>작성자</th>
   <th>작성일</th>
   <th>수정일</th>
   <th>추천수</th>
  </tr>
 </thead>
 
 <tbody>
 	<c:forEach items="${list}" var="board">
	 <tr>
	 <td><c:out value="${board.bno}" /></td>
	 <td><a href='<c:out value="/board/get?bno=${board.bno}"/>'><c:out value="${board.title}"/></a></td>
     <td><c:out value="${board.writer}" /></td>
	 <td><fmt:formatDate pattern="yyyy-MM-dd" value="${board.regDate}" /></td>
	 <td><fmt:formatDate pattern="yyyy-MM-dd" value="${board.updateDate}"/></td>
	 <td><c:out value="${board.likecnt}" /></td>
	 </tr>
	</c:forEach>
 </tbody>
</table>

<div class="search_wrap">
   <div class="search_area">
 		<select name="type">
           <option value="" <c:out value="${pageMaker.cri.type == null?'selected':'' }"/>>--</option>
           <option value="T" <c:out value="${pageMaker.cri.type eq 'T'?'selected':'' }"/>>제목</option>
           <option value="C" <c:out value="${pageMaker.cri.type eq 'C'?'selected':'' }"/>>내용</option>
           <option value="W" <c:out value="${pageMaker.cri.type eq 'W'?'selected':'' }"/>>작성자</option>
           <option value="TC" <c:out value="${pageMaker.cri.type eq 'TC'?'selected':'' }"/>>제목 + 내용</option>
           <option value="TW" <c:out value="${pageMaker.cri.type eq 'TW'?'selected':'' }"/>>제목 + 작성자</option>
           <option value="TCW" <c:out value="${pageMaker.cri.type eq 'TCW'?'selected':'' }"/>>제목 + 내용 + 작성자</option>
       </select>    
       <input type="text" name="keyword" value="${pageMaker.cri.keyword }">
       <button>검색</button>
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
</div>
<!-- end Pagination -->
<form id="actionForm" action="/board/list" method="get">
	<input type="hidden" name="pageNum" value="${pageMaker.cri.pageNum}">
	<input type="hidden" name="amount" value="${pageMaker.cri.amount}">
	<input type="hidden" name="keyword" value="${pageMaker.cri.keyword}">
	<input type="hidden" name="type" value="${pageMaker.cri.type}">
</form>

<script type="text/javascript">
var actionForm = $("#actionForm");
$(".paginate_button a").on("click", function(e) {
	e.preventDefault();
	actionForm.find("input[name='pageNum']").val($(this).attr("href"));
	actionForm.submit();
});
$(".search_area button").on("click", function(e){
    e.preventDefault();
    
    let type = $(".search_area select").val();
    let keyword = $(".search_area input[name='keyword']").val();
    
    if(!type){
        alert("검색 종류를 선택하세요.");
        return false;
    }
    
    if(!keyword){
        alert("키워드를 입력하세요.");
        return false;
    }        
    
    actionForm.find("input[name='type']").val(type);
    actionForm.find("input[name='keyword']").val(keyword);
    actionForm.find("input[name='pageNum']").val(1);
    actionForm.submit();
});
</script>
</body>
</html>