<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>자가 경리</title>
<style>

	input{
		border:none;
	}


	.div-top4menuWrapper{
	/* 상단 메뉴 4개 설정 */
		width:80%;
	}
	.div-top4menu{
	/* 상단 4개 메뉴에 대한 설정(탭ㄴㄴ완전상단ㅇㅇ) */
		display:inline-block;
		width:20%;
		height:30px;
	}
	.div-top4menu h5{
	/* 상단4개 메뉴 > 각 메뉴 글자들을 가운데 두기 위함 */
		text-align:center;
	}
	.div-top4menu:hover{
	/* 상단 4개 메뉴 */
		cursor: pointer;
	}
	
	table input{
		width:100%;
	}
	
	
	.tapMenu{
	/* 초록색 탭메뉴  */
		display:inline-block;
		/* background:#8DABA3; */
		background:#24574A;
		height: 35px;
		line-height: 35px;
		border: 1px solid #C9CACE;
		color:white;
		border-top-left-radius:10px;
        border-top-right-radius:10px;
        padding-left:5px;
		padding-right:5px;
	}
	.tapMenu:hover{
		cursor: pointer;
	}
	
	
	
	
	.table-top tr:nth-child(1), 
	.table-top td:nth-child(1), 
	.table-top tr:nth-last-child(1){
	/* 상단 테이블01 항목이름에 회색 칠하기 */
		background: lightgray;
	}
	
	
	#tableTop input{
	/* 인적공제 테이블 내 인풋태그 사이즈 조정 */
		width:50px;
	}
	
	
	
	.table-top02 tr{
	/* 상단 테이블02 회색 칠하기 */
		background:lightgray;
	}
	
	
	
	.table-top03 tr:nth-child(1),
	.table-top03 tr:nth-last-child(1)
	{
	/* 상단 테이블03 회색 칠하기 */
		background:lightgray;
	}
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	.table-bottom tr:nth-child(1),
	.table-bottom tr:nth-child(2),
	.table-bottom tr:nth-child(3) td:nth-child(1),
	.table-bottom tr:nth-child(3) td:nth-child(2),
	.table-bottom tr:nth-child(6) td:nth-child(1),
	.table-bottom tr:nth-last-child(1)
	{
	/* 하단 테이블 항목이름에 회색 칠하기 */
		background:lightgray;
	}
	
	
	
	
	
	
	
	
	.table-bottom{
	/* 하단 테이블 설정 */
		margin-top:30px;
		margin-bottom:30px;
	}
