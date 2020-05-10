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
	
	.inputNumber{
		text-align:right;
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
	
	#table01 td:nth-child(1),
	#table01 tr:nth-child(1),
	#bgGray
	{
		background:lightgray;
	}
	
	#table02{
		background:lightgray;
		width:593px;
	}
	
	
	.cursorPointer:hover{
		background:gray;
		color:white;
		opacity:50%;
		cursor:pointer;
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
		
		
		
		
		<!-- 귀속년도 -->
		<div style="float:right;">
			<label>귀속년도 : </label>
			<input id="attrYear" name="yearOfAttr" type="number" style="width:60px; border-bottom:1px solid black;">
			<label>년</label>
			<div onclick="selectStmt();" class="cursorPointer" style="padding:5px; display:inline-block; background:#24574A; color:white; border-radius:5px;">조회</div>
		</div>
		<!-- //귀속년도 -->
		<script>
		function selectStmt(){
			alert("selectStmt click zz");
			
			$.ajax({
				url: "selectAggregateCalculated.aggregate",
				type: "post",
				data: {
						"yearOfAttr": $("#attrYear").val(),
						"comCode":'${ loginCompany.companyCode}'
						},
				success: function(data){
					alert("success :::" + data);
				},
				error: function(status){
					alert("error ::: " + status)
				}
			});
			
		}
		</script>
		
		
		<div style="height:50px;"></div><!-- 간격 띄우기 위한 용도 -->
		
		<div class="div-top4menuWrapper">
			<div class="div-top4menu" onclick="goAggregateIncomeTax();"><h5>소득금액명세서</h5></div>
			<div class="div-top4menu" onclick="goIncomeDeductStmt();"><h5>소득공제명세서</h5></div>
			<div class="div-top4menu" onclick="goAddedTaxStmt();"><h5>가산세명세서</h5></div>
			<div class="div-top4menu" style="border-bottom: 3px solid #24574A"><h5>종합소득세액계산서</h5></div>
			<div class="cursorPointer" style="display:inline-block; background:#24574A; border-radius:5px; width:50px; height:30px; text-align:center; line-height:30px;color:white;">저장</div>
		</div>
		<!-- //class="div-top4menu" -->
		
		
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
		
		
		
		
		
		
		
		
		
		
		
		
		<!-- 초록색 탭메뉴 만들기 -->
		<div id="tabMenu01" class="tapMenu" onclick="tap01click()">세액계산</div>
		<div id="tabMenu02" class="tapMenu" onclick="tap02click()" style="opacity:50%;">기납부 세액 명세서</div>
		<div id="selectExistingData" onclick="selectExistingData();" class="cursorPointer tapMenu" style="height:30px; line-height:30px; border-radius:7px; margin-left:420px; background:white; color:black; border:2px solid #24574A;"><strong>불러오기</strong></div>
		<div id="savePrePaid" onclick="savePrePaid();" class="cursorPointer tapMenu" style="height:30px; line-height:30px; border-radius:7px; margin-left:280px; background:white; color:black; display:none; border:2px solid #24574A;"><strong>입력하기</strong></div>
		<!-- //초록색 탭메뉴 만들기 끝-->
		
		<script>
		/* 세액계산에 현재 값 불러오기 */
		function selectExistingData(){
			if($("#attrYear").val() == ""){
				Swal.fire({
					   title: '귀속년도를 입력하세요',
					   icon: 'info',
					   showCancelButton: false,
					   confirmButtonColor: '#24574A',
					   cancelButtonColor: '#d33',
					   confirmButtonText: '확인'
					 });
			}else{

				$.ajax({
					url: "selectExistingData.aggregate",
					type: "post",
					data: {
						"yearOfAttr":$("#attrYear").val(),
						"comCode": '${ loginCompany.companyCode }'
						
					},
					success: function(data){
						//성공했으니, 계산세 빈칸들 채우기
						var dto = JSON.parse(data);
						console.log(dto);
						
						//1번부터 17번까지 차례로 채우자
						
						$("#v101").val(dto.v101);
						
						$("#v102").val(dto.v102); 
						
						var d103 = Number(dto.v101) - Number(dto.v102);
						$("#v103").val(d103);
						
						if(d103 <= 12000000){
							$("#v104").val("6% (-)");
							$("#v105").val( Math.floor((d103 * 6 / 100 - 0)/10) * 10 );
						}else if(d103 <= 46000000){
							$("#v104").val("15% (1,080,000)");
							$("#v105").val( Math.floor((d103 * 15 / 100 - 1080000)/10) * 10 );
						}else if(d103 <= 88000000){
							$("#v104").val("24% (5,220,000)");
							$("#v105").val( Math.floor((d103 * 24 / 100 - 5220000)/10) * 10 );
						}else if(d103 <= 150000000){
							$("#v104").val("35% (14,900,000)");
							$("#v105").val( Math.floor((d103 * 35 / 100 - 14900000)/10) * 10 );
						}else if(d103 <= 300000000){
							$("#v104").val("38% (19,400,000)");
							$("#v105").val( Math.floor((d103 * 38 / 100 - 19400000)/10) * 10 );
						}else if(d103 <= 500000000){
							$("#v104").val("40% (25,400,000)");
							$("#v105").val( Math.floor((d103 * 40 / 100 - 25400000)/10) * 10 );
						}else{
							$("#v104").val("42% (35,400,000)");
							$("#v105").val( Math.floor((d103 * 42 / 100 - 35400000)/10) * 10 );
						}
						
						
						$("#v106").val(0);
						
						$("#v107").val(dto.v107);
						
						$("#v108").val(Number($("#v105").val()) - Number($("#v106").val()) - Number($("#v107").val()));
						
						$("#v109").val(dto.v109);
						
						$("#v110").val(0);
						
						$("#v111").val(Number($("#v108").val()) + Number($("#v109").val()) + Number($("#v110").val()));
						
						$("#v112").val(dto.v112);
						
						$("#v113").val( Number($("#v111").val()) - Number($("#v112").val()) );
						
						$("#v114").val(0);
						
						$("#v115").val(0);
						
						$("#v116").val(0);
						
						$("#v117").val( ( Number($("#v111").val()) - Number($("#v112").val()) ).toLocaleString() );
						
						console.log("=====");
						
						
					},
					error: function(status){
						alert("error ::: " + status);
					}
				});
			}//else end
			
		}
		
		
		/* 기납부세액 저장하기 */
		function savePrePaid(){
			if($("#attrYear").val() == ""){
				Swal.fire({
					   title: '귀속년도를 입력하세요',
					   icon: 'info',
					   showCancelButton: false,
					   confirmButtonColor: '#24574A',
					   cancelButtonColor: '#d33',
					   confirmButtonText: '확인'
					 });
			}else{
				$.ajax({
					url: "savePrePaid.aggregate",
					type: "post",
					data: {
						"yearOfAttr": $("#attrYear").val(),
						"comCode":'${ loginCompany.companyCode}',
						"totalPaidIncome":$("#totalPaidIncome").val()
					},
					success: function(data){
						if(data == "ok"){
							 Swal.fire({
								   title: '기납부 세액 저장 완료 !',
								   icon: 'info',
								   showCancelButton: false,
								   confirmButtonColor: '#24574A',
								   cancelButtonColor: '#d33',
								   confirmButtonText: '확인'
								 });
						}else{
							alert("기납부 세액 저장 실패");
						}
						
					},
					error: function(status){
						alert("기납부 세액 저장  error:::"+status);
					}
					
				});
			}//else 
			
		
		}
		
		
		</script>
		
		<script type="text/javascript">
			
		function tap01click(){
			/* 세액계산 보여주기 */
			$("#table02").css("display","none");
			$("#table01").css("display","inline-block");
			
			$("#tabMenu02").css("opacity","50%");
			$("#tabMenu01").css("opacity","100%");
			
			$("#savePrePaid").css("display","none");
			$("#selectExistingData").css("display","inline-block");
			
			
		}
		
		function tap02click(){
			/* 기납부명세서 보여주기 */
			$("#table01").css("display","none");
			$("#table02").css("display","block");	
			
			$("#tabMenu01").css("opacity","50%");
			$("#tabMenu02").css("opacity","100");

			$("#selectExistingData").css("display","none");
			$("#savePrePaid").css("display","inline-block");
			
		}
			
		</script>
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		<!--세액계산 테이블 -->
		<table id="table01" border="1" style="margin-bottom:30px;">
			<tr style="text-align:center;">
				<td colspan="2">구분</td>
				<td>종합소득세</td>
				<td>지방소득세</td>
				<td>농어촌 특별세</td>
			</tr>
			
			<tr>
				<td colspan="2">19. 종합소득금액</td>
				<td><input type="text" class="inputNumber" name="" id="v101"></td>
				<td><input type="text" class="inputNumber" name="" id="v201"></td>
				<td><input type="text" class="inputNumber" name="" id="v301"></td>
			</tr>
			
			<tr>
				<td colspan="2">20. 소득공제계</td>
				<td><input type="text" class="inputNumber" name="" id="v102"></td>
				<td><input type="text" class="inputNumber" name="" id="v102"></td>
				<td><input type="text" class="inputNumber" name="" id="v102"></td>
			</tr>
			
			<tr>
				<td colspan="2">21. 과세표준(19-20)</td>
				<td><input type="text" class="inputNumber" name="" id="v103"></td>
				<td><input type="text" class="inputNumber" name="" id=""></td>
				<td><input type="text" class="inputNumber" name="" id=""></td>
			</tr>
			
			<tr>
				<td colspan="2">22. 세율(누진공제)</td>
				<td><input type="text" class="inputNumber" name="" id="v104"></td>
				<td><input type="text" class="inputNumber" name="" id=""></td>
				<td><input type="text" class="inputNumber" name="" id=""></td>
			</tr>
			
			<tr>
				<td colspan="2">23. 산출세액</td>
				<td><input type="text" class="inputNumber" name="" id="v105"></td>
				<td><input type="text" class="inputNumber" name="" id=""></td>
				<td><input type="text" class="inputNumber" name="" id=""></td>
			</tr>
			
			<tr>
				<td colspan="2">24. 세액감면</td>
				<td><input type="text" class="inputNumber" name="" id="v106"></td>
				<td><input type="text" class="inputNumber" name="" id=""></td>
				<td><input type="text" class="inputNumber" name="" id=""></td>
			</tr>
			
			<tr>
				<td colspan="2">25. 세액공제</td>
				<td><input type="text" class="inputNumber" name="" id="v107"></td>
				<td><input type="text" class="inputNumber" name="" id=""></td>
				<td><input type="text" class="inputNumber" name="" id=""></td>
			</tr>
			
			<tr>
				<td colspan="2">26. 결정세액(23-24-25)</td>
				<td><input type="text" class="inputNumber" name="" id="v108"></td>
				<td><input type="text" class="inputNumber" name="" id=""></td>
				<td><input type="text" class="inputNumber" name="" id=""></td>
			</tr>
			
			<tr>
				<td colspan="2">27. 가산세</td>
				<td><input type="text" class="inputNumber" name="" id="v109"></td>
				<td><input type="text" class="inputNumber" name="" id=""></td>
				<td><input type="text" class="inputNumber" name="" id=""></td>
			</tr>
			
			<tr>
				<td colspan="2">28. 추가납부세액</td>
				<td><input type="text" class="inputNumber" name="" id="v110"></td>
				<td><input type="text" class="inputNumber" name="" id=""></td>
				<td><input type="text" class="inputNumber" name="" id=""></td>
			</tr>
			
			<tr>
				<td colspan="2">29. 합계(26+27+28)</td>
				<td><input type="text" class="inputNumber" name="" id="v111"></td>
				<td><input type="text" class="inputNumber" name="" id=""></td>
				<td><input type="text" class="inputNumber" name="" id=""></td>
			</tr>
			
			<tr>
				<td colspan="2">30. 기납부세액</td>
				<td><input type="text" class="inputNumber" name="" id="v112"></td>
				<td><input type="text" class="inputNumber" name="" id=""></td>
				<td><input type="text" class="inputNumber" name="" id=""></td>
			</tr>
			
			<tr>
				<td colspan="2">31. 납부(환급)할 총 세액</td>
				<td><input type="text" class="inputNumber" name="" id="v113"></td>
				<td><input type="text" class="inputNumber" name="" id=""></td>
				<td><input type="text" class="inputNumber" name="" id=""></td>
			</tr>
			
			<tr>
				<td rowspan="2">32. 납부특례세액</td>
				<td id="bgGray">차감</td>
				<td><input type="text" class="inputNumber" name="" id="v114"></td>
				<td><input type="text" class="inputNumber" name="" id=""></td>
				<td><input type="text" class="inputNumber" name="" id=""></td>
			</tr>
			
			<tr>
				<td>가산</td>
				<td><input type="text" class="inputNumber" name="" id="v115"></td>
				<td><input type="text" class="inputNumber" name="" id=""></td>
				<td><input type="text" class="inputNumber" name="" id=""></td>
			</tr>
			
			<tr>
				<td colspan="2">34. 분할납세액(2개월 내)</td>
				<td><input type="text" class="inputNumber" name="" id="v116"></td>
				<td><input type="text" class="inputNumber" name="" id=""></td>
				<td><input type="text" class="inputNumber" name="" id=""></td>
			</tr>
			
			<tr>
				<td colspan="2">35. 기한 이내 납부할 세액</td>
				<td><input type="text" class="inputNumber" name="" id="v117"></td>
				<td><input type="text" class="inputNumber" name="" id=""></td>
				<td><input type="text" class="inputNumber" name="" id=""></td>
			</tr>
		</table>
		<!-- //세액계산 테이블 끝-->
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		<!-- 기납부 세액 명세서 테이블 -->
		<table border="1" id="table02" style="display:none;">
		
			<tr style="text-align:center;">
				<td colspan="2">구분</td>
				<td>소득세</td>
				<td>농어촌특별세</td>
			</tr>
			
			<tr>
				<td colspan="2">1. 중간 예납 세액</td>
				<td><input type="text" name="v101" id="v101" class="t2left"></td>
				<td><input type="text" name="v201" id="v201"></td>
			</tr>
			
			<tr>
				<td colspan="2">2. 토지등매매차익예정신고납부</td>
				<td><input type="text" name="v102" id="v102" class="t2left"></td>
				<td><input type="text" name="v202" id="v202"></td>
			</tr>
			
			<tr>
				<td colspan="2">3. 토지등매매차익예정고지세액</td>
				<td><input type="text" name="v103" id="v103" class="t2left"></td>
				<td><input type="text" name="v203" id="v203"></td>
			</tr>
			
			<tr>
				<td colspan="2">4. 수시부과세액</td>
				<td><input type="text" name="v104" id="v104" class="t2left"></td>
				<td><input type="text" name="v204" id="v204"></td>
			</tr>
			
			<tr>
				<td rowspan="6" style="text-align:center">원천징수세액 <br>및<br> 납세조합 징수세액</td>
				<td>5. 이자소득</td>
				<td><input type="text" name="v105" id="v105" class="t2left"></td>
				<td><input type="text" name="v205" id="v205"></td>
			</tr>
			
			<tr>
				<td>6. 배당소득</td>
				<td><input type="text" name="v106" id="v106" class="t2left"></td>
				<td><input type="text" name="v206" id="v206"></td>
			</tr>
			
			<tr>
				<td>7. 사업소득</td>
				<td><input type="text" name="v107" id="v107" class="t2left"></td>
				<td><input type="text" name="v207" id="v207"></td>
			</tr>
			
			<tr>
				<td>8. 근로소득</td>
				<td><input type="text" name="v108" id="v108" class="t2left"></td>
				<td><input type="text" name="v208" id="v208"></td>
			</tr>
			
			<tr>
				<td>9. 연금소득</td>
				<td><input type="text" name="v109" id="v109" class="t2left"></td>
				<td><input type="text" name="v209" id="v209"></td>
			</tr>
			
			<tr>
				<td>10. 기타소득</td>
				<td><input type="text" name="v110" id="v110" class="t2left"></td>
				<td><input type="text" name="v210" id="v210"></td>
			</tr>
			
			<tr>
				<td colspan="2">11. 기납부세액합계</td>
				<td><input type="text" name="totalPaidIncome" id="totalPaidIncome"></td>
				<td><input type="text" name="totalPaidIncome2" id="totalPaidIncome2"></td>
			</tr>
			
		</table>
		<!-- //기납부 세액 명세서 테이블 끝-->
		
		
		<script>
		/* 테이블02 blur될 때 계산 처리 */
		$("#table02 input").blur(function(){
			
			var totalPaidIncomeValue = 0;
			
			console.log(  $(".t2left")  );
			
			
			for(var i = 0; i < $(".t2left").length; i++){
				console.log(  Number($(".t2left").eq(i).val())  );
				totalPaidIncomeValue += Number($(".t2left").eq(i).val()); 
				
			}
			
			
			
			$("#totalPaidIncome").val(totalPaidIncomeValue);
			
			
			
			
		});
		</script>
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
			
		<!-- footer -->
		<div class="card mb-4">
			<div class="card-body">
				<p>
					종소세 >  1천만 : 종소세분납시에는 분납비율만큼, 종소세 미분납시는 0<br>
					종소세 <= 1천만 : 농특세 납부할 총 세액 > 1천만 : (농특세 납부할 총 세액 X 50%)<br>
	                            : 농특세 납부할 총 세액 > 5백만 : (농특세 납부할 총 세액 - 5백만)
				</p>
			</div>
		</div>
		<!-- ///footer -->
		
	<!-- //작업영역 -->
	</div><!-- class="container-fluid" -->
	</main>
	<jsp:include page="../common/menubar2.jsp" />
		
		
		
		
		
		
		
	
</body>
</html>