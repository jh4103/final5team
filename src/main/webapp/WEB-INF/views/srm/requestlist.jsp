<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html lang="ko">

<head>
<%@ include file="/WEB-INF/views/common/head.jsp"%>
<link href="${pageContext.request.contextPath}/resources/css/requestlist.css" rel="stylesheet" type="text/css">
<style>
a {
	text-decoration: none;
}

main {
	display: flex;
	height: 800px;
	width: 1050px;
	position: relative;
	justify-content: center;
	align-items: center;
	font-size: 15px;
}

.filter {
	width: 1050px;
	height: 200px;
	overflow: hidden;
	text-align: start;
	align-items: center;
	position: absolute;
	top: 0;
	left: 0;
	background-color: #fff;
	border-bottom: 1px solid #e3e6f0;
	border-radius: 5px;
	border: 1px solid rgba(0, 0, 0, 0.125);
	border-radius: 0.25rem;
	-webkit-box-shadow: 1px 1px 5px rgba(126, 142, 159, 0.1);
	box-shadow: 1px 1px 5px rgba(126, 142, 159, 0.1);
}

.filter .filter-head {
	background-color: #f8f9fc;
	border-bottom: 1px solid #e3e6f0;
}

.filter .filter-head h4 {
	color: #68a329;
	font: bold;
	padding-top: 10px;
	padding-left: 15px;
	font-size: 15px;
}

.filter .filter-name {
	width: 100px;
	height: 200px;
	position: absolute;
	margin: 0;
	left: 2%;
	top: 22%;
}

.filter .filter-name h6 {
	font-size: 15px;
	margin: 20px 10px;
}

.filter .filter-name2 {
	width: 100px;
	height: 200px;
	position: absolute;
	margin: 0;
	left: 42%;
	top: 22%;
}

.filter .filter-name2 h6 {
	font-size: 15px;
	margin: 20px 10px;
	font-size: 15px;
}

.filter .filter-body {
	width: 300px;
	height: 200px;
	overflow: hidden;
	position: absolute;
	left: 13%;
	top: 23%;
	float: left;
}

.filter .filter-body .input-group {
	width: 100px;
	margin: 8px;
}

.filter .filter-body .date_form {
	margin: 6px;
}

.filter .filter-body2 {
	width: 300px;
	height: 200px;
	overflow: hidden;
	position: absolute;
	left: 50%;
	top: 23%;
	float: left;
}

.filter .filter-body2 .input-group {
	width: 100px;
	margin: 5px;
}

.table {
	text-align: center;
	width: inherit;
	height: 500px;
	overflow: hidden;
	text-align: start;
	align-items: center;
	position: absolute;
	top: 28%;
	left: 0;
	background-color: #fff;
	border-bottom: 1px solid #e3e6f0;
	border-radius: 5px;
	border: 1px solid rgba(0, 0, 0, 0.125);
	border-radius: 0.25rem;
	-webkit-box-shadow: 1px 1px 5px rgba(126, 142, 159, 0.1);
	box-shadow: 1px 1px 5px rgba(126, 142, 159, 0.1);
}

.table .table-header {
	background-color: #f8f9fc;
	border-bottom: 1px solid #e3e6f0;
	border-bottom: 1px solid #e3e6f0;
}

.table .table-header h4 {
	color: #68a329;
	font: bold;
	padding-top: 10px;
	padding-left: 15px;
	font-size: 15px;
}

.table .table-body {
	position: absolute;
	top: 10%;
	left: 0%;
	height: inherit;
	width: 1050px;
}

.member {
	width: inherit;
	background-color: #fff;
	border-collapse: collapse;
	box-shadow: 0 0 15px rgba(0, 0, 0, 0.15);
	border-radius: 5px;
	overflow: hidden;
}

.member caption {
	font-size: 30px;
	margin-bottom: 30px;
}

.member tr {
	width: 1050px;
	border-bottom: 1px solid #eee;
	transition: 0.3s;
}

.member tr:last-child {
	border: none;
}

/* .member tr:hover {
                                    background-color: #eee;
                                  } */
.member tr:nth-child(odd) {
	background-color: #eee;
}

.member th, .member td {
	font-size: 12px;
	width: 1050px;
	padding: 5px;
	text-align: center;
	text-overflow: ellipsis;
	white-space: nowrap;
}

.member tr th {
	background-color: #85ce36;
	color: #fff;
}

.member tr td {
	width: 1050px;
	font-size: 12px;
}

.member tr th:first-child {
	border-radius: 5px 0 0 0;
}

.member tr th:last-child {
	border-radius: 0 5px 0 0;
}

.member tr td:last-child {
	color: red;
}

.member tr:hover {
	background-color: rgba(211, 211, 211, 0.438);
}

.filter .search-button {
	position: absolute;
	width: 80px;
	height: 50px;
	left: 61%;
	top: 70%;
}

.step_tr {
	align-items: center;
}

.step_tr .step_td {
	display: flex;
	max-width: 550px;
	width: 550px;
	padding: 0;
}

.step_tr .step_td .inner_step {
	background-color: none;
}

.step_tr .step_td .inner_step .circle {
	background-color: none;
	width: 70px;
}

