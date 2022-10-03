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
   <table border="1" cellspacing="0" cellpadding="0" width="100%">
            <tr width="90%">
                <td colspan="1" width="10%" align="center">번호</td>
                <td width="40%" align="center">${get.bno}</td>
                <td width="10%" align="center">추천수</td>
                <td width="40%" align="center">${get.likecnt}</td>
            </tr>
            <tr>
                <td align="center">작성자</td>
                <td colspan="4" align="center">${get.writer}</td>
            </tr>
            <tr>
                <td align="center">제목</td>
                <td colspan="4" style="width: 95%;" align="center">${get.title}</td>
            </tr>
            <tr>
                <td align="center">내용</td>
                <c:if test="${empty get.fileName}" >
                	<td colspan="4" style="width: 100%;height: 400px;">${get.content}</td>
                </c:if>
                <c:if test="${!empty get.fileName}" >
                	<td colspan="4" style="width: 100%;height: 400px; padding: 10px 0 20px 0;  justify-content: center; align-items: center" align="center">${get.content}<br><br><img src="${contextPath}/resources/upload/${get.fileName}" height="400px" width="400px"></td>
                </c:if>
            </tr>
            <tr>
                <td align="center">등록일/수정일</td>
                <td colspan="4" align="center"><fmt:formatDate pattern = "yyyy/MM/dd" value="${get.regDate}"/> <br> <fmt:formatDate pattern = "yyyy/MM/dd" value="${get.regDate}"/></td>
            </tr>
            <tr>
            	
            </tr>
            <c:if test="${!empty mvo}">
	            <tr>
		            <td colspan="4">
		            
		            <div style="text-align: center;">추천하기
				       <a class="btn btn-outline-dark like">
				           <img id="like" src="" width="50px">
				       </a>
				       <span id="likecnt"></span>
				   </div>
		            </td>
	            </tr>
	        </c:if>
	</table>
		<div style="text-align: right">
		<c:if test="${mvo.memName  == get.writer}">
		 <button class="btn btn-primary" onclick="location.href='/board/modify?bno=<c:out value="${get.bno}"/>'">수정</button>
		</c:if>
	     <button class="btn btn-info" onclick="location.href='/board/list'">리스트</button>
	   </div>
  </div>
 </div>
 <br><br>
  
 <div id="nav">
  <%@ include file="../reply/reply.jsp" %>
 </div>
</div>



<script>
    $(document).ready(function () {

        var likeval = ${like};

        if(likeval>0) {
            $("#like").prop("src", "/resources/images/좋아요후.jpg");
            $(".like").prop('name',likeval)
        }
        else {
            $("#like").prop("src", "/resources/images/좋아요전.jpg");
            $(".like").prop('name',likeval)
        }

        $(".like").on("click", function () {

            var that = $(".like");

            var sendData = {'memName' : '${mvo.memName}', 'like' : that.prop('name'), 'bno' : '${get.bno}'};
            $.ajax({
                url :'/board/like',
                type :'POST',
                data : sendData,
                success : function(data){
                    that.prop('name',data);
                    if(data==1) {
                        $('#like').prop("src","/resources/images/좋아요후.jpg");
                    }
                    else{
                        $('#like').prop("src","/resources/images/좋아요전.jpg");
                    }

                }
            });
        });
    });
</script>
</body>
</html>