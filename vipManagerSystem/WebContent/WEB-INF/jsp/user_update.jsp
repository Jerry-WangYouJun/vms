<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="/common.jsp"%>
<%@taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>用户修改页面</title>
	
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
		if(checkInfo()){
			$.ajax({
		    	url : "${basePath}/user/user_update",
	       		type:'post',  
	       		data: $("#userForm").serialize(),
	       		dataType: 'json',
	       		success: function(data){
		           	parent.$.messager.alert('提示',data.msg);
		       		if(data.success == true) {
		       			parent.doSearch();
		       			parent.$('#dlg-frame').dialog("close");
			       	}
	       		},
	       		error: function(transport) { 
	       			$.messager.alert('提示',"系统产生错误,请联系管理员!","error");
	        	} 
	       	}); 
	       	
	       //	$("#userForm").submit();   //PUT方式提交
		}
	}
	
	function checkInfo(){
		if($("#userNo").val() == ""){
			$.messager.alert("提示","用户名不能为空!","error");
			return false;
		}
		return true;
	}
</script>
</head>
<body>
	<form:form id="userForm" action="${basePath }/user/user_update" modelAttribute="user" method="post">
		<input type="hidden" name="_method" value="PUT"/>
		<form:hidden path="id"/>
		<form:hidden path="score"/>
		<form:hidden path="balance"/>
		<table width="100%">
		  	<tr>
		  		<td>卡号：</td>
		  		<td>
		  			<form:input id="vip" path="vip" />
		  		</td>
		  		<td>姓名：</td>
		  		<td>
		  			<form:input id="username" path="username" />
		  		</td>
		  		<td>性别：</td>
		  		<td>
		  			 <c:if test="${user.sex eq 0 }">
			  			<input type="radio" name="sex" value='1' />男
			  			<input type="radio" name="sex" value='0' checked="checked"/>女
		  			 </c:if>
		  			 <c:if test="${user.sex eq 1 }">
		  				 <input type="radio" name="sex" value='1' checked="checked"/>男
			  			<input type="radio" name="sex" value='0' />女
		  			 </c:if>
		  			 
		  		</td>
		  	</tr>
		  	<tr>
		  		<td>手机号：</td>
		  		<td>
		  			<form:input id="telephone" path="telephone"  />
		  		</td>
		  		<td>生日：</td>
		  		<td>
		  			<form:input  path="birthday" class="easyui-datebox" />
		  		</td>
		  		<td>地址：</td>
		  		<td>
		  			<form:input path="address"/>
		  		</td>
		  	</tr>
		  	<tr>
		  		<td>VIP级别：</td>
		  		<td>
		  			<form:input id="level" path="level" />
		  		</td>
		  	</tr>
		  </table>
	</form:form>
</body>
</html>