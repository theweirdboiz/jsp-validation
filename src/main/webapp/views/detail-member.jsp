<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@include file="/common/taglib.jsp"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h3>Chi tiết thành viên</h3>
	<div>
		<div>Họ tên:</div>
		<span>${member.getFullname()}</span>
		<div>Ngày sinh:</div>
		<span>${member.getDob()}</span>
		<div>Giới tính:</div>
		<span>${member.getGender()}</span>
		<div>Trình độ văn hóa:</div>
		<span>${member.getEducationalLevel()}</span>
		<div>Địa chỉ:</div>
		<span>${member.getAddress()}</span>
		<div>Điện thoại:</div>
		<span>${member.getPhone()}</span>
		<div>Địa chỉ email:</div>
		<span>${member.getEmail()}</span> <a
			href="<c:url value="/view-members"/>">Danh sách thành viên</a>
	</div>
</body>
</html>