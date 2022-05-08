
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
    <font color="#777777"><strong>课件查看：</strong></font>

</form>
<table id="usertable" class="table table-bordered table-hover definewidth m10">
    <thead>
    <tr>
        <th>课程</th>
        <th>内容简介</th>
        <th>存储地址</th>
    </tr>
    </thead>
    <tbody id="tbody">
    <%--填写用户列表数据--%>
    </tbody>

</table>

<script>
    var wid = location.search.split("=")[1];
    var course = decodeURIComponent(location.search.split("=")[2]);
    alert(wid)
    $.ajax({
        url:"/file/updatabywidandcourse",
        type:"post",
        dataType:"json",
        data:{
            "wid":wid,
            "course":course,
        },
        success:function (obj){
            if(obj.code==5001){
                $(obj.obj).each(function (index,item) {
                    var str="<tr>\n" +
                        "           <td>"+item.course+"</a></td>\n" +
                        "           <td>"+item.profile+"</td>\n" +
                        "           <td><button type=\"submit\"><a href=\"/file/downLoad?wid="+item.updatalocation+"\">下载</a></button></td>\n" +
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