<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="form" uri="http://www.springframework.org/tags/form" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>用户管理</title>
	<jsp:include page="/common.jsp"></jsp:include>
	<script type="text/javascript">
		$(function(){
			$('#data-table').datagrid( {
				url : '${basePath}/recharge/query',
				rownumbers : true,
				autoRowHeight : true, 
				singleSelect : true,
				pagination : true,
				nowrap: false,
				toolbar: [{
					text:'添加',
					iconCls: 'icon-add',
					handler: function(){addRecharge();}
				},'-',{
					text:'修改',
					iconCls: 'icon-edit',
					handler: function(){updateRecharge();}
				},'-',{
					text:'删除',
					iconCls: 'icon-remove',
					handler: function(){deleteRecharge();}
				}],
				columns:[[
				    {field : 'id',align : 'center',halign:'center',checkbox : true}, 
				    {field : 'userName',title : '用户姓名',halign:'center',width : 80},
				    {field : 'actualMoney',title : '实收金额',halign:'center',width : 80},
				    {field : 'giftMoney',title : '赠送金额',halign:'center',width : 80},
				    {field : 'totalMoney',title : '余额',halign:'center',width : 100},
				    {field : 'creditPoints',title : '充值节分',halign:'center',width : 100},
				    {field : 'totalPoints',title : '剩余积分',halign:'center',width : 100},
				    {field : 'rechargetime',title : '充值时间',halign:'center',width : 100}
				]]
			});
			
			$('#dlg-frame').dialog( {
				title : '用户管理',
				width :  700,
				height : 320,
				top:50,
				left:100,
				closed : true,
				cache : false,
				modal : true,
				buttons : [ {
					text : '确定',
					iconCls : 'icon-ok',
					handler : function() {
						if (confirm("确定执行下一步操作？")) {
							frameContent.window.doServlet();
						}
					}
				}, {
					text : '关闭',
					iconCls : 'icon-cancel',
					handler : function() {
						$('#dlg-frame').dialog("close");
					}
				} ]
			});
		});
		
		function doSearch(){
			var vip = $("#search-vip").val();
			var rechargeName = $("#search-rechargeName").val();
		
			$('#data-table').datagrid('reload',{
				vip:vip,rechargeName:rechargeName
			} );
		}
		function doClear(){
			$("#search-vip").val("");
			$("#search-rechargeName").val("");
		}
		function addRecharge(){
			var path = "${basePath}/recharge/recharge_add";
			document.getElementById('frameContent').src = path;
			$('#dlg-frame').dialog('open');
		}
		
		function updateRecharge(){
			var obj = $('#data-table').datagrid('getSelected');
			if (obj == null || obj.id == null) {
				$.messager.alert('提示', "请先选中一行(只允许单行操作)", 'error');
				return;
			}		
			var path = "${basePath}/recharge/updateinit?id=" + obj.id;
			document.getElementById('frameContent').src = path;
			$('#dlg-frame').dialog('open');
		}
		
		function deleteRecharge(){
			var del= confirm("确认删除？");
			if(!del){
				return false;
			}
			var obj = $('#data-table').datagrid('getSelected');
			if (obj == null || obj.id == null) {
				$.messager.alert('提示', "请先选中一行(只允许单行操作)", 'error');
				return;
			}	
			var url = "${basePath}/recharge/delete" ;
			$.ajax( {
				url : url,
				type : 'post',
				data : {
					id : obj.id
				},
				dataType : 'json',
				success : function(data) {
					if(data.success){
						$.messager.alert('提示',data.msg);
						doSearch();
					}else{
						$.messager.alert('提示',data.msg,"error");
					}
					
				},
				error : function(transport) {
					$.messager.alert('提示', "系统产生错误,请联系管理员!", "error");
				}
			});
		}
	</script>

</head>
<body class="easyui-layout">
	<div id="tb" region="north" title="查询条件区" class="easyui-panel"  iconCls="icon-search"  style="padding:3px;height: 60px; width: 86%"  >
		<span>VIP卡号:</span>
		<input id="search-vip" name="vip"/>
		<span>姓名:</span>
		<input id="search-rechargeName" name="rechargeName"/>
		<a href="####" class="easyui-linkbutton" plain="true" iconCls="icon-search" onclick="doSearch()">查询</a>
		<a href="####" class="easyui-linkbutton" plain="true" iconCls="icon-clear" onclick="doClear()">清除</a>
	</div>
	<div region="center"  border="0">
		<form:form id="dataForm" action="${basePath}/recharge/recharge_delete" modelAttribute="recharge" method="post">
			<input type="hidden" name="_method" value="DELETE"/>
			<table id="data-table"  title="数据列表" width="86%" ></table>
		</form:form>
		
		<div id="dlg-frame">
			<iframe width="99%" height="98%" name="frameContent" id="frameContent"
				frameborder="0"></iframe>
		</div>
	</div>
	
	
</body>
</html>