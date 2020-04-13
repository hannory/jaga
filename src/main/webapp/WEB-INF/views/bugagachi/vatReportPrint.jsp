<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
        <link href="${ contextPath }/resources/css/styles.css" rel="stylesheet" />
        <link href="https://cdn.datatables.net/1.10.20/css/dataTables.bootstrap4.min.css" rel="stylesheet" crossorigin="anonymous" />
        <script src="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.11.2/js/all.min.js" crossorigin="anonymous"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
<style >
.textArea{
   			text-align: left;
   		}
   		.numberArea{
   			text-align: right;
   		}
   		#vat_mainDiv{
   			float: left; 
   			margin-right: 2px;
   		}
   		#vat_subDiv1{
   		 	width: 100%; 
   		 	float: left;
   		}
   		#vat_subDiv2{
   			width: 100%;
   		}
   		#vat_subDiv3{
   			width: 100%;
   		}
   		.mainSubDiv{
	   		width: 100%; 
	   		text-align: center;
	   		
   		}
   		.mainSubDiv td{
   			border-bottom:1px solid #D2D2D6;
   		}
   		#vat_title{
   			font-weight: 900;
   			width: 100%;
   			font-size: 20px;
   		}
   		#vat_title td{
   			 width:33%;
   		}
   		.numBiz{
   			width:20px;
   			text-align: center;
   		}
   		#writerInfo{
   			width:100%;
   			margin-bottom: 10px;
   			text-align: center;
   		}
   		
    </style>
</head>
<body>
<script type="text/javascript">
	$(function(){/* 테이블 선정리 */
		$("#writerInfo tr td").css("border","1px solid black");
		$("#writerInfo tr td").css("border-left","");
		$("#writerInfo tr td:last-child").css("border-right","");
		$(".mainSubDiv tr td").css("border","1px solid black");
		$(".mainSubDiv tr td").css("border-left","");
		$(".mainSubDiv tr td:last-child").css("border-right","");
		});
