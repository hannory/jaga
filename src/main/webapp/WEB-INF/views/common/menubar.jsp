<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>    
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
        <meta name="description" content="" />
        <meta name="author" content="" />
<title>자가경리</title>
<c:set var="contextPath"
      value="${ pageContext.servletContext.contextPath }"
      scope="application" />
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
        <link href="${ contextPath }/resources/css/styles.css" rel="stylesheet" />
        <link href="https://cdn.datatables.net/1.10.20/css/dataTables.bootstrap4.min.css" rel="stylesheet" crossorigin="anonymous" />
        <script src="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.11.2/js/all.min.js" crossorigin="anonymous"></script>

<!-- jquery UI calendar-->
<script
   src="https://code.jquery.com/ui/1.12.1/jquery-ui.min.js"
   integrity="sha256-VazP97ZCwtekAsvgPBSUwPFKdrwD3unUfSGVYrahUqU="
   crossorigin="anonymous"></script>
   <link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
  <script src="https://code.jquery.com/jquery-1.12.4.js"></script>
  <script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
  
  
      <link rel="stylesheet" type="text/css" href="https://cdn.datatables.net/1.10.20/css/jquery.dataTables.css">
<script type="text/javascript" charset="utf8" src="https://cdn.datatables.net/1.10.20/js/jquery.dataTables.js"></script>
  
   
<style>
	#printWinBtn {
		background: none;
		border: none;
		outline: none;
	}
	#helpBtn {
		background: none;
		border: none;
		outline: none;
	}
	#helpPersonBtn {
		background: none;
		border: none;
		outline: none;
		float: right;
	}
	
	#huanying{
	font-size:9px;
	text-align:center;
	}
	
		#printWinBtn22 {
		background: none;
		border: none;
		outline: none;
	}
