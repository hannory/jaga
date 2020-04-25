<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<style>
#venderTable{
width:1100px;
height:900px;
/* border:solid 1px black; */
margin:50px;

/* 	border-collapse: collapse;
	border-top: 1px solid black;
	border-left: 1px solid black;
}

#venderTable th, #venderTable td {
	border-bottom: 1px solid black;
	border-right: 1px solid black;
} */
}
input{
border-radius:5px;
border: 1px solid #C4C4C4;
box-sizing: border-box;
}

/* #radius1{
width: 50px;
}

#radius2{
width:150px;
}

#radius3{
width:300px;
}

#radius4{

width:400px;
}

#radius5{
width:500px;
} */
</style>

<body>

	
	<jsp:include page="../common/menubar.jsp" />
	
	<div id="main">
				<div id="layer" style="display:none;position:fixed;overflow:hidden;z-index:1;-webkit-overflow-scrolling:touch;">
				<img src="//t1.daumcdn.net/postcode/resource/images/close.png" id="btnCloseLayer" style="cursor:pointer;position:absolute;right:-3px;top:-3px;z-index:1" onclick="closeDaumPostcode()" alt="닫기 버튼">
			</div>
	<div class="container-fluid">
		<h2 class="mt-4">거래처 신규등록</h2>
<!-- 		<ol class="breadcrumb mb-4">
		</ol> -->
<!--   		<div class="card mb-4"> - -->
	 	<div class="card-body"> 
			<div id="main">
		<div id="table-total"> 
		 
	
<table id="venderTable">
	<form id="joinForm" method="post" action="insert.ve">


<tr>
<td style="width:400px" >거래처명</td>
<td colspan="2"><input type="text" id="radius3" style="width:310px";></td>
<td style="width:200px;">구분</td>
<td colspan="2"><input type="text" id="radius2" style="width:300px"></td>
</tr>
<tr>
<td colspan="2">사업자등록번호 / 주민번호 / 계좌번호 / 카드번호 </td>
<td colspan="4"><input type="text" id="radius4" style="width:310px"></td>
</tr>
<tr>
<td>대표자성명</td>
<td colspan="5"><input type="text" id="radius3" style="width:300px"></td>
</tr>
<tr>
<td>업종</td>
<td style="width:130px">업태</td>
<td><input type="text" id="radius2" style="width:300px"></td>
<td>종목</td>
<td><input type="text" id="radius3" style="width:300px"></td>
<td>농어민 <input type="text" id="radius1" style="width:50px"></td>
</tr>
<tr>
<td>주소</td>
<td><input type="text" id="radius2" style="width:150px"></td>
<td colspan="4">&nbsp;&nbsp;&nbsp;<input type="button" value="검색">&nbsp;&nbsp;&nbsp;<input type="text" id="radius4" style="width:400px"></td>
</tr>
<tr>
<td colspan="6">###상세입력안함###</td>
</tr>
<tr>
<td>연락처</td>
<td>전화번호</td>
<td><input type="text" id="radius3" style="width:300px"></td>
<td>팩스번호</td>
<td colspan="2"><input type="text" id="radius3" style="width:300px"></td>
</tr>
<tr>
<td>담당부서사원</td>
<td colspan="6"><input type="text" id="radius3" style="width:300px"></td>
</tr>
<tr>
<td rowspan="2">입금계좌번호</td>
<td>은행</td>
<td><input type="text" id="radius2" style="width:200px">&nbsp;&nbsp;&nbsp;&nbsp;<input type="button" value="검색"></td>
<td colspan="3"><input type="text" id="radius4" style="width:310px"></td>
</tr>
<tr>
<td>예금주</td>
<td><input type="text" id="radius4" style="width:310px"></td>
<td>계좌번호</td>
<td colspan="2"><input type="text" id="radius4" style="width:310px"></td>
</tr>
<tr>
<td>업체담당자연락처</td>
<td colspan="6"><input type="text" id="radius4" style="width:310px"> </td>
</tr>
<tr>
<td>사용여부</td>
<td colspan="6"><input type="text" id="radius1" style="width:40px"> 0:부1:여</td>
</tr>
<tr>
<td colspan=6 style="text-align:center"> <input type="button" value="확인"></td>
</tr>

