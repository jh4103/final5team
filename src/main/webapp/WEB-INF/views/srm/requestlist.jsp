<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html lang="ko">

<head>
<%@ include file="/WEB-INF/views/common/head.jsp"%>
<link href="${pageContext.request.contextPath}/resources/css/requestlist.css" rel="stylesheet" type="text/css">

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
					<div class="card shadow mb-4">
						<div class="card-header py-3">
							<h6 class="m-0 font-weight-bold text-primary">필터</h6>
						</div>
						<div class="filter card-body">
							<div class="col">
								<div class="row">
									<div class="filterlabel">유형 선택</div>
									<div class="col-sm-6">
										<div class="input-group mb-3">
											<select class="custom-select" id="req_type" name="req_type">
												<option value="1" selected>1</option>
												<option value="2">2</option>
												<option value="3">3</option>
												<option value="4">4</option>
											</select>
										</div>
									</div>
								</div>

								<div class="row">
									<div class="filterlabel">날짜 선택</div>
									<div class="col-sm-6">
										<div class="row">
											<input type="date" class="filter form-control form-control-user" id="birth" name="birth"> <i class="fa fa-minus"></i> <input type="date" class="filter form-control form-control-user" id="birth" name="birth">
										</div>
									</div>
								</div>

								<div class="row">
									<div class="filterlabel">시스템 선택</div>
									<div class="col-sm-6">
										<div class="input-group mb-3">
											<select class="custom-select" id="sno" name="sno">
												<option value="1" selected>1</option>
												<option value="2">2</option>
												<option value="3">3</option>
												<option value="4">4</option>
											</select>
										</div>
									</div>
								</div>
								<div class="row">
									<div class="filterlabel">단계 선택</div>
									<div class="col-sm-6">
										<div class="input-group mb-3">
											<select class="custom-select" id="sno" name="sno">
												<option value="1" selected>1</option>
												<option value="2">2</option>
												<option value="3">3</option>
												<option value="4">4</option>
												<option value="5">5</option>
												<option value="6">6</option>
											</select>
										</div>
									</div>
									<button class="btn btn-sm btn-primary">검색</button>
								</div>
							</div>
						</div>
					</div>
					<div class="card shadow mb-4">
						<div class="card-header py-3">
							<h6 class="m-0 font-weight-bold text-primary">내 담당 요청 관리</h6>
						</div>
						<div class="card-body">
							<div class="row">
								<div class="col-sm">
									<table class="table table-bordered" id="table_name">
										<tr>
											<td class="rno">no</td>
											<td class="client">시스템</td>
											<td class="sysType">요청 유형</td>
											<td class="reqTitle">요청 제목</td>
											<td class="reqDate">요청 일자</td>
											<td class="stepButton">단계 확인</td>
										</tr>
									</table>
								</div>
							</div>
							<div class="row">
								<div class="col-sm">
									<c:forEach var="request" items="${requestList}">
										<table class="table table-bordered" id="table_content">
											<tr>
												<td class="rno">${request.rno}</td>
												<!-- 나중에 시스템 이름으로 바꾸어 줘야 함. -->
												<td class="client">${request.sno}이름추가</td>
												<!-- 요청 유형 테이블에서 req type 가져와야 함. -->
												<td class="sysType">일반, 긴급</td>
												<td class="reqTitle">${request.reqTitle}</td>
												<td class="reqDate">${request.reqDate}</td>
												<td class="stepButton">
													<button class="btn btn-success btn-sm" type="button" data-toggle="collapse" id="step" data-target="#collapseExample${request.rno}" aria-expanded="false" aria-controls="collapseExample" onclick="sendRno(${request.rno})">단계</button>
													<input type="hidden" id="requestRno" value="${request.rno}">
												</td>
											</tr>
										</table>
										<!-- c:if로 정규, 긴급 구분 -->
										<div class="collapse" id="collapseExample${request.rno}">
											<div class="card card-body">
												<div class="row row-col-1 row-cols-sm-3 row-cols-md-6 row-cols-xl-6">

													<div class="col-2">
														<button name="status" class="btn-md <c:if test="${request.statusNo >= 2}">done</c:if>
															<c:if test="${request.statusNo == 1}">now</c:if> ">
															<c:if test="${request.statusNo == 1}">접수중</c:if>
															<c:if test="${request.statusNo >= 2}">접수완료</c:if>
														</button>
													</div>

													<div class="col-2">
														<button name="status" id="status_two" class="btn-md <c:if test="${request.statusNo >= 5}">done</c:if>
									           	 			<c:if test="${request.statusNo >= 2 && request.statusNo <= 4}">now</c:if>">
															<c:if test="${request.statusNo < 2}">개발단계</c:if>
															<c:if test="${request.statusNo == 2}">개발요청</c:if>
															<c:if test="${request.statusNo == 3}">개발중</c:if>
															<c:if test="${request.statusNo == 4}">개발재검토</c:if>
															<c:if test="${request.statusNo >= 5}">개발완료</c:if>
														</button>
													</div>
													<div class="col-2">
														<button name="status" id="status_three" class="btn-md <c:if test="${request.statusNo >= 7}">done</c:if>
									           	 			<c:if test="${request.statusNo >= 5 && request.statusNo <= 6}">now</c:if>">
															<c:if test="${request.statusNo < 5}">테스트단계</c:if>
															<c:if test="${request.statusNo == 5}">테스트요청</c:if>
															<c:if test="${request.statusNo == 6}">테스트중</c:if>
															<c:if test="${request.statusNo >= 7}">테스트완료</c:if>
														</button>
													</div>
													<div class="col-2">
														<button name="status" id="status_four" class="btn-md <c:if test="${request.statusNo >= 9}">done</c:if>
									           	 			<c:if test="${request.statusNo >= 7 && request.statusNo <= 8}">now</c:if>">
															<c:if test="${request.statusNo < 7}">유저테스트단계</c:if>
															<c:if test="${request.statusNo == 7}">유저테스트요청</c:if>
															<c:if test="${request.statusNo == 8}">유저테스트중</c:if>
															<c:if test="${request.statusNo >= 9}">유저테스트완료</c:if>
														</button>
													</div>
													<div class="col-2">
														<button name="status" id="status_five" class="btn-md <c:if test="${request.statusNo >= 11}">done</c:if>
									           	 			<c:if test="${request.statusNo >= 9 && request.statusNo <= 10}">now</c:if>">
															<c:if test="${request.statusNo < 9}">배포단계</c:if>
															<c:if test="${request.statusNo == 9}">배포요청</c:if>
															<c:if test="${request.statusNo == 10}">배포중</c:if>
															<c:if test="${request.statusNo >= 11}">배포완료</c:if>
														</button>
													</div>
													<div class="col-2">
														<button name="status" id="status_six" class="btn-md <c:if test="${request.statusNo >= 13}">done</c:if>
									           	 			<c:if test="${request.statusNo == 11}">now</c:if>">
															<c:if test="${request.statusNo < 11}">최종승인단계</c:if>
															<c:if test="${request.statusNo == 11}">최종승인요청</c:if>
															<c:if test="${request.statusNo == 13}">완료</c:if>
														</button>
													</div>
												</div>
											</div>
										</div>
										<br>
									</c:forEach>
								</div>
							</div>
						</div>
					</div>
				</div>
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
					<a type="button" href="<c:url value='/community/write/1'/>" class="btn btn-muted shadow">글 작성</a>
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