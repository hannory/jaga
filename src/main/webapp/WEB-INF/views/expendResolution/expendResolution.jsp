<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<meta charset="UTF-8">
<title>자가 경리</title>
<style>
.confirmTable {
	/* background: gray; */
	float: right;
	text-align: center;
	margin-top:-50px;
}

.topTr {
	/* background: aqua; */
	height: 30px;
}

.botTr {
	/* background: red; */
	height: 100px;
}

.topTd {
	width: 100px;
}

.botTd {
	width: 100px;
}
.topTdInput{
	width: 100px;
}

.div-menuTap {
	display: inline-block;
	background: #24574A;
	color: white;
	width: 160px;
	height: 30px;
	border-top-left-radius: 10px;
	border-top-right-radius: 10px;
	text-align: center;
	line-height: 30px;
	clear: both;
}

.div-menuTap:hover {
	cursor: pointer;
	opacity: 80%;
}

.div-menuTap-no {
	opacity: 50%;
}

.div-menuTap-no:hover {
	opacity: 80%;
}

.div-box-area {
	/* background:red; */
	width: 100%;
	border: 1px solid #C9CACE;
}

.table01 {
	width: 100%;
	text-align: center;
}

.table02 {
	margin-top: 10px;
	width: 100%;
	text-align: center;
}

.table03 {
	margin-top: 10px;
	width: 100%;
	text-align: center;
}

.color-green {
	background: #24574A;
	color:white;
}

.label-sign:hover {
	background: gray;
}

/* 모달(담당부서) */
.modal-layer {
	position: fixed;
	width: 100%;
	height: 100%;
	z-index: 1;
	display: none;
	background: rgba(150, 150, 150, 0.9);
	margin-left: -25px;
	animation: fadein 2s;
}

.modal-section {
	z-index: -1;
	width: 50%;
	height: 70%;
	background: white;
	margin-left: 250px;
	margin-top: 100px;
	border: 1px solid white;
}

.modal-dept-top {
	width: 100%;
	height: 10%;
	background: pink;
}


.deptDefaultRow:hover {
	/* 모달(담당부서) */
	background: gray;
	opacity: 30%;
	color: white;
}

.deptTempRow:hover {
	/* 모달(담당부서) */
	background: gray;
	opacity: 30%;
	color: white;
}
.accountTitleDefaultRow:hover {
	/* 모달(계정과목) */
	background: gray;
	opacity: 30%;
	color: white;
}
.accountTitleTempRow:hover {
	/* 모달(계정과목) */
	background: gray;
	opacity: 30%;
	color: white;
}
.comInIdDefaultRow:hover{
	/* 모달(담당부서) */
	background: gray;
	opacity: 30%;
	color: white;
}

.cursorPointer:hover{
	cursor: pointer;
	background:gray;
	opacity: 50%;
}

