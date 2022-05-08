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
    <font color="#777777"><strong>教学任务进度：</strong></font>

</form>
<table class="table table-bordered table-hover definewidth m10">
    <thead>
    <tr>
        <th>课程</th>
        <th>授课专业</th>
        <th>班级</th>
        <th>周数</th>
        <th>计划学时</th>
        <th>练习课学时</th>
        <th>实验课学时</th>
        <th>讲课学时</th>
        <th>审核</th>
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
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<button type="button" id="addnew">
    <a href="ztpace_add.jsp">添加</a>
</button>
<script>
    var wid = sessionStorage.getItem("wid")
    alert(wid);
    $.ajax({
        url:"/tpace/ztpaceBywid",
        type:"post",
        dataType:"json",
        data:{
            "wid":wid,
        },
        success:function (obj){
            if(obj.code==1001){
                $(obj.obj).each(function (index,item) {
                    var che = null;
                    if(item.che==0){
                        var che = "待审核";
                    }
                    if(item.che==1){
                        var che = "已审核";
                    }
                    var str="<tr>\n" +
                        "           <td><a href=\"ctpace_detail.jsp?wid="+item.cid+"\">"+item.course+"</a></td>\n" +
                        "           <td>"+item.spe+"</td>\n" +
                        "           <td>"+item.tclass+"</td>\n" +
                        "           <td>"+item.zhou+"</td>\n" +
                        "           <td>"+item.planxs+"</td>\n"+
                        "           <td>"+item.lianx+"</td>\n"+
                        "           <td>"+item.testke+"</td>\n"+
                        "           <td>"+item.jiangke+"</td>\n"+
                        "           <td>"+che+"</td>\n"+
                        "           <td><button type=\"button\" onclick='deleteTeacher("+item.cid+")'>删除<button type=\"submit\"><a href=\"tpcontextadd.jsp?cid="+item.cid+"\">添加内容</a></button></td>\n" +
                        "       </tr>";
                    $("#tbody").append(str);

                })
            }else
            {
                alert(obj.msg);
            }
        }
    })

    function deleteTeacher(cid){
        if(confirm("确定要删除吗？")){
            $.ajax({
                url:"/tpace/ctpaceDelete",
                type:"post",
                dataType:"json",
                data:{
                    "cid":cid
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