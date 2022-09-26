<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<c:if test="${!empty mvo}">
	<div class="col-lg-12">
	    <div class="card">
	        <div class="card-header with-border">
	            <h3 class="card-title">댓글 작성</h3>
	        </div>
	        <div class="card-body">
	            <div class="row">
		            <div class="form-group col-sm-8">
		            	<input class="form-control input-sm" id="newReplyText" type="text" placeholder="댓글 입력...">
		            </div>
		            <div class="form-group col-sm-2">
		            	<input class="form-control input-sm" id="newReplyWriter" type="text" value="${mvo.memName}" readonly>
					</div>
					<div class="form-group col-sm-2">
						<button type="button" class="btn btn-primary btn-sm btn-block replyAddBtn"><i class="fa fa-save"></i> 저장</button>
					</div>
				</div>	
	        </div>
	        <div class="card-footer">
	            <ul id="replies">
	
	            </ul>
	        </div>
	        <div class="card-footer">
			<nav aria-label="Contacts Page Navigation">
	                <ul class="pagination pagination-sm no-margin justify-content-center m-0">
	
	                </ul>
	            </nav>
	        </div>
	    </div>
	</div>
</c:if>
  <div class="modal fade" id="modifyModal" role="dialog">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal">&times;</button>
                <h4 class="modal-title">댓글 수정창</h4>
            </div>
            <div class="modal-body">
                <div class="form-group">
                    <label for="reply_no">댓글 번호</label>
                    <input class="form-control" id="reply_no" name="reply_no" readonly>
                </div>
                <div class="form-group">
                    <label for="reply_text">댓글 내용</label>
                    <input class="form-control" id="reply_text" name="reply_text" placeholder="댓글 내용을 입력해주세요">
                </div>
                <div class="form-group">
                    <label for="reply_writer">댓글 작성자</label>
                    <input class="form-control" id="reply_writer" name="reply_writer" readonly>
                </div>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-default pull-left" data-dismiss="modal">닫기</button>
                <button type="button" class="btn btn-success modalModBtn" data-dismiss="modal">수정</button>
                <button type="button" class="btn btn-danger modalDelBtn" data-dismiss="modal">삭제</button>
            </div>
        </div>
    </div>
  </div>
<script type="text/javascript">
$(document).ready(function () {
// 3번째 게시글
var bno = ${get.bno};
// 댓글 목록 호출
getReplies();

//댓글 목록 출력 함수
function getReplies() {
	  $.getJSON("${path}/reply/all/" + bno, function(data) {
	        var str = "";
	        $.each(data,function (index,obj) {
	            str    +="<li data-reply_no='" + obj.rno + "' class='replyLi'>"
	            str    +="<p class='reply_text'> 내용 : " + obj.content + "</p>"
	            str    +="<p class='reply_writer'> 작성자 : " + obj.writer + "</p>"
	            if("${mvo.memName}"==obj.writer){
	            	  str+="<button type='button' class='btn btn-xs btn-success' data-toggle='modal' data-target='#modifyModal'>댓글 수정</button>"
	      	          str+="</li>"
	      	          str+="<hr/>";
	            } else {
	            	 str+="</li>"
		      	     str+="<hr/>";
	            }
	        });
	        $("#replies").html(str);
	    });
} 

$(".replyAddBtn").on("click",function() {

    // 화면으로부터 입력 받은 변수값의 처리
    var content = $("#newReplyText");
    var writer = $("#newReplyWriter");

    var reply_textVal = content.val();
    var reply_writerrVal = writer.val();

    $.ajax({
        type : "post",
        url : "${path}/reply",
        headers : {
            "Content-type" : "application/json",
            "X-HTTP-Method-Override" : "POST"
        },
        dataType : "text",
        data : JSON.stringify({
            bno : bno,
            content : reply_textVal,
            writer : reply_writerrVal
        }),
        success : function (result) {
            // 성공적인 댓글 등록 처리 알림
            if (result == "regSuccess") {
                alert("댓글 등록 완료!");
            }
            getReplies(); // 댓글 목록 출력 함수 호출
            $("#newReplyText").val(""); // 댓글 내용 초기화
        }
    });
});

$("#replies").on("click", ".replyLi button", function () {
    var reply = $(this).parent();

    var rno = reply.attr("data-reply_no");
    var content = reply.find(".reply_text").text();
    var writer = reply.find(".reply_writer").text();

    $("#reply_no").val(rno);
    $("#reply_text").val(content);
    $("#reply_writer").val(writer);
});

$(".modalDelBtn").on("click", function () {

    // 댓글 번호
    var rno = $(this).parent().parent().find("#reply_no").val();

    $.ajax({
        type : "delete",
        url : "${path}/reply/" + rno,
        headers : {
            "Content-type" : "application/json",
            "X-HTTP-Method-Override" : "DELETE"
        },
        dataType : "text",
        success : function (result) {
            if (result == "delSuccess") {
                alert("댓글 삭제 완료!");
                getReplies(); // 댓글 목록 갱신
            }
        }
    });
});

$(".modalModBtn").on("click", function () {

    // 댓글 선택자
    var reply = $(this).parent().parent();
    // 댓글번호
    var rno = reply.find("#reply_no").val();
    // 수정한 댓글내용
    var content = reply.find("#reply_text").val();

    $.ajax({
        type : "put",
        url : "${path}/reply/" + rno,
        headers : {
            "Content-type" : "application/json",
            "X-HTTP-Method-Override" : "PUT"
        },
        data : JSON.stringify(
            {content : content}
        ),
        dataType : "text",
        success : function (result) {
            if (result == "modSuccess") {
                alert("댓글 수정 완료!");
                getReplies(); // 댓글 목록 갱신
            }
        }
    });

	});
})
</script>
</body>
</html>