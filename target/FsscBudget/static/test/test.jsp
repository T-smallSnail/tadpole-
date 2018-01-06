<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%><html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<title>打印指定div的内容</title>
<script src="${ctxStatic}/test/LodopFuncs.js" type="text/javascript"></script>
<script src="${ctxStatic}/test/print.js" type="text/javascript"></script>
<!-- end -->
</head>
<body>
<!-- begin -->
	<a href="javascript:prn_preview()">打印预览</a>
	<a href="javascript:prn_print()">打印</a>
<!-- end -->
	<br />
	<!-- 所打印区域 -->
	<div id="printid">
		<p
			style="line-height:24pt; margin:0pt; orphans:0; text-align:center; widows:0">
			<span style="font-family:方正小标宋简体; font-size:15pt">合同审核会签表</span><span
				style="font-family:方正小标宋简体; font-size:15pt">样表</span>
		</p>
		<div style="text-align:center">
			<table cellspacing="0" cellpadding="0"
				style="border-collapse:collapse; margin:0 auto; width:454.6pt">
				<tr style="height:25.5pt">
					<td
						style="border-bottom-color:#000000; border-bottom-style:solid; border-bottom-width:0.75pt; border-left-color:#000000; border-left-style:solid; border-left-width:3pt; border-right-color:#000000; border-right-style:solid; border-right-width:0.75pt; border-top-color:#000000; border-top-style:solid; border-top-width:3pt; padding-left:3.9pt; padding-right:5.03pt; vertical-align:middle; width:48.6pt"><p
							style="margin:0pt; orphans:0; text-align:center; widows:0">
							<span style="font-family:宋体; font-size:12pt">承办</span>
						</p>
						<p style="margin:0pt; orphans:0; text-align:center; widows:0">
							<span style="font-family:宋体; font-size:12pt">部门</span>
						</p></td>
					<td colspan="2"
						style="border-bottom-color:#000000; border-bottom-style:solid; border-bottom-width:0.75pt; border-left-color:#000000; border-left-style:solid; border-left-width:0.75pt; border-right-color:#000000; border-right-style:solid; border-right-width:0.75pt; border-top-color:#000000; border-top-style:solid; border-top-width:3pt; padding-left:5.03pt; padding-right:5.03pt; vertical-align:middle; width:88.15pt"><p
							style="margin:0pt; orphans:0; text-align:center; widows:0">
							<span style="font-family:宋体; font-size:12pt">&#xa0;</span>
						</p></td>
					<td
						style="border-bottom-color:#000000; border-bottom-style:solid; border-bottom-width:0.75pt; border-left-color:#000000; border-left-style:solid; border-left-width:0.75pt; border-right-color:#000000; border-right-style:solid; border-right-width:0.75pt; border-top-color:#000000; border-top-style:solid; border-top-width:3pt; padding-left:5.03pt; padding-right:5.03pt; vertical-align:middle; width:43.2pt"><p
							style="margin:0pt; orphans:0; text-align:center; widows:0">
							<span style="font-family:宋体; font-size:12pt">承办人</span>
						</p></td>
					<td
						style="border-bottom-color:#000000; border-bottom-style:solid; border-bottom-width:0.75pt; border-left-color:#000000; border-left-style:solid; border-left-width:0.75pt; border-right-color:#000000; border-right-style:solid; border-right-width:0.75pt; border-top-color:#000000; border-top-style:solid; border-top-width:3pt; padding-left:5.03pt; padding-right:5.03pt; vertical-align:middle; width:70.2pt"><p
							style="margin:0pt; orphans:0; text-align:center; widows:0">
							<span style="font-family:宋体; font-size:12pt">&#xa0;</span>
						</p></td>
					<td colspan="2"
						style="border-bottom-color:#000000; border-bottom-style:solid; border-bottom-width:0.75pt; border-left-color:#000000; border-left-style:solid; border-left-width:0.75pt; border-right-color:#000000; border-right-style:solid; border-right-width:0.75pt; border-top-color:#000000; border-top-style:solid; border-top-width:3pt; padding-left:5.03pt; padding-right:5.03pt; vertical-align:middle; width:34.2pt"><p
							style="margin:0pt; orphans:0; text-align:center; widows:0">
							<span style="font-family:宋体; font-size:12pt">电话</span>
						</p></td>
					<td colspan="2"
						style="border-bottom-color:#000000; border-bottom-style:solid; border-bottom-width:0.75pt; border-left-color:#000000; border-left-style:solid; border-left-width:0.75pt; border-right-color:#000000; border-right-style:solid; border-right-width:3pt; border-top-color:#000000; border-top-style:solid; border-top-width:3pt; padding-left:5.03pt; padding-right:3.9pt; vertical-align:middle; width:102.45pt"><p
							style="margin:0pt; orphans:0; text-align:center; widows:0">
							<span style="font-family:宋体; font-size:12pt">&#xa0;</span>
						</p></td>
				</tr>
				<tr style="height:25.5pt">
					<td
						style="border-bottom-color:#000000; border-bottom-style:solid; border-bottom-width:0.75pt; border-left-color:#000000; border-left-style:solid; border-left-width:3pt; border-right-color:#000000; border-right-style:solid; border-right-width:0.75pt; border-top-color:#000000; border-top-style:solid; border-top-width:0.75pt; padding-left:3.9pt; padding-right:5.03pt; vertical-align:middle; width:48.6pt"><p
							style="margin:0pt; orphans:0; text-align:center; widows:0">
							<span style="font-family:宋体; font-size:12pt">对方单</span>
						</p>
						<p style="margin:0pt; orphans:0; text-align:center; widows:0">
							<span style="font-family:宋体; font-size:12pt">位名称</span>
						</p></td>
					<td colspan="8"
						style="border-bottom-color:#000000; border-bottom-style:solid; border-bottom-width:0.75pt; border-left-color:#000000; border-left-style:solid; border-left-width:0.75pt; border-right-color:#000000; border-right-style:solid; border-right-width:3pt; border-top-color:#000000; border-top-style:solid; border-top-width:0.75pt; padding-left:5.03pt; padding-right:3.9pt; vertical-align:middle; width:381.4pt"><p
							style="margin:0pt; orphans:0; widows:0">
							<span style="font-family:宋体; font-size:12pt">&#xa0;</span>
						</p></td>
				</tr>
				<tr style="height:25.5pt">
					<td
						style="border-bottom-color:#000000; border-bottom-style:solid; border-bottom-width:0.75pt; border-left-color:#000000; border-left-style:solid; border-left-width:3pt; border-right-color:#000000; border-right-style:solid; border-right-width:0.75pt; border-top-color:#000000; border-top-style:solid; border-top-width:0.75pt; padding-left:3.9pt; padding-right:5.03pt; vertical-align:middle; width:48.6pt"><p
							style="margin:0pt; orphans:0; text-align:center; widows:0">
							<span style="font-family:宋体; font-size:12pt">合同</span>
						</p>
						<p style="margin:0pt; orphans:0; text-align:center; widows:0">
							<span style="font-family:宋体; font-size:12pt">名称</span>
						</p></td>
					<td colspan="5"
						style="border-bottom-color:#000000; border-bottom-style:solid; border-bottom-width:0.75pt; border-left-color:#000000; border-left-style:solid; border-left-width:0.75pt; border-right-color:#000000; border-right-style:solid; border-right-width:0.75pt; border-top-color:#000000; border-top-style:solid; border-top-width:0.75pt; padding-left:5.03pt; padding-right:5.03pt; vertical-align:middle; width:241.15pt"><p
							style="margin:0pt; orphans:0; text-align:center; widows:0">
							<span style="font-family:宋体; font-size:12pt">&#xa0;</span>
						</p></td>
					<td colspan="2"
						style="border-bottom-color:#000000; border-bottom-style:solid; border-bottom-width:0.75pt; border-left-color:#000000; border-left-style:solid; border-left-width:0.75pt; border-right-color:#000000; border-right-style:solid; border-right-width:0.75pt; border-top-color:#000000; border-top-style:solid; border-top-width:0.75pt; padding-left:5.03pt; padding-right:5.03pt; vertical-align:middle; width:43.2pt"><p
							style="margin:0pt; orphans:0; text-align:center; widows:0">
							<span style="font-family:宋体; font-size:12pt">标的额</span>
						</p>
						<p style="margin:0pt; orphans:0; text-align:center; widows:0">
							<span style="font-family:宋体; font-size:12pt">（万元）</span>
						</p></td>
					<td
						style="border-bottom-color:#000000; border-bottom-style:solid; border-bottom-width:0.75pt; border-left-color:#000000; border-left-style:solid; border-left-width:0.75pt; border-right-color:#000000; border-right-style:solid; border-right-width:3pt; border-top-color:#000000; border-top-style:solid; border-top-width:0.75pt; padding-left:5.03pt; padding-right:3.9pt; vertical-align:middle; width:75.45pt"><p
							style="margin:0pt 0pt 0pt 7.5pt; orphans:0; text-align:justify; widows:0">
							<span style="font-family:宋体; font-size:12pt">&#xa0;</span>
						</p></td>
				</tr>
				<tr style="height:25.5pt">
					<td
						style="border-bottom-color:#000000; border-bottom-style:solid; border-bottom-width:3pt; border-left-color:#000000; border-left-style:solid; border-left-width:3pt; border-right-color:#000000; border-right-style:solid; border-right-width:0.75pt; border-top-color:#000000; border-top-style:solid; border-top-width:0.75pt; padding-left:3.9pt; padding-right:5.03pt; vertical-align:middle; width:48.6pt"><p
							style="margin:0pt; orphans:0; text-align:center; widows:0">
							<span style="font-family:宋体; font-size:12pt">合同主</span>
						</p>
						<p style="margin:0pt; orphans:0; text-align:center; widows:0">
							<span style="font-family:宋体; font-size:12pt">要内容</span>
						</p></td>
					<td colspan="8"
						style="border-bottom-color:#000000; border-bottom-style:solid; border-bottom-width:3pt; border-left-color:#000000; border-left-style:solid; border-left-width:0.75pt; border-right-color:#000000; border-right-style:solid; border-right-width:3pt; border-top-color:#000000; border-top-style:solid; border-top-width:0.75pt; padding-left:5.03pt; padding-right:3.9pt; vertical-align:middle; width:381.4pt"><p
							style="margin:0pt; orphans:0; text-align:center; widows:0">
							<span style="font-family:宋体; font-size:12pt">&#xa0;</span>
						</p></td>
				</tr>
				<tr style="height:25.5pt">
					<td rowspan="12"
						style="border-bottom-color:#000000; border-bottom-style:solid; border-bottom-width:3pt; border-left-color:#000000; border-left-style:solid; border-left-width:3pt; border-right-color:#000000; border-right-style:solid; border-right-width:0.75pt; border-top-color:#000000; border-top-style:solid; border-top-width:3pt; padding-left:3.9pt; padding-right:5.03pt; vertical-align:middle; width:48.6pt"><p
							style="margin:0pt; orphans:0; text-align:center; widows:0">
							<span style="font-family:宋体; font-size:12pt">相</span><span
								style="font-family:宋体; font-size:12pt">关</span>
						</p>
						<p style="margin:0pt; orphans:0; text-align:center; widows:0">
							<span style="font-family:宋体; font-size:12pt">&#xa0;</span>
						</p>
						<p style="margin:0pt; orphans:0; text-align:center; widows:0">
							<span style="font-family:宋体; font-size:12pt">部门</span>
						</p>
						<p style="margin:0pt; orphans:0; text-align:center; widows:0">
							<span style="font-family:宋体; font-size:12pt">&#xa0;</span>
						</p>
						<p style="margin:0pt; orphans:0; text-align:center; widows:0">
							<span style="font-family:宋体; font-size:12pt">审核</span>
						</p>
						<p style="margin:0pt; orphans:0; text-align:center; widows:0">
							<span style="font-family:宋体; font-size:12pt">&#xa0;</span>
						</p>
						<p style="margin:0pt; orphans:0; text-align:center; widows:0">
							<span style="font-family:宋体; font-size:12pt">意见</span>
						</p></td>
					<td rowspan="2"
						style="border-bottom-color:#000000; border-bottom-style:solid; border-bottom-width:3pt; border-left-color:#000000; border-left-style:solid; border-left-width:0.75pt; border-right-color:#000000; border-right-style:solid; border-right-width:0.75pt; border-top-color:#000000; border-top-style:solid; border-top-width:3pt; padding-left:5.03pt; padding-right:5.03pt; vertical-align:middle; width:24.45pt"><p
							style="margin:0pt; orphans:0; text-align:center; widows:0">
							<span style="font-family:宋体; font-size:12pt">承办部门</span>
						</p></td>
					<td colspan="4"
						style="border-left-color:#000000; border-left-style:solid; border-left-width:0.75pt; border-top-color:#000000; border-top-style:solid; border-top-width:3pt; padding-left:5.03pt; padding-right:5.4pt; vertical-align:middle; width:205.9pt"><p
							style="margin:0pt; orphans:0; text-align:center; widows:0">
							<span style="font-family:宋体; font-size:12pt">&#xa0;</span>
						</p></td>
					<td colspan="2"
						style="border-top-color:#000000; border-top-style:solid; border-top-width:3pt; padding-left:5.4pt; padding-right:5.4pt; vertical-align:middle; width:43.2pt"><p
							style="margin:0pt; orphans:0; text-align:center; widows:0">
							<span
								style="background-color:#ffff00; color:#ff0000; font-family:宋体; font-size:12pt">审核人</span>
						</p></td>
					<td
						style="border-right-color:#000000; border-right-style:solid; border-right-width:3pt; border-top-color:#000000; border-top-style:solid; border-top-width:3pt; padding-left:5.4pt; padding-right:3.9pt; vertical-align:middle; width:75.45pt"><p
							style="margin:0pt; orphans:0; text-align:justify; widows:0">
							<span style="font-family:宋体; font-size:12pt">&#xa0;</span>
						</p></td>
				</tr>
				<tr style="height:25.5pt">
					<td colspan="4"
						style="border-bottom-color:#000000; border-bottom-style:solid; border-bottom-width:3pt; border-left-color:#000000; border-left-style:solid; border-left-width:0.75pt; padding-left:5.03pt; padding-right:5.4pt; vertical-align:middle; width:205.9pt"><p
							style="margin:0pt; orphans:0; text-align:center; widows:0">
							<span style="font-family:宋体; font-size:12pt">&#xa0;</span>
						</p></td>
					<td colspan="2"
						style="border-bottom-color:#000000; border-bottom-style:solid; border-bottom-width:3pt; padding-left:5.4pt; padding-right:5.4pt; vertical-align:middle; width:43.2pt"><p
							style="margin:0pt; orphans:0; text-align:center; widows:0">
							<span style="font-family:宋体; font-size:12pt">负责人</span>
						</p></td>
					<td
						style="border-bottom-color:#000000; border-bottom-style:solid; border-bottom-width:3pt; border-right-color:#000000; border-right-style:solid; border-right-width:3pt; padding-left:5.4pt; padding-right:3.9pt; vertical-align:middle; width:75.45pt"><p
							style="margin:0pt; orphans:0; text-align:center; widows:0">
							<span style="font-family:宋体; font-size:12pt">&#xa0;</span>
						</p></td>
				</tr>
				<tr style="height:25.5pt">
					<td rowspan="2"
						style="border-bottom-color:#000000; border-bottom-style:solid; border-bottom-width:3pt; border-left-color:#000000; border-left-style:solid; border-left-width:0.75pt; border-right-color:#000000; border-right-style:solid; border-right-width:0.75pt; border-top-color:#000000; border-top-style:solid; border-top-width:3pt; padding-left:5.03pt; padding-right:5.03pt; vertical-align:middle; width:24.45pt"><p
							style="margin:0pt; orphans:0; text-align:center; widows:0">
							<span style="font-family:宋体; font-size:12pt">相关</span><span
								style="font-family:宋体; font-size:12pt">部门</span>
						</p></td>
					<td colspan="4"
						style="border-left-color:#000000; border-left-style:solid; border-left-width:0.75pt; border-top-color:#000000; border-top-style:solid; border-top-width:3pt; padding-left:5.03pt; padding-right:5.4pt; vertical-align:middle; width:205.9pt"><p
							style="margin:0pt; orphans:0; text-align:center; widows:0">
							<span style="font-family:宋体; font-size:12pt">&#xa0;</span>
						</p></td>
					<td colspan="2"
						style="border-top-color:#000000; border-top-style:solid; border-top-width:3pt; padding-left:5.4pt; padding-right:5.4pt; vertical-align:middle; width:43.2pt"><p
							style="margin:0pt; orphans:0; text-align:center; widows:0">
							<span
								style="background-color:#ffff00; color:#ff0000; font-family:宋体; font-size:12pt">审核人</span>
						</p></td>
					<td
						style="border-right-color:#000000; border-right-style:solid; border-right-width:3pt; border-top-color:#000000; border-top-style:solid; border-top-width:3pt; padding-left:5.4pt; padding-right:3.9pt; vertical-align:middle; width:75.45pt"><p
							style="margin:0pt; orphans:0; text-align:justify; widows:0">
							<span style="font-family:宋体; font-size:12pt">&#xa0;</span>
						</p></td>
				</tr>
				<tr style="height:25.5pt">
					<td colspan="4"
						style="border-bottom-color:#000000; border-bottom-style:solid; border-bottom-width:3pt; border-left-color:#000000; border-left-style:solid; border-left-width:0.75pt; padding-left:5.03pt; padding-right:5.4pt; vertical-align:middle; width:205.9pt"><p
							style="margin:0pt; orphans:0; text-align:center; widows:0">
							<span style="font-family:宋体; font-size:12pt">&#xa0;</span>
						</p></td>
					<td colspan="2"
						style="border-bottom-color:#000000; border-bottom-style:solid; border-bottom-width:3pt; padding-left:5.4pt; padding-right:5.4pt; vertical-align:middle; width:43.2pt"><p
							style="margin:0pt; orphans:0; text-align:center; widows:0">
							<span style="font-family:宋体; font-size:12pt">负责人</span>
						</p></td>
					<td
						style="border-bottom-color:#000000; border-bottom-style:solid; border-bottom-width:3pt; border-right-color:#000000; border-right-style:solid; border-right-width:3pt; padding-left:5.4pt; padding-right:3.9pt; vertical-align:middle; width:75.45pt"><p
							style="margin:0pt; orphans:0; text-align:center; widows:0">
							<span style="font-family:宋体; font-size:12pt">&#xa0;</span>
						</p></td>
				</tr>
				<tr style="height:25.5pt">
					<td rowspan="2"
						style="border-bottom-color:#000000; border-bottom-style:solid; border-bottom-width:3pt; border-left-color:#000000; border-left-style:solid; border-left-width:0.75pt; border-right-color:#000000; border-right-style:solid; border-right-width:0.75pt; border-top-color:#000000; border-top-style:solid; border-top-width:0.75pt; padding-left:5.03pt; padding-right:5.03pt; vertical-align:middle; width:24.45pt"><p
							style="margin:0pt; orphans:0; text-align:center; widows:0">
							<span style="font-family:宋体; font-size:12pt">财务部门</span>
						</p></td>
					<td colspan="4"
						style="border-left-color:#000000; border-left-style:solid; border-left-width:0.75pt; border-top-color:#000000; border-top-style:solid; border-top-width:3pt; padding-left:5.03pt; padding-right:5.4pt; vertical-align:middle; width:205.9pt"><p
							style="margin:0pt; orphans:0; text-align:center; widows:0">
							<span style="font-family:宋体; font-size:12pt">&#xa0;</span>
						</p></td>
					<td colspan="2"
						style="border-top-color:#000000; border-top-style:solid; border-top-width:3pt; padding-left:5.4pt; padding-right:5.4pt; vertical-align:middle; width:43.2pt"><p
							style="margin:0pt; orphans:0; text-align:center; widows:0">
							<span
								style="background-color:#ffff00; color:#ff0000; font-family:宋体; font-size:12pt">审核人</span>
						</p></td>
					<td
						style="border-right-color:#000000; border-right-style:solid; border-right-width:3pt; border-top-color:#000000; border-top-style:solid; border-top-width:3pt; padding-left:5.4pt; padding-right:3.9pt; vertical-align:middle; width:75.45pt"><p
							style="margin:0pt; orphans:0; text-align:center; widows:0">
							<span style="font-family:宋体; font-size:12pt">&#xa0;</span>
						</p></td>
				</tr>
				<tr style="height:25.5pt">
					<td colspan="4"
						style="border-bottom-color:#000000; border-bottom-style:solid; border-bottom-width:3pt; border-left-color:#000000; border-left-style:solid; border-left-width:0.75pt; padding-left:5.03pt; padding-right:5.4pt; vertical-align:middle; width:205.9pt"><p
							style="margin:0pt; orphans:0; text-align:center; widows:0">
							<span style="font-family:宋体; font-size:12pt">&#xa0;</span>
						</p></td>
					<td colspan="2"
						style="border-bottom-color:#000000; border-bottom-style:solid; border-bottom-width:3pt; padding-left:5.4pt; padding-right:5.4pt; vertical-align:middle; width:43.2pt"><p
							style="margin:0pt; orphans:0; text-align:center; widows:0">
							<span style="font-family:宋体; font-size:12pt">负责人</span>
						</p></td>
					<td
						style="border-bottom-color:#000000; border-bottom-style:solid; border-bottom-width:3pt; border-right-color:#000000; border-right-style:solid; border-right-width:3pt; padding-left:5.4pt; padding-right:3.9pt; vertical-align:middle; width:75.45pt"><p
							style="margin:0pt; orphans:0; text-align:center; widows:0">
							<span style="font-family:宋体; font-size:12pt">&#xa0;</span>
						</p></td>
				</tr>
				<tr style="height:25.5pt">
					<td rowspan="2"
						style="border-bottom-color:#000000; border-bottom-style:solid; border-bottom-width:3pt; border-left-color:#000000; border-left-style:solid; border-left-width:0.75pt; border-right-color:#000000; border-right-style:solid; border-right-width:0.75pt; border-top-color:#000000; border-top-style:solid; border-top-width:0.75pt; padding-left:5.03pt; padding-right:5.03pt; vertical-align:middle; width:24.45pt"><p
							style="margin:0pt; orphans:0; text-align:center; widows:0">
							<span
								style="background-color:#ffff00; color:#ff0000; font-family:宋体; font-size:12pt">审计部门</span>
						</p></td>
					<td colspan="4"
						style="border-left-color:#000000; border-left-style:solid; border-left-width:0.75pt; border-top-color:#000000; border-top-style:solid; border-top-width:3pt; padding-left:5.03pt; padding-right:5.4pt; vertical-align:middle; width:205.9pt"><p
							style="margin:0pt; orphans:0; text-align:center; widows:0">
							<span style="color:#ff0000; font-family:宋体; font-size:12pt">&#xa0;</span>
						</p></td>
					<td colspan="2"
						style="border-top-color:#000000; border-top-style:solid; border-top-width:3pt; padding-left:5.4pt; padding-right:5.4pt; vertical-align:middle; width:43.2pt"><p
							style="margin:0pt; orphans:0; text-align:center; widows:0">
							<span
								style="background-color:#ffff00; color:#ff0000; font-family:宋体; font-size:12pt">审核人</span>
						</p></td>
					<td
						style="border-right-color:#000000; border-right-style:solid; border-right-width:3pt; border-top-color:#000000; border-top-style:solid; border-top-width:3pt; padding-left:5.4pt; padding-right:3.9pt; vertical-align:middle; width:75.45pt"><p
							style="margin:0pt; orphans:0; text-align:center; widows:0">
							<span style="color:#ff0000; font-family:宋体; font-size:12pt">&#xa0;</span>
						</p></td>
				</tr>
				<tr style="height:25.5pt">
					<td colspan="4"
						style="border-bottom-color:#000000; border-bottom-style:solid; border-bottom-width:3pt; border-left-color:#000000; border-left-style:solid; border-left-width:0.75pt; padding-left:5.03pt; padding-right:5.4pt; vertical-align:middle; width:205.9pt"><p
							style="margin:0pt; orphans:0; text-align:center; widows:0">
							<span style="color:#ff0000; font-family:宋体; font-size:12pt">&#xa0;</span>
						</p></td>
					<td colspan="2"
						style="border-bottom-color:#000000; border-bottom-style:solid; border-bottom-width:3pt; padding-left:5.4pt; padding-right:5.4pt; vertical-align:middle; width:43.2pt"><p
							style="margin:0pt; orphans:0; text-align:center; widows:0">
							<span
								style="background-color:#ffff00; color:#ff0000; font-family:宋体; font-size:12pt">负责人</span>
						</p></td>
					<td
						style="border-bottom-color:#000000; border-bottom-style:solid; border-bottom-width:3pt; border-right-color:#000000; border-right-style:solid; border-right-width:3pt; padding-left:5.4pt; padding-right:3.9pt; vertical-align:middle; width:75.45pt"><p
							style="margin:0pt; orphans:0; text-align:center; widows:0">
							<span style="color:#ff0000; font-family:宋体; font-size:12pt">&#xa0;</span>
						</p></td>
				</tr>
				<tr style="height:25.5pt">
					<td rowspan="2"
						style="border-bottom-color:#000000; border-bottom-style:solid; border-bottom-width:3pt; border-left-color:#000000; border-left-style:solid; border-left-width:0.75pt; border-right-color:#000000; border-right-style:solid; border-right-width:0.75pt; border-top-color:#000000; border-top-style:solid; border-top-width:0.75pt; padding-left:5.03pt; padding-right:5.03pt; vertical-align:middle; width:24.45pt"><p
							style="margin:0pt; orphans:0; text-align:center; widows:0">
							<span
								style="background-color:#ffff00; color:#ff0000; font-family:宋体; font-size:12pt">纪检部门</span>
						</p></td>
					<td colspan="4"
						style="border-left-color:#000000; border-left-style:solid; border-left-width:0.75pt; padding-left:5.03pt; padding-right:5.4pt; vertical-align:middle; width:205.9pt"><p
							style="margin:0pt; orphans:0; text-align:center; widows:0">
							<span style="color:#ff0000; font-family:宋体; font-size:12pt">&#xa0;</span>
						</p></td>
					<td colspan="2"
						style="padding-left:5.4pt; padding-right:5.4pt; vertical-align:middle; width:43.2pt"><p
							style="margin:0pt; orphans:0; text-align:center; widows:0">
							<span
								style="background-color:#ffff00; color:#ff0000; font-family:宋体; font-size:12pt">审核人</span>
						</p></td>
					<td
						style="border-right-color:#000000; border-right-style:solid; border-right-width:3pt; padding-left:5.4pt; padding-right:3.9pt; vertical-align:middle; width:75.45pt"><p
							style="margin:0pt; orphans:0; text-align:center; widows:0">
							<span style="color:#ff0000; font-family:宋体; font-size:12pt">&#xa0;</span>
						</p></td>
				</tr>
				<tr style="height:25.5pt">
					<td colspan="4"
						style="border-bottom-color:#000000; border-bottom-style:solid; border-bottom-width:3pt; border-left-color:#000000; border-left-style:solid; border-left-width:0.75pt; padding-left:5.03pt; padding-right:5.4pt; vertical-align:middle; width:205.9pt"><p
							style="margin:0pt; orphans:0; text-align:center; widows:0">
							<span style="color:#ff0000; font-family:宋体; font-size:12pt">&#xa0;</span>
						</p></td>
					<td colspan="2"
						style="border-bottom-color:#000000; border-bottom-style:solid; border-bottom-width:3pt; padding-left:5.4pt; padding-right:5.4pt; vertical-align:middle; width:43.2pt"><p
							style="margin:0pt; orphans:0; text-align:center; widows:0">
							<span
								style="background-color:#ffff00; color:#ff0000; font-family:宋体; font-size:12pt">负责人</span>
						</p></td>
					<td
						style="border-bottom-color:#000000; border-bottom-style:solid; border-bottom-width:3pt; border-right-color:#000000; border-right-style:solid; border-right-width:3pt; padding-left:5.4pt; padding-right:3.9pt; vertical-align:middle; width:75.45pt"><p
							style="margin:0pt; orphans:0; text-align:center; widows:0">
							<span style="color:#ff0000; font-family:宋体; font-size:12pt">&#xa0;</span>
						</p></td>
				</tr>
				<tr style="height:25.5pt">
					<td rowspan="2"
						style="border-bottom-color:#000000; border-bottom-style:solid; border-bottom-width:3pt; border-left-color:#000000; border-left-style:solid; border-left-width:0.75pt; border-right-color:#000000; border-right-style:solid; border-right-width:0.75pt; border-top-color:#000000; border-top-style:solid; border-top-width:0.75pt; padding-left:5.03pt; padding-right:5.03pt; vertical-align:middle; width:24.45pt"><p
							style="margin:0pt; orphans:0; text-align:center; widows:0">
							<span style="font-family:宋体; font-size:12pt">法律部门</span>
						</p></td>
					<td colspan="4"
						style="border-left-color:#000000; border-left-style:solid; border-left-width:0.75pt; border-top-color:#000000; border-top-style:solid; border-top-width:3pt; padding-left:5.03pt; padding-right:5.4pt; vertical-align:middle; width:205.9pt"><p
							style="margin:0pt; orphans:0; text-align:center; widows:0">
							<span style="font-family:宋体; font-size:12pt">&#xa0;</span>
						</p></td>
					<td colspan="2"
						style="border-top-color:#000000; border-top-style:solid; border-top-width:3pt; padding-left:5.4pt; padding-right:5.4pt; vertical-align:middle; width:43.2pt"><p
							style="margin:0pt; orphans:0; text-align:center; widows:0">
							<span
								style="background-color:#ffff00; color:#ff0000; font-family:宋体; font-size:12pt">审核人</span>
						</p></td>
					<td
						style="border-right-color:#000000; border-right-style:solid; border-right-width:3pt; border-top-color:#000000; border-top-style:solid; border-top-width:3pt; padding-left:5.4pt; padding-right:3.9pt; vertical-align:middle; width:75.45pt"><p
							style="margin:0pt; orphans:0; text-align:center; widows:0">
							<span style="font-family:宋体; font-size:12pt">&#xa0;</span>
						</p></td>
				</tr>
				<tr style="height:25.5pt">
					<td colspan="4"
						style="border-bottom-color:#000000; border-bottom-style:solid; border-bottom-width:3pt; border-left-color:#000000; border-left-style:solid; border-left-width:0.75pt; padding-left:5.03pt; padding-right:5.4pt; vertical-align:middle; width:205.9pt"><p
							style="margin:0pt; orphans:0; text-align:center; widows:0">
							<span style="font-family:宋体; font-size:12pt">&#xa0;</span>
						</p></td>
					<td colspan="2"
						style="border-bottom-color:#000000; border-bottom-style:solid; border-bottom-width:3pt; padding-left:5.4pt; padding-right:5.4pt; vertical-align:middle; width:43.2pt"><p
							style="margin:0pt; orphans:0; text-align:center; widows:0">
							<span style="font-family:宋体; font-size:12pt">负责人</span>
						</p></td>
					<td
						style="border-bottom-color:#000000; border-bottom-style:solid; border-bottom-width:3pt; border-right-color:#000000; border-right-style:solid; border-right-width:3pt; padding-left:5.4pt; padding-right:3.9pt; vertical-align:middle; width:75.45pt"><p
							style="margin:0pt; orphans:0; text-align:center; widows:0">
							<span style="font-family:宋体; font-size:12pt">&#xa0;</span>
						</p></td>
				</tr>
				<tr style="height:25.5pt">
					<td colspan="2"
						style="border-bottom-color:#000000; border-bottom-style:solid; border-bottom-width:3pt; border-left-color:#000000; border-left-style:solid; border-left-width:3pt; border-right-color:#000000; border-right-style:solid; border-right-width:0.75pt; border-top-color:#000000; border-top-style:solid; border-top-width:3pt; padding-left:3.9pt; padding-right:5.03pt; vertical-align:middle; width:83.85pt"><p
							style="margin:0pt; orphans:0; text-align:center; widows:0">
							<span
								style="background-color:#ffff00; color:#ff0000; font-family:宋体; font-size:12pt">总法律顾问</span>
						</p></td>
					<td colspan="4"
						style="border-bottom-color:#000000; border-bottom-style:solid; border-bottom-width:3pt; border-left-color:#000000; border-left-style:solid; border-left-width:0.75pt; padding-left:5.03pt; padding-right:5.4pt; vertical-align:middle; width:205.9pt"><p
							style="margin:0pt; orphans:0; text-align:center; widows:0">
							<span style="color:#ff0000; font-family:宋体; font-size:12pt">&#xa0;</span>
						</p></td>
					<td colspan="2"
						style="border-bottom-color:#000000; border-bottom-style:solid; border-bottom-width:3pt; padding-left:5.4pt; padding-right:5.4pt; vertical-align:middle; width:43.2pt"><p
							style="margin:0pt; orphans:0; text-align:center; widows:0">
							<span style="color:#ff0000; font-family:宋体; font-size:12pt">&#xa0;</span>
						</p></td>
					<td
						style="border-bottom-color:#000000; border-bottom-style:solid; border-bottom-width:3pt; border-right-color:#000000; border-right-style:solid; border-right-width:3pt; padding-left:5.4pt; padding-right:3.9pt; vertical-align:middle; width:75.45pt"><p
							style="margin:0pt; orphans:0; text-align:center; widows:0">
							<span style="color:#ff0000; font-family:宋体; font-size:12pt">&#xa0;</span>
						</p></td>
				</tr>
				<tr style="height:25.5pt">
					<td colspan="2"
						style="border-bottom-color:#000000; border-bottom-style:solid; border-bottom-width:3pt; border-left-color:#000000; border-left-style:solid; border-left-width:3pt; border-right-color:#000000; border-right-style:solid; border-right-width:0.75pt; border-top-color:#000000; border-top-style:solid; border-top-width:3pt; padding-left:3.9pt; padding-right:5.03pt; vertical-align:middle; width:83.85pt"><p
							style="margin:0pt; orphans:0; text-align:center; widows:0">
							<span
								style="background-color:#ffff00; color:#ff0000; font-family:宋体; font-size:12pt">分管领导</span>
						</p></td>
					<td colspan="4"
						style="border-bottom-color:#000000; border-bottom-style:solid; border-bottom-width:3pt; border-left-color:#000000; border-left-style:solid; border-left-width:0.75pt; padding-left:5.03pt; padding-right:5.4pt; vertical-align:middle; width:205.9pt"><p
							style="margin:0pt; orphans:0; text-align:center; widows:0">
							<span style="color:#ff0000; font-family:宋体; font-size:12pt">&#xa0;</span>
						</p></td>
					<td colspan="2"
						style="border-bottom-color:#000000; border-bottom-style:solid; border-bottom-width:3pt; padding-left:5.4pt; padding-right:5.4pt; vertical-align:middle; width:43.2pt"><p
							style="margin:0pt; orphans:0; text-align:center; widows:0">
							<span style="color:#ff0000; font-family:宋体; font-size:12pt">&#xa0;</span>
						</p></td>
					<td
						style="border-bottom-color:#000000; border-bottom-style:solid; border-bottom-width:3pt; border-right-color:#000000; border-right-style:solid; border-right-width:3pt; padding-left:5.4pt; padding-right:3.9pt; vertical-align:middle; width:75.45pt"><p
							style="margin:0pt; orphans:0; text-align:center; widows:0">
							<span style="color:#ff0000; font-family:宋体; font-size:12pt">&#xa0;</span>
						</p></td>
				</tr>
				<tr style="height:25.5pt">
					<td colspan="2"
						style="border-bottom-color:#000000; border-bottom-style:solid; border-bottom-width:3pt; border-left-color:#000000; border-left-style:solid; border-left-width:3pt; border-right-color:#000000; border-right-style:solid; border-right-width:0.75pt; border-top-color:#000000; border-top-style:solid; border-top-width:3pt; padding-left:3.9pt; padding-right:5.03pt; vertical-align:middle; width:83.85pt"><p
							style="margin:0pt; orphans:0; text-align:center; widows:0">
							<span
								style="background-color:#ffff00; color:#ff0000; font-family:宋体; font-size:12pt">总会计师</span>
						</p></td>
					<td colspan="4"
						style="border-bottom-color:#000000; border-bottom-style:solid; border-bottom-width:3pt; border-left-color:#000000; border-left-style:solid; border-left-width:0.75pt; padding-left:5.03pt; padding-right:5.4pt; vertical-align:middle; width:205.9pt"><p
							style="margin:0pt; orphans:0; text-align:center; widows:0">
							<span style="color:#ff0000; font-family:宋体; font-size:12pt">&#xa0;</span>
						</p></td>
					<td colspan="2"
						style="border-bottom-color:#000000; border-bottom-style:solid; border-bottom-width:3pt; padding-left:5.4pt; padding-right:5.4pt; vertical-align:middle; width:43.2pt"><p
							style="margin:0pt; orphans:0; text-align:center; widows:0">
							<span style="color:#ff0000; font-family:宋体; font-size:12pt">&#xa0;</span>
						</p></td>
					<td
						style="border-bottom-color:#000000; border-bottom-style:solid; border-bottom-width:3pt; border-right-color:#000000; border-right-style:solid; border-right-width:3pt; padding-left:5.4pt; padding-right:3.9pt; vertical-align:middle; width:75.45pt"><p
							style="margin:0pt; orphans:0; text-align:center; widows:0">
							<span style="color:#ff0000; font-family:宋体; font-size:12pt">&#xa0;</span>
						</p></td>
				</tr>
				<tr style="height:25.5pt">
					<td colspan="2"
						style="border-bottom-color:#000000; border-bottom-style:solid; border-bottom-width:3pt; border-left-color:#000000; border-left-style:solid; border-left-width:3pt; border-right-color:#000000; border-right-style:solid; border-right-width:0.75pt; border-top-color:#000000; border-top-style:solid; border-top-width:3pt; padding-left:3.9pt; padding-right:5.03pt; vertical-align:middle; width:83.85pt"><p
							style="margin:0pt; orphans:0; text-align:center; widows:0">
							<span
								style="background-color:#ffff00; color:#ff0000; font-family:宋体; font-size:12pt">总经理</span>
						</p></td>
					<td colspan="4"
						style="border-bottom-color:#000000; border-bottom-style:solid; border-bottom-width:3pt; border-left-color:#000000; border-left-style:solid; border-left-width:0.75pt; padding-left:5.03pt; padding-right:5.4pt; vertical-align:middle; width:205.9pt"><p
							style="margin:0pt; orphans:0; text-align:center; widows:0">
							<span style="color:#ff0000; font-family:宋体; font-size:12pt">&#xa0;</span>
						</p></td>
					<td colspan="2"
						style="border-bottom-color:#000000; border-bottom-style:solid; border-bottom-width:3pt; padding-left:5.4pt; padding-right:5.4pt; vertical-align:middle; width:43.2pt"><p
							style="margin:0pt; orphans:0; text-align:center; widows:0">
							<span style="color:#ff0000; font-family:宋体; font-size:12pt">&#xa0;</span>
						</p></td>
					<td
						style="border-bottom-color:#000000; border-bottom-style:solid; border-bottom-width:3pt; border-right-color:#000000; border-right-style:solid; border-right-width:3pt; padding-left:5.4pt; padding-right:3.9pt; vertical-align:middle; width:75.45pt"><p
							style="margin:0pt; orphans:0; text-align:center; widows:0">
							<span style="color:#ff0000; font-family:宋体; font-size:12pt">&#xa0;</span>
						</p></td>
				</tr>
				<tr style="height:25.5pt">
					<td
						style="border-bottom-color:#000000; border-bottom-style:solid; border-bottom-width:3pt; border-left-color:#000000; border-left-style:solid; border-left-width:3pt; border-right-color:#000000; border-right-style:solid; border-right-width:0.75pt; border-top-color:#000000; border-top-style:solid; border-top-width:3pt; padding-left:3.9pt; padding-right:5.03pt; vertical-align:middle; width:48.6pt"><p
							style="margin:0pt; orphans:0; text-align:center; widows:0">
							<span style="font-family:宋体; font-size:12pt">备注</span>
						</p></td>
					<td colspan="8"
						style="border-bottom-color:#000000; border-bottom-style:solid; border-bottom-width:3pt; border-left-color:#000000; border-left-style:solid; border-left-width:0.75pt; border-right-color:#000000; border-right-style:solid; border-right-width:3pt; border-top-color:#000000; border-top-style:solid; border-top-width:3pt; padding-left:5.03pt; padding-right:3.9pt; vertical-align:middle; width:381.4pt"><p
							style="margin:0pt; orphans:0; text-align:center; widows:0">
							<span style="font-family:宋体; font-size:12pt">&#xa0;</span>
						</p></td>
				</tr>
				<tr style="height:0pt">
					<td style="width:59.4pt; border:none"></td>
					<td style="width:35.25pt; border:none"></td>
					<td style="width:63.7pt; border:none"></td>
					<td style="width:54pt; border:none"></td>
					<td style="width:81pt; border:none"></td>
					<td style="width:18pt; border:none"></td>
					<td style="width:27pt; border:none"></td>
					<td style="width:27pt; border:none"></td>
					<td style="width:86.25pt; border:none"></td>
				</tr>
			</table>
		</div>
		<p style="line-height:18pt; margin:0pt; orphans:0; widows:0">
			<span style="font-family:仿宋_GB2312; font-size:16pt">注：标黄内容为各单位根据本单位实际情况可自行增减内容</span>
		</p>
	</div>
</body>
</html>