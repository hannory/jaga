<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<style>
.tap {
	height: 35px;
    border: 1px solid #C9CACE;
    background-color:#8DABA3;
    color: white;
	border-top-left-radius:10px;
	border-top-right-radius:10px;
}
.tap > p {
	margin-left: 5px;
	margin-right: 5px;
	margin-top: 3px;
}
.table-justify1 {
	width: 183px;
	display: flex;
	justify-content: space-between;
}
.hidden-right {
	color: rgba(0,0,0,0);
	margin-bottom: 0px;
}
.table-justify2 {
	width: 180px;
	display: flex;
	justify-content: space-between;
}
.table-justify3 {
	width: 150px;
	display: flex;
	justify-content: space-between;
}
/* table-justify1과 같은 레벨인데 번호가 2자리인 경우 */
.table-justify4 {
	width: 200px;
	display: flex;
	justify-content: space-between;
}
.table-head {
	border:1px solid #a6a6a6;
	background:#e7e6e6;
}
#foldBtn {
	width:77px;
	background:#24574A;
	border-radius:5px;
	color:white;
}
#foldImg {
	width:70px;
	height:26px;
	padding:1px;
	padding-right:3px;
}
#inputNum {
	text-align:right;
}
#inputNum::-webkit-inner-spin-button,
#inputNum::-webkit-outer-spin-button {
	-webkit-appearance:none;
}
</style>
<title>자가 경리</title>
</head>
<body>
	<jsp:include page="../common/menubar.jsp" />
	<c:set var="contextPath"
		value="${ pageContext.servletContext.contextPath }"
		scope="application" />
	<main>
	<div class="container-fluid">
		<table width="1100px">
			<tr>
				<td><h2 class="mt-4">일계표(월계표)</h2></td>
				<td width="50%" align="right"><span>조회기간&nbsp;&nbsp;&nbsp;&nbsp;</span><input type="text" id="datepicker"> ~ <input type="text" id="datepicker1"></td>
			</tr>
		</table>
		<div>
			<ul class="nav nav-pills">
				<li class="click_li"><div class="tap" onclick="showTax1()" style="background:#1B5748;"><p>일계표</p></div></li>
				<li class="click_li"><div class="tap" onclick="showTax2()"><p>월계표</p></div></li>
			</ul>
		</div>
		<script>/* 버튼 스크립트 */
			$(function() {
				$("#tax2").css("display", "none");
				$(".tap").click(function() {
					$(".tap").css("background", "#8DABA3");
					$(this).css("background", "#1B5748");
					$(this).css("color", "white");
				});
			});
		</script>
		<table id="contentTable" width="1100px" style="text-align:center;">
			<tr>
				<td class="table-head" colspan="2">차변</td>
				<td class="table-head" width="28%" rowspan="2" align="center"><div class="table-justify3"><div>계</div><div>정</div><div>과</div><div>목</div></td>
				<td class="table-head" colspan="2">대변</td>
			</tr>
			<tr>
				<td class="table-head" width="18%">잔액</td>
				<td class="table-head" width="18%">합계</td>
				<td class="table-head" width="18%">합계</td>
				<td class="table-head" width="18%">잔액</td>
			</tr>
			<tr ondblclick="PopSlipModal()">
				<td></td>
				<td></td>
				<td align="center"><div class="table-justify1"><div>1. 유</div><div>동</div><div>자</div><div>산 <label class="hidden-right">.1</label></div></div></td>
				<td></td>
				<td></td>
			</tr>
			<tr>
				<td></td>
				<td></td>
				<td align="center"><div class="table-justify2"><div>< 당</div><div>좌</div><div>자</div><div>산 ></div></div></td>
				<td></td>
				<td></td>
			</tr>
			<tr>
				<td></td>
				<td></td>
				<td align="center"><div class="table-justify3"><div>현</div><div>금</div><div>및</div><div>현</div><div>금</div><div>성</div><div>자</div><div>산</div></td>
				<td></td>
				<td></td>
			</tr>
			<tr>
				<td></td>
				<td></td>
				<td align="center"><div class="table-justify3"><div>단</div><div>기</div><div>투</div><div>자</div><div>자</div><div>산</div></td>
				<td></td>
				<td></td>
			</tr>
			<tr>
				<td></td>
				<td></td>
				<td align="center"><div class="table-justify3"><div>매</div><div>출</div><div>채</div><div>권</div></td>
				<td></td>
				<td></td>
			</tr>
			<tr>
				<td></td>
				<td></td>
				<td align="center"><div class="table-justify3"><div>대</div><div>손</div><div>충</div><div>당</div><div>금</div></td>
				<td></td>
				<td></td>
			</tr>
			<tr>
				<td></td>
				<td></td>
				<td align="center"><div class="table-justify3"><div>미</div><div>수</div><div>금</div></td>
				<td></td>
				<td></td>
			</tr>
			<tr>
				<td></td>
				<td></td>
				<td align="center"><div class="table-justify3"><div>소</div><div>모</div><div>품</div></td>
				<td></td>
				<td></td>
			</tr>
			<tr>
				<td></td>
				<td></td>
				<td align="center"><div class="table-justify3"><div>선</div><div>급</div><div>금</div></td>
				<td></td>
				<td></td>
			</tr>
			<tr>
				<td></td>
				<td></td>
				<td align="center"><div class="table-justify3"><div>선</div><div>급</div><div>비</div><div>용</div></td>
				<td></td>
				<td></td>
			</tr>
			<tr>
				<td></td>
				<td></td>
				<td align="center"><div class="table-justify3"><div>가</div><div>지</div><div>급</div><div>금</div></td>
				<td></td>
				<td></td>
			</tr>
			<tr>
				<td></td>
				<td></td>
				<td align="center"><div class="table-justify3"><div>부</div><div>가</div><div>세</div><div>대</div><div>급</div><div>금</div></td>
				<td></td>
				<td></td>
			</tr>
			<tr>
				<td></td>
				<td></td>
				<td align="center"><div class="table-justify3"><div>임</div><div>직</div><div>등</div><div>단</div><div>기</div><div>채</div><div>권</div></td>
				<td></td>
				<td></td>
			</tr>
			<tr>
				<td></td>
				<td></td>
				<td align="center"><div class="table-justify2"><div>< 재</div><div>고</div><div>자</div><div>산 ></div></div></td>
				<td></td>
				<td></td>
			</tr>
			<tr>
				<td></td>
				<td></td>
				<td align="center"><div class="table-justify3"><div>상</div><div>품</div></td>
				<td></td>
				<td></td>
			</tr>
			<tr>
				<td></td>
				<td></td>
				<td align="center"><div class="table-justify3"><div>제</div><div>품</div></td>
				<td></td>
				<td></td>
			</tr>
			<tr>
				<td></td>
				<td></td>
				<td align="center"><div class="table-justify3"><div>원</div><div>재</div><div>료</div></td>
				<td></td>
				<td></td>
			</tr>
			<tr>
				<td></td>
				<td></td>
				<td align="center"><div class="table-justify3"><div>재</div><div>공</div><div>품</div></td>
				<td></td>
				<td></td>
			</tr>
			<tr>
				<td></td>
				<td></td>
				<td align="center"><div class="table-justify1"><div>2. 비</div><div>유</div><div>동</div><div>자</div><div>산 <label class="hidden-right">.2</label></div></div></td>
				<td></td>
				<td></td>
			</tr>
			<tr>
				<td></td>
				<td></td>
				<td align="center"><div class="table-justify2"><div>< 투</div><div>자</div><div>자</div><div>산 ></div></div></td>
				<td></td>
				<td></td>
			</tr>
			<tr>
				<td></td>
				<td></td>
				<td align="center"><div class="table-justify3"><div>장</div><div>기</div><div>투</div><div>자</div><div>증</div><div>권</div></td>
				<td></td>
				<td></td>
			</tr>
			<tr>
				<td></td>
				<td></td>
				<td align="center"><div class="table-justify3"><div>장</div><div>기</div><div>대</div><div>여</div><div>금</div></td>
				<td></td>
				<td></td>
			</tr>
			<tr>
				<td></td>
				<td></td>
				<td align="center"><div class="table-justify1"><div>3. 유</div><div>동</div><div>부</div><div>채 <label class="hidden-right">.3</label></div></div></td>
				<td></td>
				<td></td>
			</tr>
			<tr>
				<td></td>
				<td></td>
				<td align="center"><div class="table-justify3"><div>외</div><div>상</div><div>매</div><div>입</div><div>금</div></td>
				<td></td>
				<td></td>
			</tr>
			<tr>
				<td></td>
				<td></td>
				<td align="center"><div class="table-justify3"><div>지</div><div>급</div><div>어</div><div>음</div></td>
				<td></td>
				<td></td>
			</tr>
			<tr>
				<td></td>
				<td></td>
				<td align="center"><div class="table-justify3"><div>미</div><div>지</div><div>급</div><div>금</div></td>
				<td></td>
				<td></td>
			</tr>
			<tr>
				<td></td>
				<td></td>
				<td align="center"><div class="table-justify3"><div>예</div><div>수</div><div>금</div></td>
				<td></td>
				<td></td>
			</tr>
			<tr>
				<td></td>
				<td></td>
				<td align="center"><div class="table-justify3"><div>부</div><div>가</div><div>세</div><div>예</div><div>수</div><div>금</div></td>
				<td></td>
				<td></td>
			</tr>
			<tr>
				<td></td>
				<td></td>
				<td align="center"><div class="table-justify1"><div>4. 매</div><div>출 <label class="hidden-right">.4</label></div></div></td>
				<td></td>
				<td></td>
			</tr>
			<tr>
				<td></td>
				<td></td>
				<td align="center"><div class="table-justify3"><div>외</div><div>상</div><div>매</div><div>입</div><div>금</div></td>
				<td></td>
				<td></td>
			</tr>
			<tr>
				<td></td>
				<td></td>
				<td align="center"><div class="table-justify1"><div>5. 제</div><div>조</div><div>원</div><div>가 <label class="hidden-right">.5</label></div></div></td>
				<td></td>
				<td></td>
			</tr>
			<tr>
				<td></td>
				<td></td>
				<td align="center"><div class="table-justify2"><div>< 노</div><div>무</div><div>비 ></div></div></td>
				<td></td>
				<td></td>
			</tr>
			<tr>
				<td></td>
				<td></td>
				<td align="center"><div class="table-justify3"><div>복</div><div>리</div><div>후</div><div>생</div><div>비</div></td>
				<td></td>
				<td></td>
			</tr>
			<tr>
				<td></td>
				<td></td>
				<td align="center"><div class="table-justify3"><div>여</div><div>비</div><div>교</div><div>통</div><div>비</div></td>
				<td></td>
				<td></td>
			</tr>
			<tr>
				<td></td>
				<td></td>
				<td align="center"><div class="table-justify1"><div>6. 판</div><div>매</div><div>비</div><div>및</div><div>일</div><div>반</div><div>관</div><div>리</div><div>비 <label class="hidden-right">.6</label></div></div></td>
				<td></td>
				<td></td>
			</tr>
			<tr>
				<td></td>
				<td></td>
				<td align="center"><div class="table-justify1"><div>7. 영</div><div>업</div><div>외</div><div>수</div><div>익 <label class="hidden-right">.7</label></div></div></td>
				<td></td>
				<td></td>
			</tr>
			<tr>
				<td></td>
				<td></td>
				<td align="center"><div class="table-justify1"><div>8. 영</div><div>업</div><div>외</div><div>비</div><div>용 <label class="hidden-right">.8</label></div></div></td>
				<td></td>
				<td></td>
			</tr>
			<tr>
				<td class="table-head" width="18%"></td>
				<td class="table-head" width="18%"></td>
				<td class="table-head" width="18%" align="center"><div class="table-justify3"><div>합</div><div>계</div></td>
				<td class="table-head" width="18%"></td>
				<td class="table-head" width="18%"></td>
			</tr>
		</table>
		<div style="height: 10vh;"></div>
		<div class="card mb-4">
			<div class="card-body">일계표란 자금및 물품의 출납을 밝히기 위해서 그날그날 기재하는 표 형식의 문서를 말한다. 즉 일계표는 현금의 수입, 지출, 거래 등에 관한 일별 현황을 기재하는 장부를 말한다.</div>
		</div>
	</div>
	</main>
	<script>
	/* 날짜 input jquery ui */
	$.datepicker.setDefaults({
		showOn : "both",
		buttonImageOnly : true,
		buttonImage : "${contextPath}/resources/images/calendar.png",
		dateFormat : 'yy-mm-dd'

	});
	$(function() {
		$("#datepicker").datepicker({});
		$("#datepicker1").datepicker({});
		/* 달력버튼 */
		$("img.ui-datepicker-trigger")
				.attr("style","margin-left:2px; vertical-align:middle; cursor: Pointer; width:20px; height:20px");
		
		/* 표에서 하늘색 hover 주기 */
		$("#contentTable td").mouseover(function() {
			$(this).parent().css("background", "#DDEBF7");
		});
		
		$("#contentTable td").mouseout(function() {
			$(this).parent().css("background", "white");
		});		
	});
	</script>
	<jsp:include page="../common/menubar2.jsp" />
</body>
</html>