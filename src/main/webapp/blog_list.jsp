<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
<title></title>
<meta charset="UTF-8">
<link rel="stylesheet" type="text/css" href="css/bootstrap.css" />
<link rel="stylesheet" type="text/css" href="css/bootstrap-responsive.css" />
<link rel="stylesheet" type="text/css" href="css/style.css" />
<%--<script type="text/javascript" src="js/jquery2.js"></script>--%>
<%--<script type="text/javascript" src="js/jquery2.sorted.js"></script>--%>
<script type="text/javascript" src="js/bootstrap.js"></script>
<script type="text/javascript" src="js/ckform.js"></script>
<script type="text/javascript" src="js/common.js"></script>
	<script src="js/jquery.min.js?v=2.1.4"></script>
<style type="text/css">
body {font-size: 20px;
	padding-bottom: 40px;
	background-color: #e9e7ef;
}

.sidebar-nav {
	padding: 9px 0;
}

@media ( max-width : 980px) {
	/* Enable use of floated navbar text */
	.navbar-text.pull-right {
		float: none;
		padding-left: 5px;
		padding-right: 5px;
	}
}
</style>
</head>
<body>
	<form class="form-inline definewidth m20" action="#" method="get">
	<a href="documentAdd.jsp">发布博客</a>

	</form>
	<table class="table table-bordered table-hover definewidth m10">
		<thead>
			<tr align="center">
				<th>博客标题</th>
				<th>博客类别</th>
				<th>作者</th>
				<th>发布日期</th>
				<th>管理菜单</th>
			</tr>
		</thead>
		<tbody id="tbody">
		   <%--存放行数据--%>
		   <tr align="center">
			   <td>蒹葭</td>
			   <td>策</td>
			   <td>小强</td>
			   <td>2016.07.22</td>
			   <td>
				   <a href="javascripe:deleteInfo()">删除 </a>
				   &nbsp;&nbsp;&nbsp;&nbsp;
				   <a href="blog_detail.jsp">博客详情</a>
			   </td>
		   </tr>
		</tbody>
		<tfoot id="tfoot">
			<%--设置分页信息--%>
		</tfoot>
	</table>

</body>
</html>