</script>
<div style="width: 90%; margin-right:auto; margin-left:auto;"><!-- 전체 div start -->
		
			<div id="vat_mainDiv"><!-- vat_main div start -->
			<p style="float:left">■ 부가가치세법 시행규칙 [별지 제21호서식] < 개정 2018. 3. 19. > </p>
			<p style="float:right">홈텍스(www.hometax.go.kr)에서도 신청할 수 있습니다.</p>
			<table id="vat_title"><!-- 신고서 명 영역 시작 -->
					<tr> <td rowspan="3" style="text-align: right">일반과세자 부가가치세</td>
					<td colspan="2" style="text-align: center;">[ ]예정 &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;  [ ]확정</td>
					<td rowspan="3" style="text-align:left;">신고서</td>
				</tr>
				<tr><td colspan="2"style="text-align: center;">[ ]기한후 과세표준</td></tr>
				<tr><td colspan="2"style="text-align: center;">[ ]영세율 등 조기환급</td></tr>
			</table><!-- 신고서 명 영역 끝 -->
			<p style="float:right">(4쪽 중 제 1쪽)</p><br>
			
			<table id="writerInfo"><!-- 신고자 상세 정보 시작 -->
				<tr style="background-color: #E7E6E6">
					<td colspan="6" style="text-align: left;">관리번호</td>
					<td colspan="13" style="text-align: left;">처리기간      즉시</td>
				</tr>
				<tr><td colspan="19" style="text-align:left;">신고 기간:  2019년 제 2기 (7 월 1 일 ~ 12 월 31일)</td></tr>
				<tr><td rowspan="4">사업자</td><td>상 호<br>(법인명)</td><td> 상호명띄우는 부분</td>
					<td>성    명<br>(대표자명)</td><td>대표자이름</td>
					<td colspan="2">사업자등록번호</td><td class="numBiz">1</td><td class="numBiz">2</td><td class="numBiz">3</td><td class="numBiz">-</td>
					<td class="numBiz">4</td><td class="numBiz">5</td><td class="numBiz">-</td><td class="numBiz">6</td><td class="numBiz">7</td><td class="numBiz">8</td><td class="numBiz">9</td><td class="numBiz">10</td>
				</tr>
				<tr><td rowspan="2">생년월일</td><td rowspan="2" colspan="2">0000.00.00</td><td rowspan="2">전화번호</td>
					<td colspan="2">사업장</td><td colspan="6">주소지</td><td colspan="6">휴대전화</td>
				</tr>
				<tr><td colspan="2">사업장전화번호임</td><td colspan="6">주소지 전화번호</td><td colspan="6">폰번임</td></tr>
				<tr><td>사업장 주소</td><td colspan="3">주소</td><td colspan="2">전자우편주소</td><td colspan="12">이메일 쓰는곳</td></tr>
			</table><!-- 신고자 상세 정보 끝 -->
				<table class="mainSubDiv">
					<tr class="Tex_bill_th">
						<td colspan="8" style="font-weight:1000; font-size: 17px;">① 신   고   내   용</td>
					</tr>
					<tr class="Tex_bill_th">
						<td colspan="5" style="width:40%">구분</td>
						<td>금액</td>
						<td style="width:10%">세율</td>
						<td>세액</td>
					</tr>
					<tr>
						<td rowspan="9" style=" width:4%; ">과세표준및매출세액</td>
						<td rowspan="4" style="width:10%;" class="green_value">과세</td>
						<td colspan="2" class="green_value textArea">세금계산서발급분</td>
						<td class="pink">1</td>
						<td class="numberArea"></td>
						<td class="green_value">10/100</td>
						<td class="numberArea"></td>
					</tr>
					<tr>
						<td colspan="2" class="green_value textArea">매입자발행세금계산서</td>
						<td class="pink">2</td>
						<td class="numberArea"></td>
						<td class="green_value">10/100</td>
						<td class="numberArea"></td>
					</tr>
					<tr>
						<td colspan="2" class="green_value textArea">신용카드/현금 영수증 발행분</td>
						<td class="pink">3</td>
						<td class="numberArea"></td>
						<td rowspan="2" class="green_value">10/100</td>
						<td class="numberArea"></td>
					</tr>
					<tr>
						<td colspan="2" class="green_value textArea">기타(정규영수증외매출분)</td>
						<td class="pink">4</td>
						<td class="numberArea"></td>
						<td class="numberArea"></td>
					</tr>
					<tr>
						<td rowspan="2" style="width:10%;" class="green_value">영세</td>
						<td colspan="2" class="green_value textArea">세금계산서발급분</td>
						<td class="pink">5</td>
						<td class="numberArea"></td>
						<td class="green_value">0/100</td>
						<td class="green numberArea"></td>
					</tr>
					<tr>
						<td colspan="2" class="green_value textArea">기타</td>
						<td class="pink">6</td>
						<td class="numberArea"></td>
						<td class="green_value">0/100</td>
						<td class="green numberArea"></td>
					</tr>
					<tr>
						<td colspan="3" class="green_value textArea">예정신고누락분</td>
						<td class="pink">7</td>
						<td class="numberArea"></td>
						<td class="green"></td>
						<td class="numberArea"></td>
					</tr>
					<tr>
						<td colspan="3" class="green_value textArea">대손세액가감</td>
						<td class="pink">8</td>
						<td class="green numberArea"></td>
						<td class="green"></td>
						<td class="numberArea"></td>
					</tr>
					<tr>
						<td colspan="3" class="green_value textArea">합계</td>
						<td class="pink">9</td>
						<td class="green numberArea"></td>
						<td class="green_value">㉮</td>
						<td class="green numberArea"></td>
					</tr>
					<tr>
						<td rowspan="9" style="width:4%;" class="blue">매입세액</td>
						<td rowspan="3" colspan="2" style="width:10%;" class="green_value">세금계산서 수취분</td>
						<td class="green_value textArea">일반매입</td>
						<td class="blue">10</td>
						<td class="numberArea"></td>
						<td class="green_value"></td>
						<td class="numberArea"></td>
					</tr>
					<tr>
						<td class="green_value textArea">수출기업수입분납부유예</td>
						<td class="blue">10</td>
						<td class="numberArea"></td>
						<td class="green_value"></td>
						<td class="numberArea"></td>
					</tr>
					<tr>
						<td class="green_value textArea">고정자산매입</td>
						<td class="blue">11</td>
						<td class="numberArea"></td>
						<td class="green_value"></td>
						<td class="numberArea"></td>
					</tr>
					<tr>
						<td colspan="3" class="green_value textArea">예정신고누락분</td>
						<td class="blue">12</td>
						<td class="numberArea"></td>
						<td class="green_value"></td>
						<td class="numberArea"></td>
					</tr>
					<tr>
						<td colspan="3" class="green_value textArea">매입자발행세금계산서</td>
						<td class="blue">13</td>
						<td class="numberArea"></td>
						<td class="green_value"></td>
						<td class="numberArea"></td>
					</tr>
					<tr>
						<td colspan="3" class="green_value textArea">그 밖의 공제매입세액</td>
						<td class="blue">14</td>
						<td class="numberArea"></td>
						<td class="green_value"></td>
						<td class="numberArea"></td>
					</tr>
					<tr>
						<td colspan="3" class="green_value textArea">합계(10)-(10-1)+(11)+(12)+(13)+(14)</td>
						<td class="blue">15</td>
						<td class="green numberArea"></td>
						<td class="green_value"></td>
						<td class="green numberArea"></td>
					</tr>
					<tr>
						<td colspan="3" class="green_value textArea">공제받지못할매입세액</td>
						<td class="blue">16</td>
						<td class="numberArea"></td>
						<td class="green_value"></td>
						<td class="numberArea"></td>
					</tr>
					<tr>
						<td colspan="3" class="green_value textArea">차감계(15-16)</td>
						<td class="blue">17</td>
						<td class="green numberArea"></td>
						<td class="green_value">㉯</td>
						<td class="green numberArea"></td>
					</tr>
					<tr>
						<td colspan="6" class="green_value textArea">납부(환급)세액(매출세액㉮-매입세액㉯)</td>
						<td class="green_value">㉰</td>
						<td class="green numberArea"></td>
					</tr>
					<tr>
						<td colspan="3" rowspan="3" class="green">경감공제세액</td>
						<td class="green_value textArea">그 밖의 경감,공제세액</td>
						<td class="green_value">18</td>
						<td class="green numberArea"></td>
						<td class="green_value"></td>
						<td class="green numberArea"></td>
					</tr>
					<tr>
						<td class="green_value textArea">신용카드매출전표등 발행공제등</td>
						<td class="green_value">19</td>
						<td class="numberArea"></td>
						<td class="green_value"></td>
						<td class="numberArea"></td>
					</tr>
					<tr>
						<td class="green_value textArea">합계</td>
						<td class="green_value">20</td>
						<td class="green numberArea"></td>
						<td class="green_value">㉱</td>
						<td class="numberArea"></td>
					</tr>
					<tr>
						<td colspan="4" class="green_value textArea">예정신고미환급세액</td>
						<td class="green_value">21</td>
						<td class="green numberArea"></td>
						<td class="green_value">㉲</td>
						<td class="numberArea"></td>
					</tr>
					<tr>
						<td colspan="4" class="green_value textArea">예정고지세액</td>
						<td class="green_value">22</td>
						<td class="green numberArea"></td>
						<td class="green_value">㉳</td>
						<td class="numberArea"></td>
					</tr>
					<tr>
						<td colspan="4" class="green_value textArea">사업양수자의 대리납부 기납부세액</td>
						<td class="green_value">23</td>
						<td class="green numberArea"></td>
						<td class="green_value">㉴</td>
						<td class="numberArea"></td>
					</tr>
					<tr>
						<td colspan="4" class="green_value textArea">매입자 납부특례 기납부세액</td>
						<td class="green_value">24</td>
						<td class="green numberArea"></td>
						<td class="green_value">㉵</td>
						<td class="numberArea"></td>
					</tr>
					<tr>
						<td colspan="4" class="green_value textArea">신용카드업자의 대리납부 기납부세액</td>
						<td class="green_value">25</td>
						<td class="numberArea"></td>
						<td class="green_value">㉶</td>
						<td class="numberArea"></td>
					</tr>
					<tr>
						<td colspan="4" class="green_value textArea">가산세액계</td>
						<td class="green_value">26</td>
						<td class="green numberArea"></td>
						<td class="green_value">㉷</td>
						<td class="numberArea"></td>
					</tr>
					<tr>
						<td colspan="6" class="green_value textArea">차감,가감하여 납부할세액(환급받을세액)(㉰-㉱-㉲-㉴-㉵-㉶+㉷)</td>
						<td class="green_value">27</td>
						<td class="green numberArea"></td>
					</tr>
					<tr>
						<td colspan="6" class="green_value textArea">총괄납부사업자가 납부할 세액(환급받을 세액)</td>
						<td class="green_value"></td>
						<td class="numberArea"></td>
					</tr>
				</table>

			</div><!-- vat_main div end -->
			
			
		<div style="float: left;"><!-- 오른쪽 서브 영역 !!!!!!!!!!!!!!!!!!!!!!!!!!1-->
			<div class="subTable" id="vat_subDiv1"><!--7,12,14 vat_sub1 start-->
				<table class="mainSubDiv">
					<tr class="Tex_bill_th">
						<td colspan="5"style="width:40%">구분</td>
						<td>금액</td>
						<td style="width:10%">세율</td>
						<td>세액</td>
					</tr>
					<tr class="green textArea">
						<td colspan="8">7.매출(예정신고누락분)</td>
					</tr>
					<tr>
						<td rowspan="5" style="width:4%;" class="yellow">예정누락분</td>
						<td rowspan="2" style="width:10%;"class="green_value">과세</td>
						<td colspan="2" class="green_value textArea">세금계산서발급분</td>
						<td class="pink">33</td>
						<td class="numberArea"></td>
						<td class="green_value">10/100</td>
						<td class="numberArea"></td>
					</tr>
					<tr>
						<td colspan="2" class="green_value textArea">기타</td>
						<td class="pink">34</td>
						<td class="numberArea"></td>
						<td class="green_value">10/100</td>
						<td class="numberArea"></td>
					</tr>
					<tr>
						<td rowspan="2" style="width:10%;" class="green_value">영세</td>
						<td colspan="2" class="green_value textArea">세금계산서발급분</td>
						<td class="pink">35</td>
						<td class="numberArea"></td>
						<td class="green_value">0/100</td>
						<td class="green numberArea"></td>
					</tr>
					<tr>
						<td colspan="2" class="green_value textArea">기타</td>
						<td class="pink">36</td>
						<td class="numberArea"></td>
						<td class="green_value">0/100</td>
						<td class="numberArea green"></td>
					</tr>
					<tr>
						<td colspan="3" class="green_value">합계</td>
						<td class="pink">37</td>
						<td class="numberArea green"></td>
						<td class="green"></td>
						<td class="numberArea green"></td>
					</tr>
					<tr>
						<td colspan="8" class="green textArea">12.매입(예정신고누락분)</td>
					</tr>
					<tr>
						<td rowspan="12" style="width:4%;" class="yellow">예정누락분</td>
						<td colspan="3" class="green_value textArea">세금계산서발급분</td>
						<td class="blue">38</td>
						<td class="numberArea"></td>
						<td class="green_value"></td>
						<td class="numberArea"></td>
					</tr>
					<tr>
						<td colspan="3" class="green_value textArea">그 밖의 공제매입세액</td>
						<td class="blue">39</td>
						<td class="numberArea"></td>
						<td class="green_value"></td>
						<td class="numberArea"></td>
					</tr>
					<tr>
						<td colspan="3" class="green_value">합계</td>
						<td class="blue">40</td>
						<td class="numberArea green"></td>
						<td class="green"></td>
						<td class="numberArea green"></td>
					</tr>
					<tr>
						<td  colspan="2" rowspan="2"  class="green_value">신용카드매출<br>수령금액합계</td>
						<td class="green_value textArea">일반매입</td>
						<td class="green_value"></td>
						<td class="numberArea"></td>
						<td class="green_value"></td>
						<td class="numberArea"></td>
					</tr>
					<tr>
						<td class="green_value textArea">고정매입</td>
						<td class="green_value"></td>
						<td class="numberArea"></td>
						<td class="green_value"></td>
						<td class="numberArea"></td>
					</tr>
					<tr>
						<td colspan="3" class="green_value textArea">의제매입세액</td>
						<td class="green_value"></td>
						<td class="numberArea"></td>
						<td class="green"></td>
						<td class="numberArea"></td>
					</tr>
					<tr>
						<td colspan="3" class="green_value textArea">재활용폐자원등매입세액</td>
						<td class="green_value"></td>
						<td class="numberArea"></td>
						<td class="green"></td>
						<td class="numberArea"></td>
					</tr>
					<tr>
						<td colspan="3" class="green_value textArea">과세사업전환매입세액</td>
						<td class="green_value"></td>
						<td class="numberArea green"></td>
						<td class="green"></td>
						<td class="numberArea"></td>
					</tr>
					<tr>
						<td colspan="3" class="green_value textArea">재고매입세액</td>
						<td class="green_value"></td>
						<td class="numberArea green"></td>
						<td class="green"></td>
						<td class="numberArea"></td>
					</tr>
					<tr>
						<td colspan="3" class="green_value textArea">변제대손세액</td>
						<td class="green_value"></td>
						<td class="numberArea green"></td>
						<td class="green"></td>
						<td class="numberArea"></td>
					</tr>
					<tr>
						<td colspan="3" class="green_value textArea">외국인관광객에대한 환급세액</td>
						<td class="green_value"></td>
						<td class="numberArea green"></td>
						<td class="green"></td>
						<td class="numberArea"></td>
					</tr>
					<tr>
						<td colspan="3" class="green_value">합계</td>
						<td class="green_value"></td>
						<td class="numberArea green"></td>
						<td class="green"></td>
						<td class="numberArea green"></td>
					</tr>
					<tr>
						<td colspan="8" class="green textArea">14.그 밖의 공제매입세액</td>
					</tr>
					<tr>
						<td rowspan="2" colspan="3" class="green_value textArea">신용카드매출수령금액합계표</td>
						<td class="green_value textArea">일반매입</td>
						<td class="blue">41</td>
						<td class="numberArea"></td>
						<td class="green_value"></td>
						<td class="numberArea"></td>
					</tr>
					<tr>
						<td class="green_value textArea">고정매입</td>
						<td class="blue">42</td>
						<td class="numberArea"></td>
						<td class="green_value"></td>
						<td class="numberArea"></td>
					</tr>
					<tr>
						<td colspan="4" class="green_value textArea">의제매입세액</td>
						<td class="blue">43</td>
						<td class="numberArea"></td>
						<td class="green">뒤쪽</td>
						<td class="numberArea"></td>
					</tr>
					<tr>
						<td colspan="4" class="green_value textArea">재활용폐자원등매입세액</td>
						<td class="blue">44</td>
						<td class="numberArea"></td>
						<td class="green">뒤쪽</td>
						<td class="numberArea"></td>
					</tr>
					<tr>
						<td colspan="4" class="green_value textArea">과세사업전환매입세액</td>
						<td class="blue">45</td>
						<td class="numberArea green"></td>
						<td class="green"></td>
						<td class="numberArea"></td>
					</tr>
					<tr>
						<td colspan="4" class="green_value textArea">재고매입세액</td>
						<td class="blue">46</td>
						<td class="numberArea green"></td>
						<td class="green"></td>
						<td class="numberArea"></td>
					</tr>
					<tr>
						<td colspan="4" class="green_value textArea">변제대손세액</td>
						<td class="blue">47</td>
						<td class="green numberArea"></td>
						<td class="green"></td>
						<td class="numberArea"></td>
					</tr>
					<tr>
						<td colspan="4" class="green_value textArea">외국인관광객에대한환급세액</td>
						<td class=blue>48</td>
						<td class="numberArea green"></td>
						<td class="green"></td>
						<td class="numberArea"></td>
					</tr>
					<tr>
						<td colspan="4" class="green_value">합계</td>
						<td class="blue">49</td>
						<td class="numberArea green"></td>
						<td class="green"></td>
						<td class="numberArea green"></td>
					</tr>
					
				</table>
			</div><!--7,12,14 vat_sub1 end -->
			
			
			<div class="subTable" id="vat_subDiv2"><!--16,18 vat_sub2 start  -->
				<table class="mainSubDiv">
					<tr class="green_value">
						<td colspan="5"style="width:40%">구분</td>
						<td>금액</td>
						<td style="width:10%">세율</td>
						<td>세액</td>
					</tr>
					<tr class="green teatArea">
						<td colspan="8">16.공제받지 못할 매입세액</td>
					</tr>
					<tr>
						<td colspan="4" class="green_value textArea">공제받지못할 매입세액</td>
						<td class="green_value">50</td>
						<td class="numberArea"></td>
						<td class="green"></td>
						<td class="numberArea"></td>
					</tr>
					<tr>
						<td colspan="4" class="green_value textArea">공통매입세액면세등사업분</td>
						<td class="green_value">51</td>
						<td class="numberArea"></td>
						<td class="green"></td>
						<td class="numberArea"></td>
					</tr>
					<tr>
						<td colspan="4" class="green_value textArea">대손처분받은세액</td>
						<td class="green_value">52</td>
						<td class="numberArea"></td>
						<td class="green"></td>
						<td class="numberArea"></td>
					</tr>
					<tr class="green_value">
						<td colspan="4" class="textArea">합계</td>
						<td>53</td>
						<td class="numberArea"></td>
						<td></td>
						<td class="numberArea"></td>
					</tr>
					<tr class="green textArea">
						<td colspan="8">18.그 밖의 경감/공제세액</td>
					</tr>
					<tr>
						<td colspan="4" class="green_value textArea">전자신고세액공제</td>
						<td class="green_value">54</td>
						<td class="green numberArea"></td>
						<td class="green"></td>
						<td class="numberArea"></td>
					</tr>
					<tr>
						<td colspan="4" class="green_value textArea">전자세금계산서발급세액공제</td>
						<td class="green_value">55</td>
						<td class="green numberArea"></td>
						<td class="green"></td>
						<td class="numberArea"></td>
					</tr>
					<tr>
						<td colspan="4" class="green_value textArea">택시운송사업자경감세액</td>
						<td class="green_value">56</td>
						<td class="numberArea green"></td>
						<td class="green"></td>
						<td class="numberArea"></td>
					</tr>
					<tr>
						<td colspan="4" class="green_value textArea">대리납부세액공제</td>
						<td class="green_value">57</td>
						<td class="green numberArea"></td>
						<td class="green"></td>
						<td class="numberArea"></td>
					</tr>
					<tr>
						<td colspan="4" class="green_value textArea">현금영수증사업자세액공제</td>
						<td class="green_value">58</td>
						<td class="green numberArea"></td>
						<td class="green"></td>
						<td class="numberArea"></td>
					</tr>
					<tr>
						<td colspan="4" class="green_value textArea">기타</td>
						<td class="green_value">59</td>
						<td class="green numberArea"></td>
						<td class="green"></td>
						<td class="numberArea"></td>
					</tr>
					<tr>
						<td colspan="4" class="green_value">합계</td>
						<td class="green_value">60</td>
						<td class="green numberArea"></td>
						<td class="green"></td>
						<td class="green_value"></td>
					</tr>
				</table>
			</div><!--16,18 vat_sub2 end -->
			<div  class="subTable" id="vat_subDiv3"><!--25 vat_sub3 start  -->
				<table class="mainSubDiv">
					<tr class="green_value">
						<td colspan="5"style="width:40%">구분</td>
						<td>금액</td>
						<td style="width:10%">세율</td>
						<td>세액</td>
					</tr>
					<tr>
						<td colspan="8" class="green textArea">25.가산세명세</td>
					</tr>
					<tr>
						<td colspan="4" class="green_value textArea">사업자미등록등</td>
						<td class="green_value">61</td>
						<td class="numberArea"></td>
						<td class="green">1/100</td>
						<td class="numberArea"></td>
					</tr>
					<tr>
						<td colspan="3" rowspan="3" class="green_value">세금<br>계산서</td>
						<td class="green_value textArea">자연발급 등</td>
						<td class="green_value">62</td>
						<td class="numberArea"></td>
						<td class="green">1/100</td>
						<td class="numberArea"></td>
						
					</tr>
					<tr>
						<td class="green_value textArea">자연수취</td>
						<td class="green_value">63</td>
						<td class="numberArea"></td>
						<td class="green">5/1,000</td>
						<td class="numberArea"></td>
					</tr>
					<tr>
						<td class="green_value textArea">미발급 등</td>
						<td class="green_value">64</td>
						<td class="numberArea"></td>
						<td class="green">뒤쪽참조</td>
						<td class="numberArea"></td>
					</tr>
					<tr>
						<td colspan="3" rowspan="2" class="green_value">전자세금<br>발급명세</td>
						<td class="green_value textArea">자연전송</td>
						<td class="green_value">65</td>
						<td class="numberArea"></td>
						<td class="green">3/1,100</td>
						<td class="numberArea"></td>
					</tr>
					<tr>
						<td class="green_value textArea">자연전송</td>
						<td class="green_value">66</td>
						<td class="numberArea"></td>
						<td class="green">5/1,000</td>
						<td class="numberArea"></td>
					</tr>
					<tr>
						<td colspan="3" rowspan="2" class="green_value">세금계산서<br>합계표</td>
						<td class="green_value textArea">제출불성실</td>
						<td class="green_value">67</td>
						<td class="numberArea"></td>
						<td class="green">5/1,100</td>
						<td class="numberArea"></td>
					</tr>
					<tr>
						<td class="green_value textArea">지연제출</td>
						<td class="green_value">68</td>
						<td class="numberArea"></td>
						<td class="green">3/1,000</td>
						<td class=""></td>
					</tr>
					<tr>
						<td colspan="3" rowspan="4" class="green_value">신고<br>불성실</td>
						<td class="green_value textArea">무신고(일반)</td>
						<td class="green_value">69</td>
						<td class="numberArea"></td>
						<td class="green">뒤쪽</td>
						<td class="numberArea"></td>
						
					</tr>
					<tr>
						<td class="green_value textArea">무신고(부당)</td>
						<td class="green_value">70</td>
						<td class="numberArea"></td>
						<td class="green">뒤쪽</td>
						<td class="numberArea"></td>
					</tr>
					<tr>
						<td class="green_value textArea">과소,초과환급(일반)</td>
						<td class="green_value">71</td>
						<td class="numberArea"></td>
						<td class="green">뒤쪽</td>
						<td class="numberArea"></td>
					</tr>
					<tr>
						<td class="green_value textArea">과소,초과환급(부당)</td>
						<td class="green_value">72</td>
						<td class="numberArea"></td>
						<td class="green">뒤쪽</td>
						<td class="numberArea"></td>
					</tr>
					<tr>
						<td colspan="4" class="green_value textArea">납부불성실</td>
						<td class="green_value">73</td>
						<td class="numberArea"></td>
						<td class="green">뒤쪽</td>
						<td class="numberArea"></td>
					</tr>
					<tr>
						<td colspan="4" class="green_value textArea">영세율과세표준신고불성실</td>
						<td class="green_value">74</td>
						<td class="numberArea"></td>
						<td class="green">5/1,000</td>
						<td class="numberArea"></td>
					</tr>
					<tr>
						<td colspan="4" class="green_value textArea">현금매출명세서불성실</td>
						<td class="green_value">74</td>
						<td class="numberArea"></td>
						<td class="green">1/100</td>
						<td class="numberArea"></td>
					</tr>
					<tr>
						<td colspan="4" class="green_value textArea">부동산임대공급가액명세서</td>
						<td class="green_value">76</td>
						<td class="numberArea"></td>
						<td class="green">1/100</td>
						<td class="numberArea"></td>
					</tr>
					<tr>
						<td colspan="3" rowspan="2" class="green_value">매입자<br>납부특례</td>
						<td class="green_value textArea">거래계좌미사용</td>
						<td class="green_value">77</td>
						<td class="numberArea"></td>
						<td class="green">뒤쪽</td>
						<td class="numberArea"></td>
					</tr>
					<tr>
						<td class="green_value textArea">거래계좌 지연입금</td>
						<td class="green_value">78</td>
						<td class="numberArea"></td>
						<td class="green">뒤쪽</td>
						<td class="numberArea"></td>
					</tr>
					<tr class="green_value">
						<td colspan="4" class="textArea">합계</td>
						<td>79</td>
						<td></td>
						<td class="green"></td>
						<td></td>
					</tr>
					</table>
			
			</div><!--25 vat_sub3 end  -->
	</div><!-- 오른쪽 서브영역 -->
		</div><!-- 전체 div end -->
</body>
</html>