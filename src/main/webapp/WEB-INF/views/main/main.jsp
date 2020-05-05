<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
      <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
      <%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>자가 경리</title>
<script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.8.0/Chart.bundle.min.js"></script>
	<script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.8.0/Chart.min.js"></script>
<style>
	main table {
		width:100%;
	}
	
	#divS{
		width: 49%;
		float: left;
	}
	
	#divB{
		width: 49%;
		float: right;
	}
	
	#wrap1{
		flot: left;
		
	}
	
	#chartArea{
		float: left;
	}
	
	.col-container {
	  display: table;
	  width: 100%;
	}
	.col {
	  display: table-cell;
	}
</style>
</head>
<body>
	<jsp:include page="../common/menubar.jsp" />
	<main>
	<div class="container-fluid">
		<h2 class="mt-4">대시보드</h2>
		<div class="card mb-4">
			<div class="card-body">
				<table id="sumTranTable">
			<colgroup>
				<col width="40%">
				<col width="30%">
				<col width="30%">
			</colgroup>
				<caption>이번달 리포트</caption>
				<tr>
					<th>매출-매입</th>
					<th>매출</th>
					<th>매입</th>
				</tr>
				<tr>
					<td><fmt:formatNumber value="${ profit.profit }" type="currency" currencySymbol=""/>원</td>
					<td><fmt:formatNumber value="${ profit.sale }" type="currency" currencySymbol=""/>원</td>
					<td><fmt:formatNumber value="${ profit.buy }" type="currency" currencySymbol=""/>원</td>
				</tr>
			</table>
			</div>
		</div>
		
		
		<div id="wrap1" class="col-container">
		
			<div class="col card mb-4" id="divS">
				<div class="card-body">
					<table id="creditSTable">
						<caption>거래처별 채권 현황</caption>
							<thead>
								<tr>
									<th>거래처</th>
									<th>잔액</th>
								</tr>
							</thead>
							
							<tbody>
							<c:forEach var="s" items="${ creditS }">
								<tr>
									<td><c:out value="${ s.venderName }"></c:out></td>
									<td><fmt:formatNumber value="${ s.totalVender }" type="currency" currencySymbol=""/>원</td>
								</tr>							
							</c:forEach>
							</tbody>
						
					</table>
				</div>
			</div>
			
			
			
			<div class="col card mb-4" id="divB">
				<div class="card-body">
					<table id="creditBTable">
						<caption>거래처별 채무 현황</caption>
							<thead>
								<tr>
									<th>거래처</th>
									<th>잔액</th>
								</tr>
							</thead>
							<tbody>
							<c:forEach var="b" items="${ creditB }">
								<tr>
									<td><c:out value="${ b.venderName }"></c:out></td>
									<td><fmt:formatNumber value="${ b.totalVender }" type="currency" currencySymbol=""/>원</td>
								</tr>							
							</c:forEach>
							</tbody>
						
					</table>
				</div>
			</div>
		</div>
		
		<div class="card mb-4" id="chartArea">
			<div class="card-body">
				<canvas id="myChart" width="400" height="400"></canvas>
			</div>
		</div>
		
		<div style="height: 100vh;"></div>
		<div class="card mb-4">
			<div class="card-body">When scrolling, the navigation stays at
				the top of the page. This is the end of the static navigation demo.</div>
		</div>
	</div>
	</main>
	
	<script>
	var ctx = document.getElementById('myChart').getContext('2d');
	var month1 = ${chart1.get(0).yearMonthAll};
	var month2 = ${chart1.get(0).yearMonthAll};
	var month3 = ${chart1.get(0).yearMonthAll};
	var month4 = ${chart1.get(0).yearMonthAll};
	var month5 = ${chart1.get(0).yearMonthAll};
	var myChart = new Chart(ctx, {
	    type: 'line',
	    data: {
	        labels: [ '${chart1.get(0).yearMonthAll}', '${chart1.get(1).yearMonthAll}', '${chart1.get(2).yearMonthAll}', '${chart1.get(3).yearMonthAll}', '${chart1.get(4).yearMonthAll}', '${chart1.get(5).yearMonthAll}'],
	        datasets: [{
	            label: '매출',
	            data: ['${chart1.get(0).sumMonthCha}', '${chart1.get(1).sumMonthCha}', '${chart1.get(2).sumMonthCha}', '${chart1.get(3).sumMonthCha}', '${chart1.get(4).sumMonthCha}', '${chart1.get(5).sumMonthCha}'],
	            backgroundColor: [
	                'rgba(255, 99, 132, 0)',
	                'rgba(54, 162, 235, 0)',
	                'rgba(255, 206, 86, 0)',
	                'rgba(75, 192, 192, 0)',
	                'rgba(153, 102, 255, 0)',
	                'rgba(255, 159, 64, 0)'
	            ],
	            borderColor: [
	                'rgba(255, 180, 179, 1)',
	                'rgba(54, 162, 235, 1)',
	                'rgba(255, 206, 86, 1)',
	                'rgba(75, 192, 192, 1)',
	                'rgba(153, 102, 255, 1)',
	                'rgba(255, 159, 64, 1)'
	            ],
	            borderWidth: 2
	        },
	        {
	            label: '매입',
	            data: ['${chart1.get(0).sumMonthDea}','${chart1.get(1).sumMonthDea}','${chart1.get(2).sumMonthDea}','${chart1.get(3).sumMonthDea}','${chart1.get(4).sumMonthDea}','${chart1.get(5).sumMonthDea}'],
	            backgroundColor: [
	                'rgba(255, 99, 132, 0)',
	                'rgba(54, 162, 235, 0)',
	                'rgba(255, 206, 86, 0)',
	                'rgba(75, 192, 192, 0)',
	                'rgba(153, 102, 255, 0)',
	                'rgba(255, 159, 64, 0)'
	            ],
	            borderColor: [
	                'rgba(161, 169, 255, 1)',
	                'rgba(54, 162, 235, 1)',
	                'rgba(255, 206, 86, 1)',
	                'rgba(75, 192, 192, 1)',
	                'rgba(153, 102, 255, 1)',
	                'rgba(255, 159, 64, 1)'
	            ],
	            borderWidth: 2
	        },
	        {
	            label: '수익',
	            data: ['${chart1.get(0).sumAll}','${chart1.get(1).sumAll}','${chart1.get(2).sumAll}','${chart1.get(3).sumAll}','${chart1.get(4).sumAll}','${chart1.get(5).sumAll}'],
	            backgroundColor: [
	                'rgba(255, 99, 132, 0)',
	                'rgba(54, 162, 235, 0)',
	                'rgba(255, 206, 86, 0)',
	                'rgba(75, 192, 192, 0)',
	                'rgba(153, 102, 255, 0)',
	                'rgba(255, 159, 64, 0)'
	            ],
	            borderColor: [
	                'rgba(41, 99, 86, 1)',
	                'rgba(54, 162, 235, 1)',
	                'rgba(255, 206, 86, 1)',
	                'rgba(75, 192, 192, 1)',
	                'rgba(153, 102, 255, 1)',
	                'rgba(255, 159, 64, 1)'
	            ],
	            borderWidth: 2
	        }]
	    },
	    options: {
	        scales: {
	            yAxes: [{
	                ticks: {
	                    beginAtZero: true
	                },
	                ticks: {
	                    callback: function(value, index, values) {
	                      return value.toLocaleString({style:"currency", currency:""});
	                    }
	                }
	            }]
	        }
	    }
	});
	</script>
	
	<jsp:include page="../common/menubar2.jsp" />
</body>
</html>