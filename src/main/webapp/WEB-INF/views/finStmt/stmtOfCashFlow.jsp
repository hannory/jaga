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
				<td><h2 class="mt-4">재무제표</h2></td>
				<td width="50%" align="right"><span>조회기간&nbsp;&nbsp;&nbsp;&nbsp;</span><input type="text" id="datepicker"> ~ <input type="text" id="datepicker1"></td>
			</tr>
		</table>
		<table style="margin-bottom:15px">
			<tr>
				<td><span class="subtitle"><a href="compTrialBal.fs">합계잔액시산표</a></span></td>
				<td><span class="subtitle"><a href="stmtOfFinPos.fs">재무상태표</a></span></td>
				<td><span class="subtitle"><a href="incomeStmt.fs">손익계산서</a></span></td>
				<td><span class="subtitle"><a href="mfrgCostsStmt.fs">제조원가명세서</a></span></td>
				<td><span class="subtitle" style="border-bottom:1px solid #24574A"><a href="stmtOfCashFlow.fs">현금흐름표</a></span></td>
				<td align="right" style="width:180px;"><span id="foldBtn"><img id="foldImg" src="${ contextPath }/resources/images/fold.PNG"></span></td>
			</tr>
		</table>
		<table id="contentTable" width="1100px" style="text-align:center;">
			<tr>
				<td class="table-head" width="28%" rowspan="2">과&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;목</td>
				<td class="table-head" colspan="2">제 14(당)기 2020.03.25 현재</td>
				<td class="table-head" colspan="2">제 13(전)기 2019.12.31 현재</td>
			</tr>
			<tr>
				<td class="table-head" colspan="2">금액</td>
				<td class="table-head" colspan="2">금액</td>
			</tr>
			<tr>
				<td class="table-title">Ⅰ. 영업활동 현금흐름</td>
				<td class="table-title" width="18%"></td>
				<td class="table-title" width="18%"></td>
				<td class="table-title" width="18%"></td>
				<td class="table-title" width="18%"></td>
			</tr>
			<tr>
				<td class="table-subTitle">1. 영업활동 현금유입액</td>
				<td class="table-subTitle"></td>
				<td class="table-subTitle"></td>
				<td class="table-subTitle"></td>
				<td class="table-subTitle"></td>
			</tr>
			<tr>
				<td class="table-subSubTitle">상품매출 활동 현금유입</td>
				<td></td>
				<td></td>
				<td></td>
				<td></td>
			</tr>
			<tr>
				<td class="table-subSubTitle">제품매출 활동 현금유입</td>
				<td></td>
				<td></td>
				<td></td>
				<td></td>
			</tr>
			<tr>
				<td class="table-subTitle">2. 영업활동 현금유출액</td>
				<td class="table-subTitle"></td>
				<td class="table-subTitle"></td>
				<td class="table-subTitle"></td>
				<td class="table-subTitle"></td>
			</tr>
			<tr>
				<td class="table-subSubTitle">상품매입 활동 현금유출</td>
				<td></td>
				<td></td>
				<td></td>
				<td></td>
			</tr>
			<tr>
				<td class="table-subSubTitle">여비교통비 활동 현금유출</td>
				<td></td>
				<td></td>
				<td></td>
				<td></td>
			</tr>
			<tr>
				<td class="table-title">Ⅱ. 투자활동 현금흐름</td>
				<td class="table-title" width="18%"></td>
				<td class="table-title" width="18%"></td>
				<td class="table-title" width="18%"></td>
				<td class="table-title" width="18%"></td>
			</tr>
			<tr>
				<td class="table-subTitle">1. 투자활동 현금유입액</td>
				<td class="table-subTitle"></td>
				<td class="table-subTitle"></td>
				<td class="table-subTitle"></td>
				<td class="table-subTitle"></td>
			</tr>
			<tr>
				<td class="table-subSubTitle">건물 처분 활동 현금유입</td>
				<td></td>
				<td></td>
				<td></td>
				<td></td>
			</tr>
			<tr>
				<td class="table-subTitle">2. 투자활동 현금유출액</td>
				<td class="table-subTitle"></td>
				<td class="table-subTitle"></td>
				<td class="table-subTitle"></td>
				<td class="table-subTitle"></td>
			</tr>
			<tr>
				<td class="table-subSubTitle">건물 취득 활동 현금 현금유출</td>
				<td></td>
				<td></td>
				<td></td>
				<td></td>
			</tr>
			<tr>
				<td class="table-title">Ⅲ. 재무활동 현금흐름</td>
				<td class="table-title" width="18%"></td>
				<td class="table-title" width="18%"></td>
				<td class="table-title" width="18%"></td>
				<td class="table-title" width="18%"></td>
			</tr>
			<tr>
				<td class="table-subTitle">1. 재무활동 현금유입액</td>
				<td class="table-subTitle"></td>
				<td class="table-subTitle"></td>
				<td class="table-subTitle"></td>
				<td class="table-subTitle"></td>
			</tr>
			<tr>
				<td class="table-subSubTitle">보통주자본금 출자 활동 현금유입</td>
				<td></td>
				<td></td>
				<td></td>
				<td></td>
			</tr>
			<tr>
				<td class="table-subTitle">2. 재무활동 현금유출액</td>
				<td class="table-subTitle"></td>
				<td class="table-subTitle"></td>
				<td class="table-subTitle"></td>
				<td class="table-subTitle"></td>
			</tr>
			<tr>
				<td class="table-subSubTitle">국고보조금 사용 호라동 현금유출</td>
				<td></td>
				<td></td>
				<td></td>
				<td></td>
			</tr>
			<tr>
				<td class="table-title">Ⅳ. 현금의 증가(감소)</td>
				<td class="table-title" width="18%"></td>
				<td class="table-title" width="18%"></td>
				<td class="table-title" width="18%"></td>
				<td class="table-title" width="18%"></td>
			</tr>
			<tr>
				<td class="table-title">Ⅴ. 기초의 현금 및 현금성자산</td>
				<td class="table-title" width="18%"></td>
				<td class="table-title" width="18%"></td>
				<td class="table-title" width="18%"></td>
				<td class="table-title" width="18%"></td>
			</tr>
			<tr>
				<td class="table-title">Ⅵ. 기말의 현금 및 현금성자산</td>
				<td class="table-title" width="18%"></td>
				<td class="table-title" width="18%"></td>
				<td class="table-title" width="18%"></td>
				<td class="table-title" width="18%"></td>
			</tr>
		</table>
		<div style="height: 10vh;"></div>
		<div class="card mb-4">
			<div class="card-body">일정 기간 동안 기업의 현금흐름을 나타내는 표이다. 기업이 현금을 어디에서 창출하였고 어떻게 사용하였는지를 보여준다.</div>
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