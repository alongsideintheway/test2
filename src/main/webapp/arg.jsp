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
    <font color="#777777"><strong>教师姓名名：</strong></font>
    <input type="text" name="uname" id="uname" class="abc input-default " placeholder="请输入教师姓名" value="">&nbsp;&nbsp;
    <button type="button" class="btn btn-primary queryBtn" id="searchBtn">查询</button>
    <span id="errorMsg"></span>
</form>
<table id="usertable" class="table table-bordered table-hover definewidth m10">
    <thead>
    <tr>
        <th>教师</th>
        <th>课程</th>
        <th>授课专业</th>
        <th>授课班级</th>
        <th>操作</th>
    </tr>
    </thead>
    <tbody id="tbody">
    <%--填写用户列表数据--%>
    </tbody>

</table>
<div style="text-align: center;">
    <table border: 1px solid transparent !important; style="margin: auto;" width='60%' >
        <tfoot id="tfoot">

        </tfoot>
    </table>
</div>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<button type="button" id="addnew">
    <a href="argAdd.jsp">添加</a>
</button>
<script>
    findByPage(1);
    function findByPage(currentPage){
        $.ajax({
            url:"arg/findAllarg",
            type:"post",
            dataType:"json",
            data:{
                "currentPage":currentPage,
            },
            success:function (obj){
                console.log(obj)
                if (obj.code == 5001) {
                    $("#tbody").empty();
                    $("#tfoot").empty();
                    $(obj.obj.list).each(function (index, item) {

                        var str="<tr>\n" +
                            "           <td>"+item.tname+"</td>\n" +
                            "           <td>"+item.course+"</td>\n" +
                            "           <td>"+item.twh+"</td>\n" +
                            "           <td>"+item.tclass+"</td>\n" +
                            "           <td><button type=\"button\" onclick='deleteTeacher("+item.id+")'>删除</td>\n" +
                            "       </tr>";
                        $("#tbody").append(str);
                    })
                    var pageInfo = "<tr><td></td></tr>\n" +
                        "\t\t\t<tr><td></td></tr>\n" +
                        "\t\t     <tr>\n" +
                        "\t\t\t\t <td colspan=\"3\"></td>\n" +
                        "\t\t\t\t <td>\n" +
                        "\t\t\t\t\t <button type=\"button\" onclick=\"tofindByPage(1)\">首页</button>&nbsp;&nbsp;&nbsp;\n" +
                        "\t\t\t\t\t <button type=\"button\" onclick=\"tofindByPage(" + obj.obj.prePage + ")\">上一页</button>&nbsp;&nbsp;&nbsp;\n" +
                        "\t\t\t\t\t <button type=\"button\" onclick=\"tofindByPage(" + obj.obj.nextPage + ")\">下一页</button>&nbsp;&nbsp;&nbsp;\n" +
                        "\t\t\t\t\t <button type=\"button\" onclick=\"tofindByPage(" + obj.obj.pages + ")\">末页</button>&nbsp;&nbsp;&nbsp;\n" +
                        "\t\t\t\t </td>\n" +
                        "\t\t\t </tr>";
                    $("#tfoot").append(pageInfo);
                }

            }

        })
    }
    function tofindByPage(page){
        //调用分页查询
        findByPage(page);
    }
    /*$.ajax({
        url:"/user/findAllUser",
        type:"post",
        dataType:"json",
        success:function(obj){
            console.log(obj)
            if (obj.code==2001) {
                //遍历用户数组
                $(obj.obj).each(function (index,item){
                    if(item.type==0)
                    {
                        var type = "管理员"
                    }
                    if(item.type==1)
                    {
                        var type = "教师"
                    }
                    if(item.type==2)
                    {
                        var type = "系主任"
                    }
                    if(item.type==3)
                    {
                        var type = "督导员"
                    }
                    var str="<tr>\n" +
                        "           <td><a href=\"user_detail.jsp?wid="+item.wid+"\">"+item.uname+"</a></td>\n" +
                        "           <td>"+item.account+"</td>\n" +
                        "           <td>"+item.password+"</td>\n" +
                        "           <td>"+type+"</td>\n" +
                        "           <td><button type=\"button\" onclick='deleteTeacher("+item.wid+")'>注销<button type=\"submit\"><a href=\"user_update.jsp?wid="+item.wid+"\">修改</a></button></td>\n" +
                        "       </tr>";
                    $("#tbody").append(str);
                })
            }else{
                alert(obj.msg);
            }

        }

    })*/
    function deleteTeacher(id){
        if(confirm("确定要删除吗？")){
            $.ajax({
                url:"/arg/deleteargbyid",
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
        var uname=$("#uname").val();
        if(uname==null||uname==undefined||$.trim(uname).length==0){

            alert("输入不正确");
            return;
        }
        //
        $.ajax({
            url:"/arg/findargLikeUname",
            type:"post",
            dataType:"json",
            data:{
                "uname":uname
            },
            success:function (obj){
                if (obj.code==2001) {
                    //清空之前的数据
                    $("#tbody").empty();
                    //遍历用户数组
                    $(obj.obj).each(function (index,item){
                        var str="<tr>\n" +
                            "           <td>"+item.tname+"</td>\n" +
                            "           <td>"+item.course+"</td>\n" +
                            "           <td>"+item.twh+"</td>\n" +
                            "           <td>"+item.tclass+"</td>\n" +
                            "           <td><button type=\"button\" onclick='deleteTeacher("+item.id+")'>删除</td>\n" +
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