</style>
</head>
<body>
	<jsp:include page="../common/menubar.jsp" />
	<c:set var="contextPath"
		value="${ pageContext.servletContext.contextPath }"
		scope="application" />
	<main>
	<div class="container-fluid">
		<!-- 작업공간 -->






		<!-- @@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@ 모달(부서검색) 시작 @@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@ -->
		<!-- 모달창 영역(담당부서 검색) -->
		<div class="modal-layer" id="modalLayer">
			<!-- 회색영역 -->

			<!-- 모달 내 작업영역 -->
			<div class="modal-section">
				<button onclick="closeModal()" style="float: right;">X</button>

				<div style="width: 70%; height: 100%; overflow: scroll;">
					<!-- 스크롤 만들기 위한 div -->
					<table border="1"
						style="margin-top: 50px; margin-left: 140px; text-align: center;">
						<tr>
							<td style="width: 100px; background: #24574A;"><span>부서검색</span></td>
							<td><input id="searchDeptBox" type="text"
								style="width: 100%; height: 100%;"></td>
							<td style="width: 100px;">
								<div class="searchBtn" onclick="searchDept()">
									<img style="width: 30px; height: 30px;"
										src="${contextPath}/resources/images/search.PNG">
								</div>
							</td>
						</tr>
						<tr id="trDeptHead" style="background: #24574A;">
							<td>부서코드</td>
							<td colspan="2">부서 명</td>
						</tr>

						<c:if test="${ deptList ne null }">
							<c:forEach var="list" items="${ deptList }">
								<tr class="deptDefaultRow" onclick="selectDept(this);">
									<td>${ list.deptCode }</td>
									<td colspan="2">${ list.deptName }</td>
								</tr>
							</c:forEach>
						</c:if>

					</table>
				</div>
				<!-- //스크롤 만들기 위한 div -->



				<script>/* 담당부서 검색 관련 스크립트 */
					/* 부서 행 클릭 시 동작 */
					function selectDept(target) {
						var selectedDeptCode = target.children[0].innerHTML;
						var selectedDeptName = target.children[1].innerHTML;
						$("#inputDeptName").val(selectedDeptName);
						$("#inputDept").val(selectedDeptCode);
						console.log(selectedDeptCode);
						closeModal();
					}
					/* 부서 행 클릭 시 동작 끝 */
				
				
					/* 부서검색을 위한 스크립트 / 검색스크립트 */
					$('#searchDeptBox')
							.keyup(
									function(e) {
										/* 검색창에서 keyup 될 때 마다 실행 */
										var searchValue = e.target.value;
										var $deptDefaultRow = $(".deptDefaultRow");
										var listDeptTemp = new Array(JSON
												.parse('${ jsonList }'));
										var listDept = listDeptTemp[0]; /* listDept : list로 변환된 deptList */
										console.log("@@@@@@@@@@@@@@@@@@@@@@@@@")
										console.log(listDeptTemp[0])
										if (searchValue.length != 0) {
											console
													.log("searchValue 길이 : 0 아님")
											$deptDefaultRow.detach();

											for (var i = 0; i < listDept.length; i++) {
												if (listDept[i].deptName
														.includes(searchValue)
														|| listDept[i].deptCode
																.includes(searchValue)) {
													var tempDeptName = listDept[i].deptName;
													var tempDeptCode = listDept[i].deptCode;
													$(".deptTempRow").detach();
													$("#trDeptHead")
															.after(
																	"<tr class='deptTempRow' onclick='selectDept(this)'><td>"
																			+ tempDeptCode
																			+ "</td><td colspan='2'>"
																			+ tempDeptName
																			+ "</td></tr>");
												}
											}

										} else {
											for (var i = listDept.length - 1; i >= 0; i--) {
												$deptDefaultRow.detach();
												$("#trDeptHead")
														.after(
																"<tr class='deptTempRow' onclick='selectDept(this)'><td>"
																		+ listDept[i].deptCode
																		+ "</td><td colspan='2'>"
																		+ listDept[i].deptName
																		+ "</td></tr>");
											}
										}
									});

					/* 부서검색을 위한 스크립트 / 검색스크립트 끝*/
				</script>
				
				
				
				
				<script>
					/* 담당부서 관련 스크립트*/
					/* 모달 보여주기 */
					function showModalDept() {
						$("#modalLayer").fadeIn(200);
					}
					/* 모달 닫기 */
					function closeModal() {
						$("#modalLayer").fadeOut(200);
					}
					function searchDept() {
						alert("부서검색 검색 버튼 누름");
					}
		
					$(function() {
						$("#inputDept").focus(function(e) {
							//일단 수동으로 입력 가능하게 ...
							/* e.target.blur();
							showModalDept(); */
		
						});
					});
					/* --담당부서 검색 끝--*/
				</script>



			</div>
			<!-- //모달 내 작업영역 -->
		</div>
		<!-- //회색영역 -->
		<!-- //모달창 영역(담당부서 검색) 끝-->
		<!-- @@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@ 모달(부서검색) 끝 @@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@ -->






		<!-- @@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@ 모달(계정과목검색) 시작 @@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@ -->
		<!-- 모달창 영역(계정과목 검색) -->
		<div class="modal-layer" id="modalLayerSubject">
			<!-- 회색영역 -->

			<!-- 모달 내 작업영역 -->
			<div class="modal-section">
				<button onclick="closeModalSubject()" style="float: right;">X</button>
				
			
			<div style="width: 70%; height: 100%; overflow: scroll;">
					<!-- 스크롤 만들기 위한 div -->
				<table border="1"
					style="margin-top: 50px; margin-left: 140px; text-align: center;">
					<tr>
						<td style="width: 100px; background: #24574A;"><span>계정과목</span></td>
						<td style="width: 200px;">
							<input id="searchAccountTitleBox" type="text" style="width: 100%; height: 100%;">
						</td>
						<td style="width: 100px;">
							<div class="searchBtnSubject" onclick="searchSubject()">
								<img style="width: 30px; height: 30px;" src="${contextPath}/resources/images/search.PNG">
							</div>
						</td>
					</tr>
					<tr id="trAccountTitleHead" style="background: #24574A;">
						<td>코드</td>
						<td>계정과목명</td>
						<td>비고</td>
					</tr>
					
					<c:if test="${ accountTitleList ne null }">
							<c:forEach var="obj" items="${ accountTitleList }">
								<tr class="accountTitleDefaultRow" onclick="selectAccountTitle(this);">
									<td>${ obj.accountCode }</td>
									<td>${ obj.accountTitle }</td>
									<td>${ obj.character }</td>
								</tr>
							</c:forEach>
					</c:if>
					
				</table>
				</div><!-- 스크롤을 위한 div 끝 -->
			</div>
			<!-- //모달 내 작업영역 -->
		</div>
		<!-- //회색영역 -->
		<!-- //모달창 영역(계정과목) 끝-->
		
		<!-- 모달 계정과목 검색을 위한 스크립트 -->
		<script>/* 계정과목 검색 관련 스크립트 */
					/* 계정과목 행 클릭 시 동작 */
					function selectAccountTitle(target) {
						var selectedAccountTitleCode = target.children[0].innerHTML;
						var selectedAccountTitleName = target.children[1].innerHTML;
						var selectedAccountTitleCharacter = target.children[2].innerHTML;
						$("#inputAccountTitleName").val(selectedAccountTitleName);
						$("#inputAccountTitleCode").val(selectedAccountTitleCode);
						closeModalSubject();
					}
					/* 계정과목 행 클릭 시 동작 끝 */
				
					/* 계정과목검색을 위한 스크립트 / 검색스크립트 */	
					$('#searchAccountTitleBox')
							.keyup(
									function(e) {
										/* 검색창에서 keyup 될 때 마다 실행 */
										var searchValue = e.target.value;
										var $accountTitleDefaultRow = $(".accountTitleDefaultRow");
										var listAccountTitleTemp = new Array(JSON
												.parse('${ jsonAccountTitleList }'));
										var listAccountTitle = listAccountTitleTemp[0]; /* listAccountTitle : list로 변환된 listAccountTitle */

										if (searchValue.length != 0) {
											console.log("searchValue 길이 : 0 아님");
											$accountTitleDefaultRow.detach();
											$(".accountTitleTempRow").detach();
											for (var i = 0; i < listAccountTitle.length; i++) {
												if (listAccountTitle[i].accountTitle.includes(searchValue) 
														|| listAccountTitle[i].accountCode.includes(searchValue)) {
													var tempAccountTitleName = listAccountTitle[i].accountTitle;
													var tempAccountTitleCode = listAccountTitle[i].accountCode;
													var tempAccountTitleCharacter = listAccountTitle[i].character;
													/* $(".accountTitleTempRow").detach(); */
													
													$("#trAccountTitleHead")
															.after(
																	"<tr class='accountTitleTempRow' onclick='selectAccountTitle(this)'><td>"
																			+ tempAccountTitleCode
																			+ "</td><td>"
																			+ tempAccountTitleName
																			+ "</td><td>"
																			+ tempAccountTitleCharacter
																			+ "</td></tr>");
													
														
												}
											}//for end
											/* 저장된 문자열 붙이기 */
											/* $("#trAccountTitleHead").after(tempString); */
											
										} else {
											for (var i = listAccountTitle.length - 1; i >= 0; i--) {
												$accountTitleDefaultRow.detach();
												$("#trAccountTitleHead")
														.after(
																"<tr class='accountTitleTempRow' onclick='selectDept(this)'><td>"
																		+ listAccountTitle[i].accountCode
																		+ "</td><td>"
																		+ listAccountTitle[i].accountTitle
																		+ "</td><td>"
																		+ listAccountTitle[i].character
																		+ "</td></tr>");
											}
										}
									});

					/* 계정과목 검색을 위한 스크립트 / 검색스크립트 끝*/
				</script>
		<!-- 모달 계정과목 검색을 위한 스크립트 끝 -->
		
		<script>
			/* 계정과목 관련 스크립트*/
			/* 모달 보여주기 */
			function showModalSubject() {
				$("#modalLayerSubject").fadeIn(200);
			}
			/* 모달 닫기 */
			function closeModalSubject() {
				$("#modalLayerSubject").fadeOut(200);
			}
			function searchSubject() {
				alert("searchSubjectMethodExecute");
			}

			$(function() {
				$("#inputSubject").focus(function(e) {
					//일단 수동으로 입력 가능하게 ...
					/* e.target.blur();
					showModalSubject(); */

				});
			});
			/* --계정과목 검색끝--*/
		</script>


		<!-- @@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@ 모달(계정과목검색) 끝 @@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@ -->








		<!-- @@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@ 모달(담당자검색) 시작 @@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@ -->
		<!-- 모달창 영역(담당자 검색) -->
		<div class="modal-layer" id="modalLayerEmployee">
			<!-- 회색영역 -->

			<!-- 모달 내 작업영역 -->
			<div class="modal-section">
				<button onclick="closeModalEmployee()" style="float: right;">X</button>

				<table border="1"
					style="margin-top: 50px; margin-left: 140px; text-align: center;">
					<tr>
						<td style="width: 100px; background: #24574A;"><span>직원검색</span></td>
						<td><input type="text" style="width: 100%; height: 100%;"></td>
						<td style="width: 100px;">
							<div class="searchBtnEmployee" onclick="searchEmployee()">
								<img style="width: 30px; height: 30px;"
									src="${contextPath}/resources/images/search.PNG">
							</div>
						</td>
					</tr>
					<tr style="background: #24574A;">
						<td>직원코드</td>
						<td>직원명</td>
						<td>직급</td>
					</tr>
					
					<c:if test="${ comInIdList ne null }">
							<c:forEach var="obj" items="${ comInIdList }">
								<tr class="comInIdDefaultRow" onclick="selectComInId(this);">	<!-- 와드0422_1439 -->
									<td>${ obj.comInnerIdNum }</td>
									<td>${ obj.name }</td>
									<td>${ obj.positionName }</td>
								</tr>
							</c:forEach>
					</c:if>
					
					
				</table>
				
				<script>
				/* 모달 > 담당자 행 클릭 시 동작 */
				function selectComInId(target) {
					var selectedComInIdNum = target.children[0].innerHTML;
					var selectedComInIdName = target.children[1].innerHTML;
					var selectedComInIdPositionName = target.children[2].innerHTML;
					$("#inputComInIdNum").val(selectedComInIdNum);
					$("#inputComInIdName").val(selectedComInIdName);
					closeModalEmployee();
				}
				/* 모달 > 담당자 행 클릭 시 동작 끝 */
				</script>
				
			</div>
			<!-- //모달 내 작업영역 -->
		</div>
		<!-- //회색영역 -->
		<!-- //모달창 영역 -->
		<script>
			/* 담당부서 검색 */
			/* 모달 보여주기 */
			function showModalEmployee() {
				$("#modalLayerEmployee").fadeIn(200);
			}
			/* 모달 닫기 */
			function closeModalEmployee() {
				$("#modalLayerEmployee").fadeOut(200);
			}
			function searchEmployee() {
				alert("searchEmployeeMethodExecute");
			}

			$(function() {
				$("#inputEmployee").focus(function(e) {
					//일단 수동으로 입력 가능하게 ...
					/* e.target.blur();
					showModalEmployee(); */

				});
			});
			/* --담당자 검색 끝--*/
		</script>
		
		
		<!-- @@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@ 모달(담당자검색) 끝  @@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@ -->













		<!-- @@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@ 본 화면 내용 (모달X) @@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@ -->


		<form action="insertExpendResolution.expendResolution" method="post">
		
		
		<!-- 데이터 모아놓음 value들 밸루들 밸류들 -->
		
		<input type="hidden" id="managerPosition" name="managerPosition" value="직급명">
		
		<!-- 로그인한게 컴퍼니인지, 유저인지에 따라 createUser 값을 다르게 설정하기 -->
		<c:if test="${ empty sessionScope.loginCompany }">
			<%-- <input type="hidden" id="createUser" name="createUser" value="${ sessionScope.loginUser.id }"> --%>
			<input type="hidden" id="createUser" name="createUser" value="defaultUserId">
		</c:if>
		<c:if test="${ !empty sessionScope.loginCompany }">
			<input type="hidden" id="createUser" name="createUser" value="${ sessionScope.loginCompany.companyId }">
			<%-- <input type="hidden" id="createUser" name="createUser" value="${ defaultComId }"> --%>
		</c:if>
		
		<input type="hidden" id="comCode" name="comCode" value="${ loginCompany.companyCode }">
		
		<!-- //데이터 모아놓음 value들 밸루들 밸류들 끝-->
		
		
		
			<!-- 우측상단 결재 관련 -->
			<h2 class="mt-4">지출결의서</h2>


			<table class="confirmTable" border="1">
				<tr class="topTr" id="confirmTopRow">
					<td class="cursorPointer" style="width: 30px;" onclick="addBtn()">+</td>
					<td class="topTd">${ loginEmp.name }</td>
					<td class="topTd">
						<input type="hidden" id="apprInfoCode" name="apprInfoCode">
						<!-- <input type="text" id="apprEmpCode" name="apprEmpCode" class='topTdInput'> -->
						<select id="apprEmpCode" name="apprEmpCode">
							<c:if test="${ comInIdList ne null }">
								<c:forEach items="${ comInIdList }" var="obj">
									<option value="${ obj.comInnerIdNum }"><c:out value="${ obj.name }"/></option>	
								</c:forEach>
							</c:if>
						</select>
					</td>
				</tr>

				<tr class="botTr" id="confirmBotRow">
					<td class="">결재</td>
					<td class="botTd" id="tdDefaultEmpSign"><img id="defaultEmpSign" style="width:100%; height:100px;"></td>
					<td class="botTd" id="apprSignImg01">싸인</td>
				</tr>

			</table>
			<!-- //우측상단 결재 관련 -->
			
			<script>
			/* 우측상단 결재박스 늘리기 */
			var apprCount = 1;	//전역변수 설정	//
			function addBtn() {
				console.log(apprCount);
				apprCount++;
				console.log(apprCount);
				
				var topTdStr = "<td class='topTd'>"
							 + "<input style='width:100px;' type='hidden' id='apprInfoCodeㅋㅋㅋ" + apprCount + "' name='apprInfoCodeㅋㅋㅋ" + apprCount + "'>"
							 /* + "<input type='text' id='apprEmpCodeㅋㅋㅋ" + apprCount + "' class='topTdInput' name='apprEmpCodeㅋㅋㅋ" + apprCount + "'></td>" ;*/
							 + "<select>" 
							 + "<option>김사장</option>"
							 + "<option>222</option>"
							 + "<option>333</option>"
							 + "</select>"
				var botTdStr = "<td class='botTd' id='apprSignImg01'>싸인</td>";
				
				$(".topTd:last-child").after(topTdStr);
				$(".botTd:last-child").after(botTdStr);
				
				console.log($(".topTdInput:nth-last-child(1)"));
				/* console.log($(".topTdInput:last-child").attr("name")); */
				
				
				/* var nodeTop = document.createElement("td");
				var textnodeTop = document.createTextNode("품의자");
				nodeTop.appendChild(textnodeTop);
				document.getElementById("confirmTopRow").appendChild(nodeTop);

				var nodeBot = document.createElement("td");
				var textnodeBot = document.createTextNode("싸인");
				nodeBot.appendChild(textnodeBot);
				document.getElementById("confirmBotRow").appendChild(nodeBot); */

			}
		</script>













			<!-- 탭메뉴 영역 -->
			<div class="div-menuTap" style="margin-top: 105px;">
				<span>지출결의서 작성</span>
			</div>
			<div class="div-menuTap div-menuTap-no"
				onclick="showExpendResolutionList()">
				<span>지출결의서 목록</span>
			</div>

			<script>
				/* 지출결의서 조회 탭으로 이동 */
				function showExpendResolutionList() {
					location.href = "showExpendResolutionList.expendResolution";
				}
			</script>


			<!-- //탭메뉴 영역 -->

			<!-- 테이블 3개 감싸는 박스 -->
			<div class="div-box-area">

				<!-- 테이블 1번 -->
				<table class="table01" border="1">
					<tr>
						<td style="width: 15%" class="color-green">발의일</td>
						<td style="width: 25%"><input name="initiativeDate" readonly
							id="datepicker01" style="width: 100%; text-align: center;"></td>
						<td style="width: 10%"><span> <img class="dateTestBtn"
								id="dateTestBtn01"
								src="${contextPath}/resources/images/calendar.png"
								style="width: 25px; height: 25px;">
						</span></td>
						<td style="width: 15%" class="color-green">지출일</td>
						<td style="width: 25%"><input name="expendDate" readonly
							id="datepicker02" style="width: 100%; text-align: center;"></td>
						<td style="width: 10%"><span> <img class="dateTestBtn"
								id="dateTestBtn02"
								src="${contextPath}/resources/images/calendar.png"
								style="width: 25px; height: 25px;">
						</span></td>
					</tr>
					<tr>
						<td class="color-green">담당부서</td>
						<td><input id="inputDeptName" name="departmentCodeDisplay"
							type="text"
							style="width: 100%; height: 100%; text-align: center;"> <input
							id="inputDept" name="departmentCode" type="hidden"></td>
						<td onclick="showModalDept()"><img
							style="width: 20px; height: 20px;"
							src="${contextPath}/resources/images/search.PNG"></td>
						<td class="color-green">계정과목</td>
						<td>
						
							<input id="inputAccountTitleName" type="text" style="width: 100%; height: 100%; text-align: center;">
							<input id="inputAccountTitleCode" name="accountTitleCode" type="hidden">
							
						</td>
						<td onclick="showModalSubject()"><img
							style="width: 20px; height: 20px;"
							src="${contextPath}/resources/images/search.PNG"></td>
					</tr>
					<tr>
						<td class="color-green">담당자</td>
						<td>
						
						<input id="inputComInIdName" type="text" style="width: 100%; height: 100%; text-align: center;">
						<input id="inputComInIdNum" name="managerNo" type="hidden">
							
						</td>
						<td onclick="showModalEmployee()"><img
							style="width: 20px; height: 20px;"
							src="${contextPath}/resources/images/search.PNG"></td>
						<td class="color-green">지출합계</td>
						<td colspan="2" style="text-align: right"><input
							id="expendSummary" name="expendSummary" type="text" value="0"
							style="width: 100%; height: 100%; text-align: right;"></td>
					</tr>
					<tr>
						<td class="color-green">지출목적</td>
						<td colspan="5"><input type="text" name="expendPurpose"
							style="width: 100%"></td>
					</tr>
				</table>
				<!-- //테이블 1번 -->

				<br><br>

				<!-- 테이블 2번 -->
				<table class="table02" id="detailListTable" border="1">
					<tr>
						<td class="color-green">일자</td>
						<td class="color-green">적요</td>
						<td class="color-green">거래처</td>
						<td class="color-green">금액</td>
						<td class="color-green">비고</td>
					</tr>
					<tr>
						<td><input name="detailDate01" type="date"></td>
						<td><input name="detailBrief01" type="text"></td>
						<td><input name="detailVenderCode01" type="text"></td>
						<td><input name="detailPrice01" type="text" class="price"></td>
						<td><input name="detailMemo01" type="text"></td>
					</tr>
					<tr>
						<td><input name="detailDate02" type="date"></td>
						<td><input name="detailBrief02" type="text"></td>
						<td><input name="detailVenderCode02" type="text"></td>
						<td><input name="detailPrice02" type="text" class="price"></td>
						<td><input name="detailMemo02" type="text"></td>
					</tr>
					<tr>
						<td><input name="detailDate03" type="date"></td>
						<td><input name="detailBrief03" type="text"></td>
						<!-- <td><input name="detailVenderCode03" type="text"></td> -->
						<td>
							<c:if test="${ venderList ne null }">
								<select name="detailVenderCode03" style="width:100%;">
									<c:forEach items="${ venderList }" var="target">
										<option value="${ target.venderCode }">${ target.venderName }</option>
									</c:forEach>
								</select>
							</c:if>
						</td>
						<td><input name="detailPrice03" type="text" class="price"></td>
						<td><input name="detailMemo03" type="text"></td>
					</tr>

				</table>
				<!-- //테이블 2번 -->

				<br><br>


				<!-- 테이블 3번 -->
				<table class="table03" border="1">
					<tr>
						<td class="color-green" style="width: 10%">결제구분</td>
						<td style="width: 10%;"><input type="radio"
							name="paymentTypeCode" value="cash" id="radioCash"><label
							for="radioCash">현금</label></td>
						<td style="width: 10%;"><input type="radio"
							name="paymentTypeCode" value="card" id="radioCard"><label
							for="radioCard">카드</label></td>
						<td style="width: 10%; border-top: 1px solid white; border-right:white;"></td>
						<!-- <td style="width: 10%;" class="color-green">합계</td>
						<td style="width: 20%;"><span id="totalSumDisplay"></span></td> -->
					</tr>
					<tr>
						<td class="color-green">관련증빙</td>
						<td><input type="radio" name="evidenceCode" class="evidenceTemp"
							value="10" id="radiotaxReception"><label
							for="radiotaxReception">세금계산서</label></td>
						<td><input type="radio" name="evidenceCode" class="evidenceTemp"
							value="50" id="radiocashReception"><label
							for="radiocashReception">현금영수증</label></td>
						<td><input type="radio" name="evidenceCode" class="evidenceTemp"
							value="100" id="radiocardReception"><label
							for="radiocardReception">카드영수증</label></td>
						<td><input type="radio" name="evidenceCode" class="evidenceTemp"
							value="999" id="radioetcReception"><label
							for="radioetcReception">기타</label></td>
						<td><span id="receptionLabel">증빙파일을 선택하세요</span></td>
					</tr>
				</table>
				
				<!-- //테이블 3번 -->


			</div>
			<!-- 테이블 3개 감싸는 박스 -->



			<!-- 하단 영역 감싸는 박스 -->
			<div class="div-bot">
				<div>
					<!-- 두개 묶어주기 위한 div -->
					<br><span>위와 같이 지출을 결의하오니 허가하여주시기 바랍니다.</span>

					<div style="float: right; margin-top: 20px;">
						<!-- 
					<input type="text" maxlength="4" style="width:50px; text-align:right; border:1px solid white; border-bottom:1px solid black">년
					<input type="text" maxlength="2" style="width:50px; text-align:right; border:1px solid white; border-bottom:1px solid black">월
					<input type="text" maxlength="2" style="width:50px; text-align:right; border:1px solid white; border-bottom:1px solid black">일
					 -->
						<br> <label>작성자</label><input type="text"
							style="text-align: right; border: 1px solid white; border-bottom: 1px solid black;" readonly value="${ loginEmp.name }">
						<label class="label-sign" for="signInput">(인)</label> <input
							id="signInput" type="file" style="display: none"
							onchange="loadFileName(this)"> <br> 
							<label id="signFileName" for="signInput" style="float: right; display:none;">서명파일을 업로드하세요</label>
					</div>
				</div>
				<!-- //두개 묶어주기 위한 div -->
				<div class="buttonArea"
					style="margin-top: 70px; margin-left: 500px;">
					<button type="submit" style="background:#24574A; color:white; border-radius:5px; border:1px solid white;">등록</button>
					<button type="reset" style="background:#24574A; color:white; border-radius:5px; border:1px solid white;">취소</button>
				</div>
				<br> <br> <br> <input type="file" id="receptionFile"
					style="display: none;">

				<script>
					/* 파일이름 읽어와서 라벨에 넣어주기 */
					function loadFileName(signFileTag) {
						if (signFileTag.files && signFileTag.files[0]) {
							var signInput = document
									.getElementById("signInput");
							var signFileName = document
									.getElementById("signFileName");
							signFileName.innerHTML = signInput.value
									.substring(signInput.value
											.lastIndexOf("\\") + 1);
						}
					}

					/* 체크박스 클릭 시 파일 선택창 클릭 */
					$(function() {
						$(".evidenceTemp").click(function(e) {
							$("#receptionFile").click();
						});
					});

					/* 영수증 파일 선택 완료 시 파일 명  표시 */
					$(function() {
						$("#receptionFile").change(
								function(e) {
									var receptionFileName = e.target.value
											.substring(e.target.value
													.lastIndexOf("\\") + 1);
									$("#receptionLabel")
											.text(receptionFileName);
								});
					});
				</script>





			</div>
			<!-- //하단 영역 감싸는 박스 -->



		</form>

		



		<script>
			/* 지출합계에 숫자 3개마다 콤마 찍기 */
			window.onload = function() {
				$("#totalExpend").blur(function() {
					var num = $("#totalExpend").val();
					$("#totalExpend").val(num.toLocaleString());
				});

			}
		</script>







		<script>
			/* btn01 클릭하면 달력 나옴 */
			$(function() {
				$("#dateTestBtn01").click(function() {
					$("#datepicker01").focus();
				});
			});
			$(function() {
				$("#dateTestBtn02").click(function() {
					$("#datepicker02").focus();
				});
			});
			/* 날짜 input jquery ui */
			$.datepicker.setDefaults({
				showOn : "both",
				buttonImageOnly : true,
				buttonImage : "${contextPath}/resources/images/calendar.png",
				dateFormat : 'yy-mm-dd'

			});
			/* datepicker 동작하게 설정 */
			$(function() {
				$("#datepicker01").datepicker({});
				/* 달력버튼 */
				$("img.ui-datepicker-trigger")
						.attr(
								"style",
								"margin-left:2px; vertical-align:middle; cursor: Pointer; width:20px; height:20px; display:none;");
				$('.ui-datepicker ').css({
					"margin-left" : "0px",
					"margin-top" : "0px"
				}); //달력(calendar) 위치
			});
			$(function() {
				$("#datepicker02").datepicker({});
				/* 달력버튼 */
				$("img.ui-datepicker-trigger")
						.attr(
								"style",
								"margin-left:2px; vertical-align:middle; cursor: Pointer; width:20px; height:20px; display:none;");
				$('.ui-datepicker ').css({
					"margin-left" : "0px",
					"margin-top" : "0px"
				}); //달력(calendar) 위치
			});
		</script>





		<script>
			/* 상세내역 금액 총 합을 지출합계 항목으로 넣어준다 */
			$(function() {
				$(".price").blur(
						function(e) {
							console.log(e.target.value);
							//숫자만 입력하도록 함
							var value = e.target.value;
							var regExp = /^[0-9]+$/;
							if (!regExp.test(value)) {
								//문자있으므로 초기화시켜줌
								e.target.value = "";
							}

							//expendSummary(지출합계) 값을 자동으로 바꿔줌
							$("#expendSummary").val(
									Number($(".price").eq(0).val())
											+ Number($(".price").eq(1).val())
											+ Number($(".price").eq(2).val())
							);
							//totalSumDisplay(합계) 값을 자동으로 바꿔줌
							$("#totalSumDisplay").text(
									Number($(".price").eq(0).val())
									+ Number($(".price").eq(1).val())
									+ Number($(".price").eq(2).val())	
							);
							
						});

			});
		</script>


	
		



		<script>
		/* 본인싸인 기본으로 넣어놓는 스크립트 */
		var loginEmp = '${ loginEmp}';
		
		var startIndex = loginEmp.indexOf('fileName');
		var tempStr = loginEmp.substring(startIndex);
		
		var fileName = tempStr.substring(9,tempStr.indexOf(","));

		$("#defaultEmpSign").attr("src",'${contextPath}/resources/uploadFiles/signs/' + fileName);
		
		
		</script>
		
		











		<!-- footer -->
		<div class="card mb-4">
			<div class="card-body">
				도움말입니다. 읽어주세요*^^*
				<h1>${ test }</h1>
			</div>
		</div>
		<!-- ///footer -->
		<!-- //작업공간 -->
	</div>
	</main>
	<jsp:include page="../common/menubar2.jsp" />
</body>
</html>






