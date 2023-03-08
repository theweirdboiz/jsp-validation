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
			Chọn giới tính <select>
				<option >Chọn ...</option>
				<option value="1">Nam</option>
				<option value="0">Nữ</option>
			</select>
		</div>
		<div class="grid grid-cols-4 border rounded border p-4 mt-5">
			<strong>Họ tên</strong> <strong>Ngày sinh</strong> <strong>Giới
				tính</strong> <strong>Email</strong>
			<c:forEach var="item" items="${members}">
				<span>${item.getFullname()}</span>
				<span>${item.getDob()}</span>
				<span>${item.getGender() == 1 ? "Nam" : "Nữ"}</span>
				<a href="<c:url value="/view-detail-member?id=${item.getId()}"/>">${item.getEmail()}</a>
			</c:forEach>
		</div>
	</div>
	<script>
	$(document).ready(function() {
		var listMember;
		let gender;
		$.ajax("/validation-ajax/view-members", {
			type : 'GET',
			data: { gender: gender},
			contentType: "application/json; charset=utf-8",
            dataType: 'json',
			success:function(res){
				listMember = jQuery.parseJSON(res);
				console.log(listMember);
			},
			error:function(err){
				console.log(err);
			}
	})
		const selectElm = $("select");
		$(selectElm).change(function(){
			let value = $(this).val();
		
			if(value == "1") {
				gender = 1;
			}
			if(value=="0") {

				gender =0
			}
			$.ajax("/validation-ajax/view-members", {
				type : 'GET',
				contentType: "application/json; charset=utf-8",
	            dataType: 'json',
				data: { gender: gender},
				success:function(res){
					listMember = jQuery.parseJSON(res);
					console.log(listMember);
				},
				error:function(err){
					console.log(err);
				}
		})
		})
		})
	</script>
</body>
</html>