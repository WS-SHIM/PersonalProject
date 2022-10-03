<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<c:set var="contextPath" value="${pageContext.request.contextPath}"/>
<nav class="navbar navbar-default">
  <div class="container-fluid">
    <div class="navbar-header">
      <button type="button" class="navbar-toggle" data-toggle="collapse" data-target="#myNavbar">
        <span class="icon-bar"></span>
        <span class="icon-bar"></span>
        <span class="icon-bar"></span>                        
      </button>
      <a class="navbar-brand" href="${contextPath}/">오늘 뭐 먹지?</a>
    </div>
    <div class="collapse navbar-collapse" id="myNavbar">
      <ul class="nav navbar-nav">
        <li class="active"><a href="${contextPath}/">Home</a></li>
        <li><a href="${contextPath}/board/list">맛집공유</a></li>            
        <li><a href="${contextPath}/board/list2">추천맛집</a></li>            
      </ul>
      <c:if test="${empty mvo}">
	      <ul class="nav navbar-nav navbar-right">
	            <li><a href="${contextPath}/memLoginForm.do"><span class="glyphicon glyphicon-log-in"></span> 로그인</a></li>
	            <li><a href="${contextPath}/memJoin.do"><span class="glyphicon glyphicon-user"></span> 회원가입</a></li>            
	      </ul>
      </c:if>
      <c:if test="${!empty mvo}">
	      <ul class="nav navbar-nav navbar-right">
	            <li><a href="${contextPath}/memUpdateForm.do"><span class="glyphicon glyphicon glyphicon-wrench"></span> 회원정보수정</a></li>
	            <li><a href="${contextPath}/memLogout.do"><span class="glyphicon glyphicon-log-out"></span> 로그아웃</a></li>            
	            <li><a>${mvo.memName} 님Welcome.</a></li>            
	      </ul>
      </c:if>
    </div>
  </div>
</nav>
<script>
$(document).ready(function() {
	  $('li.active').removeClass('active').removeAttr('aria-current');
	  $('a[href="' + location.pathname + '"]').closest('li').addClass('active').attr('aria-current', 'page'); 
	});
</script>