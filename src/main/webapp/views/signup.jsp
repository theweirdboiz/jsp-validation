<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@include file="/common/taglib.jsp"%>
<c:url var="APIurl" value="/add-member" />
<c:url var="NewURL" value="/view-members" />
<c:url var="validationUrl" value="/validation" />

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
	<form action="<c:url value="/add-member"/>" id="form__sign-up"
		class="form" method="post">
		<h3 class="form__title">Đăng ký thành viên</h3>
		<div class="form__group">
			<label class="form__label" for="email">*Địa chỉ email:</label> <input
				autocomplete="off" class="form__input required"
				placeholder="Nhập địa chỉ email" id="email" name="email" />
		</div>
		<div class="form__message"></div>
		<div class="form__group">
			<label class="form__label" for="password">*Mật khẩu:</label> <input
				type="password" autocomplete="off" class="form__input required"
				placeholder="Nhập mật khẩu" id="password" name="password" />
		</div>
		<div class="form__message"></div>
		<div class="form__group">
			<label class="form__label" for="repassword">*Nhập lại mật
				khẩu:</label> <input type="password" autocomplete="off"
				class="form__input required" placeholder="Nhập lại mật khẩu"
				id="repassword" name="repassword" />
		</div>
		<div class="form__message"></div>

		<div class="form__group">
			<label class="form__label" for="fullname ">*Họ tên</label> <input
				autocomplete="off" class="form__input required"
				placeholder="Nhập họ tên" id="fullname" name="fullname" />
		</div>
		<div class="form__message"></div>

		<div class="form__group">
			<label class="form__label" for="dob">*Ngày sinh:</label> <input
				autocomplete="off" class="form__input required"
				placeholder="Nhập ngày sinh" id="dob" name="dob" /> <span>dd/mm/yyyy</span>
		</div>
		<div class="form__message"></div>

		<div class="form__group">
			<label class="form__label" for="gender">Giới tính:</label>
			<div class="form__gender">
				<div class="form__gender-box">
					<input type="radio" class="" id="female" name="gender" checked
						value="1" /> <span>Nam</span>
				</div>
				<div class="form__gender-box">
					<input type="radio" class="" id="male" value="0" name="gender" />
					<span>Nữ</span>
				</div>
			</div>
		</div>

		<div class="form__group">
			<label class="form__label" for="educationalLevel">Trình độ
				văn hóa:</label> <select class="form__select" id="educationalLevel"
				name="educationalLevel">
				<option>Chọn...</option>
				<option>Tốt nghiệp phổ thông</option>
				<option>Cao đẳng</option>
				<option>Đại học</option>
				<option>Thạc sĩ</option>
				<option>Tiến sĩ</option>
			</select>
		</div>

		<div class="form__group">
			<label class="form__label" for="address">Địa chỉ:</label>
			<textarea class="form__area" rows="5" cols="50"></textarea>
		</div>
		<div class="form__group">
			<label class="form__label" for="city">Thành phố:</label> <select
				class="form__select" id="city" name="city">
				<option>Chọn...</option>
				<option>Tốt nghiệp phổ thông</option>
				<option>Cao đẳng</option>
				<option>Đại học</option>
				<option>Thạc sĩ</option>
				<option>Tiến sĩ</option>
			</select>
		</div>

		<div class="form__group">
			<label class="form__label" for="district">Quận:</label> <select
				class="form__select" id="district" name="district">
				<option>Chọn...</option>
				<option>Tốt nghiệp phổ thông</option>
				<option>Cao đẳng</option>
				<option>Đại học</option>
				<option>Thạc sĩ</option>
				<option>Tiến sĩ</option>
			</select>
		</div>

		<div class="form__group">
			<label class="form__label" for="ward">Phường:</label><select
				class="form__select" id="ward" name=""ward"">
				<option>Chọn...</option>
				<option>Tốt nghiệp phổ thông</option>
				<option>Cao đẳng</option>
				<option>Đại học</option>
				<option>Thạc sĩ</option>
				<option>Tiến sĩ</option>
			</select>
		</div>
		<div class="form__group">
			<label class="form__label" for="phone">Điện thoại:</label> <input
				class="form__input" placeholder="Nhập địa số điện thoại" id="phone"
				name="phone" />
		</div>
		<button class="form__submit">Submit</button>
	</form>

	<script>
		$(document).ready(function() {
			const inputElms = $("input.required");
			// $(".form__submit").attr("disabled",true);
			let value="";
			let isValid = false;
			$.each(inputElms , function (index, inputElm){
				//on blur
				$(this).blur(function(){
					//vaidation
					if($(this).val()==""){
						$(this).css({"color":"red","border":"1px solid red"}).parent().siblings(".form__message").eq(index).text("Vui lòng không bỏ trống trường này!")
					}
					if($(this).is('[name="email"]')){
						value = $(this).val();
						$.ajax("/validation-ajax/validation?type=email", {
							type : 'POST',
							data: { email: value},
							success:function(res){
								if(res==0) {
									$(inputElm).css({"color":"red","border":"1px solid red"}).parent().siblings(".form__message").eq(index).text("Email đã tồn tại!")
								}
							},
							error:function(err){
								console.log(err);
							}
					})
					}
					if($(this).is('[name="password"]')){
						value = $(this).val();
						$.ajax("/validation-ajax/validation?type=password", {
							type : 'POST',
							data: { password: value},
							success:function(res){
								if(res==0) {
									$(inputElm).css({"color":"red","border":"1px solid red"}).parent().siblings(".form__message").eq(index).text("Mật khẩu ít nhất 8 kí tự!")
								}
							},
							error:function(err){
								console.log(err);
							}
					})
					}
					if($(this).is('[name="repassword"]')){
						let password = $("input[name='password']").val();
						value = $(this).val();
						$.ajax("/validation-ajax/validation?type=repassword", {
							type : 'POST',
							data: { repassword: value, password: password},
							success:function(res){
								if(res==0) {
									$(inputElm).css({"color":"red","border":"1px solid red"}).parent().siblings(".form__message").eq(index).text("Mật khẩu không tương ứng!")
								}
							},
							error:function(err){
								console.log(err);
							}
					})
					}
					if($(this).is('[name="dob"]')){
						value = $(this).val();
						$.ajax("/validation-ajax/validation?type=dob", {
							type : 'POST',
							data: { dob: value},
							success:function(res){
								if(res==0) {
									$(inputElm).css({"color":"red","border":"1px solid red"}).parent().siblings(".form__message").eq(index).text("Ngày không hợp lệ!")
								}
							},
							error:function(err){
								console.log(err);
							}
					})
					}
					else {
						isValid = true;
						$(this).css({"color":"black","border":"1px solid #ddd"}).parent().siblings(".form__message").eq(index).text("")
					}
					//end
				})
				
				//on input change
				$(this).on('input',function(){
					$(this).css({"color":"black","border":"1px solid #ddd"}).parent().siblings(".form__message").eq(index).text("")
				})
			});
			
			$("#form__sign-up").submit(function(e){
			    e.preventDefault();
				if(isValid) {
					let password = $("input[name='password']").val();
					let email = $("input[name='email']").val();
					let fullname = $("input[name='fullname']").val();
					let dob = $("input[name='dob']").val();
					let gender = $("input[name='gender']").val();
					let educationalLevel = $("input[name='educationalLevel']").val();
					let address = $("input[name='address']").val();
					let city = $("input[name='city']").val();
					let ward = $("input[name='ward']").val();
					let district = $("input[name='district']").val();
					let phone = $("input[name='phone']").val();
					
					value =  { email: email, password: password, fullname: fullname, dob:dob,
							gender: gender, educationalLevel: educationalLevel, address:address,
							city:city, ward:ward,district:district,
							phone:phone
							}
					
					$.ajax("/validation-ajax/add-member", {
						type : 'POST',
						contentType: "application/json; charset=utf-8",
			            dataType: 'json',
						data: JSON.stringify(value),
						success:function(res){
							alert("Welcome "+fullname+"!");

						},
						error:function(err){
							alert("Add member fail!");

						}
				})
				}
				else {
					console.log("invalid");

				}
			})
        })
		</script>
</body>
</html>