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
		<div class="form__message"></div>

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
		<div class="form__message"></div>

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
		<div class="form__message"></div>

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
		<div class="form__message"></div>

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
		<div class="form__message"></div>

		<button class="form__submit">Submit</button>
	</form>

	<script>
		$(document).ready(function() {
			let rules = true;
			//check email
			function isValidEmail(email) {
            const regex = /^\b[A-Z0-9._%-]+@[A-Z0-9.-]+\.[A-Z]{2,4}\b$/i;
            return regex.test(email);
        }
			function isValidPassword(password) {
				const regex = /^(?=.*\d)(?=.*[a-z])(?=.*[A-Z])(?=.*[a-zA-Z]).{8,}$/;
				return regex.test(password);
			}
			function isValidRepassword(password,repassword) {
				return password==repassword;
			}
			function isValidDob(dob) {
				const regex = /^([0-2][0-9]|(3)[0-1])(\/)(((0)[0-9])|((1)[0-2]))(\/)\d{4}$/;
				return regex.test(dob);
			}
			const sendEmail = (data,element)=> {
				$.ajax({
					url: `${validationUrl}`,
					type: "GET",
					contentType: 'application/json',
					data: {
						email:data
					},
					dataType: 'text',
					success: function(res) {
						if(res.trim()=='true') {
							element.text("Email đã tồn tại, hãy thử lại");
						}
					}, error: function(error) {
						console.log(error);
					}
				})
			}
			const sendPassword = (data)=> {
				$.ajax({
					url: `${validationUrl}`,
					type: "GET",
					contentType: 'application/json',
					data: {
						password:data
					},
					dataType: 'text',
					success: function(res) {
						

					}, error: function(error) {
						console.log(error);
					}
				})
			}
			const sendDob = (element)=> {
				$.ajax({
					url: `${checkEmailURL}`,
					type: "GET",
					contentType: 'application/json',
					data: {
						password:element.value
					},
					dataType: 'text',
					success: function(res) {
							

					}, error: function(error) {
						console.log(error);
					}
				})
			}
			//add new
			const addMember = (data) => {
				$.ajax({
					url: `${APIurl}`,
					type: "POST",
					contentType: 'application/json',
					data: JSON.stringify(data),
					dataType: 'json',
					success: function(res) {
						console.log(res);
						window.location.href = `${NewURL}`;
						console.log("${NewURL}")
					}, error: function(error) {
						console.log(error);
					}
				})
			}
			
			const inputs = $('input.required');
			const btnSubmit = $('.form__submit');
			$(btnSubmit).prop("disabled", true);

			inputs.each(function(idx) {
				const parentElm = $(this).parent();
				const messageElm = $(parentElm).next();
				$(this).on('blur',function(e){
					e.target.value == "" &&	$(messageElm).text("Dữ liệu này trống")
				});

				$(this).on('input',function(e){
					let data = e.target.value;
					messageElm.text("");
					if(isValidEmail(data)){
						sendEmail(data,messageElm);
					}
					else {
						rules = false;
						messageElm.text("Email không hợp lệ, hãy thử lại");
					}
					
					if(isValidPassword(data)) {
						messageElm.text("");
					}
					else {
						rules = false;
						messageElm.text("Password phải có ít nhất 8 kí tự, 1 ký tự in hoa và 1 ký tự đặc biệt");
					}
					if(!isValidRepassword($("input[name='password']").val(),data)) {
						rules = false;
						messageElm.text("Mật khẩu không tương ứng, thử lại");
					}
					else {
						messageElm.text("");
					}
					if(!isValidDob(data)) {
						rules = false;
						messageElm.text("Không đúng định dạng dd/mm/yyyy");
					}
					else {
						messageElm.text("");
					}
				});
			})
			
			btnSubmit.click(function(e) {
				e.preventDefault();
				const data = {};
				const formData = $("#form__sign-up").serializeArray();
				
				formData.map((item) => {
					if(item.name!=='repassword'){
					data[item.name] = item.value;						
					}
				})
				if(rules) {
					addMember(data);	
				}
				else {
				    alert("Bạn phải điền các thông tin có dấu *");
					$(btnSubmit).prop("disabled", true);
				}
			})

		});
		</script>
</body>
</html>