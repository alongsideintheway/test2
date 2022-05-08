<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
    <title></title>
    <meta charset="UTF-8">
    <link rel="stylesheet" type="text/css" href="css/bootstrap.css" />
    <link rel="stylesheet" type="text/css" href="css/bootstrap-responsive.css" />
    <link rel="stylesheet" type="text/css" href="css/style.css" />
    <script src="js/jquery-3.5.1.min.js"></script>
    <script type="text/javascript" src="js/bootstrap.js"></script>
    <script type="text/javascript" src="js/ckform.js"></script>
    <script type="text/javascript" src="js/common.js"></script>

    <style type="text/css">
        body {font-size: 20px;
            padding-bottom: 40px;
            background-color:#e9e7ef;
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
<body>

<table id="usertable" class="table table-bordered table-hover definewidth m10">
    <thead>
    <tr>
        <th>姓名</th>
        <th>课程</th>
        <th>计划学时数</th>
        <th>课程类别</th>
        <th>课程性质</th>
        <th>授课专业</th>
        <th>授课年级</th>
        <th>上课时间</th>
        <th>上课地点</th>
        <th>授课班级</th>
        <th>实际课时</th>
        <th>周课时</th>

    </tr>
    </thead>
    <tbody id="tbody">
    <%--填写用户列表数据--%>
    </tbody>

</table>

<script>
    var wid = location.search.split("=")[1];

    $.ajax({
        url:"arg/findBywidargDetail",
        type:"post",
        dataType:"json",
        data:{
            "wid":wid,
        },
        success:function (obj){
            console.log(obj)
            if (obj.code == 3001) {
                $("#tbody").empty();

                $(obj.obj).each(function (index, item) {
                    var czhou = item.czhou;
                    var cxues = item.cxues;
                    if(item.czhou==null){
                        czhou="暂无";
                    }
                    if(item.cxues==null){
                        cxues="暂无";
                    }
                    var str="<tr>\n" +
                        "           <td>"+item.tname+"</td>\n" +
                        "           <td>"+item.course+"</td>\n" +
                        "           <td>"+item.ttime+"</td>\n" +
                        "           <td>"+item.ctype+"</td>\n" +
                        "           <td>"+item.csex+"</td>\n" +
                        "           <td>"+item.twh+"</td>\n" +
                        "           <td>"+item.tage+"</td>\n" +
                        "           <td>"+item.xinq+""+item.jie+"</td>\n" +
                        "           <td>"+item.loc+"</td>\n" +
                        "           <td>"+item.tclass+"</td>\n" +
                        "           <td>"+czhou+"</td>\n" +
                        "           <td>"+cxues+"</td>\n" +

                        "       </tr>";
                    $("#tbody").append(str);
                })}
            else {
                alert(obj.msg);
            }}
    })

</script>


</body>

</html>