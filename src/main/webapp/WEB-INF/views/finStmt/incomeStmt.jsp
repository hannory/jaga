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
#inputNum:focus {
	background:#b3cfe4;
}
#inputNum::-webkit-inner-spin-button,
#inputNum::-webkit-outer-spin-button {
	-webkit-appearance:none;
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
		<table style="width:100%; max-width:1100px;">
			<tr>
				<td><h2 class="mt-4">재무제표</h2></td>
				<td width="50%" align="right"><span>조회기간&nbsp;&nbsp;&nbsp;&nbsp;</span><input type="number" style="width:70px"> 년&nbsp;&nbsp;&nbsp;&nbsp;
					<select>
						<option>1</option>
						<option>2</option>
						<option>3</option>
						<option>4</option>
						<option>5</option>
						<option>6</option>
						<option>7</option>
						<option>8</option>
						<option>9</option>
						<option>10</option>
						<option>11</option>
						<option>12</option>
					</select> 월
				</td>
			</tr>
		</table>
		<table style="margin-bottom:15px">
			<tr>
				<td><span class="subtitle"><a href="compTrialBal.fs">합계잔액시산표</a></span></td>
				<td><span class="subtitle"><a href="stmtOfFinPos.fs">재무상태표</a></span></td>
				<td><span class="subtitle" style="border-bottom:1px solid #24574A"><a href="incomeStmt.fs">손익계산서</a></span></td>
				<td><span class="subtitle"><a href="mfrgCostsStmt.fs">제조원가명세서</a></span></td>
				<td><span class="subtitle"><a href="stmtOfCashFlow.fs">현금흐름표</a></span></td>
				<td align="right" style="width:180px;"><div id="foldBtn"><img id="foldImg" src="${ contextPath }/resources/images/fold.PNG"></div></td>
			</tr>
		</table>
		<table style="width:100%; max-width:1100px;">
			<tr>
				<td>
					<div style="margin-bottom:10px; color:red;"><img src="${ contextPath }/resources/images/pencil.PNG">기말상품재고액을 입력하세요</div>		
				</td>
				<td align="right">
					<button type="button" onclick="insertIncomeStmt();">마감</button>
				</td>
			</tr>
		</table>
		<form id="contentForm" action="insertIncomeStmt.fs" method="post">		
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
					<td class="table-title">Ⅰ. 매출액</td>
					<td class="table-title"></td>
					<td class="table-title"></td>
					<td class="table-title"></td>
					<td class="table-title"></td>
				</tr>
				<tr>
					<td class="table-subSubTitle">상품매출</td>
					<td></td>
					<td></td>
					<td></td>
					<td></td>
				</tr>
				<tr>
					<td class="table-subSubTitle">제품매출</td>
					<td></td>
					<td></td>
					<td></td>
					<td></td>
				</tr>
				<tr>
					<td class="table-title">Ⅱ. 매출원가</td>
					<td class="table-title"></td>
					<td class="table-title"></td>
					<td class="table-title"></td>
					<td class="table-title"></td>
				</tr>
				<tr>
					<td class="table-subTitle">상품매출원가</td>
					<td class="table-subTitle"></td>
					<td class="table-subTitle"></td>
					<td class="table-subTitle"></td>
					<td class="table-subTitle"></td>
				</tr>
				<tr>
					<td class="table-subSubTitle">기초상품재고액</td>
					<td></td>
					<td></td>
					<td></td>
					<td></td>
				</tr>
				<tr>
					<td class="table-subSubTitle">당기상품재고액</td>
					<td></td>
					<td></td>
					<td></td>
					<td></td>
				</tr>
				<tr>
					<td class="table-subSubTitle">기말상품재고액</td>
					<td><input type="text" id="inputNum" name="endingInvOfMdse" onkeyup="inputNumberFormat(this);"></td>
					<td></td>
					<td></td>
					<td></td>
				</tr>
				<tr>
					<td class="table-subTitle">제품매출원가</td>
					<td class="table-subTitle"></td>
					<td class="table-subTitle"></td>
					<td class="table-subTitle"></td>
					<td class="table-subTitle"></td>
				</tr>
				<tr>
					<td class="table-subSubTitle">기초제품재고액</td>
					<td></td>
					<td></td>
					<td></td>
					<td></td>
				</tr>
				<tr>
					<td class="table-subSubTitle">당기제품재고액</td>
					<td></td>
					<td></td>
					<td></td>
					<td></td>
				</tr>
				<tr>
					<td class="table-subSubTitle">기말제품재고액</td>
					<td></td>
					<td></td>
					<td></td>
					<td></td>
				</tr>
				<tr>
					<td class="table-title">Ⅲ. 매출총이익</td>
					<td class="table-title"></td>
					<td class="table-title"></td>
					<td class="table-title"></td>
					<td class="table-title"></td>
				</tr>
				<tr>
					<td class="table-title">Ⅳ. 판매비와관리비</td>
					<td class="table-title"></td>
					<td class="table-title"></td>
					<td class="table-title"></td>
					<td class="table-title"></td>
				</tr>
				<tr>
					<td class="table-title">Ⅴ. 영업이익</td>
					<td class="table-title"></td>
					<td class="table-title"></td>
					<td class="table-title"></td>
					<td class="table-title"></td>
				</tr>
				<tr>
					<td class="table-title">Ⅵ. 영업외수익</td>
					<td class="table-title"></td>
					<td class="table-title"></td>
					<td class="table-title"></td>
					<td class="table-title"></td>
				</tr>
				<tr>
					<td class="table-title">Ⅶ. 영업외비용</td>
					<td class="table-title"></td>
					<td class="table-title"></td>
					<td class="table-title"></td>
					<td class="table-title"></td>
				</tr>
				<tr>
					<td class="table-title">Ⅷ. 법인세차감전이익</td>
					<td class="table-title"></td>
					<td class="table-title"></td>
					<td class="table-title"></td>
					<td class="table-title"></td>
				</tr>
				<tr>
					<td class="table-title">Ⅸ. 법인세등</td>
					<td class="table-title"></td>
					<td class="table-title"></td>
					<td class="table-title"></td>
					<td class="table-title"></td>
				</tr>
				<tr>
					<td class="table-title">Ⅹ. 당기순이익</td>
					<td class="table-title"></td>
					<td class="table-title"></td>
					<td class="table-title"></td>
					<td class="table-title"></td>
				</tr>
			</table>
		</form>
		<div style="height: 10vh;"></div>
		<div class="card mb-4">
			<div class="card-body">When scrolling, the navigation stays at
				the top of the page. This is the end of the static navigation demo.</div>
		</div>
	</div>
	</main>
	<script>
		$(function() {
			/* 표에서 하늘색 hover 주기 */
			$("#contentTable td").mouseover(function() {
				$(this).parent().css("background", "#DDEBF7");
			});
			
			$("#contentTable td").mouseout(function() {
				$(this).parent().css("background", "white");
			});			
		});
		
		/* 콤마 찍기 */
		function comma(str) {
			str = String(str);
			return str.replace(/(\d)(?=(?:\d{3})+(?!\d))/g, "$1,");
		}
		
		/* 콤마 등 숫자 이외의 입력값 제거 */
		function uncomma(str) {
			str = String(str);
			return str.replace(/[^\d]+/g, "");
		}
		
		/* 값 입력시 콤마 찍기 */
		function inputNumberFormat(str) {
			str.value = comma(uncomma(str.value));
		}
		
		/* 마감버튼 입력시 */
		function insertIncomeStmt() {
			console.log("마감 버튼 입력");
			
			num = uncomma($("#inputNum").val());
			console.log("num : " + num);
			
			$("#inputNum").val(uncomma($("#inputNum").val()));
			
			$("#contentForm").submit();
		}
	</script>
	<jsp:include page="../common/menubar2.jsp" />
</body>
</html>















