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
	function changeColor(obj){
		obj.style.backgroundColor='#6298E1';
		obj.style.color='#000000';
	}
	
	function changeColorBack(obj){
		obj.style.backgroundColor='#6298E1';
		obj.style.color="#000000";
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
	    //添加列:日期
	    var newNameTD=newTR.insertCell(1);
	    //添加列内容
		newNameTD.innerHTML = "<select style='width:70px;' name='way" + xuhao + "' id='way" + xuhao + "'>"
						+ " <option  value='饮品'>饮品</option> "
						 +" <option value='点心'>点心</option>  "
						 +" <option value='特色'>特色</option>  "
						 +"  </select>";
	    //添加列:方式
	    var newEmailTD=newTR.insertCell(2);
	    //添加列内容
	    newEmailTD.innerHTML = "<input  name='time" + xuhao + "' id='time" + xuhao + " size='19' />";

		//添加列:备注
		var newTelTD = newTR.insertCell(3);
		//添加列内容
		newTelTD.innerHTML = "<input size='10' name='remark" + xuhao
				+ "' id='remark" + xuhao
				+ "' type='text'   />";

		//添加列:删除按钮
		var newDeleteTD = newTR.insertCell(4);
		//添加列内容
		newDeleteTD.innerHTML = "<div align='center' style='width:40px'><a href=\"javascript:;\" onclick=\"deltr('tr"
				+ xuhao + "')\">删除</a></div>";
				$("#td1").css("width","50px");
				$("#signFrame tr").each(function(){   
				    $(this).children("td:first").attr("style","width:80px;");   
				}) 
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
</script>
</head>
<body>

	<form id="orderForm"
		action="${basePath}/admin/OrderServlet?flag=insert" method="post">
		<table width="100%" >
			<tr>
				<td>订单编码：</td>
				<td><input type="text" name="productno" size="14" /></td>
				<td>商品分类：</td>
				<td><select id="productTypeCode" name="producttype">
						<option value="">---请选择---</option>
						<option value="饮品">---饮品---</option>
						<option value="点心">---点心---</option>
						<option value="特色">---特色---</option>
				</select></td>
			</tr>
			<tr>
				<td>商品名称：</td>
				<td><input type="text" name="productname" size="14" /></td>
				<td>商品规格：</td>
				<td><input type="text" id="productStandard"
					name="productstandard" size="14" /></td>
			</tr>
			<tr>
				<td>商品数量：</td>
				<td><input type="text" name="productnum" size="14"></input></td>
				<td>计量单位：</td>
				<td><input type="text" name="unit" size="14"></input></td>
			</tr>
			<tr>
				<td>商品单价：</td>
				<td><input type="text" name="price" size="14"></input></td>
				<td valign="top" colspan="">备注：</td>
				<td colspan="5"><textarea rows="2" cols="15" name="remark"></textarea>
				</td>
			</tr>
		</table>
		
		<input type="button" value="添加行" onclick="addtr()" />


		<table  style="width:70%;height:auto;" id="signFrame">
			<tr id="trHeader">
				<td width="50px">序号</td>
				<td width="170px">类型</td>
				<td width="100px">单价</td>
				<td>备注</td>
				<td width="80px">操作</td>
			</tr>
		</table>
	</form>
</body>
</html>