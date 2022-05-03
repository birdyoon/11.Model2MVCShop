<%@ page language="java" contentType="text/html; charset=EUC-KR" %>
 
 <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%-- 
<%@ page import="com.model2.mvc.service.domain.*" %>

<%
	Product vo = (Product)request.getAttribute("vo");
	System.out.println("1 :"+vo);
%>
--%>

<html>
<head>
	
	<!-- 참조 : http://getbootstrap.com/css/   참조 -->
	<meta name="viewport" content="width=device-width, initial-scale=1.0" />
	
	<!--  ///////////////////////// Bootstrap, jQuery CDN ////////////////////////// -->
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" >
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap-theme.min.css" >
<!--  <script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>-->	
	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js" ></script>
	
	<!-- Bootstrap Dropdown Hover CSS -->
   <link href="/css/animate.min.css" rel="stylesheet">
   <link href="/css/bootstrap-dropdownhover.min.css" rel="stylesheet">
   
    <!-- Bootstrap Dropdown Hover JS -->
   <script src="/javascript/bootstrap-dropdownhover.min.js"></script>
	<script src="http://code.jquery.com/jquery-2.1.4.min.js"></script>
	
	<style>
 		body {
            padding-top : 50px;
        }
     </style>
     
	<script type="text/javascript">

	$(function() {
		 $( "button" ).on("click", function() {
			 self.location = "/product/listProduct?menu=manage"
		 });
	});
		 
	$(function() {	 
		 $( "#plus" ).on("click" , function() {
			 self.location = "../product/addProductView.jsp;"
		 });
	});
	
	</script>
</head>

<body>
	<jsp:include page="/layout/toolbar.jsp" />

	<div class="container">
	
	<div class="page-header ">
	       <h3 class=" text-info">상품등록</h3>
	       <h5 class="text-muted">상품을 <strong class="text-danger">등록</strong>해 주세요.</h5>
	    </div>

	<div class="row">
	  		<div class="col-xs-4 col-md-2"><strong>상 품 명</strong></div>
			<div class="col-xs-8 col-md-4">${product.prodName }</div>
		</div>

	<hr/>
		
		<div class="row">
	  		<div class="col-xs-4 col-md-2 "><strong>상품상세정보</strong></div>
			<div class="col-xs-8 col-md-4">${product.prodDetail }</div>
		</div>
	
	<hr/>
		
		<div class="row">
	  		<div class="col-xs-4 col-md-2 "><strong>제조일자</strong></div>
			<div class="col-xs-8 col-md-4">${product.manuDate }</div>
		</div>
	
	<hr/>
		
		<div class="row">
	  		<div class="col-xs-4 col-md-2"><strong>가 격</strong></div>
			<div class="col-xs-8 col-md-4">${product.price }</div>
		</div>

	<hr/>
		
		<div class="row">
	  		<div class="col-xs-4 col-md-2 "><strong>상품이미지</strong></div>
			<div class="col-xs-8 col-md-4">${product.fileName }</div>
		</div>




	<div class="form-group">
		    <div class="col-sm-offset-4  col-sm-4 text-center">
		      <button type="button" class="yes"  >확 &nbsp;인</button>
			   <button type="button" class="add2"  id="plus" >추가등록</button>
		    </div>
		  </div>



</body>
</html>