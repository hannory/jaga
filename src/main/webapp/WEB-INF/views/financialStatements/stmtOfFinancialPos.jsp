<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<style>
.subtitle {
	font-size:21px;
	margin-right:60px;
}
.table-justify1 {
	width: 183px;
	display: flex;
	justify-content: space-between;
}
.hidden-right {
	color: #7edfc6;
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
.table-title {
	background:#7edfc6;
}
.table-subTitle {
	background:#d3ede6;
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
</style>
<title></title>
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
				<td><h2 class="mt-4">재무제표</h2></td>
				<td width="50%" align="right"><span>조회기간&nbsp;&nbsp;&nbsp;&nbsp;</span><input type="text" id="datepicker"> ~ <input type="text" id="datepicker1">	</td>
			</tr>
		</table>
		
		
		<!-- <ol class="breadcrumb mb-4">
			<li class="breadcrumb-item"><a href="index.html">끨끨끨</a></li>
			<li class="breadcrumb-item active">희희희희희희희희희</li>
		</ol> -->
		<!-- <div class="card mb-4">
			<div class="card-body">
				<p class="mb-0">본문내용 영역임니다.</p>
			</div>
		</div> -->
		<table style="margin-bottom:15px">
			<tr>
				<td><span class="subtitle" style="border-bottom:1px solid #24574A">합계잔액시산표</span></td>
				<td><span class="subtitle">재무상태표</span></td>
				<td><span class="subtitle">손익계산서</span></td>
				<td><span class="subtitle">제조원가명세서</span></td>
				<td><span class="subtitle">현금흐름표</span></td>
				<td align="right" style="width:180px;"><div id="foldBtn"><img id="foldImg" src="${contextPath}/resources/images/fold.PNG"></div></td>
			</tr>
		</table>
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
			<tr>
				<td class="table-title"></td>
				<td class="table-title"></td>
				<td class="table-title" align="center"><div class="table-justify1"><div>1. 유</div><div>동</div><div>자</div><div>산 <label class="hidden-right">.1</label></div></div></td>
				<td class="table-title"></td>
				<td class="table-title"></td>
			</tr>
			<tr>
				<td class="table-subTitle"></td>
				<td class="table-subTitle"></td>
				<td class="table-subTitle" align="center"><div class="table-justify2"><div>< 당</div><div>좌</div><div>자</div><div>산 ></div></div></td>
				<td class="table-subTitle"></td>
				<td class="table-subTitle"></td>
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
				<td class="table-subTitle"></td>
				<td class="table-subTitle"></td>
				<td class="table-subTitle" align="center"><div class="table-justify2"><div>< 재</div><div>고</div><div>자</div><div>산 ></div></div></td>
				<td class="table-subTitle"></td>
				<td class="table-subTitle"></td>
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
				<td class="table-title"></td>
				<td class="table-title"></td>
				<td class="table-title" align="center"><div class="table-justify1"><div>2. 비</div><div>유</div><div>동</div><div>자</div><div>산 <label class="hidden-right">.2</label></div></div></td>
				<td class="table-title"></td>
				<td class="table-title"></td>
			</tr>
			<tr>
				<td class="table-subTitle"></td>
				<td class="table-subTitle"></td>
				<td class="table-subTitle" align="center"><div class="table-justify2"><div>< 투</div><div>자</div><div>자</div><div>산 ></div></div></td>
				<td class="table-subTitle"></td>
				<td class="table-subTitle"></td>
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
				<td class="table-subTitle"></td>
				<td class="table-subTitle"></td>
				<td class="table-subTitle" align="center"><div class="table-justify2"><div>< 유</div><div>형</div><div>자</div><div>산 ></div></div></td>
				<td class="table-subTitle"></td>
				<td class="table-subTitle"></td>
			</tr>
			<tr>
				<td></td>
				<td></td>
				<td align="center"><div class="table-justify3"><div>기</div><div>계</div><div>장</div><div>치</div></td>
				<td></td>
				<td></td>
			</tr>
			<tr>
				<td></td>
				<td></td>
				<td align="center"><div class="table-justify3"><div>감</div><div>가</div><div>상</div><div>각</div><div>누</div><div>계</div><div>액</div></td>
				<td></td>
				<td></td>
			</tr>
			<tr>
				<td></td>
				<td></td>
				<td align="center"><div class="table-justify3"><div>차</div><div>량</div><div>운</div><div>반</div><div>구</div></td>
				<td></td>
				<td></td>
			</tr>
			<tr>
				<td></td>
				<td></td>
				<td align="center"><div class="table-justify3"><div>감</div><div>가</div><div>상</div><div>각</div><div>누</div><div>계</div><div>액</div></td>
				<td></td>
				<td></td>
			</tr>
			<tr>
				<td></td>
				<td></td>
				<td align="center"><div class="table-justify3"><div>비</div><div>품</div></td>
				<td></td>
				<td></td>
			</tr>
			<tr>
				<td></td>
				<td></td>
				<td align="center"><div class="table-justify3"><div>감</div><div>가</div><div>상</div><div>각</div><div>누</div><div>계</div><div>액</div></td>
				<td></td>
				<td></td>
			</tr>
			<tr>
				<td class="table-title"></td>
				<td class="table-title"></td>
				<td class="table-title" align="center"><div class="table-justify1"><div>3. 유</div><div>동</div><div>부</div><div>채 <label class="hidden-right">.3</label></div></div></td>
				<td class="table-title"></td>
				<td class="table-title"></td>
			</tr>
			<tr>
				<td class="table-title"></td>
				<td class="table-title"></td>
				<td class="table-title" align="center"><div class="table-justify1"><div>4. 비</div><div>유</div><div>동</div><div>부</div><div>채 <label class="hidden-right">.4</label></div></div></td>
				<td class="table-title"></td>
				<td class="table-title"></td>
			</tr>
			<tr>
				<td class="table-title"></td>
				<td class="table-title"></td>
				<td class="table-title" align="center"><div class="table-justify1"><div>5. 자</div><div>본</div><div>금 <label class="hidden-right">.5</label></div></div></td>
				<td class="table-title"></td>
				<td class="table-title"></td>
			</tr>
			<tr>
				<td class="table-title"></td>
				<td class="table-title"></td>
				<td class="table-title" align="center"><div class="table-justify1"><div>6. 이</div><div>익</div><div>잉</div><div>여</div><div>금 <label class="hidden-right">.6</label></div></div></td>
				<td class="table-title"></td>
				<td class="table-title"></td>
			</tr>
			<tr>
				<td class="table-title"></td>
				<td class="table-title"></td>
				<td class="table-title" align="center"><div class="table-justify1"><div>7. 매</div><div>출 <label class="hidden-right">.7</label></div></div></td>
				<td class="table-title"></td>
				<td class="table-title"></td>
			</tr>
			<tr>
				<td class="table-title"></td>
				<td class="table-title"></td>
				<td class="table-title" align="center"><div class="table-justify1"><div>8. 제</div><div>조</div><div>원</div><div>가 <label class="hidden-right">.3</label></div></div></td>
				<td class="table-title"></td>
				<td class="table-title"></td>
			</tr>
			<tr>
				<td class="table-subTitle"></td>
				<td class="table-subTitle"></td>
				<td class="table-subTitle" align="center"><div class="table-justify2"><div>< 노</div><div>무</div><div>비 ></div></div></td>
				<td class="table-subTitle"></td>
				<td class="table-subTitle"></td>
			</tr>
			<tr>
				<td class="table-subTitle"></td>
				<td class="table-subTitle"></td>
				<td class="table-subTitle" align="center"><div class="table-justify2"><div>< 제</div><div>조</div><div>경</div><div>비 ></div></div></td>
				<td class="table-subTitle"></td>
				<td class="table-subTitle"></td>
			</tr>
			<tr>
				<td class="table-title"></td>
				<td class="table-title"></td>
				<td class="table-title" align="center"><div class="table-justify1"><div>9. 판</div><div>매</div><div>비</div><div>및</div><div>일</div><div>반</div><div>관</div><div>리</div><div>비 <label class="hidden-right">.6</label></div></div></td>
				<td class="table-title"></td>
				<td class="table-title"></td>
			</tr>
			<tr>
				<td class="table-title"></td>
				<td class="table-title"></td>
				<td class="table-title" align="center"><div class="table-justify4"><div>10. 영</div><div>업</div><div>외</div><div>수</div><div>익 <label class="hidden-right">.10</label></div></div></td>
				<td class="table-title"></td>
				<td class="table-title"></td>
			</tr>
			<tr>
				<td class="table-title"></td>
				<td class="table-title"></td>
				<td class="table-title" align="center"><div class="table-justify4"><div>11. 영</div><div>업</div><div>외</div><div>비</div><div>용 <label class="hidden-right">.11</label></div></div></td>
				<td class="table-title"></td>
				<td class="table-title"></td>
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
			<div class="card-body">When scrolling, the navigation stays at
				the top of the page. This is the end of the static navigation demo.</div>
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
		
	});
	</script>
	<jsp:include page="../common/menubar2.jsp" />
</body>
</html>