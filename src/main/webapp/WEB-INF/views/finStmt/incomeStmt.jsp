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
.table-title-num {
	background:#7edfc6;
	text-align:right;
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
.table-content {
	text-align:right;
}
#foldBtn {
	background:#24574A;
	border-radius:3px;
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
			</tr>
		</table>
		<table style="margin-bottom:15px">
			<tr>
				<td><span class="subtitle"><a href="compTrialBal.fs">합계잔액시산표</a></span></td>
				<td><span class="subtitle"><a href="stmtOfFinPos.fs">재무상태표</a></span></td>
				<td><span class="subtitle" style="border-bottom:1px solid #24574A"><a href="incomeStmt.fs">손익계산서</a></span></td>
				<td><span class="subtitle"><a href="mfrgCostsStmt.fs">제조원가명세서</a></span></td>
				<td><span class="subtitle"><a href="stmtOfCashFlow.fs">현금흐름표</a></span></td>
				<td align="right" style="width:180px;"><span id="foldBtn" data-clicks="false" align="left"><img id="foldImg" src="${ contextPath }/resources/images/fold.PNG"></span></td>
			</tr>
		</table>
		<ol class="breadcrumb mb-4">
			<table id="searchReTable">
				<tr>
					<td style="width:150px;">조회기간 : </td>
					<td>
						<input type="number" id="year" name="year" style="width:70px"> 년&nbsp;&nbsp;&nbsp;&nbsp;
						<select id="month" name="month">
							<option id="jan" value="01">1</option>
							<option id="feb" value="02">2</option>
							<option id="mar" value="03">3</option>
							<option id="apr" value="04">4</option>
							<option id="may" value="05">5</option>
							<option id="jun" value="06">6</option>
							<option id="jul" value="07">7</option>
							<option id="aug" value="08">8</option>
							<option id="sep" value="09">9</option>
							<option id="oct">10</option>
							<option id="nov">11</option>
							<option id="dec">12</option>
						</select> 월&nbsp;&nbsp;&nbsp;&nbsp;
						<button onclick="return dateSearch();">검색</button></td>
				</tr>
			</table>
		</ol>
		<table style="width:100%; max-width:1100px;">
			<tr>
				<td>
					<span style="margin-bottom:10px; color:red;"><img src="${ contextPath }/resources/images/pencil.PNG">기말상품재고액을 입력하세요</span>
					&nbsp;&nbsp;&nbsp;&nbsp;		
					<button type="button" onclick="insertIncomeStmt();">마감</button>
				</td>
				<td align="right">
				</td>
			</tr>
		</table>
		<form id="contentForm" action="insertIncomeStmt.fs" method="post">		
			<table id="contentTable" width="1100px" style="text-align:center;">
				<tr>
					<td class="table-head" width="28%" rowspan="2">과&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;목</td>
					<td class="table-head" colspan="2">제 14(당)기 2020.01 ~ 2020.03</td>
					<td class="table-head" colspan="2">제 13(전)기 2019.01 ~ 2019.12</td>
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
					<td class="table-title-num" id="cSum10"></td>
					<td class="table-title"></td>
					<td class="table-title-num" id="pSum10"></td>
				</tr>
				<tr class="table-detail">
					<td class="table-subSubTitle">상품매출</td>
					<td class="table-content" id="c40100"></td>
					<td></td>
					<td class="table-content" id="p40100"></td>
					<td></td>
				</tr>
				<tr class="table-detail">
					<td class="table-subSubTitle">제품매출</td>
					<td></td>
					<td></td>
					<td></td>
					<td></td>
				</tr>
				<tr>
					<td class="table-title">Ⅱ. 매출원가</td>
					<td class="table-title"></td>
					<td class="table-title" id="cSum20"></td>
					<td class="table-title"></td>
					<td class="table-title" id="pSum20"></td>
				</tr>
				<tr class="table-detail">
					<td class="table-subTitle">상품매출원가</td>
					<td class="table-subTitle"></td>
					<td class="table-subTitle" id="cSum21"></td>
					<td class="table-subTitle"></td>
					<td class="table-subTitle" id="pSum21"></td>
				</tr>
				<tr class="table-detail">
					<td class="table-subSubTitle">기초상품재고액</td>
					<td></td>
					<td></td>
					<td></td>
					<td></td>
				</tr>
				<tr class="table-detail">
					<td class="table-subSubTitle">당기상품매입액</td>
					<td class="table-content" id="c14600"></td>
					<td></td>
					<td class="table-content" id="p14600"></td>
					<td></td>
				</tr>
				<tr class="table-detail">
					<td class="table-subSubTitle">기말상품재고액</td>
					<td><input type="text" id="inputNum" name="endingInvOfMdse" onkeyup="inputNumberFormat(this);" style="width:195px;"></td>
					<td></td>
					<td></td>
					<td></td>
				</tr>
				<tr class="table-detail">
					<td class="table-subTitle">제품매출원가</td>
					<td class="table-subTitle"></td>
					<td class="table-subTitle" id="cSum22"></td>
					<td class="table-subTitle"></td>
					<td class="table-subTitle" id="pSum22"></td>
				</tr>
				<tr class="table-detail">
					<td class="table-subSubTitle">기초제품재고액</td>
					<td class="table-content" id="cur-beginning-inventory-of-finished-goods"></td>
					<td></td>
					<td></td>
					<td></td>
				</tr>
				<tr class="table-detail">
					<td class="table-subSubTitle">당기제품제조원가</td>
					<td class="table-content" id="cur-cost-of-finished-goods"></td>
					<td></td>
					<td></td>
					<td></td>
				</tr>
				<tr class="table-detail">
					<td class="table-subSubTitle">기말제품재고액</td>
					<td class="table-content" id="cur-ending-inventory-of-finished-goods"></td>
					<td></td>
					<td></td>
					<td></td>
				</tr>
				<tr>
					<td class="table-title">Ⅲ. 매출총이익</td>
					<td class="table-title"></td>
					<td class="table-title-num" id="cSum30"></td>
					<td class="table-title"></td>
					<td class="table-title-num" id="pSum30"></td>
				</tr>
				<tr>
					<td class="table-title">Ⅳ. 판매비와관리비</td>
					<td class="table-title"></td>
					<td class="table-title-num" id="cSum40"></td>
					<td class="table-title"></td>
					<td class="table-title-num" id="pSum40"></td>
				</tr>
				<tr class="table-detail" id="row83000">
					<td class="table-subSubTitle">소모품비</td>
					<td class="table-content" id="c83000"></td>
					<td></td>
					<td class="table-content" id="p83000"></td>
					<td></td>
				</tr>
				<tr>
					<td class="table-title">Ⅴ. 영업이익</td>
					<td class="table-title"></td>
					<td class="table-title-num" id="cSum50"></td>
					<td class="table-title"></td>
					<td class="table-title-num" id="pSum50"></td>
				</tr>
				<tr>
					<td class="table-title">Ⅵ. 영업외수익</td>
					<td class="table-title"></td>
					<td class="table-title-num" id="cSum60"></td>
					<td class="table-title"></td>
					<td class="table-title-num" id="pSum60"></td>
				</tr>
				<tr>
					<td class="table-title">Ⅶ. 영업외비용</td>
					<td class="table-title"></td>
					<td class="table-title-num" id="cSum70"></td>
					<td class="table-title"></td>
					<td class="table-title-num" id="pSum70"></td>
				</tr>
				<tr>
					<td class="table-title">Ⅷ. 소득세차감전이익</td>
					<td class="table-title"></td>
					<td class="table-title-num" id="cSum80"></td>
					<td class="table-title"></td>
					<td class="table-title-num" id="pSum80"></td>
				</tr>
				<tr>
					<td class="table-title">Ⅸ. 소득세등</td>
					<td class="table-title"></td>
					<td class="table-title-num" id="cSum90"></td>
					<td class="table-title"></td>
					<td class="table-title-num" id="pSum90"></td>
				</tr>
				<tr>
					<td class="table-title">Ⅹ. 당기순이익</td>
					<td class="table-title"></td>
					<td class="table-title-num" id="cSum100"></td>
					<td class="table-title"></td>
					<td class="table-title-num" id="pSum100"></td>
				</tr>
			</table>
		</form>
		<div style="height: 10vh;"></div>
		<div class="card mb-4" style="max-width:1100px">
			<div class="card-body">손익계산서란 일정기간 동안 발생한 수익과 비용을 기록하여 
			해당 기간 동안 얼마만큼의 이익 또는 손실을 보았는지 경영성과를 보여주는 보고서이다. 
			기업의 미래현금흐름과 수익창출 능력 등의 예측에 유용한 정보를 제공한다.</div>
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
			
			/* 현재 날짜로 기본값 설정 */
			var curDate = new Date();
			console.log("curDate : " + curDate);
			console.log("curYear : " + curDate.getFullYear());
			
			$("#year").val(curDate.getFullYear());
			
			switch (curDate.getMonth()) {
			case 0 : $("#jan").prop("selected", true); break;
			case 1 : $("#feb").prop("selected", true); break;
			case 2 : $("#mar").prop("selected", true); break;
			case 3 : $("#apr").prop("selected", true); break;
			case 4 : $("#may").prop("selected", true); break;
			case 5 : $("#jun").prop("selected", true); break;
			case 6 : $("#jul").prop("selected", true); break;
			case 7 : $("#aug").prop("selected", true); break;
			case 8 : $("#sep").prop("selected", true); break;
			case 9 : $("#oct").prop("selected", true); break;
			case 10 : $("#nov").prop("selected", true); break;
			case 11 : $("#dec").prop("selected", true); break;
			}
			
			/* 키 입력창 이벤트 */
			$("#inputNum").keyup(function() {
				
			})
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
		
		function dateSearch() {
			var year = $("#year").val();
			var month = $("#month").val();
			
			console.log(year);
			console.log(month);
			
			$.ajax({
				url : "selectIncomeStmt.fs",
				type : "get",
				data : {
					year : year,
					month : month
				},
				success : function(data) {
					//-------------당기-------------					
					var c14600 = data["c14600"];
					var c40100 = data["c40100"];
					var c83000 = data["c83000"];
					
					$("#c14600").text(comma(c14600));
					$("#c40100").text(comma(c40100));
					$("#c83000").text(comma(c83000));
					
					//표 각 합계 계산
					var cSum10 = c40100 + 0;
					$("#cSum10").text(comma(cSum10));
					
					var cSum30 = cSum10 - 0;
					$("#cSum30").text(comma(cSum30));
					
					var cSum40 = c83000 + 0;
					$("#cSum40").text(comma(cSum40));
					
					var cSum50 = cSum30 - cSum40;
					$("#cSum50").text(comma(cSum50));
					
					var cSum60 = 0;
					$("#cSum60").text(comma(cSum60));
					
					var cSum70 = 0;
					$("#cSum70").text(comma(cSum70));
					
					var cSum80 = cSum50 + cSum60 - cSum70;
					$("#cSum80").text(comma(cSum80));
					
					var cSum90 = 0;
					$("#cSum90").text(comma(cSum90));
					
					var cSum100 = cSum80 - cSum90;
					$("#cSum100").text(comma(cSum100));
					//------------당기 끝------------					
					//-------------전기-------------					
					var p14600 = data["p14600"];
					var p40100 = data["p40100"];
					var p83000 = data["p83000"];
					console.log("p83000 : " + p83000);
					
					$("#p14600").text(comma(p14600));
					$("#p40100").text(comma(p40100));
					$("#p83000").text(comma(p83000));
					
					//표 각 합계 계산
					var pSum10 = p40100 + 0;
					$("#pSum10").text(comma(pSum10));
					
					var pSum30 = pSum10 - 0;
					$("#pSum30").text(comma(pSum30));
					
					var pSum40 = p83000 + 0;
					$("#pSum40").text(comma(pSum40));
					
					var pSum50 = pSum30 - pSum40;
					$("#pSum50").text(comma(pSum50));
					
					var pSum60 = 0;
					$("#pSum60").text(comma(pSum60));
					
					var pSum70 = 0;
					$("#pSum70").text(comma(pSum70));
					
					var pSum80 = pSum50 + pSum60 - pSum70;
					$("#pSum80").text(comma(pSum80));
					
					var pSum90 = 0;
					$("#pSum90").text(comma(pSum90));
					
					var pSum100 = pSum80 - pSum90;
					$("#pSum100").text(comma(pSum100));
					//------------전기 끝------------	
					
					//행 보여주기/숨기기
					if(c83000 == 0 && p83000 == 0) {
						$("#row83000").hide();
					} else {
						$("#row83000").show();
					}
				},
				error : function(status) {
					console.log(status);
				}
			});
			
			return false;
		}
		
		$(document).on("click", '#foldBtn', function() {
			var clicks = $(this).data('clicks');
			
			console.log("접기 버튼 클릭");
			
			if(clicks) {
				$("#foldImg").attr({'src':'${ contextPath }/resources/images/fold.PNG'});
				$(".table-detail").show();
			} else {
				$("#foldImg").attr({'src':'${ contextPath }/resources/images/unfold.PNG'});
				$(".table-detail").hide();
			}
			
			$(this).data('clicks', !clicks);
		});
	</script>
	<jsp:include page="../common/menubar2.jsp" />
</body>
</html>















