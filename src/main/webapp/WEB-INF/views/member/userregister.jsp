<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>


<!DOCTYPE html>
<html lang="ko">

<head>
<%@ include file="/WEB-INF/views/common/head.jsp"%>
<style>
a {
	text-decoration: none;
}

form {
	display: flex;
	justify-content: center;
	align-items: center;
	height: 800px;
	width: 1050px;
	position: relative;
	background-color: #fff;
	border-radius: 5px;
	border: 1px solid rgba(0, 0, 0, 0.125);
	border-radius: 0.25rem;
	-webkit-box-shadow: 1px 1px 5px rgba(126, 142, 159, 0.1);
	box-shadow: 1px 1px 5px rgba(126, 142, 159, 0.1);
	margin-bottom: 50px;
}

.section1 {
	width: 1047px;
	overflow: hidden;
	text-align: start;
	align-items: center;
	position: absolute;
	top: 0;
	left: 0;
	background-color: #f8f9fc;
	border-bottom: 1px solid #e3e6f0;
}

.section1 h4 {
	color: #68a329;
	font: bold;
	margin: 15px 15px;
}

.section2 article {
	width: 200px;
	height: 200px;
	overflow: hidden;
	position: absolute;
	margin: 120px 50px;
	left: 5%;
	top: 10%;
}

.section2 img {
	width: 150px;
	height: 150px;
}

.section2 article button {
	position: absolute;
	left: 35%;
	top: 90%;
	transform: translate(-50%, -50%);
}

.section2 .userData {
	position: absolute;
	width: inherit;
	height: 250px;
	left: 25%;
	top: 5%;
}

.item {
	/* border: 1px solid red; */
	width: 250px;
	margin-bottom: 10px;
	position: relative;
}

.item input {
	height: 40px;
	width: inherit;
	border-radius: 5px;
	padding: 10px;
	box-sizing: border-box;
	padding-left: 40px;
	outline: none;
	transition: 0.3s;
}

.item .fa {
	position: absolute;
	top: 0;
	left: 0;
	color: gray;
	font-size: 20px;
	width: 40px;
	height: 40px;
	/* border: 1px solid blue; */
	text-align: center;
	line-height: 40px;
	transition: 0.3s;
	z-index: 3;
}

.item select {
	height: 40px;
	width: inherit;
	border-radius: 5px;
	padding: 10px;
	box-sizing: border-box;
	padding-left: 40px;
	outline: none;
	transition: 0.3s;
}

.item input:focus {
	box-shadow: 0 0 5px #85ce36;
}

.item input:focus+.fa {
	color: #85ce36;
}

.item input:focus::placeholder {
	visibility: hidden;
}

.item select:focus+.fa {
	color: #85ce36;
}

.item select:focus {
	box-shadow: 0 0 5px #85ce36;
}

.section2 .userData2 {
	position: absolute;
	width: 300px;
	height: 250px;
	left: 55%;
	top: 5%;
}

]
.submit-button {
	width: 70px;
	height: 25px;
}

.return-button {
	width: 70px;
	height: 25px;
}

.section2 article.submit-button {
	left: 35%;
	top: 20%;
}

.section2 article.return-button {
	left: 50%;
	top: 22%;
}
</style>


<script>
	function imageRegist() {
		let myInput = document.getElementById('i_file');
		myInput.click();
	}
</script>

</head>

<body id="page-top">

	<!-- Page Wrapper -->
	<div id="wrapper">

		<!-- Sidebar -->
		<%@ include file="/WEB-INF/views/common/sidebar.jsp"%>
		<!-- End of Sidebar -->

		<!-- Content Wrapper -->
		<div id="content-wrapper" class="d-flex flex-column">

			<!-- Main Content -->
			<div id="content">

				<!-- Topbar -->
				<%@ include file="/WEB-INF/views/common/topbar.jsp"%>
				<!-- End of Topbar -->

				<!-- 여기에 내용 담기 start -->
				<div class="container-fluid">
					<form method="post" action="${pageContext.request.contextPath}/customer/register">
						<section class="section1">
							<h4>사용자 등록</h4>
						</section>

						<section class="section2">
							<article class="photo">
								<img id="img_file" src="${pageContext.request.contextPath}/resources/img/undraw_profile.svg">
								<button name="imageRegister" class="btn-dark btn-sm" onclick="imageRegist()">이미지 등록</button>
							</article>
							<article class="userData">
								<div class="item">
									<div class="input-group">
										<select class="custom-select" id="sno" name="sno">
											<option selected>TYPE 선택</option>
											<option value="1">user</option>
											<option value="2">pm</option>
											<option value="3">developer</option>
											<option value="4">distributer</option>
											<option value="5">tester</option>
											<option value="6">user_tester</option>
										</select>
										<i class="fa fa-user"></i>
									</div>
								</div>
								<div class="data">
									<div class="item">
										<input type="text" class="form-control form-control-user" id="mid" name="mid" placeholder="아이디"> <i class="fa fa-user"></i>
									</div>
									<div class="item">
										<input type="password" class="form-control form-control-user" id="password" name="password" placeholder="비밀번호"> <i class="fa fa-envelope"></i>
									</div>
									<!-- 비밀번호 확인 -->
									<div class="item">
										<input type="password" class="form-control form-control-user" id="password" name="password" placeholder="비밀번호 확인"> <i class="fa fa-envelope"></i>
									</div>
									<div class="item">
										<input type="text" class="form-control form-control-user" id="mname" name="mname" placeholder="이름"> <i class="fa fa-phone"></i>
									</div>
								</div>
							</article>
							<article class="userData2">
								<div class="item">
									<div class="input-group">
										<select class="custom-select" id="gender" name="gender">
											<option value="man">남</option>
											<option value="woman">여</option>
										</select>
										<i class="fa fa-user"></i>
									</div>
								</div>
								<div class="item">
									<div class="input-group">
										<select class="custom-select" id="position" name="position">
											<option selected>직급 선택</option>
											<option value="사원">사원</option>
											<option value="대리">대리</option>
											<option value="과장">과장</option>
											<option value="차장">차장</option>
										</select>
										<i class="fa fa-user"></i>
									</div>

								</div>
								<div class="item">
									<div class="input-group">
										<i class="fa fa-user"></i>
										<select class="custom-select" id="organ" name="organ">
											<option selected>소속 기관 선택</option>
											<option value="1">1</option>
											<option value="2">2</option>
											<option value="3">3</option>
										</select>
										<i class="fa fa-user"></i>
									</div>

								</div>
								<div class="item">
									<div class="input-group">
										<i class="fa fa-user"></i>
										<select class="custom-select" id="organ" name="organ">
											<option selected=>소속기관 선택</option>
											<option value="1">2</option>
											<option value="2">2</option>
											<option value="3">3</option>
										</select>
										<i class="fa fa-user"></i>
									</div>

								</div>
							</article>

							<article class="submit-button">
								<button class="btn btn-dark btn-sm" type="submit">회원 등록</button>

							</article>
							<article class="return-button">
								<button class="btn btn-dark btn-sm" type="submit">취소</button>
							</article>
						</section>
					</form>
					<!-- 여기에 내용 담기 end -->
				</div>
				<!-- End of Main Content -->

				<!-- Footer -->
				<%@ include file="/WEB-INF/views/common/footer.jsp"%>
				<!-- End of Footer -->

			</div>
			<!-- End of Content Wrapper -->
		</div>
		<!-- End of Page Wrapper -->
	</div>
	<!-- Scroll to Top Button-->
	<a class="scroll-to-top rounded" href="#page-top"> <i class="fas fa-angle-up"></i>
	</a>
</body>

</html>