</style>
</head>
<body>
	<jsp:include page="../common/menubar.jsp" />
	<main>
	<div class="container-fluid">
	<!-- 작업영역 -->
	
	<!-- 로딩화면 -->
   <div id="loading">
        <img id="loading-image" src="${ contextPath }/resources/images/loading36.gif" alt="Loading..." />
    </div>
   <!-- 로딩화면 끝-->
	
	
		<h2 class="mt-4">종합소득세</h2>
		
		<form id="formTag" action="insertDeduct.aggregate" method="post" onsubmit="return checkSubmit();">
		
		<!-- 귀속년도 -->
		<div style="float:right;">
			<label>귀속년도 : </label>
			<input id="attrYear" name="yearOfAttr" value="" type="number" style="width:60px; border-bottom:1px solid black;">
			<label>년</label>
			<button onclick="selectStmt();" style="display:inline-block; background:#24574A; color:white; border-radius:5px;">조회</button>
		</div>
		<!-- //귀속년도 -->
		
		<div style="height:50px;"></div><!-- 간격 띄우기 위한 용도 -->
		
		
		
		<div class="div-top4menuWrapper">
			<div class="div-top4menu" onclick="goAggregateIncomeTax();"><h5>소득금액명세서</h5></div>
			<div class="div-top4menu" style="border-bottom: 3px solid #24574A"><h5>소득공제명세서</h5></div>
			<div class="div-top4menu" onclick="goAddedTaxStmt();"><h5>가산세명세서</h5></div>
			<div class="div-top4menu" onclick="goAggregateCalculated();"><h5>종합소득세액계산서</h5></div>
			<div class="cursorPointer" onclick="saveDeduct();" style="display:inline-block; background:#24574A; border-radius:5px; width:50px; height:30px; text-align:center; line-height:30px;color:white;">저장</div>
		</div>
		<!-- //class="div-top4menu" -->
		
		<script>
		/* 소득공제명세서 저장(탭 3개 다 ,, 이페이지 전체 저장함) */
		function saveDeduct(){
			$("#formTag").submit();
		}
		
		
		</script>
		
		
		<script type="text/javascript">
		/* 상단 메뉴 탭 이동 함수들 */
		
		function goAggregateIncomeTax(){
			/* 소득금액명세서 */
			location.href="showAggregateIncomeTax.aggregate";
		}
		function goIncomeDeductStmt(){
			/* 소득공제명세서 */
			location.href="showIncomeDeductStmt.aggregate";
		}
		function goAddedTaxStmt(){
			/* 가산세명세서 */
			location.href="showAddedTaxStmt.aggregate";
		}
		function goAggregateCalculated(){
			/* 종합소득세액계산서 */
			location.href="showAggregateCalculated.aggregate";
		}
		</script>		
		
		
		<br>
		
		
		<!-- //여기까지 종소세 공통 -->
		
		
		
		
		
		
		
		
		
		<!-- 초록색 탭메뉴 만들기 -->
		<div id="tabMenu01" class="tapMenu" onclick="tap01click()">인적공제</div>
		<div id="tabMenu02" class="tapMenu" onclick="tap02click()" style="opacity:50%;">소득세법상 소득공제</div>
		<div id="tabMenu03" class="tapMenu" onclick="tap03click()" style="opacity:50%;">조세특례제한법상 소득공제</div>
		<!-- //초록색 탭메뉴 만들기 끝-->
		
		
		
		
		<script>
		/* 탭 메뉴 클릭 시 다른 테이블들은 하이드, 해당테이블은 display */
			function tap01click(){
				$("#tableTop03").css("display","none");
				$("#tableTop02").css("display","none");
				$("#tableTop").css("display","block");
				
				/* 투명도  */
				$("#tabMenu01").css("opacity","100%");
				$("#tabMenu02").css("opacity","50%");
				$("#tabMenu03").css("opacity","50%");
				
				/* 아래 테이블 보이게하기 */
				/* $(".table-bottom").css("display","inline-block"); */
				$(".div-table-bot").css("display","block");
			}
			
			function tap02click(){
				$("#tableTop").css("display","none");
				$("#tableTop03").css("display","none");
				$("#tableTop02").css("display","block");
				
				/* 투명도  */
				$("#tabMenu01").css("opacity","50%");
				$("#tabMenu02").css("opacity","100%");
				$("#tabMenu03").css("opacity","50%");
				
				/* 아래 테이블 지우기 */
				/* $(".table-bottom").css("display","none"); */
				$(".div-table-bot").css("display","none");
				
			}
			
			function tap03click(){
				$("#tableTop").css("display","none");
				$("#tableTop02").css("display","none");
				$("#tableTop03").css("display","block");
				
				/* 투명도  */
				$("#tabMenu01").css("opacity","50%");
				$("#tabMenu02").css("opacity","50%");
				$("#tabMenu03").css("opacity","100%");
				
				/* 아래 테이블 지우기 */
				/* $(".table-bottom").css("display","none"); */
				$(".div-table-bot").css("display","none");
			}
		</script>
		
		
		<!-- <form id="formTag" action="insertDeduct.aggregate" method="post" onsubmit="return checkSubmit();"> -->
		
		
		<input type="hidden" name="comCode" value="${ loginCompany.companyCode }">
		
		
		
		
		
		<script>
		submitFlag = 0;
		function checkSubmit(){
			if($("#attrYear").val() == ""){
				alert("귀속년도 입력해주세요");
				return false;
			}else{
				return true;
			}
			
		}//method
		
		</script>
		
		
		<!-- 상단 테이블01 만들기 -->
		<table id="tableTop" class="table-top" border="1">
			<tr>
				<td>번호</td>
				<td>관계코드</td>
				<td>성명</td>
				<td>내외국인</td>
				<!-- <td>주민(외국인)번호</td> -->
				<td>나이(만)</td>
				<td>기본공제</td>
				<td>세대주구분</td>
				<td>부녀자</td>
				<td>한부모</td>
				<td>경로우대</td>
				<td>장애인</td>
				<td>자녀</td>
				<td>출산입양</td>
			</tr>
			<tr>
				<td><span>1</span></td>
				<td><input type="text" id="relationCode01" name="relationCode01" class="relationCode"></td>
				<td><input type="text" id="personName01" name="personName01" class="personName"></td>
				<!-- <td><input type="text" id="foreigner01" name="foreigner01" class="foreigner"></td> -->
				<td>
				<select name="foreigner01" >
					<option value="1">1.내국인</option>
					<option value="2">2.외국인</option>
				</select>
				</td>
				<!-- <td><input type="text" id="personId01" name="personId01" class="personId"></td> -->
				<td><input type="text" id="age01" name="age01" class="age"></td>
				<td><input type="text" id="basicDeduct01" name="basicDeduct01" class="basicDeduct"></td>
				<td><input type="text" id="head01" name="head01" class="head"></td>
				<td><input type="text" id="woman01" name="woman01" class="woman"></td>
				<td><input type="text" id="oneParent01" name="oneParent01" class="oneParent"></td>
				<td><input type="text" id="old01" name="old01" class="old"></td>
				<td><input type="text" id="disabillity01" name="disabillity01" class="disabillity"></td>
				<td><input type="text" id="kids01" name="kids01" class="kids"></td>
				<td><input type="text" id="adopt01" name="adopt01" class="adopt"></td>
			</tr>
			<tr id="tr102" style="display:none;">
				<td><span>2</span></td>
				<td><input type="text" id="relationCode02" name="relationCode02" class="relationCode"></td>
				<td><input type="text" id="personName02" name="personName02" class="personName"></td>
				<!-- <td><input type="text" id="foreigner02" name="foreigner02" class="foreigner"></td> -->
				<td>
				<select name="foreigner02" >
					<option value="1">1.내국인</option>
					<option value="2">2.외국인</option>
				</select>
				</td>
				<!-- <td><input type="text" id="personId02" name="personId02" class="personId"></td> -->
				<td><input type="text" id="age02" name="age02" class="age"></td>
				<td><input type="text" id="basicDeduct02" name="basicDeduct02" class="basicDeduct"></td>
				<td><input type="text" id="head02" name="head02" class="head"></td>
				<td><input type="text" id="woman02" name="woman02" class="woman"></td>
				<td><input type="text" id="oneParent02" name="oneParent02" class="oneParent"></td>
				<td><input type="text" id="old02" name="old02" class="old"></td>
				<td><input type="text" id="disabillity02" name="disabillity02" class="disabillity"></td>
				<td><input type="text" id="kids02" name="kids02" class="kids"></td>
				<td><input type="text" id="adopt02" name="adopt02" class="adopt"></td>
			</tr>
			<tr id="tr103" style="display:none;">
				<td><span>3</span></td>
				<td><input type="text" id="relationCode03" name="relationCode03" class="relationCode"></td>
				<td><input type="text" id="personName03" name="personName03" class="personName"></td>
				<!-- <td><input type="text" id="foreigner03" name="foreigner03" class="foreigner"></td> -->
				<td>
				<select name="foreigner03" >
					<option value="1">1.내국인</option>
					<option value="2">2.외국인</option>
				</select>
				</td>
				<!-- <td><input type="text" id="personId03" name="personId03" class="personId"></td> -->
				<td><input type="text" id="age03" name="age03" class="age"></td>
				<td><input type="text" id="basicDeduct03" name="basicDeduct03" class="basicDeduct"></td>
				<td><input type="text" id="head03" name="head03" class="head"></td>
				<td><input type="text" id="woman03" name="woman03" class="woman"></td>
				<td><input type="text" id="oneParent03" name="oneParent03" class="oneParent"></td>
				<td><input type="text" id="old03" name="old03" class="old"></td>
				<td><input type="text" id="disabillity03" name="disabillity03" class="disabillity"></td>
				<td><input type="text" id="kids03" name="kids03" class="kids"></td>
				<td><input type="text" id="adopt03" name="adopt03" class="adopt"></td>
			</tr>
		
			
			<tr>
				<td></td>
				<td colspan="5">합계[명]</td>
				<td></td>
				<td></td>
				<td></td>
				<td></td>
				<td></td>
				<td></td>
				<td></td>
				<td></td>
			</tr>
		</table>
		<!-- 상단 테이블01 만들기 -->
		
		<script>
		/* 관계코드 포커스 하면 도움말 바꾸기 */
		$(".relationCode").focus(function(){
			$("#helpBox").html(
						"<strong>0</strong>:소득자본인  <strong>1</strong>:소득자의 직계존속  <strong>2</strong>:배우자의 직계존속 <strong>3</strong>:배우자 <strong>4</strong>:직계비속 중 자녀.입양자" + "<br>" 
					+ 	"<strong>5</strong>:직계비속 중 자녀.입양자외(직계비속과 그 배우자가 모두 장애인의 경우 그 배우자 포함)" +"<br>"
					+	"<strong>6</strong>:형제자매 <strong>7</strong>:수급자 <strong>8</strong>:위탁아동(관계코드 4~6은 소득자와 배우자의 각각의 관계를 포함합니다.)"
					);
		});
		
		
		/* 관계코드에서 blur하면 다음 행 보이기 */
		$(".relationCode").eq(0).blur(function(){
			$("#tr102").css("display","");
		});
		
		/* 관계코드에서 blur하면 다음 행 보이기 */
		$(".relationCode").eq(1).blur(function(){
			$("#tr103").css("display","");
		});
		
		
		/* 관계코드 입력시 */
		$(".relationCode").eq(0).blur(function(){
			if($("#relationCode01").val() == 0){
				/* 본인 이므로 인적공제 내용 채우기 */
				$("#btd11").val("1");
				$("#btd12").val("1,500,000");
				
				$("#btd81").val("1");
				$("#btd82").val("1,500,000");
				
				$("#basicDeduct01").val("본인");
				
				
			}
		});
		
		
		
		$(".relationCode").eq(1).blur(function(){
			if($("#relationCode02").val() == 3){
				/* 배우자 이므로 인적공제 내용 채우기 */
				$("#btd21").val("1");
				$("#btd22").val("1,500,000");
				
				$("#btd81").val("2");
				$("#btd82").val("3,000,000");
				
				$("#basicDeduct02").val("배우자");
				
			}
		});
		
		
		
		</script>
		
		
		
		
		<!-- 상단 테이블02 만들기 -->
		<table id="tableTop02" class="table-top02" style="display: none;" border="1">
			<tr>
				<td colspan="3">구분</td>
				<td>금액</td>
			</tr>
			<tr>
				<td colspan="3">(9)국민연금</td>
				<td><input type="text" id="b01" name=""></td>
			</tr>
			<tr>
				<td colspan="3">(10)공무원.군인.사립교직원.별정우체국연금</td>
				<td><input type="text" id="" name=""></td>
			</tr>
			<tr>
				<td colspan="3">(11)주택담보노후연금이자비용공제</td>
				<td><input type="text" id="" name=""></td>
			</tr>
			<tr>
				<td rowspan="5">특별공제</td>
				<td colspan="2">(12)보험료공제</td>
				<td><input type="text" id="b04" name=""></td>
			</tr>
			<tr>
				<td colspan="2">(13)주택자금공제</td>
				<td><input type="text" id="" name=""></td>
			</tr>
			<tr>
				<td colspan="2">(14)기보금(이월분)공제</td>
				<td><input type="text" id="" name=""></td>
			</tr>
			<tr>
				<td rowspan="2">(15)특별공제합계</td>
				<td>근로소득이 있는 자 (12~14)</td>
				<td><input type="text" id="b07" name=""></td>
			</tr>
			<tr>
				<td>근로소득이 없는 자 (14)</td>
				<td><input type="text" id="b08" name=""></td>
			</tr>
			<tr>
				<td colspan="3">(22)소득공제합계(8~11+15+21)</td>
				<td><input type="text" id="b09" name="totalDeduct"></td>
			</tr>
			<tr>
				<td colspan="3">(23)소득공제 종합한도 초과액</td>
				<td><input type="text" id="b10" name=""></td>
			</tr>
			
			
		</table>
		<!-- //상단 테이블02 만들기 끝 -->
		
		<script>
		/* 테이블2번에서  값 입력시 프론트 처리*/
		$("#b01").blur(function(){
			console.log("============");
			
			var b01 = $("#b01").val(); 
			var b04 = $("#b04").val();
			var btd82 = $("#btd82").val().replace(",","").replace(",","").replace(",","").replace(",","").replace(",","").replace(",","");
			var sum = 0;
			
			sum = Number(b01) + Number(b04) + Number(btd82);
			console.log(sum);
			
			$("#b09").val(sum);
			console.log("============");
			
			$("#b10").val(0);
			
		});
		
		$("#b04").blur(function(){
			console.log("============");
			
			$("#b07").val($("#b04").val());
			
			var b01 = $("#b01").val(); 
			var b04 = $("#b04").val(); 
			var btd82 = $("#btd82").val().replace(",","").replace(",","").replace(",","").replace(",","").replace(",","").replace(",","");
			var sum = 0;
			
			sum = Number(b01) + Number(b04) + Number(btd82);
			console.log(sum);
			
			$("#b09").val(sum);
			console.log("============");
			
			$("#b10").val(0);
		});
		
		
		
		
		
		
		</script>
		
		
		
		
		<!-- 상단 테이블03 만들기 -->
		<table id="tableTop03" class="table-top03" border="1" style="display:none">
			<tr>
				<td>코드</td>
				<td>17.조세특례제한법 조문(제목)</td>
				<td>19.금액</td>
				<td>20.사업자번호</td>
			</tr>
			<tr>
				<td></td>
				<td></td>
				<td></td>
				<td></td>
			</tr>
			<tr>
				<td><input type="text" id="" name=""></td>
				<td><input type="text" id="" name=""></td>
				<td><input type="text" id="" name=""></td>
				<td><input type="text" id="" name=""></td>
			</tr>
			<tr>
				<td><input type="text" id="" name=""></td>
				<td><input type="text" id="" name=""></td>
				<td><input type="text" id="" name=""></td>
				<td><input type="text" id="" name=""></td>
			</tr>
			<tr>
				<td><input type="text" id="" name=""></td>
				<td><input type="text" id="" name=""></td>
				<td><input type="text" id="" name=""></td>
				<td><input type="text" id="" name=""></td>
			</tr>
			<tr>
				<td><input type="text" id="" name=""></td>
				<td><input type="text" id="" name=""></td>
				<td><input type="text" id="" name=""></td>
				<td><input type="text" id="" name=""></td>
			</tr>
			<tr>
				<td><input type="text" id="" name=""></td>
				<td><input type="text" id="" name=""></td>
				<td><input type="text" id="" name=""></td>
				<td><input type="text" id="" name=""></td>
			</tr>
			<tr>
				<td><input type="text" id="" name=""></td>
				<td><input type="text" id="" name=""></td>
				<td><input type="text" id="" name=""></td>
				<td><input type="text" id="" name=""></td>
			</tr>
			<tr>
				<td><input type="text" id="" name=""></td>
				<td><input type="text" id="" name=""></td>
				<td><input type="text" id="" name=""></td>
				<td><input type="text" id="" name=""></td>
			</tr>
			
			<tr>
				<td colspan="2">21. 조세특례제한법상 소득공제 합계</td>
				<td><input type="text" id="" name="" style="background:lightgray;"></td>
				<td><input type="text" id="" name="" style="background:lightgray;"></td>
			</tr>
		</table>
		<!-- //상단 테이블03 만들기 끝-->
		
		
		
		
		
		
		
		
		
		<!-- 하단 테이블 만들기 -->
		<div id="div-table-bot">
		<table class="table-bottom" border="1">
			<tr>
				<td colspan="5">인적공제</td>
			</tr>
			<tr>
				<td colspan="3">구분</td>
				<td>인원</td>
				<td>공제액(원)</td>
			</tr>
			<tr>
				<td rowspan="7">인적공제</td>
				<td rowspan="3">기본공제</td>
				<td>(1)본인 </td>
				<td><input type="text" id="btd11"></td>
				<td><input type="text" id="btd12"></td>
			</tr>
			<tr>
				<td>(2)배우자</td>
				<td><input type="text" id="btd21"></td>
				<td><input type="text" id="btd22"></td>
			</tr>
			<tr>
				<td>(3)부양가족</td>
				<td></td>
				<td></td>
			</tr>
			<tr>
				<td rowspan="4">추가공제</td>
				<td>(4)경로우대자</td>
				<td></td>
				<td></td>
			</tr>
			<tr>
				<td>(5)장애인</td>
				<td></td>
				<td></td>
			</tr>
			<tr>
				<td>(6)부녀자</td>
				<td></td>
				<td></td>
			</tr>
			<tr>
				<td>(7)한부모</td>
				<td></td>
				<td></td>
			</tr>
			<tr>
				<td colspan="3">(8) 인적공제계(1~7의 합계)</td>
				<td><input type="text" id="btd81"></td>
				<td><input type="text" id="btd82"></td>
			</tr>
		</table>
		</div>
		<!-- //하단 테이블 만들기 끝-->
		
		
		
		
	
	
	
	
	
	</form>
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
		<!-- footer -->
		<div class="card mb-4">
			<div id="helpBox" class="card-body">
				도움말입니다. 읽어주세요*^^*
			</div>
		</div>
		<!-- ///footer -->
		
	<!-- //작업영역 -->
	</div><!-- class="container-fluid" -->
	</main>
	<jsp:include page="../common/menubar2.jsp" />
</body>
</html>