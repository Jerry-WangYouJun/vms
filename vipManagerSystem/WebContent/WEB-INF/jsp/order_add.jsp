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
		var bill =   $("#bill").val();
		var count=   $("#count").val();
		if(count <= 0 || count == "" ){
			 alert("请添加饮品或点心");
			 return ;
		}
		if(bill < 0 ){
			alert("订单总价错误，请检查订单费用是否错误");
			return;
		}
		$.ajax({
			url : "${basePath}/order/insert",
			type : 'post',
			data : $("#orderForm").serialize(),
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
	
	//添加方法
	function addtr(){
	    //var trid=0;
	    var tab=document.getElementById("signFrame");
	    //添加行
	    var newTR = tab.insertRow(tab.rows.length);
	    //trid++;
	    //获取序号=行索引
	    var  xuhao=newTR.rowIndex.toString();
	    newTR.id = "tr" + xuhao;
	    //添加列:序号
	    var newNameTD=newTR.insertCell(0);
	    newNameTD.setAttribute("class", "tdwidth");
	    newNameTD.id = 'td'+ xuhao;
	    //添加列内容
	    newNameTD.innerHTML = xuhao;
	    //添加列:类型
	    var newNameTD=newTR.insertCell(1);
	    //添加列内容
	    
		newNameTD.innerHTML = "<select style='width:70px;' name='way_." + xuhao + "' id='way_" + xuhao + "' onchange='change(this)'>"
						 +" <option  value=''>请选择</option> "				
						 +" <option value='咖啡'>---咖啡---</option> "
						 +" <option value='点心'>冷饮</option>  "
						 +"<option value='茶'>---茶---</option>"
						 +" <option value='特色'>特色</option>  "
						 +"  </select>";
		//添加列:品名
	    var newEmailTD=newTR.insertCell(2);
	    //添加列内容
	    newEmailTD.innerHTML =  "<select style='width:70px;' name='product_" + xuhao + "' id='product_" + xuhao + "'  onchange='changePrice(this)' >"
		 +"  </select>";
	    //添加列:单价
	    var newEmailTD=newTR.insertCell(3);
	    //添加列内容
	    newEmailTD.innerHTML =  "<input type='text' style='width:70px;' name='orderDetailList[" + xuhao + "].price' id='price_" + xuhao + "' onchange='getBill()'  />"
								+  "<input size='10' name='orderDetailList[" + xuhao + "].goodId' id='id_" + xuhao
								+ "' type='hidden'   />";
		//添加列:数量
	    var newEmailTD=newTR.insertCell(4);
	    //添加列内容
	    newEmailTD.innerHTML =  "<input type='text' style='width:70px;' value='1' name='orderDetailList[" + xuhao + "].count' id='count_" + xuhao + "' onchange='getBill()'  />";
		//添加列:删除按钮
		var newDeleteTD = newTR.insertCell(5);
		//添加列内容
		newDeleteTD.innerHTML = "<div align='center' style='width:40px'><a href=\"javascript:;\" onclick=\"deltr('tr"
				+ xuhao + "')\">删除</a></div>";
				$("#td1").css("width","50px");
				$("#signFrame tr").each(function(){   
				    $(this).children("td:first").attr("style","width:80px;");   
				}) 
	}
	
	function change(obj){
			$("#product_" + obj.id.split("_")[1]).empty();
			$("#price_" + obj.id.split("_")[1]).empty();
			var str = ${model};
			var list  ; 
		 if(obj.value=='饮品'){
			  list = str.drink;
		 }else if(obj.value=='点心'){
			   list = str.food;
		 }else if(obj.value=='特色'){
			   list = str.special;
		 }
			for(var i=0 ; i < list.length ; i ++){
				$("#product_" + obj.id.split("_")[1]).append("<option value='"+ list[i].price +"_" + obj.id.split("_")[1] + "'>"+ list[i].productname +"</option>"); 
			}
			$("#price_" + obj.id.split("_")[1]).val(list[0].price);
			$("#id_" + obj.id.split("_")[1]).val(list[0].id);
			getBill();
	}
	
	function changePrice(obj){
		$("#price_" + obj.value.split("_")[1]).val( obj.value.split("_")[0]);
		getBill();
	}
	
	//删除其中一行
	function deltr(trid){   
	    var tab=document.getElementById("signFrame");
	    var row=document.getElementById(trid);   
	    var index=row.rowIndex;//rowIndex属性为tr的索引值，从0开始  
	    tab.deleteRow(index);  //从table中删除

	    //重新排列序号，如果没有序号，这一步省略
	    var nextid;
	    for(i=index;i<tab.rows.length;i++){
	        tab.rows[i].cells[0].innerHTML = i.toString();
	        nextid=i+1;
	        remark=document.getElementById("remark"+nextid);
	        remark.id="remark";
	    }
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
		   $("#bill").val(billSum - $("#discount").val());
		   $("#count").val(billNum);
	 }
	 
	 $(document).bind('click', function(e) {  
         var e = e || window.event; //浏览器兼容性   
         var elem = e.target || e.srcElement;  
         while (elem) { //循环判断至跟节点，防止点击的是div子元素   
             if (elem.id && elem.id == 'user_namelist_div') {  
                 return;  
             }  
             elem = elem.parentNode;  
         }  
         $('#user_namelist_div').css('display', 'none'); //点击的不是div或其子元素   
     }); 
</script>
</head>
<body>

	<form id="orderForm"
		action="${basePath}/admin/OrderServlet?flag=insert" method="post">
		<table width="100%" >
			<tr>
				<td>客户：</td>
				<td><input type="text" name="userName" id="userName" size="14" />
					<div id="user_namelist_div"   
						style="border: 1px solid green; background-color: #EFEFEF; width: 400px; height: 300px; display: none; position: absolute; z-index: 100; overflow-y: scroll; overflow-x: scroll;">
						<table class="list_tab">
							<tr class="row">
								<td id="user_namelist"></td>
							</tr>
						</table>
					</div>
				</td>
				<td>订单编码：</td>
				<td><input type="text" name="orderNo" size="14" /></td>
			</tr>
			<tr>
				<td>应收总价：</td>
				<td><input type="text" name="pill" id="bill" size="14"></input></td>
				<td>折扣：</td>
				<td><input type="text" id="discount" name=discount size="14" onchange="getBill()"></input></td>
			</tr>
			<tr>
				<td>总数量：</td>
				<td><input type="text" name="count" id = "count"  size="14" ></input></td>
				<td>支付方式：</td>
				<td>
					 <select id="pillType" name = "pillType">
					 		<option value="">---请选择---</option>
					 		<option value="01">---会员卡扣费---</option>
					 		<option value="02">---其他方式---</option>
					 </select>
				</td>
			</tr>
			<tr>
				<td valign="top" colspan="">备注：</td>
				<td colspan="5"><textarea rows="2" cols="15" name="remark"></textarea>
				</td>
			</tr>
		</table>
		
		<input type="button" value="添加行" onclick="addtr()" />


		<table  style="width:70%;height:auto;" id="signFrame">
			<tr id="trHeader">
				<td width="50px">序号</td>
				<td width="70px">类型</td>
				<td width="70px">品名</td>
				<td width="50px">单价</td>
				<td width="50px">数量</td>
				<td width="80px">操作</td>
			</tr>
		</table>
	</form>
</body>
</html>