<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>商品添加页面</title>
<jsp:include page="/common.jsp"></jsp:include>
<style type="text/css">
table {
	font-size: 12px;
}

textarea {
	font-size: 12px;
}

.tdwidth{
	 width: 50px;
}
</style>
<script type="text/javascript">
	function doServlet() {
		if(checkUser($("#userName").val())){
			alert(123);
			$.ajax({
				url : "${basePath}/recharge/insert",
				type : 'post',
				data : $("#rechargeForm").serialize(),
				dataType : 'text',
				success : function(data) {
					if (data > 0) {
						parent.doSearch();
						parent.$('#dlg-frame').dialog("close");
					}
				},
				error : function(transport) {
					$.messager.alert('提示', "系统产生错误,请联系管理员!", "error");
				}
			});
		}
	}
	
	 function checkUser(userName){
		 var flag = true ;
		 $.ajax({
				type : "POST",
				cache : false,
				url : "${basePath}/user/checkUserName?userName="
						+ userName,
				dataType : "text",
				async : false,
				success : function(data) {
					  if(data <= 0 ){
						    alert("该用户不存在");
						    flag = false ;
					  }else{
						   flag = true;
					  }
				}
			});
		 
		 return flag ;
	 }
	$(function(){
			$("#userName").keyup(
				function() { //这个keyup要写在//$(document).ready,还要那个keyup,keydown,keypress自己百度看看
					var userName = $("#userName").val();
					$.ajax({
								type : "POST",
								cache : false,
								url : "${basePath}/user/ajaxUserName?userName="
										+ userName,
								dataType : "json",
								data : {},
								async : false,
								success : function(data) {
									var htmlStr = "";
									if (data && data.length > 0) {
										htmlStr += "<table class=\"list_tab\">";
										for (var i = 0; i < data.length; i++) {
											htmlStr += "<tr class=\"row\" onclick=\"selectDName('"
													+ (i + 1)
													+ "_dName')\">";
											htmlStr += "<td id=\""
													+ (i + 1)
													+ "_dName\" style=\"text-align:left;\">";
											htmlStr += data[i].username;
											htmlStr += "</td>";
											htmlStr +="<input type=\"hidden\" name = 'userId'  value = \"" + data[i].id +"\"/>"
											htmlStr += "</tr>";
										}
										htmlStr += "</table>";

										$("#user_namelist_div").html(
												htmlStr);
										$("#user_namelist_div")
												.show();
									} else {
										//没有数据div就不显示
										$("#user_namelist_div")
												.hide();

									} 
								}
							});
				});
	});
	
	 function selectDName(tdId){
	        $("[id='userName']").val(document.getElementById(tdId).innerHTML);
	      $("#user_namelist_div").hide();
	  }
	 
	 function getBill(){
		   var billSum = 0;
		   var billNum = 0 ;
		   $("#signFrame tr:not(:first)").each(function(){
			      if(this.childNodes[4].childNodes[0].value!="" && this.childNodes[3].childNodes[0].value!=""){
			    	  billSum += parseFloat(this.childNodes[4].childNodes[0].value)  *  parseFloat(this.childNodes[3].childNodes[0].value);
			    	  billNum += parseFloat(this.childNodes[4].childNodes[0].value) ;
			      }
		   });	
		   $("#bill").val(billSum);
		   $("#count").val(billNum);
	 }
	 
	 function getTotalMoney(){
		  $("").val($("#actualMoney").val() + $("#giftMoney").val())
	 }
</script>
</head>
<body>

	<form id="rechargeForm"
		action="${basePath}/admin/OrderServlet?flag=insert" method="post">
		<table width="100%" >
			<tr>
				<td>客户：</td>
				<td><input type="text" name="userName" id="userName" size="14"  />
					<div id="user_namelist_div"
						style="border: 1px solid green; background-color: #EFEFEF; width: 400px; height: 300px; display: none; position: absolute; z-index: 100; overflow-y: scroll; overflow-x: scroll;">
						<table class="list_tab">
							<tr class="row">
								<td id="user_namelist"></td>
							</tr>
						</table>
					</div>
				</td>
				<td>余额：</td>
				<td><input type="text" name="totalMoney" size="14" disabled="disabled"/></td>
				<td>充值金额：</td>
				<td><input type="text" name="finalMoney" id = "finalMoney" size="14" disabled="disabled"></input></td>
			</tr>
			<tr>
				<td>实收金额：</td>
				<td><input type="text" name="actualMoney" id="actualMoney" onchange="getTotalMoney()" size="14" class="easyui-numberbox"></input></td>
				<td>赠送金额：</td>
				<td><input type="text" name="giftMoney" id="giftMoney" size="14" onchange="getTotalMoney()"></input></td>
			</tr>
			<tr>
				<td>充值积分：</td>
				<td><input type="text" name="creditPoints" id = "creditPoints"  onchange="getTotalPoints()" size="14" ></input></td>
				<td>剩余积分：</td>
				<td><input type="text" name="totalPoints" id = "totalPoints"  size="14" disabled="disabled" ></input></td>
			</tr>
		</table>
	</form>
</body>
</html>