</style>
</head>
<body class="sb-nav-fixed">
        <nav class="sb-topnav navbar navbar-expand navbar-dark bg-dark">
            <a class="navbar-brand" href="main.vi"><img src="${ contextPath }/resources/images/logo_vertical.PNG" width="90%"></a><button class="btn btn-link btn-sm order-1 order-lg-0" id="sidebarToggle" href="#"><i class="fas fa-bars"></i></button
            >
            <button id="helpBtn" style="color:#296355; font-weight: bold;"><img src="${ contextPath }/resources/images/help.PNG" width="30px"> 도움!</button>
            <button id="printWinBtn" style="color:#296355; font-weight: bold;"><img src="${ contextPath }/resources/images/print.PNG" width="30px"> 인쇄</button>
            <!-- Navbar Search-->
            <button id="helpPersonBtn" style="color:#296355; font-weight: bold;"><img src="${ contextPath }/resources/images/cs.PNG" width="30px"> 고객센터</button>
            <form class="d-none d-md-inline-block form-inline ml-auto mr-0 mr-md-3 my-2 my-md-0">
                <div class="input-group">
                	 	<c:if test="${!empty sessionScope.loginCompany }">

			<button id="printWinBtn22" style="color:#296355; font-weight: bold;"  disabled="disabled"><c:out value="${sessionScope.loginCompany.bizName}의  ${sessionScope.loginCompany.companyId }님 "></c:out></button>
 				</c:if> 
                    <input class="form-control" type="text" placeholder="Search for..." aria-label="Search" aria-describedby="basic-addon2" />
                    <div class="input-group-append">
                        <button class="btn btn-primary" type="button"><i class="fas fa-search"></i></button>
                    </div>
                </div>
            </form>
            <!-- Navbar-->
            <ul class="navbar-nav ml-auto ml-md-0">
                <li class="nav-item dropdown">
                    <a class="nav-link dropdown-toggle" id="userDropdown" href="#" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false"><i class="fas fa-user fa-fw"></i></a>
                    <div class="dropdown-menu dropdown-menu-right" aria-labelledby="userDropdown">
                        <a class="dropdown-item" href="#">Settings</a><a class="dropdown-item" href="#">Activity Log</a>
                        <div class="dropdown-divider"></div>
                        <a class="dropdown-item" href="${contextPath}/logout.co">Logout</a>
                    </div>
                </li>
            </ul>
            
        </nav>
        
        
        <div id="layoutSidenav">
            <div id="layoutSidenav_nav">
                <nav class="sb-sidenav accordion sb-sidenav-dark" id="sidenavAccordion">
                    <div class="sb-sidenav-menu">
                        <div class="nav">
                        
                                 <a class="nav-link collapsed" href="#" data-toggle="collapse" data-target="#collapsePages" aria-expanded="false" aria-controls="collapsePages">
                            <div class="sb-nav-link-icon"><i class="fas fa-book-open"></i></div>
                                회계관리
                                <div class="sb-sidenav-collapse-arrow"><i class="fas fa-angle-down"></i></div></a>
                                
                            
                            <div class="collapse" id="collapsePages" aria-labelledby="headingTwo" data-parent="#sidenavAccordion">
                                <nav class="sb-sidenav-menu-nested nav accordion" id="sidenavAccordionPages">
                                    <a class="nav-link collapsed" href="#" data-toggle="collapse" data-target="#pagesCollapseAuth" aria-expanded="false" aria-controls="pagesCollapseAuth">
                                    전표입력
                                    <div class="sb-sidenav-collapse-arrow"><i class="fas fa-angle-down"></i></div></a>
                                    <div class="collapse" id="pagesCollapseAuth" aria-labelledby="headingOne" data-parent="#sidenavAccordionPages">
                                        <nav class="sb-sidenav-menu-nested nav">
	                                       <a class="nav-link" href="normalReceiption.vi">일반전표입력</a>
	                                        <a class="nav-link" href="receiption.vi">매입매출전표입력</a>
	                                        <a class="nav-link" href="taxInvoice.vi">세금계산서발행</a>
	                                        <a class="nav-link" href="transListAll.th">매입매출전표조회</a>
	                                        <a class="nav-link" href="businessEmpList.be">사업소득자임시</a>
                                        </nav>
                                    </div>
                                    
                                    
                                    
                                    <a class="nav-link collapsed" href="#" data-toggle="collapse" data-target="#pagesCollapseError" aria-expanded="false" aria-controls="pagesCollapseError">
                                    기초정보관리
                                        <div class="sb-sidenav-collapse-arrow"><i class="fas fa-angle-down"></i></div></a>
                                        
                                    <div class="collapse" id="pagesCollapseError" aria-labelledby="headingOne" data-parent="#sidenavAccordionPages">
                                        <nav class="sb-sidenav-menu-nested nav">
                                      		<a class="nav-link" href="venderList.vi">거래처리스트</a>
											<a class="nav-link" href="vender.vi">거래처등록</a>
	                                        <a class="nav-link" href="accountTitle.at">계정과목 및<br> 적요등록</a>
	                                        <a class="nav-link" href="500.html">부서등록</a>
	                                        <a class="nav-link" href="500.html">부서등록</a>
                                        </nav>
                                    </div>
                                    
                                    <a class="nav-link collapsed" href="#" data-toggle="collapse" data-target="#pagesCollapseA" aria-expanded="false" aria-controls="pagesCollapseError">
                                    장부관리
                                        <div class="sb-sidenav-collapse-arrow"><i class="fas fa-angle-down"></i></div></a>
                                        
                                    <div class="collapse" id="pagesCollapseA" aria-labelledby="headingOne" data-parent="#sidenavAccordionPages">
                                        <nav class="sb-sidenav-menu-nested nav">
	                                        <a class="nav-link" href="purchase.vi">매입매출장</a>
	                                        <a class="nav-link" href="generalLedger.vi">총계정원장</a>
	                                        <a class="nav-link" href="500.html">계정별원장</a>
	                                        <a class="nav-link" href="500.html">거래처원장</a>
	                                        <a class="nav-link" href="500.html">거래처별<br>계정과목별원장</a>
	                                        <a class="nav-link" href="500.html">현금출납장</a>
	                                        <a class="nav-link" href="dailyTable.ab">일(월)계표</a>
                                        </nav>
                                    </div>
                                    
                                    <a class="nav-link collapsed" href="compTrialBal.fs" aria-expanded="false" aria-controls="pagesCollapseError">재무제표</a>
                                        
                                    <a class="nav-link collapsed" href="showExpendResolutionWriteForm.expendResolution" aria-expanded="false" aria-controls="pagesCollapseError">지출결의서</a>
                                      
                                </nav>
                            </div>
                        
                             
                            <a class="nav-link collapsed" href="#" data-toggle="collapse" data-target="#collapseLayouts" aria-expanded="false" aria-controls="collapseLayouts"
                                ><div class="sb-nav-link-icon"><i class="fas fa-columns"></i></div>
                                부가가치세
                                <div class="sb-sidenav-collapse-arrow"><i class="fas fa-angle-down"></i></div
                            ></a>
                            
                            
                            <div class="collapse" id="collapseLayouts" aria-labelledby="headingOne" data-parent="#sidenavAccordion">
                                <nav class="sb-sidenav-menu-nested nav">
                                 <a class="nav-link" href="vatReport.vi">부가가치세신고서</a>
                                <a class="nav-link" href="sumTableTax.vi">세금계산서합계표</a>
                                <a class="nav-link" href="billTotalTable.vi">계산서합계표</a>
                                <a class="nav-link" href="creditCardSalesSlipGap.vi">신용카드등수령명세서</a>
                                <a class="nav-link" href="creditCardPurchaseSilp.vi">신용카드등발행명세서</a>
                                <a class="nav-link" href="deemedInputTax.vi">의제매입신고서</a>
                                <a class="nav-link" href="updatePurchaseSTMT.vi">과세표준및세액<br>결정(경정)청구서</a>
                                <a class="nav-link" href="updateSalseSTMT.vi">과세표준수정신고서및<br>추가자진납부</a>
                                </nav>
                            </div>
                            
                   
                             
                            <a class="nav-link collapsed" href="#" data-toggle="collapse" data-target="#collapseB" aria-expanded="false" aria-controls="collapseLayouts"
                                ><div class="sb-nav-link-icon"><i class="fas fa-columns"></i></div>
                                급여관리
                                <div class="sb-sidenav-collapse-arrow"><i class="fas fa-angle-down"></i></div
                            ></a>
                            
                            
                            <div class="collapse" id="collapseB" aria-labelledby="headingOne" data-parent="#sidenavAccordion">
                                <nav class="sb-sidenav-menu-nested nav">
                                <a class="nav-link" href="employee.vi">직원관리</a>
                                <a class="nav-link" href="layout-sidenav-light.html">급여대장</a>
                                <a class="nav-link" href="BPaymentList.bp">사업소득자<br>자료입력</a>
                                <a class="nav-link" href="layout-sidenav-light.html">일용직<br>급여자료입력</a>
                                <a class="nav-link" href="layout-sidenav-light.html">일용직<br>급여명세서</a>
                                
                                    <a class="nav-link collapsed" href="#" data-toggle="collapse" data-target="#pagesCollapseError" aria-expanded="false" aria-controls="pagesCollapseError">
                                    퇴직소득관리
                                        <div class="sb-sidenav-collapse-arrow"><i class="fas fa-angle-down"></i></div></a>
                                        
                                    <div class="collapse" id="pagesCollapseError" aria-labelledby="headingOne" data-parent="#sidenavAccordionPages">
                                        <nav class="sb-sidenav-menu-nested nav">
	                                        <a class="nav-link" href="retirement.vi">퇴직금계산</a>
	                                        <a class="nav-link" href="retirementReceipt.vi">퇴직소득원천징수영수증</a>
                                        </nav>
                                    </div>
                                    
                                <a class="nav-link" href="layout-sidenav-light.html">원천징수이행상황신고서</a>
                                </nav>
                            </div>
                            
                            
                            
                            <a class="nav-link collapsed" href="#" data-toggle="collapse" data-target="#collapseC" aria-expanded="false" aria-controls="collapseLayouts"
                                ><div class="sb-nav-link-icon"><i class="fas fa-columns"></i></div>
                                종합소득세
                                <div class="sb-sidenav-collapse-arrow"><i class="fas fa-angle-down"></i></div
                            ></a>
                            
                            <div class="collapse" id="collapseC" aria-labelledby="headingOne" data-parent="#sidenavAccordion">
                                <nav class="sb-sidenav-menu-nested nav">
                                <a class="nav-link" href="showViewAggregate.vi">종합소득세신고서</a>
                                </nav>
                            </div>
                   
                            
                            
                            
                            <a class="nav-link collapsed" href="#" data-toggle="collapse" data-target="#collapseD" aria-expanded="false" aria-controls="collapseLayouts"
                                ><div class="sb-nav-link-icon"><i class="fas fa-columns"></i></div>
                                설정
                                <div class="sb-sidenav-collapse-arrow"><i class="fas fa-angle-down"></i></div
                            ></a>
                            
                            <div class="collapse" id="collapseD" aria-labelledby="headingOne" data-parent="#sidenavAccordion">
                                <nav class="sb-sidenav-menu-nested nav">
                                <a class="nav-link" href="showViewCeateCompanyId.vi">계정생성</a>
                                <a class="nav-link" href="showViewCeateCompanyId.vi">계정생성</a>
                                <a class="nav-link" href="showViewCeateCompanyId.vi">계정생성</a>
                                <a class="nav-link" href="showViewCeateCompanyId.vi">계정생성</a>
                                </nav>
                            </div>
                   

                        </div>
                    </div>
                    
                            
                    <div class="sb-sidenav-footer">
                        <div class="small">Logged in as:</div>
                        Start Bootstrap
                    </div>
                </nav>
            </div>
            <div id="layoutSidenav_content">
            