</form>
</table>
	<div style="height: 100vh;"></div>
		<div class="card mb-4">
			<div class="card-body">When scrolling, the navigation stays at
				the top of the page. This is the end of the static navigation demo.</div>
		</div>
	</main>
	<jsp:include page="../common/menubar2.jsp" />
<!-- </table> -->

<script src="https://t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>

<script>

/*주소*/
// 우편번호 찾기 화면을 넣을 element
var element_layer = document.getElementById('layer');

function closeDaumPostcode() {
	// iframe을 넣은 element를 안보이게 한다.
	element_layer.style.display = 'none';
}

function sample2_execDaumPostcode() {
	new daum.Postcode(
			{
				oncomplete : function(data) {
					// 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.
					// 각 주소의 노출 규칙에 따라 주소를 조합한다.
					
					// 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
					var addr = ''; // 주소 변수
					var extraAddr = ''; // 참고항목 변수

					//사용자가 선택한 주소 타입에 따라 해당 주소 값을 가져온다.
					if (data.userSelectedType === 'R') { // 사용자가 도로명 주소를 선택했을 경우
						addr = data.roadAddress;
					} else { // 사용자가 지번 주소를 선택했을 경우(J)
						addr = data.jibunAddress;
					}

					// 사용자가 선택한 주소가 도로명 타입일때 참고항목을 조합한다.
					if (data.userSelectedType === 'R') {
						// 법정동명이 있을 경우 추가한다. (법정리는 제외)
						// 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
						if (data.bname !== ''
								&& /[동|로|가]$/g.test(data.bname)) {
							extraAddr += data.bname;
						}
						// 건물명이 있고, 공동주택일 경우 추가한다.
						if (data.buildingName !== ''
								&& data.apartment === 'Y') {
							extraAddr += (extraAddr !== '' ? ', '
									+ data.buildingName : data.buildingName);
						}
						// 표시할 참고항목이 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
						if (extraAddr !== '') {
							extraAddr = ' (' + extraAddr + ')';
						}

					} /* else {
						document.getElementById("sample2_extraAddress").value = '';
					} 여기 주석처리했어!*/

					// 우편번호와 주소 정보를 해당 필드에 넣는다.
					document.getElementById('vender-address1-surr').value = data.zonecode;
					document.getElementById("vender-address2-surr").value = addr;
					// 커서를 상세주소 필드로 이동한다.
					document.getElementById("address2")
							.focus();

					// iframe을 넣은 element를 안보이게 한다.
					// (autoClose:false 기능을 이용한다면, 아래 코드를 제거해야 화면에서 사라지지 않는다.)
					element_layer.style.display = 'none';
				},
				width : '100%',
				height : '100%',
				maxSuggestItems : 5
			}).embed(element_layer);

	// iframe을 넣은 element를 보이게 한다.
	element_layer.style.display = 'block';

	// iframe을 넣은 element의 위치를 화면의 가운데로 이동시킨다.
	initLayerPosition();
}

// 브라우저의 크기 변경에 따라 레이어를 가운데로 이동시키고자 할때는
// resize이벤트나, orientationchange이벤트를 이용하여 값이 변경될때마다 아래 함수를 실행 시켜 주거나,
// 직접 element_layer의 top,left값을 수정해 주면 
function initLayerPosition() {
	var width = 400; //우편번호서비스가 들어갈 element의 width
	var height = 500; //우편번호서비스가 들어갈 element의 height
	var borderWidth = 1; //샘플에서 사용하는 border의 두께

	// 위에서 선언한 값들을 실제 element에 넣는다.
	element_layer.style.width = width + 'px';
	element_layer.style.height = height + 'px';
	element_layer.style.border = borderWidth + 'px solid';
	// 실행되는 순간의 화면 너비와 높이 값을 가져와서 중앙에 뜰 수 있도록 위치를 계산한다.
	element_layer.style.left = (((window.innerWidth || document.documentElement.clientWidth) - width) / 2 - borderWidth)
			+ 'px';
	element_layer.style.top = (((window.innerHeight || document.documentElement.clientHeight) - height) / 2 - borderWidth)
			+ 'px';
}


</script>
</body>
</html>