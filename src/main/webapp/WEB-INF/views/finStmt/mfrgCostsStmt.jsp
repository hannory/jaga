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
		<table width="1100px">
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
				<td><span class="subtitle"><a href="incomeStmt.fs">손익계산서</a></span></td>
				<td><span class="subtitle" style="border-bottom:1px solid #24574A">제조원가명세서</span></td>
				<td><span class="subtitle"><a href="stmtOfCashFlow.fs">현금흐름표</a></span></td>
				<td align="right" style="width:180px;"><div id="foldBtn"><img id="foldImg" src="${ contextPath }/resources/images/fold.PNG"></div></td>
			</tr>
		</table>
		<div style="margin-bottom:10px; color:red;"><img src="${ contextPath }/resources/images/pencil.PNG">기말원재료재고액을 입력하세요</div>
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
				<td class="table-title">1. 원재료비</td>
				<td class="table-title" width="18%"></td>
				<td class="table-title" width="18%"></td>
				<td class="table-title" width="18%"></td>
				<td class="table-title" width="18%"></td>
			</tr>
			<tr>
				<td class="table-subSubTitle">기초원재료재고액</td>
				<td></td>
				<td></td>
				<td></td>
				<td></td>
			</tr>
			<tr>
				<td class="table-subSubTitle">당기원재료매입액</td>
				<td></td>
				<td></td>
				<td></td>
				<td></td>
			</tr>
			<tr>
				<td class="table-subSubTitle">타계정으로대체액</td>
				<td></td>
				<td></td>
				<td></td>
				<td></td>
			</tr>
			<tr>
				<td class="table-subSubTitle">기말원재료재고액</td>
				<td><input type="text" id="inputNum" onkeyup="inputNumberFormat(this)"></td>
				<td></td>
				<td></td>
				<td></td>
			</tr>
			<tr>
				<td class="table-title">2. 노무비</td>
				<td class="table-title"></td>
				<td class="table-title"></td>
				<td class="table-title"></td>
				<td class="table-title"></td>
			</tr>
			<tr>
				<td class="table-subSubTitle">임금</td>
				<td></td>
				<td></td>
				<td></td>
				<td></td>
			</tr>
			<tr>
				<td class="table-subSubTitle">상여금</td>
				<td></td>
				<td></td>
				<td></td>
				<td></td>
			</tr>
			<tr>
				<td class="table-title">3. 경비</td>
				<td class="table-title"></td>
				<td class="table-title"></td>
				<td class="table-title"></td>
				<td class="table-title"></td>
			</tr>
			<tr>
				<td class="table-subSubTitle">복리후생비</td>
				<td></td>
				<td></td>
				<td></td>
				<td></td>
			</tr>
			<tr>
				<td class="table-subSubTitle">여비교통비</td>
				<td></td>
				<td></td>
				<td></td>
				<td></td>
			</tr>
			<tr>
				<td class="table-subSubTitle">접대비</td>
				<td></td>
				<td></td>
				<td></td>
				<td></td>
			</tr>
			<tr>
				<td class="table-subSubTitle">가스수도료</td>
				<td></td>
				<td></td>
				<td></td>
				<td></td>
			</tr>
			<tr>
				<td class="table-subSubTitle">전력비</td>
				<td></td>
				<td></td>
				<td></td>
				<td></td>
			</tr>
			<tr>
				<td class="table-title">4. 당기 총 제조비용</td>
				<td class="table-title"></td>
				<td class="table-title"></td>
				<td class="table-title"></td>
				<td class="table-title"></td>
			</tr>
			<tr>
				<td class="table-title">5. 기초재공품 재고액</td>
				<td class="table-title"></td>
				<td class="table-title"></td>
				<td class="table-title"></td>
				<td class="table-title"></td>
			</tr>
			<tr>
				<td class="table-title">6. 합계</td>
				<td class="table-title"></td>
				<td class="table-title"></td>
				<td class="table-title"></td>
				<td class="table-title"></td>
			</tr>
			<tr>
				<td class="table-title">7. 기말재공품 재고액</td>
				<td class="table-title"></td>
				<td class="table-title"></td>
				<td class="table-title"></td>
				<td class="table-title"></td>
			</tr>
			<tr>
				<td class="table-title">8. 타계정으로 대체액</td>
				<td class="table-title"></td>
				<td class="table-title"></td>
				<td class="table-title"></td>
				<td class="table-title"></td>
			</tr>
			<tr>
				<td class="table-title">9. 당기제품 제조원가</td>
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
	</script>
	<jsp:include page="../common/menubar2.jsp" />
</body>
</html>