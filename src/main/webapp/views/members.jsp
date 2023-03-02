<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@include file="/common/taglib.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.3/jquery.min.js"></script>
<link href="<c:url value="/assets/css/main.css"/>" rel="stylesheet">
<title>Insert title here</title>
</head>
<body>
	<div class="members">
		<h3 class="title">Danh sách thành viên</h3>
		<div class="flex justify-between">
			<span>Tổng số thành viên: ${members.size()}</span> <a
				href="<c:url value="/views/signup.jsp"/>">Thêm thành viên </a>
		</div>
		<div>
			Chọn giới tính <select><option>Nam</option>
				<option>Nữ</option></select>
		</div>
		<div class="grid grid-cols-4 border rounded border p-4 mt-5">
			<strong>Họ tên</strong> <strong>Ngày sinh</strong> <strong>Giới
				tính</strong> <strong>Email</strong>
			<c:forEach var="item" items="${members}">
				<span>${item.getFullname()}</span>
				<span>${item.getDob()}</span>
				<span>${item.getGender()}</span>
				<a href="<c:url value="/view-detail-member?id=${item.getId()}"/>">${item.getEmail()}</a>
			</c:forEach>
		</div>
	</div>
</body>
</html>