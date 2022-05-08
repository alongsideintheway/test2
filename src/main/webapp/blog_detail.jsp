<%@ page contentType="text/html;charset=UTF-8" language="java" isELIgnored="false" %>
<html>
<head>
    <title></title>
    <meta charset="UTF-8">
    <link rel="stylesheet" type="text/css" href="css/bootstrap.css" />
    <link rel="stylesheet" type="text/css" href="css/bootstrap-responsive.css" />
    <link rel="stylesheet" type="text/css" href="css/style.css" />
    <script type="text/javascript" src="js/bootstrap.js"></script>
    <script type="text/javascript" src="js/ckform.js"></script>
    <script type="text/javascript" src="js/common.js"></script>
    <script type="text/javascript" src="js/showdate.js"></script>
	<script src="js/jquery.min.js?v=2.1.4"></script>
    <style type="text/css">
        body {font-size: 20px;
             padding-bottom: 40px;
             background-color:#e9e7ef;
             font-size:17px;
        }
        .sidebar-nav {
            padding: 9px 0;
        }

        @media (max-width: 980px) {
            /* Enable use of floated navbar text */
            .navbar-text.pull-right {
                float: none;
                padding-left: 5px;
                padding-right: 5px;
            }
        }
    </style>
</head>
<h3><strong>博客信息：</strong></h3>
      <table class="table table-condensed">
               <tr>              
	              <td width="18%" height="30" align="center">博主名称：</td>
	              <td id="uname" width="82%" class="word_grey">
					 <%--博主名称--%>
				  </td>
	            </tr>
	            <tr>
	              <td height="28" align="center">邮箱</td>
	              <td height="28" id="email">fendou@fendou.com</td>
	            </tr>
				  <tr>
					  <td height="28" align="center">发布内容：</td>
					  <td height="28" id="content">的设计费看就看的房间</td>
				  </tr>
	            <tr>
	              <td height="28" align="center">发布时间：</td>
	              <td height="28" id="time" >2022-11-15 12:33:23</td>
	            </tr>
	  </table>

<h3><strong>全部评价内容：</strong></h3>
<table class="table table-bordered">
	<thead>
		<tr>
			<th>评价内容</th>
			<%--<th>评价人</th>--%>
			<th>评价时间</th>
			<th>操作</th>
		</tr>
	</thead>
	<tbody id="evaluates">
		<%--追加评论信息--%>
        <td>这是一个不错的电影</td>
        <td>2022-04-01</td>
		<td><button type="button"  id="deletecomment">删除</button></td>
	</tbody>
</table>
</body>

</html>
