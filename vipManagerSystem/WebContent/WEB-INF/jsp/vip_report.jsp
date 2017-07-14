<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>商品管理</title>
	<jsp:include page="/common.jsp"></jsp:include>
	<script type="text/javascript">
		$(function(){
			$("#reportType").val("${reportType}");
			$("#reportDate").val("${reportDate}");
			var reportType = $("#reportType").val();
			var reportDate = $("#reportDate").val();
			$('#data-table').datagrid( {
				url : '${basePath}/report/vip?reportType=' + reportType +
				'&reportDate=' + reportDate,
				rownumbers : true,
				autoRowHeight : true, 
				singleSelect : true,
				pagination : true,
				nowrap: false,
				columns:[[
				    {field : 'username',title : '顾客',halign:'center',width : 80},
				    {field : 'orderNo',title : '订单号',halign:'center',width : 120},
				    {field : 'pill',title : '订单总价',halign:'center',width : 120},
				    {field : 'count',title : '订单数量',halign:'center',width : 150}
				]]
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
			var reportType = $("#reportType").val();
			var reportDate = $("#reportDate").val();
			window.location.href='${basePath}/report/vipinit?reportType=' + reportType +
			'&reportDate=' + reportDate;
		}
		function doClear(){
			$("#productno").val("");
			$("#productname").val("");
			$("#producttypecode").val("");
			$("#productstandard").val("");
		}
		function addGoods(){
			var path = "${basePath}/init/goods_add";
			document.getElementById('frameContent').src = path;
			$('#dlg-frame').dialog('open');
		}
		
		function updateGoods(){
			var obj = $('#data-table').datagrid('getSelected');
			if (obj == null || obj.id == null) {
				$.messager.alert('提示', "请先选中一行(只允许单行操作)", 'error');
				return;
			}		
			var path = "${basePath}/goods/updateinit?id=" + obj.id;
			document.getElementById('frameContent').src = path;
			$('#dlg-frame').dialog('open');
		}
		
		function deleteGoods(){
			var obj = $('#data-table').datagrid('getSelected');
			if (obj == null || obj.id == null) {
				$.messager.alert('提示', "请先选中一行(只允许单行操作)", 'error');
				return;
			}	
			var url = "${basePath}/goods/delete";
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
				<td><span>统计分类:</span></td>
				<td>
					<select id="reportType" name="reportType">
		  				<option value="">---请选择---</option>
		  				<option value="01">按月</option>
	  					<option value="02">按日</option>
		  			</select>
				</td>
				<td><span>统计时间:</span></td>
				<td><input id="reportDate" name="reportDate"/></td>
				<td>
					<a href="####" class="easyui-linkbutton" plain="true" iconCls="icon-search" onclick="doSearch()">查询</a>
				</td>
				<td>
					<a href="####" class="easyui-linkbutton" plain="true" iconCls="icon-clear" onclick="doClear()">清除</a>
				</td>
			</tr>
		</table>
	</div>
	<div style="height:290px;width:600px;float:left" >
		<table id="data-table"  style="height:290px" title="数据列表" ></table>
	</div>
	<div id="main" style="width:400px;height:400px;float:left" ></div>
	<div id="dlg-frame">
		<iframe width="99%" height="90%" name="frameContent" id="frameContent"
			frameborder="0"></iframe>
	</div>
	</body>
	<script type="text/javascript">
	 // 基于准备好的dom，初始化echarts实例
    var myChart = echarts.init(document.getElementById('main'), 'dark');
	var   nameList = ${data} ;
	var  valueList = ${valueData}
    // 指定图表的配置项和数据
    var option = {
        title: {
            text: 'ECharts 入门示例'
        },
        tooltip: {},
        legend: {
            data:['销量']
        },
        xAxis: {
            data: nameList
        },
        yAxis: {},
        series: [{
        	itemStyle: {
                normal: {
                    color: function(params) {
                        // build a color map as your need.
                        var colorList = [
                          '#C1232B','#B5C334','#FCCE10','#E87C25','#27727B',
                           '#FE8463','#9BCA63','#FAD860','#F3A43B','#60C0DD',
                           '#D7504B','#C6E579','#F4E001','#F0805A','#26C0C0'
                        ];
                        return colorList[params.dataIndex]
                    },
                    label: {
                        show: true,
                        position: 'top',
//                         formatter: '{c}'
                        formatter: '{b}\n{c}'
                    }
                }
            },
            name: '销量',
            type: 'bar',
            data: valueList
        }]
    };

    // 使用刚指定的配置项和数据显示图表。
    myChart.setOption(option);
	</script>
</html>