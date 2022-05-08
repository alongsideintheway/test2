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
    <font color="#777777"><strong>大纲查看：</strong></font>

</form>
<table class="table table-bordered table-hover definewidth m10">
    <thead>
    <tr>
        <th>课程</th>
        <th>课程性质</th>
        <th>考试形式</th>
        <th>先修课程</th>
        <th>适用专业</th>
        <th>开课单位</th>
        <th>总课时</th>
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
    var course = decodeURIComponent(location.search.split("=")[2]);
    $.ajax({
        url:"/outline/outlinefindbywidandcourse",
        type:"post",
        dataType:"json",
        data:{
            "wid":wid,
            "course":course
        },
        success:function (obj){
            if(obj.code==1001){
                $(obj.obj).each(function (index,item) {
                    var che;
                    if(item.che==0){
                        che="未审核";
                    }
                    if(item.che==1){
                        che="已审核";
                    }
                    var str="<tr>\n" +
                        "           <td><a href=\"outline_detail.jsp?id="+item.id+"\">"+item.course+"</a></td>\n" +
                        "           <td>"+item.ctype+"</td>\n" +
                        "           <td>"+item.ttype+"</td>\n" +
                        "           <td>"+item.firstc+"</td>\n" +
                        "           <td>"+item.spe+"</td>\n"+
                        "           <td>"+item.col+"</td>\n"+
                        "           <td>"+item.alltime+"</td>\n"+

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
                url:"/outline/outlineDelete",
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