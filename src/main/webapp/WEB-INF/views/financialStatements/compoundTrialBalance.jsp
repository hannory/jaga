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
	/* width:200px;
	text-align:center; */
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
		<table width="1100px" style="text-align:center;">
			<tr>
				<td class="table-head" colspan="2">차변</td>
				<td class="table-head" width="28%" rowspan="2">계정과목</td>
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
				<td class="table-title">1. 유&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;동&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;자&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;산&nbsp;&nbsp;&nbsp;&nbsp;</td>
				<td class="table-title"></td>
				<td class="table-title"></td>
			</tr>
			<tr>
				<td class="table-subTitle"></td>
				<td class="table-subTitle"></td>
				<td class="table-subTitle">< 당&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;좌&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;자&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;산 ></td>
				<td class="table-subTitle"></td>
				<td class="table-subTitle"></td>
			</tr>
			<tr>
				<td></td>
				<td></td>
				<td>현 금 및 현금성 자산</td>
				<td></td>
				<td></td>
			</tr>
			<tr>
				<td></td>
				<td></td>
				<td>단 &nbsp;&nbsp;기 &nbsp;투 &nbsp;자 &nbsp;자 &nbsp;산</td>
				<td></td>
				<td></td>
			</tr>
			<tr>
				<td></td>
				<td></td>
				<td>매&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;출&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;채&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;권</td>
				<td></td>
				<td></td>
			</tr>
			<tr>
				<td></td>
				<td></td>
				<td>대&nbsp;&nbsp;&nbsp;&nbsp;손&nbsp;&nbsp;&nbsp;&nbsp;충&nbsp;&nbsp;&nbsp;당&nbsp;&nbsp;&nbsp;금</td>
				<td></td>
				<td></td>
			</tr>
			<tr>
				<td></td>
				<td></td>
				<td>미&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;수&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;금</td>
				<td></td>
				<td></td>
			</tr>
			<tr>
				<td></td>
				<td></td>
				<td>소&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;모&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;품</td>
				<td></td>
				<td></td>
			</tr>
			<tr>
				<td></td>
				<td></td>
				<td>선&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;급&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;금</td>
				<td></td>
				<td></td>
			</tr>
			<tr>
				<td></td>
				<td></td>
				<td>단 &nbsp;기 &nbsp;투 &nbsp;자 &nbsp;자 &nbsp;산</td>
				<td></td>
				<td></td>
			</tr>
			<tr>
				<td></td>
				<td></td>
				<td>단 &nbsp;기 &nbsp;투 &nbsp;자 &nbsp;자 &nbsp;산</td>
				<td></td>
				<td></td>
			</tr>
			<tr>
				<td></td>
				<td></td>
				<td>단 &nbsp;기 &nbsp;투 &nbsp;자 &nbsp;자 &nbsp;산</td>
				<td></td>
				<td></td>
			</tr>
			<tr>
				<td></td>
				<td></td>
				<td>단 &nbsp;기 &nbsp;투 &nbsp;자 &nbsp;자 &nbsp;산</td>
				<td></td>
				<td></td>
			</tr>
		</table>
		<div style="height: 100vh;"></div>
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