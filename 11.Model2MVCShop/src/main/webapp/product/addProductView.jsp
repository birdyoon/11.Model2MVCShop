<%@ page contentType="text/html; charset=euc-kr" %>
<html>
<head>
<title>��ǰ���</title>

	
<!-- 
	<link rel="stylesheet" href="/css/admin.css" type="text/css">
	
	<script type="text/javascript" src="../javascript/calendar.js">
	</script>
 -->
 	
<link rel="stylesheet" href="resources/css/plugin/datepicker/bootstrap-datepicker.css">

<script src="resources/js/plugin/datepicker/bootstrap-datepicker.js"></script>
<script src="resources/js/plugin/datepicker/bootstrap-datepicker.ko.min.js"></script>

<link rel="stylesheet" href="resources/css/plugin/datepicker/bootstrap-datepicker.css">
	
	<meta name="viewport" content="width=device-width, initial-scale=1.0" />
	
	<script src="http://code.jquery.com/jquery-2.1.4.min.js"></script>
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" >
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap-theme.min.css" >
	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js" ></script>
	
	
	
	 <!-- jQuery UI toolTip ��� CSS-->
  <link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
  <!-- jQuery UI toolTip ��� JS-->
  <script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>


	
	
	<!--  ///////////////////////// CSS ////////////////////////// -->
	<style>
       body > div.container{
        	border: 3px solid #D6CDB7;
            margin-top: 10px;
        }
    </style>
    
	<script type="text/javascript">

	
	$(function() {
		$('#manuDate').datepicker({
			dateFormat: "yy-mm-dd"
		});
	});	
	
	$(function() {
		 $( "#check" ).on("click" , function() {
			 fncAddProduct();
		 });
	});
	
	$(function() {
		 $( "a[href='#' ]" ).on("click" , function() {
			 $("form")[0].reset();
		 });
	});
	
function fncAddProduct(){
	//Form ��ȿ�� ����
//	var name = document.detailForm.prodName.value;
//	var detail = document.detailForm.prodDetail.value;
//	var manuDate = document.detailForm.manuDate.value;
//	var price = document.detailForm.price.value;

	var name=$("input[name='prodName']").val();
	var detail=$("input[name='prodDetail']").val();
	var manuDate=$("input[name='manuDate']").val();
	var price=$("input[name='price']").val();
	
	
	
	if(name == null || name.length<1){
		alert("��ǰ���� �ݵ�� �Է��Ͽ��� �մϴ�.");
		return;
	}
	if(detail == null || detail.length<1){
		alert("��ǰ�������� �ݵ�� �Է��Ͽ��� �մϴ�.");
		return;
	}
	if(manuDate == null || manuDate.length<1){
		alert("�������ڴ� �ݵ�� �Է��ϼž� �մϴ�.");
		return;
	}
	if(price == null || price.length<1){
		alert("������ �ݵ�� �Է��ϼž� �մϴ�.");
		return;
	}

//	document.detailForm.action='/addProduct.do';
//	document.detailForm.action='/product/addProduct';
//	document.detailForm.submit();
	$("form").attr("method", "POST").attr("action", "/product/addProduct").submit();
}



/*
function resetData(){
	document.detailForm.reset();
}
*/


</script>
</head>

<body>

<div class="navbar  navbar-default">
        <div class="container">
        	<a class="navbar-brand" href="/index.jsp">Model2 MVC Shop</a>
   		</div>
   	</div>
   	
   	<div class="container">
   	
   		<h1 class="bg-primary text-center">��ǰ���</h1>
   		
		<form class="form-horizontal" enctype="multipart/form-data">
		
  
	 <div class="form-group">
    <label for="prodName" class="col-sm-offset-1 col-sm-3 control-label" >��ǰ��</label>
    <div class="col-sm-4">
      <input class="form-control" type="text" name="prodName"  placeholder="��ǰ��">
    </div>
  </div>
		
	 <div class="form-group">
    <label class="col-sm-offset-1 col-sm-3 control-label" for="prodDetail">��ǰ������</label>
    <div class="col-sm-4">
      <input class="form-control" type="text" name="prodDetail" placeholder="��ǰ������">
    </div>
  </div>

	 <div class="form-group">
    <label for="text" class="col-sm-offset-1 col-sm-3 control-label" >��������</label>
    <div class="col-sm-4">
      <input type="text" class="form-control" id="manuDate" name="manuDate" placeholder="��������">
    </div>
  </div>
  
   <div class="form-group">
    <label class="col-sm-offset-1 col-sm-3 control-label" for="formGroupInputSmall">�� ��</label>
    <div class="col-sm-4">
      <input class="form-control" type="text" name="price"  placeholder="�� ��">
    </div>
  </div>
  
   <div class="form-group">
    <label class="col-sm-offset-1 col-sm-3 control-label" for="formGroupInputSmall">��ǰ�̹���</label>
    <div class="col-sm-4">
       <input multiple="multiple" class="form-control" type="file" id ="uploadFile"  name="uploadFile"  placeholder="��ǰ�̹���">
  <!--   <input multiple="multiple" class="form-control" type="file" id ="fileName"  name="fileName"  placeholder="��ǰ�̹���">-->
    </div>
  </div>


	<div class="form-group">
		    <div class="col-sm-offset-4  col-sm-4 text-center">
		      <button type="button" class="btn btn-primary" id="check" >�� &nbsp;��</button>
			  <a class="btn btn-primary btn" href="#" role="button">��&nbsp;��</a>
		    </div>
		  </div>

</form>
</div>
</body>
</html>