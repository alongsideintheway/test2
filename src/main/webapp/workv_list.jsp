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
<form id="form1" class="form-inline definewidth m20" action="#" method="get">
    <font color="#777777"><strong>教师姓名：</strong></font>
    <input type="text" name="uname" id="uname" class="abc input-default " placeholder="请输入要查询的教师姓名" value="">&nbsp;&nbsp;
    <button type="button" class="btn btn-primary queryBtn" id="searchBtn">查询</button>
    <span id="errorMsg"></span>
</form>

<table id="usertable" class="table table-bordered table-hover definewidth m10">
    <thead>
    <tr>

        <th>工号</th>
        <th>姓名</th>
        <th>职称</th>
        <th>学院</th>
        <th>课程</th>
        <th>课时</th>
        <th>备注</th>
    </tr>
    </thead>
    <tbody id="tbody">
    <%--填写用户列表数据--%>
    </tbody>
</table>
<script>
    $.ajax({
        url:"/workv/findAllworkv",
        type:"post",
        dataType:"json",
        success:function(obj){
            console.log(obj)
            if (obj.code==2001) {
                //遍历用户数组
                $(obj.obj).each(function (index,item){

                    var str="<tr>\n" +
                        "           <td>"+item.wid+"</td>\n" +
                        "           <td>"+item.tname+"</td>\n" +
                        "           <td>"+item.title+"</td>\n" +
                        "           <td>"+item.col+"</td>\n" +
                        "           <td>"+item.course+"</td>\n" +
                        "           <td>"+item.alltime+"</td>\n" +
                        "           <td>"+item.note+"</td>\n" +
                        "       </tr>";
                    $("#tbody").append(str);
                })
            }else{
                alert(obj.msg);
            }

        }

    })

</script>

<script>
    $("#searchBtn").click(function (){
        //清空提示框

        //获取搜索框输入的内容
        var uname=$("#uname").val();
        if(uname==null||uname==undefined||$.trim(uname).length==0){

            alert("输入不正确");
            return;
        }
        //
        $.ajax({
            url:"/workv/findworkvLikeUname",
            type:"post",
            dataType:"json",
            data:{
                "tname":uname
            },
            success:function (obj){
                if (obj.code==2001) {
                    //清空之前的数据
                    $("#tbody").empty();
                    //遍历用户数组
                    $(obj.obj).each(function (index,item){

                        var str="<tr>\n" +
                            "           <td>"+item.wid+"</td>\n" +
                            "           <td>"+item.tname+"</td>\n" +
                            "           <td>"+item.title+"</td>\n" +
                            "           <td>"+item.col+"</td>\n" +
                            "           <td>"+item.course+"</td>\n" +
                            "           <td>"+item.alltime+"</td>\n" +
                            "           <td>"+item.note+"</td>\n" +
                            "       </tr>";
                        $("#tbody").append(str);
                    })
                }else{
                    alert(obj.msg);
                }
            }
        })
    })
</script>
</body>

</html>