.step_tr .step_td .inner_step .bar {
	background-color: none;
	width: 10px;
}
</style>

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
					<main class="all">
					<section method="post" class="filter">
						<article class="filter-head">
							<h4>필터</h4>
						</article>

						<article class="filter-name">
							<h6>유형 선택</h6>
							<h6>작성 날짜</h6>
						</article>

						<article class="filter-name2">
							<h6>단계 선택</h6>
							<h6>시스템</h6>
						</article>
						<article class="search-button">
							<button class="btn btn-primary btn-sm" type="submit">검색</button>
						</article>
						<form action="">
							<article class="filter-body">
								<div class="input-group">
									<select class="custom-select" id="req_type" name="req_type">
										<option value="1" selected>1</option>
										<option value="2">2</option>
										<option value="3">3</option>
										<option value="4">4</option>
									</select>
								</div>
								<div class="date_form">
									<input type="date" id="birth_first" name="birth_first"> <i class="fa fa-minus"></i> <input type="date" id="birth_last" name="birth_last">
								</div>
							</article>
							<article class="filter-body2">
								<div class="input-group">
									<select class="custom-select" id="sno" name="sno">
										<option value="1" selected>1</option>
										<option value="2">2</option>
										<option value="3">3</option>
										<option value="4">4</option>
										<option value="5">5</option>
										<option value="6">6</option>
									</select>
								</div>
								<div class="input-group">
									<select class="custom-select" id="sno" name="sno">
										<option value="1" selected>1</option>
										<option value="2">2</option>
										<option value="3">3</option>
										<option value="4">4</option>
										<option value="5">5</option>
										<option value="6">6</option>
									</select>
								</div>
							</article>
						</form>
					</section>
					<section class="table">
						<article class="table-header">
							<h4>리스트</h4>
						</article>
						<article class="member table-body">
							<table class="member" id="table_content">
								<tr>
									<th>No.</th>
									<th>시스템</th>
									<th>요청 유형</th>
									<th>요청 제목</th>
									<th>요청 일자</th>
									<th>단계</th>

								</tr>
								<c:forEach var="request" items="${requestList}">
									<tr>
										<td class="rno">${request.rno}</td>
										<!-- 										나중에 시스템 이름으로 바꾸어 줘야 함. -->
										<td class="client">${request.sno}이름추가</td>
										<!-- 요청 유형 테이블에서 req type 가져와야 함. -->
										<td class="sysType">N Q</td>
										<td class="reqTitle">${request.reqTitle}</td>
										<td class="reqDate">${request.reqDate}</td>

										<td class="step_td">
											
											<table class="inner_step">
												<td class="circle">요청완료</td>
												<td class="bar"></td>
												<td class="circle">접수완료</td>
												<td class="bar"></td>
												<td class="circle">개발완료</td>
												<td class="bar"></td>
												<td class="circle">테스트완료</td>
												<td class="bar"></td>
												<td class="circle">유저테스트</td>
												<td class="bar"></td>
												<td class="circle">배포단계</td>
												<td class="bar"></td>
												<td class="circle">최종승인</td>
											</table>
										</td>

									</tr>
								</c:forEach>
							</table>
						</article>
					</section>
					</main>
				</div>
				<div class="container-fluid"></div>
				<div class="pager d-flex justify-content-center my-3">
					<div class="flex-fulfill"></div>
					<div class="pagingButtonSet d-flex justify-content-center">
						<c:if test="${pager.pageNo > 1}">
							<a href="1" type="button" class="btn btn-muted shadow">◀◀</a>
						</c:if>
						<c:if test="${pager.groupNo > 1}">
							<a href="${pager.startPageNo-1}" type="button" class="btn btn-muted shadow">◀</a>
						</c:if>

						<c:forEach var="i" begin="${pager.startPageNo}" end="${pager.endPageNo}">
							<c:if test="${pager.pageNo != i}">
								<a href="${i}" type="button" class="btn btn-white shadow">${i}</a>
							</c:if>
							<c:if test="${pager.pageNo == i}">
								<a href="${i}" type="button" class="btn btn-dark shadow">${i}</a>
							</c:if>
						</c:forEach>

						<c:if test="${pager.groupNo < pager.totalGroupNo }">
							<a href="${pager.endPageNo+1}" type="button" class="btn btn-muted shadow">▶</a>

						</c:if>
						<c:if test="${pager.pageNo < pager.totalPageNo}">
							<a href="${pager.totalPageNo}" type="button" class="btn btn-muted shadow">▶▶</a>
						</c:if>
					</div>
					<div class="flex-fulfill"></div>
					<a type="button" href="<c:url value='/customer/requestlist/1'/>" class="btn btn-muted shadow">글 작성</a>
				</div>

			</div>
		</div>
		<!-- 여기에 내용 담기 end -->

	</div>
	<!-- End of Main Content -->

	<!-- Footer -->
	<%@ include file="/WEB-INF/views/common/footer.jsp"%>
	<!-- End of Footer -->

	<!-- End of Page Wrapper -->

	<!-- Scroll to Top Button-->
	<a class="scroll-to-top rounded" href="#page-top"> <i class="fas fa-angle-up"></i>
	</a>


</body>

</html>
