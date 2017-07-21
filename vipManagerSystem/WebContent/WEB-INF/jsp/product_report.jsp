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
			$("#producttypecode").val("${producttypecode}");
			var reportType = $("#reportType").val();
			var reportDate = $("#reportDate").val();
			var producttypecode = $("#producttypecode").val();
			$('#data-table').datagrid( {
				url : '${basePath}/report/product?reportType=' + reportType +
				'&reportDate=' + reportDate + '&producttypecode=' + producttypecode,
				rownumbers : true,
				autoRowHeight : true, 
				singleSelect : true,
				pagination : true,
				nowrap: false,
				columns:[[
				    {field : 'proname',title : '品名',halign:'center',width : 80},
				    {field : 'counts',title : '数量',halign:'center',width : 120}
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
			var producttypecode = $("#producttypecode").val();
			window.location.href='${basePath}/report/productinit?reportType=' + reportType +
					'&reportDate=' + reportDate + '&producttypecode=' + producttypecode;
		}
		function doClear(){
			$("#productno").val("");
			$("#productname").val("");
			$("#producttypecode").val("");
			$("#productstandard").val("");
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
			</tr>
			<tr>
				<td><span>商品规格:</span></td>
				<td><input id="productstandard" name="productstandard"/></td>
				<td><span>商品分类:</span></td>
				<td>
					<select id="producttypecode" name="producttypecode">
		  				<option value="">---请选择---</option>
		  				<option value="饮品">---饮品---</option>
	  					<option value="点心">---点心---</option>
	  					<option value="特色">---特色---</option>
		  			</select>
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
        var myChart = echarts.init(document.getElementById('main'));
        var jsonstr="[{value:10, name:'直接访问'},{value:20, name:'邮件营销'},{value:70, name:'邮123营销12'}]";
        var jsonarray = eval('('+jsonstr+')');
        //  console.info(jsonarray[1]);
        var arr  =
             {
                 "name" : $('#names').val(),
                 "value" : $('#values').val()
             }
        var ttt = ${mapdata};
        var arrs = [];
        for(var i = 0 ; i < ttt.length ; i++){
        	 arrs.push({name:ttt[i].name, value:ttt[i].value});
        }
        // 指定图表的配置项和数据
        var option = {
				title : {
					text: 'VIP消费统计',
					x:'center'
				},
				tooltip : {
					trigger: 'item',
					formatter: "{a} <br/>{b} : {c} ({d}%)"
				},
				
				toolbox: {
					show : true,
					feature : {
						mark : {show: true},
						dataView : {show: true, readOnly: false},
						magicType : {
							show: true, 
							type: ['pie', 'funnel'],
							option: {
								funnel: {
									x: '25%',
									width: '50%',
									funnelAlign: 'left',
									max: 1548
								}
							}
						},
						restore : {show: true},
						saveAsImage : {show: true}
					}
				},
				calculable : true,
				series : [
					{
						name:'访问来源',
						type:'pie',
						radius : '55%',
						center: ['50%', '60%'],
						data:(function(){
                            var res = [];
                            var len = 0;
                            for(var i = 0 ; i < ttt.length ; i++) {
	                            res.push({
	                            	name:ttt[i].name, 
	                            	value:ttt[i].value
	                            });
                            }
                            return res;
                            })()
					}
				]
		};

		// 使用刚指定的配置项和数据显示图表。
		myChart.setOption(option);
	function getCharts(){
		var myChart = echarts.init(document.getElementById('main'));
		var url = "${basePath}/report/ajaxProduct";
		$.ajax( {
			url : url,
			type : 'post',
			dataType : 'json',
			success : function(data) {
				//var jsonarray = eval('('+data+')');
				//console.info(data);
				ttt=data;
			},
			error : function(transport) {
				$.messager.alert('提示', "系统产生错误,请联系管理员!", "error");
			}
		});
		option = {
				title : {
					text: '饮品消费分类统计',
					x:'center'
				},
				tooltip : {
					trigger: 'item',
					formatter: "{a} <br/>{b} : {c} ({d}%)"
				},
				
				toolbox: {
					show : true,
					feature : {
						mark : {show: true},
						dataView : {show: true, readOnly: false},
						magicType : {
							show: true, 
							type: ['pie', 'funnel'],
							option: {
								funnel: {
									x: '25%',
									width: '50%',
									funnelAlign: 'left',
									max: 1548
								}
							}
						},
						restore : {show: true},
						saveAsImage : {show: true}
					}
				},
				calculable : true,
				series : [
					{
						name:'访问来源',
						type:'pie',
						radius : '55%',
						center: ['50%', '60%'],
						data:(function(){
                            var res = [];
                            var len = 0;
                            for(var i = 0 ; i < ttt.length ; i++) {
	                            res.push({
	                            	name:ttt[i].name, 
	                            	value:ttt[i].value
	                            });
                            }
                            return res;
                            })()
					}
				]
		};
		myChart.setOption(option);
	}
	</script>
</html>