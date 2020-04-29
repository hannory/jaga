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
.table-head {
	border:1px solid #a6a6a6;
	background:#e7e6e6;
}
.table-title {
	background:#7edfc6;
	text-align:left;
	padding-left:20px;
}
.table-subTitle {
	background:#d3ede6;
	text-align:left;
	padding-left:40px;
}
.table-subSubTitle {
	text-align:left;
	padding-left:61px;
}
	#foldBtn {
		background:#24574A;
		border-radius:4px;
		padding:1px;
		padding-bottom:7px;
		color:white;
	}
	#foldImg {
		height:30px;
		padding:1px;
		padding-right:3px;
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
				<td><h2 class="mt-4">재무제표</h2></td>
				<td width="50%" align="right"><span>조회기간&nbsp;&nbsp;&nbsp;&nbsp;</span><input type="text" id="datepicker"></td>
			</tr>
		</table>
		<table style="margin-bottom:15px">
			<tr>
				<td><span class="subtitle"><a href="compTrialBal.fs">합계잔액시산표</a></span></td>
				<td><span class="subtitle" style="border-bottom:1px solid #24574A">재무상태표</span></td>
				<td><span class="subtitle"><a href="incomeStmt.fs">손익계산서</a></span></td>
				<td><span class="subtitle"><a href="mfrgCostsStmt.fs">제조원가명세서</a></span></td>
				<td><span class="subtitle"><a href="stmtOfCashFlow.fs">현금흐름표</a></span></td>
				<td align="right" style="width:180px;"><span id="foldBtn"><img id="foldImg" src="${contextPath}/resources/images/fold.PNG"></span></td>
			</tr>
		</table>
		<table id="contentTable" width="1100px" style="text-align:center;">
			<tr>
				<td class="table-head" width="28%" rowspan="2">과&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;목</td>
				<td class="table-head" colspan="2">제 14(당)기 2020.03.25 현재</td>
				<td class="table-head" colspan="2">제 13(전)기 2019.12.31 현재</td>
			</tr>
			<tr>
				<td class="table-head" width="18%">잔액</td>
				<td class="table-head" width="18%">합계</td>
				<td class="table-head" width="18%">잔액</td>
				<td class="table-head" width="18%">합계</td>
			</tr>
			<tr>
				<td class="table-title" style="padding-left:0px;">자산</td>
				<td class="table-title"></td>
				<td class="table-title"></td>
				<td class="table-title"></td>
				<td class="table-title"></td>
			</tr>
			<tr>
				<td class="table-title">Ⅰ. 유동자산</td>
				<td class="table-title"></td>
				<td class="table-title"></td>
				<td class="table-title"></td>
				<td class="table-title"></td>
			</tr>
			<tr>
				<td class="table-subTitle">① 당좌자산</td>
				<td class="table-subTitle"></td>
				<td class="table-subTitle"></td>
				<td class="table-subTitle"></td>
				<td class="table-subTitle"></td>
			</tr>
			<tr>
				<td class="table-subSubTitle">현금및현금성자산</td>
				<td></td>
				<td></td>
				<td></td>
				<td></td>
			</tr>
			<tr>
				<td class="table-subSubTitle">단기투자자산</td>
				<td></td>
				<td></td>
				<td></td>
				<td></td>
			</tr>
			<tr>
				<td class="table-subSubTitle">매출채권</td>
				<td></td>
				<td></td>
				<td></td>
				<td></td>
			</tr>
			<tr>
				<td class="table-subTitle">② 재고자산</td>
				<td class="table-subTitle"></td>
				<td class="table-subTitle"></td>
				<td class="table-subTitle"></td>
				<td class="table-subTitle"></td>
			</tr>
			<tr>
				<td class="table-title">Ⅱ. 비유동자산</td>
				<td class="table-title"></td>
				<td class="table-title"></td>
				<td class="table-title"></td>
				<td class="table-title"></td>
			</tr>
			<tr>
				<td class="table-subTitle">① 투자자산</td>
				<td class="table-subTitle"></td>
				<td class="table-subTitle"></td>
				<td class="table-subTitle"></td>
				<td class="table-subTitle"></td>
			</tr>
			<tr>
				<td class="table-subTitle">② 유형자산</td>
				<td class="table-subTitle"></td>
				<td class="table-subTitle"></td>
				<td class="table-subTitle"></td>
				<td class="table-subTitle"></td>
			</tr>
			<tr>
				<td class="table-subTitle">③ 무형자산</td>
				<td class="table-subTitle"></td>
				<td class="table-subTitle"></td>
				<td class="table-subTitle"></td>
				<td class="table-subTitle"></td>
			</tr>
			<tr>
				<td class="table-subTitle">④ 기타비유동자산</td>
				<td class="table-subTitle"></td>
				<td class="table-subTitle"></td>
				<td class="table-subTitle"></td>
				<td class="table-subTitle"></td>
			</tr>
			<tr>
				<td class="table-title" style="padding-left:0px;">자산총계</td>
				<td class="table-title"></td>
				<td class="table-title"></td>
				<td class="table-title"></td>
				<td class="table-title"></td>
			</tr>
			<tr>
				<td class="table-title" style="padding-left:0px;">부채</td>
				<td class="table-title"></td>
				<td class="table-title"></td>
				<td class="table-title"></td>
				<td class="table-title"></td>
			</tr>
			<tr>
				<td class="table-title">Ⅰ. 유동부채</td>
				<td class="table-title"></td>
				<td class="table-title"></td>
				<td class="table-title"></td>
				<td class="table-title"></td>
			</tr>
			<tr>
				<td class="table-title">Ⅱ. 비유동부채</td>
				<td class="table-title"></td>
				<td class="table-title"></td>
				<td class="table-title"></td>
				<td class="table-title"></td>
			</tr>
			<tr>
				<td class="table-title" style="padding-left:0px;">부채총계</td>
				<td class="table-title"></td>
				<td class="table-title"></td>
				<td class="table-title"></td>
				<td class="table-title"></td>
			</tr>
			<tr>
				<td class="table-title" style="padding-left:0px;">자본</td>
				<td class="table-title"></td>
				<td class="table-title"></td>
				<td class="table-title"></td>
				<td class="table-title"></td>
			</tr>
			<tr>
				<td class="table-title">Ⅰ. 자본금</td>
				<td class="table-title"></td>
				<td class="table-title"></td>
				<td class="table-title"></td>
				<td class="table-title"></td>
			</tr>
			<tr>
				<td class="table-title">Ⅱ. 자본잉여금</td>
				<td class="table-title"></td>
				<td class="table-title"></td>
				<td class="table-title"></td>
				<td class="table-title"></td>
			</tr>
			<tr>
				<td class="table-title">Ⅲ. 자본조정</td>
				<td class="table-title"></td>
				<td class="table-title"></td>
				<td class="table-title"></td>
				<td class="table-title"></td>
			</tr>
			<tr>
				<td class="table-title">Ⅳ. 기타포괄손익누계액</td>
				<td class="table-title"></td>
				<td class="table-title"></td>
				<td class="table-title"></td>
				<td class="table-title"></td>
			</tr>
			<tr>
				<td class="table-title">Ⅴ. 이익잉여금</td>
				<td class="table-title"></td>
				<td class="table-title"></td>
				<td class="table-title"></td>
				<td class="table-title"></td>
			</tr>
			<tr>
				<td class="table-title" style="padding-left:0px;">(당기순이익)</td>
				<td class="table-title"></td>
				<td class="table-title"></td>
				<td class="table-title"></td>
				<td class="table-title"></td>
			</tr>
			<tr>
				<td class="table-title" style="padding-left:0px;">자본총계</td>
				<td class="table-title"></td>
				<td class="table-title"></td>
				<td class="table-title"></td>
				<td class="table-title"></td>
			</tr>
			<tr>
				<td class="table-title" style="padding-left:0px;">부채와자본총계</td>
				<td class="table-title"></td>
				<td class="table-title"></td>
				<td class="table-title"></td>
				<td class="table-title"></td>
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