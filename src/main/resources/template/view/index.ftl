<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<script type="text/javascript" src="http://st.icson.com/static_v1/js/jquery-1.5.1.min.js?v=2013080801"></script>
<style>
body,button,input,select,textarea,div,label,span{
  font-family: Tahoma,Arial,Verdana,Simsun;
  font-size: 12px;
}
body, form, dl, dt, dd, h1, h2, h3, h4, h5, h6, ul, ol, p, th, td, fieldset {
    margin: 0;
    padding: 0;
}
body {
    background-color: #F5F5F5;
    color: #333333;
}
body, table, th, td, input, textarea, select {
    font: 12px Arial,Helvetica,sans-serif,'瀹嬩綋';
}
em {font-style: italic;color: #ff6600; padding:0px; margin-right:5px;}
div.clear {clear: both;}
.hidden{display:none;}
.t-align-left{text-align:left;}
.t-align-center{text-align:center;}
.t-align-right{text-align:right;}
.help_text{color:#A1A1A1;}

.layout-block-header{padding:14px 20px;}
.layout-block-header h2{font-size:14px;}

.ui-button{height:auto;padding:3px 10px; text-align:center;margin-left:5px;margin-bottom:5px;_margin-right:10px;*margin-right:10px!important;
	border:1px solid #A8ADB6;cursor:pointer;display:inline-block;font-size:12px;border-radius:2px;overflow:visible;
	line-height:16px;_line-height:15px;*line-height:14px!important;
	background-color:#fafafa;background:-moz-linear-gradient(#fff,#f4f4f4);background:-ms-linear-gradient(#fff,#f4f4f4);
	background:-webkit-gradient(linear,left top,left bottom,color-stop(0%,#fff),color-stop(100%,#f4f4f4));
	background:-webkit-linear-gradient(#fff,#f4f4f4);background:-o-linear-gradient(#fff,#f4f4f4);
	filter:progid:DXImageTransform.Microsoft.gradient(startColorstr='#ffffff',endColorstr='#f4f4f4');
	-ms-filter:"progid:DXImageTransform.Microsoft.gradient(startColorstr='#ffffff',endColorstr='#f4f4f4')";
	background:linear-gradient(#fff,#f4f4f4);}
.ui-button:hover{background:-moz-linear-gradient(#fff,#ddd);background:-ms-linear-gradient(#fff,#ddd);background:-webkit-gradient(linear,left top,left bottom,color-stop(0%,#fff),color-stop(100%,#ddd));background:-webkit-linear-gradient(#fff,#ddd);background:-o-linear-gradient(#fff,#ddd);filter:progid:DXImageTransform.Microsoft.gradient(startColorstr='#ffffff',endColorstr='#dddddd');-ms-filter:"progid:DXImageTransform.Microsoft.gradient(startColorstr='#ffffff',endColorstr='#dddddd')";background:linear-gradient(#fff,#ddd);}
.ui-button:active{background:-moz-linear-gradient(#e2e2e2,#f7f7f7);background:-ms-linear-gradient(#e2e2e2,#f7f7f7);background:-webkit-gradient(linear,left top,left bottom,color-stop(0%,#e2e2e2),color-stop(100%,#f7f7f7));background:-webkit-linear-gradient(#e2e2e2,#f7f7f7);background:-o-linear-gradient(#e2e2e2,#f7f7f7);filter:progid:DXImageTransform.Microsoft.gradient(startColorstr='#e2e2e2',endColorstr='#f7f7f7');-ms-filter:"progid:DXImageTransform.Microsoft.gradient(startColorstr='#e2e2e2',endColorstr='#f7f7f7')";background:linear-gradient(#e2e2e2,#f7f7f7);}


.box{border:1px solid #ddd;margin-bottom:12px;background:#fff;border-radius:2px;}
.listTable{
	background: none repeat scroll 0 0 #F6F7F9;
	border: none;
}
.listTable thead{color:#5B7691;background-color:#f6f7f9;line-height:30px;text-align: left;}
.listTable thead tr th{line-height:20px;border-top: thin solid #CDCDCD;border-right: thin solid #DDDDDD;border-bottom: thin solid #DDDDDD;color: #666666;font-weight: bold;word-break: break-all;word-wrap: break-word;overflow: hidden;padding: 8px;}
.listTable tbody{color:#5B7691;background-color:#FFFFFF;}
.listTable tbody tr td{line-height:18px;border-top: thin solid #DDDDDD;border-bottom: thin solid #DDDDDD;padding: 3px 3px 3px 5px;}
.tr_hover{cursor:pointer;background:#FDE8C4;}



</style>
<script>
function showTab(id){
	$('#dbSetting').hide();
	$('#codeGeneratorSetting').hide();
	$('#queryTables').hide();
	$('#'+id).show();
}

function changeChecked(tableName){
	if($("#"+tableName).attr("checked") == true){
		$("#" + tableName + "GenerateEntity").attr("checked", true);
		$("#" + tableName + "GenerateDTO").attr("checked", true);
		$("#" + tableName + "GenerateDAO").attr("checked", true);
		$("#" + tableName + "GenerateBo").attr("checked", true);
		$("#" + tableName + "GenerateService").attr("checked", true);
	//	$("#" + tableName + "GenerateController").attr("checked", true);
	}else{
		$("#" + tableName + "GenerateEntity").attr("checked",false);
		$("#" + tableName + "GenerateDTO").attr("checked", false);
		$("#" + tableName + "GenerateDAO").attr("checked", false);
		$("#" + tableName + "GenerateBo").attr("checked", true);
		$("#" + tableName + "GenerateService").attr("checked", false);
	//	$("#" + tableName + "GenerateController").attr("checked", false);
	//	$("#" + tableName + "GenerateRestAPIController").attr("checked", false);
	}
	
}

function highlight(expression){
	if(!expression){
		expression = '.listTable tbody tr';
	}
	$(expression).each(function(i){
			$(this).mouseover(function() {
				$(this).children("td").each(function(i){
						 $(this).addClass("tr_hover");
					 });
			});
			$(this).mouseout(function() {
				$(this).children("td").each(function(i){
							$(this).removeClass("tr_hover");
					 });
			});
	});
}
</script>
</head>

<body><div style="margin:30px 80px;">

<div class="box">
	<div style="margin:20px;">代码生成分三步：第一步、配置数据源；第二步、代码生成配置；第三步、选择要生成代码的数据库表</div>
	<div style="margin:20px">
		第一步<button type="button" onclick="document.location='/generator/dbSetting?method=dbSetting';">数据源配置</button>　　
		>>第二步<button type="button" onclick="document.location='/generator/codeGeneratorSetting?method=codeGeneratorSetting';">代码生成配置</button>　　
		>>第三步<button type="button" onclick="document.location='/generator/queryTables?method=queryTables';">选表并生成代码</button>　　
	</div>
</div>
	
	
<div id="dbSetting" style="display:<#if params.method?exists && params.method=="dbSetting">block<#else>none</#if>;">
<div class="layout-block-header">
	<h2>第一步：配置数据源</h2>
</div>
<div class="box">
<form action="/generator/dbSetting" method="post">
	<input type="hidden" name="method" value="dbSetting">
	<table style="width:100%;margin:8px;" cellspacing="0" cellpadding="0"><tbody>
		<tr>
			<td width="200px" height="30px" class="t-align-right"><em>*</em>jdbcDriverClassName：</td>
			<td><input size="70" type="text" name="jdbcDriverClassName" value="${conf.jdbcDriverClassName!}"> 例：com.mysql.jdbc.Driver</td>
		</tr>
		<tr>
			<td height="50px" class="t-align-right"><em>*</em>jdbcUrl：</td>
			<td><input size="100" type="text" name="jdbcUrl" value="${conf.jdbcUrl!}"><br/> 例：jdbc:mysql://172.24.207.60:3306/post_item?useUnicode=true&amp;characterEncoding=utf-8</td>
		</tr>
		<tr>
			<td height="30px" class="t-align-right"><em>*</em>用户库用户名：</td>
			<td><input size="70" type="text" name="jdbcUsername" value="${conf.jdbcUsername!}"></td>
		</tr>
		<tr>
			<td height="30px" class="t-align-right"><em>*</em>用户库用户密码：</td>
			<td><input size="70" type="text" name="jdbcPassword" value="${conf.jdbcPassword!}">	</td>
		</tr>
	</tbody></table>
	<div style="padding:20px 0px 60px 50px;"><button class="ui-button" type="submit">　保　存　</button></div>
</form>
</div></div>



<div id="codeGeneratorSetting" style="display:<#if params.method?exists && params.method=="codeGeneratorSetting">block<#else>none</#if>;">
<div class="layout-block-header">
	<h2>第二步：代码生成配置</h2>
</div>
<div class="box">
<form action="/generator/codeGeneratorSetting" method="post">
	<input type="hidden" name="method" value="codeGeneratorSetting">
	<table style="width:100%;margin:8px;" cellspacing="0" cellpadding="0"><tbody>
		<tr>
			<td width="220px" height="30px" class="t-align-right"><em>*</em>代码生成目录：</td>
			<td><input size="50" type="text" name="outputDir" value="${conf.outputDir!}">	 例：C:\codeGenerator</td>
		</tr>
		<tr>
			<td width="220px" height="30px" class="t-align-right"><em>*</em>作者：</td>
			<td><input size="50" type="text" name="author" value="${conf.author!}">	 例：wugennong</td>
		</tr>
		<tr>
			<td height="30px" class="t-align-right"><em>*</em>dao接口所在的package：</td>
			<td><input size="50" type="text" name="daoPackage" value="${conf.daoPackage!}">	 例：com.ule.item.service.common.dao</td>
		</tr>
		<tr>
			<td height="30px" class="t-align-right"><em>*</em>dao接口继承自哪个接口：</td>
			<td><input size="50" type="text" name="daoSuperInterface" value="${conf.daoSuperInterface!}"> 例：com.ule.item.service.framework.IDao</td>
		</tr>
		<tr>
			<td height="30px" class="t-align-right"><em>*</em>dao实现类继承自哪个父类：</td>
			<td><input size="50" type="text" name="daoSuperClass" value="${conf.daoSuperClass!}">	 例：com.ule.item.service.framework.BaseDao</td>
		</tr>
		<tr>
			<td height="30px" class="t-align-right"><em>*</em>VO类所在的package：</td>
			<td><input size="50" type="text" name="entityPackage" value="${conf.entityPackage!}">	 例：com.ule.item.service.common.vo</td>
		</tr>
<!--
		<tr>
			<td height="30px" class="t-align-right">entity类继承自哪个父类：</td>
			<td><input size="50" type="text" name="entitySuperClass" value="${conf.entitySuperClass!}"></td>
		</tr>
-->
		<tr>
			<td height="30px" class="t-align-right"><em>*</em>dto类所在的package：</td>
			<td><input size="50" type="text" name="dtoPackage" value="${conf.dtoPackage!}">	 例：com.ule.item.service.common.dto</td>
		</tr>
		<tr>
			<td height="30px" class="t-align-right"><em>*</em>Bo类所在的package：</td>
			<td><input size="50" type="text" name="boPackage" value="${conf.boPackage!}">	 例：com.ule.item.service.common.bo</td>
		</tr>
		<tr>
			<td height="30px" class="t-align-right"><em>*</em>Service类所在的package：</td>
			<td><input size="50" type="text" name="servicePackage" value="${conf.servicePackage!}">	 例：com.ule.item.service.common.so</td>
		</tr>
		<tr>
			<td height="30px" class="t-align-right"><em>*</em>分页数据传输对象PaginationList：</td>
			<td><input size="50" type="text" name="paginationList" value="${conf.paginationList!}">	 例：com.ule.item.service.common.dto.PaginationList</td>
		</tr>
		<tr>
			<td height="30px" class="t-align-right"><em>*</em>自定义业务异常类：</td>
			<td><input size="50" type="text" name="serviceException" value="${conf.serviceException!}">	 例：com.ule.item.service.exception.ItemServiceException</td>
		</tr>
<!--

		<tr>
			<td height="30px" class="t-align-right">Controller类所在的package：</td>
			<td><input size="50" type="text" name="controllerPackage" value="${conf.controllerPackage!}">	 例：com.ule.item.web.controller</td>
		</tr>
		<tr>
			<td height="30px" class="t-align-right">rest api controller类所在的package：</td>
			<td><input size="50" type="text" name="restAPIControllerPackage" value="${conf.restAPIControllerPackage!}">	 例：com.ule.item.api.controller</td>
		</tr>
-->
	</tbody></table>
	<div style="padding:20px 0px 60px 50px;"><button class="ui-button" type="submit">　保　存　</button></div>
</form>
</div></div>

<!--选择要生成代码的表   开始-->
<div id="queryTables" style="display:<#if params.method?exists && params.method=="queryTables">block<#else>none</#if>;">
<div class="layout-block-header">
	<h2>第三步：选表并生成代码</h2>
</div>
<div class="box">
<form action="/generator/generate" method="post">
	<input type="hidden" name="method" value="generate">
	<table id="ResultTable" class="listTable" width="100%" cellspacing="0" cellpadding="0">
		<thead>
			<tr>
				<th class="t-align-center" style="width:200px;">　数据库表名　</th>
				<th class="t-align-center" style="width:100px;">生成entity</th>
				<th class="t-align-center" style="width:100px;">生成DTO</th>
				<th class="t-align-center" style="width:100px;">生成DAO</th>
				<th class="t-align-center" style="width:100px;">生成Bo</th>
				<th class="t-align-center" style="width:100px;">生成Service</th>
<!--
				<th class="t-align-center" style="width:100px;">生成controller</th>
				<th class="t-align-center" style="width:100px;">生成rest api controller</th>
-->
			<tr>
		</thead>
		<tbody>
	<#if tables?exists><#list tables as tableName>
		<tr style="height:25px">
			<td class="t-align-left"><input type="checkbox" name="tableName" id="${tableName}" value="${tableName}" onclick="changeChecked('${tableName}')">${tableName}</td>
			<td class="t-align-center"><input type="checkbox" name="${tableName}GenerateEntity" id="${tableName}GenerateEntity" value="${tableName}GenerateEntity"></td>
			<td class="t-align-center"><input type="checkbox" name="${tableName}GenerateDTO" id="${tableName}GenerateDTO" value="${tableName}GenerateDTO"></td>
			<td class="t-align-center"><input type="checkbox" name="${tableName}GenerateDAO" id="${tableName}GenerateDAO" value="${tableName}GenerateDAO"></td>
			<td class="t-align-center"><input type="checkbox" name="${tableName}GenerateBo" id="${tableName}GenerateBo" value="${tableName}GenerateBo"></td>
			<td class="t-align-center"><input type="checkbox" name="${tableName}GenerateService" id="${tableName}GenerateService" value="${tableName}GenerateService"></td>
<!--
			<td class="t-align-center"><input type="checkbox" name="${tableName}GenerateController" id="${tableName}GenerateController" value="${tableName}GenerateController"></td>
			<td class="t-align-center"><input type="checkbox" name="${tableName}GenerateRestAPIController" id="${tableName}GenerateRestAPIController" value="${tableName}GenerateRestAPIController"></td>
-->
		</tr>
	</#list></#if>
		</tbody>
	</table>

	<div style="padding:20px 0px 60px 50px;"><button class="ui-button" type="submit">　生成代码　</button></div>
</form>
</div></div>

<!--选择要生成代码的表   结束-->



<script language="javascript" type="text/javascript">
$(document).ready(function(){
	highlight();
});

</script>
</div></body>
</html>
