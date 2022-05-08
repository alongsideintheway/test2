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
<form id="form1" class="form-inline definewidth m20" action="#" method="get">
    <font color="#777777"><strong>教师姓名：</strong></font>
    <input type="text" name="tname" id="tname" class="abc input-default " placeholder="请填写教师姓名" value="">&nbsp;&nbsp;
    <button type="button" class="btn btn-primary queryBtn" id="searchBtn">查询</button>
    <span id="errorMsg"></span>
</form>
<form class="form-inline definewidth m20" action="#" method="get">
    <font color="#777777"><strong>成果信息：</strong></font>

</form>
<table class="table table-bordered table-hover definewidth m10">
    <thead>
    <tr>
        <th>教师姓名</th>
        <th>教学成果类型</th>
        <th>获得奖项</th>
        <th>成果细节</th>
        <th>时间</th>
        <th>审核状态</th>
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
&nbsp;
<script>

    $.ajax({
        url:"/reap/reapfindAll",
        type:"post",
        dataType:"json",
        data:{

        },
        success:function (obj){
            if(obj.code==1001){
                $(obj.obj).each(function (index,item) {
                    if(item.checks=="已审核"){
                        var str="<tr>\n" +
                            "           <td>"+item.tname+"</td>\n" +
                            "           <td>"+item.type+"</td>\n" +
                            "           <td>"+item.award+"</td>\n" +
                            "           <td>"+item.detail+"</td>\n" +
                            "           <td>"+dateToString(item.time)+"</td>\n" +
                            "           <td><button type=\"button\" disabled onclick='check("+item.id+")'>"+item.checks+"</td>\n" +
                            "       </tr>";
                        $("#tbody").append(str);

                    }else {
                        var str = "<tr>\n" +
                            "           <td>"+item.tname+"</td>\n" +
                            "           <td>" + item.type + "</td>\n" +
                            "           <td>" + item.award + "</td>\n" +
                            "           <td>" + item.detail + "</td>\n" +
                            "           <td>" + dateToString(item.time) + "</td>\n" +
                            "           <td><button type=\"button\"  onclick='check(" + item.id + ")'>" + item.checks + "</td>\n" +
                            "       </tr>";
                        $("#tbody").append(str);
                    }
                })
            }else
            {
                alert(obj.msg);
            }
        }
    })
    function dateToString(str) {
        //创建时间对象
        var time = new Date(str);
        //获取年
        var y = time.getFullYear();
        //获取月
        var mon = time.getMonth() + 1;
        //获取日
        var day = time.getDate();
        //拼接字符串
        return y + "-" + mon + "-" + day;
    }
    function check(id){
        if(confirm("确定通过审核")){
            $.ajax({
                url:"/reap/checkreap",
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
<script>
    $("#searchBtn").click(function (){
        //清空提示框

        //获取搜索框输入的内容
        var tname=$("#tname").val();
        if(tname==null||tname==undefined||$.trim(tname).length==0){

            alert("输入不正确");
            return;
        }
        //
        $.ajax({
            url:"/reap/findReapLikeUname",
            type:"post",
            dataType:"json",
            data:{
                "tname":tname
            },
            success:function (obj){
                if (obj.code==2001) {
                    $("#tbody").empty();
                    //清空之前的数据
                    $(obj.obj).each(function (index,item) {
                        if(item.checks=="已审核"){
                            var str="<tr>\n" +
                                "           <td>"+item.tname+"</td>\n" +
                                "           <td>"+item.type+"</td>\n" +
                                "           <td>"+item.award+"</td>\n" +
                                "           <td>"+item.detail+"</td>\n" +
                                "           <td>"+dateToString(item.time)+"</td>\n" +
                                "           <td><button type=\"button\" disabled onclick='check("+item.id+")'>"+item.checks+"</td>\n" +
                                "       </tr>";
                            $("#tbody").append(str);

                        }else {
                            var str = "<tr>\n" +
                                "           <td>"+item.tname+"</td>\n" +
                                "           <td>" + item.type + "</td>\n" +
                                "           <td>" + item.award + "</td>\n" +
                                "           <td>" + item.detail + "</td>\n" +
                                "           <td>" + dateToString(item.time) + "</td>\n" +
                                "           <td><button type=\"button\"  onclick='check(" + item.id + ")'>" + item.checks + "</td>\n" +
                                "       </tr>";
                            $("#tbody").append(str);
                        }
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