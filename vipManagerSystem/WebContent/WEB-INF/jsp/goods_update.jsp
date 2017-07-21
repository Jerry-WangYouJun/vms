<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>商品修改页面</title>
		<jsp:include page="/common.jsp"></jsp:include>
	<style type="text/css">
		table{
			font-size:12px;
		}
		textarea{
			font-size:12px;
		}
	</style>
<script type="text/javascript">
	function doServlet(){
		$.ajax({
	    	url : "${basePath}/goods/update",
       		type:'post',  
       		data: $("#goodsForm").serialize(),
       		dataType: 'text',
       		success: function(data){
	       		if(data > 0) {
	       			parent.doSearch();
	       			parent.$('#dlg-frame').dialog("close");
		       	}
       		},
       		error: function(transport) { 
       			$.messager.alert('提示',"系统产生错误,请联系管理员!","error");
        	} 
       	});
	}
	
	function chooseOption(obj){
		var optionValue = $(obj).find("option:selected").val();
		var optionText = $(obj).find("option:selected").text();
		if(optionValue == ""){
			$("#productTypeCode").val("");
		}else{
			$("#productTypeCode").val(optionText);
		}
		
	}
	
	 $(function(){
		 var option = $("option");
		 for(var i = 0 ; i < option.length ; i ++){
			  if("${goods.producttype }" == option[i].value){
				  option[i].selected = "selected";
			  }
			 	  
		 }
	 });
</script>
</head>
<body>
	<form id="goodsForm" action="${basePath}/admin/GoodsServlet?flag=update" method="post">
	  <table width="100%">
	  	<tr>
	  		<td>产品编码：</td>
	  		<td>
	  			<input type="hidden" id="id" name="id" value="${goods.id }" />
	  			<input type="text" name="productno" size="14" value="${goods.productno }"/>
	  		</td>
	  		<td>产品分类：</td>
	  		<td>
	  			<select id="productTypeCode" name="producttype">
	  				<option value="">---请选择---</option>
	  				<!-- <option value="饮品">---咖啡---</option>
	  				<option value="点心">---冷饮---</option>  需要更新数据库-->
	  				 <option value="咖啡">---咖啡---</option>
	  				<option value="冷饮">---冷饮---</option> 
	  				<option value="茶">---茶---</option>
	  				<option value="本店特色">---本店特色---</option>
	  			</select>
	  			<input type="hidden" id="producttype" value="${goods.producttype }"/>
	  		</td>
	  	</tr>
	  	<tr>
	  		<td>产品名称：</td>
	  		<td>
	  			<input type="text" name="productname" size="14"  value="${goods.productname }"/>
	  		</td>
	  		<td>产品规格：</td>
	  		<td>
	  			<input type="text" id="productStandard" name="productstandard" size="14" value="${goods.productstandard }" />
	  		</td>
	  	</tr>
	  	<tr>
	  		<td>计量单位：</td>
	  		<td>
	  			<input type="text" name="unit" size="14" value="${goods.unit }"></input>
	  		</td>
	  		<td>产品单价：</td>
	  		<td>
	  			<input type="text" name="price" size="14" value="${goods.price }"></input>
	  		</td>
	  	</tr>
	  	<tr>
	  		<td valign="top" colspan="">备注：</td>
			<td colspan="5">
				<textarea rows="2" cols="60" name="remark">${goods.remark }</textarea>
			</td>
	  	</tr>
	  </table>
  </form>
</body>
</html>