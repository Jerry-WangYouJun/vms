<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>订单管理</title>
	<jsp:include page="/common.jsp"></jsp:include>
	<script type="text/javascript">
		$(function(){
			$('#data-table').datagrid( {
				url : '${basePath}/order/query',
				rownumbers : true,
				autoRowHeight : true, 
				singleSelect : true,
				pagination : true,
				nowrap: false,
				toolbar: [{
					text:'添加',
					iconCls: 'icon-add',
					handler: function(){addOrder();}
				},'-',{
					text:'修改',
					iconCls: 'icon-edit',
					handler: function(){updateOrder();}
				},'-',{
					text:'删除',
					iconCls: 'icon-remove',
					handler: function(){deleteOrder();}
				}],
				columns:[[
				    {field : 'id',align : 'center',halign:'center',checkbox : true}, 
				    {field : 'orderNo',title : '订单编码',halign:'center',width : 120},
				    {field : 'userName',title : '顾客',halign:'center',width : 150},
				    {field : 'count',title : '数量',halign:'center',width : 80},
				    {field : 'pill',title : '总价',halign:'center',width : 80}, 
				    {field : 'pillType',title : '支付方式',halign:'center',width : 80 , formatter:function(value,rowData,rowIndex){
			    		if (value == "01") {
							return "会员卡扣费";
						}else {
							return "其他方式";
						}
			    }}, 
				    {field : 'orderDate',title : '时间',halign:'center',width : 80}, 
				]],
			 view: detailview,
			    detailFormatter: function(rowIndex, rowData){
			    	var tds = '';
			    	for(var i =0 ; i <  rowData.orderDetailList.length ; i++){
			    		var detail = rowData.orderDetailList[i]
			    		  
			    		 tds += '<tr style="height: 30px"> <td style="padding-left: 20px;padding-right: 20px">'+ detail.producttype +'</td>'
								+'<td style="padding-left: 20px;padding-right: 20px">'+ detail.productname +'</td>'
								+'<td style="padding-left: 20px;padding-right: 20px">'+ detail.price +'</td>'
								+'<td style="padding-left: 20px;padding-right: 20px">'+ detail.count +'</td>'
			    		  tds += '</tr>';
			    	}
			    	var str = '<table>'
				        +'<tr style="height: 30px">'
				        +'<td style="padding-left: 20px;padding-right: 20px">类型：</td>'
				        +'<td style="padding-left: 20px;padding-right: 20px">品名：</td>'
				        +'<td style="padding-left: 20px;padding-right: 20px">单价：</td>'
						+'<td style="padding-left: 20px;padding-right: 20px">数量：</td>'
						+'</tr>'
						+ tds
					+'</table>' ;
			        return str ;
			    }
			});
			
			$('#dlg-frame').dialog( {
				title : '商品管理',
				width :  900,
				height : 400,
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
			var userName = $("#userName").val();
			$('#data-table').datagrid('reload',{
				userName:userName
			} );
		}
		function doClear(){
			$("#orderNo").val("");
			$("#productname").val("");
			$("#producttypecode").val("");
			$("#productstandard").val("");
		}
		function addOrder(){
			var path = "${basePath}/order/insertInit";
			document.getElementById('frameContent').src = path;
			$('#dlg-frame').dialog('open');
		}
		
		function updateOrder(){
			var obj = $('#data-table').datagrid('getSelected');
			if (obj == null || obj.id == null) {
				$.messager.alert('提示', "请先选中一行(只允许单行操作)", 'error');
				return;
			}		
			var path = "${basePath}/order/updateinit?id=" + obj.id;
			document.getElementById('frameContent').src = path;
			$('#dlg-frame').dialog('open');
		}
		
		function deleteOrder(){
			var obj = $('#data-table').datagrid('getSelected');
			if (obj == null || obj.id == null) {
				$.messager.alert('提示', "请先选中一行(只允许单行操作)", 'error');
				return;
			}	
			var flag = confirm("确定删除该数据么?");
			if(!flag){
				 return;
			}
			var url = "${basePath}/order/delete";
			$.ajax( {
				url : url,
				type : 'post',
				data : {
					id : obj.id
				},
				dataType : 'text',
				success : function(data) {
					if(data>0)
					doSearch();
				},
				error : function(transport) {
					$.messager.alert('提示', "系统产生错误,请联系管理员!", "error");
				}
			});
		}
	</script>
</head>
<body>
	<div id="tb" title="查询条件区" class="easyui-panel"  style="padding:3px;width:85%" iconCls="icon-search">
		<table align="left">
			<tr>
				<td><span>顾客:</span></td>
				<td><input id="userName" name="userName"/></td>
				<td>
					<a href="####" class="easyui-linkbutton" plain="true" iconCls="icon-search" onclick="doSearch()">查询</a>
				</td>
				<td>
					<a href="####" class="easyui-linkbutton" plain="true" iconCls="icon-clear" onclick="doClear()">清除</a>
				</td>
			</tr>
		</table>
	</div>
	<table id="data-table"  style="height:490px" title="数据列表" width="85%"></table>
	<div id="dlg-frame">
		<iframe width="99%" height="90%" name="frameContent" id="frameContent"
			frameborder="0"></iframe>
	</div>
	</body>
</html>