<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title></title>
    <meta charset="UTF-8">
    <link rel="stylesheet" type="text/css" href="css/bootstrap.css"/>
    <link rel="stylesheet" type="text/css"
          href="css/bootstrap-responsive.css"/>
    <link rel="stylesheet" type="text/css" href="css/style.css"/>
    <script type="text/javascript" src="js/bootstrap.js"></script>
    <script type="text/javascript" src="js/ckform.js"></script>
    <script type="text/javascript" src="js/common.js"></script>
    <script src="js/jquery.min.js?v=2.1.4"></script>
    <style type="text/css">
        body {
            font-size: 20px;
            padding-bottom: 40px;
            background-color: #e9e7ef;
        }

        .sidebar-nav {
            padding: 9px 0;
        }

        @media ( max-width: 980px) {
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
    <font color="#777777"><strong>大类信息：</strong></font>

</form>
<table class="table table-bordered table-hover definewidth m10">
    <thead>
    <tr>
        <th>大类名称</th>
        <th>类别描述</th>
        <th>查看小类</th>
        <th>小类管理</th>
        <th>修改</th>
        <th>删除</th>
    </tr>
    </thead>
    <tbody id="tbody">
        <%--存放数据行--%>
        <tr>
            <td>娱乐</td>
            <td>当前了别是影视评价的博客类别</td>
            <td>
                <select>
                    <option value="2"/>&nbsp;电影</option>
                    <option value="7"/>&nbsp;原创</option>
               </select>
            </td>
            <td>
                <button type="submit"><a href="subtype_list.jsp">管理小类</a></button>
            </td>
            <td>
                <button type="submit"><a href="type_update.jsp">修改</a></button>
            </td>
            <td>
                <button type="submit">删除</button>
            </td>
        </tr>
    </tbody>
</table>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<button type="button" id="addnew">
    <a href="type_add.jsp">添加大类</a>
</button>
</body>
</html>