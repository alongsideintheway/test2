
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
    <font color="#777777"><strong>具体教学任务进度：</strong></font>

</form>
<table class="table table-bordered table-hover definewidth m10">
    <thead>
    <tr>
        <th>周次日期</th>
        <th>周学时</th>
        <th>讲课</th>
        <th>实验课</th>
        <th>习题课</th>
        <th>内容摘要</th>
        <th>操作</th>
    </tr>
    </thead>
    <tbody id="tbody">
    <%--存放数据行--%>
    <%-- <tr>
         <td>娱乐</td>
         <td>当前了别是影视评价的博客类别</td>
         <td>
             <select id="uu">
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
     </tr>--%>
    </tbody>
</table>

<script>
    var wid = location.search.split("=")[1];
    alert(wid);
    $.ajax({
        url:"/tpcontext/tpcontextfindbycid",
        type:"post",
        dataType:"json",
        data:{
            "cid":wid
        },
        success:function (obj){
            if(obj.code==3001){
                $(obj.obj).each(function (index,item) {
                    var str="<tr>\n" +
                        "           <td>"+item.zdata+"</a></td>\n" +
                        "           <td>"+item.zxs+"</td>\n" +
                        "           <td>"+item.jk+"</td>\n" +
                        "           <td>"+item.syk+"</td>\n" +
                        "           <td>"+item.xtk+"</td>\n" +
                        "           <td>"+item.cjian+"</td>\n" +
                        "           <td><button type=\"button\" onclick='deleteTeacher("+item.id+")'>删除</td>\n"+
                        "       </tr>";
                    $("#tbody").append(str);

                })
            }else
            {
                alert(obj.msg);
            }
        }
    })

    function deleteTeacher(id){
        if(confirm("确定要删除吗？")){
            $.ajax({
                url:"/tpcontext/tpcontextDelete",
                type:"post",
                dataType:"json",
                data:{
                    "id":id
                },
                success:function(obj){
                    console.log(obj)
                    if(obj.code==4001){
                        alert(obj.msg);
                        //删除成功刷新当前页面
                        location.reload();
                    }else{
                        alert(obj.msg);
                    }
                }
            })
        }
    }
</script>
</body>
</html>