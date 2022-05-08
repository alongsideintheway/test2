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
    <font color="#777777"><strong>初期检查：</strong></font>

</form>
<table class="table table-bordered table-hover definewidth m10">
    <thead>
    <tr>
        <th>教师姓名</th>
        <th>课程进度</th>
        <th>课件</th>
        <th>教学大纲</th>
        <th>授课专业</th>
        <th>班级</th>
        <th>周数</th>
        <th>计划学时</th>
        <th>练习课学时</th>
        <th>实验课学时</th>
        <th>讲课学时</th>
        <th>审核状态</th>
        <th>评价</th>
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
        url:"/tpace/ztpacefindAll",
        type:"post",
        dataType:"json",
        data:{

        },
        success:function (obj){
            if(obj.code==1001){
                console.log(obj);
                $(obj.obj).each(function (index,item) {
                    var a = "已审核";
                    var b = "未审核"
                    if(item.che=="1" ){
                        var str="<tr>\n" +
                            "           <td>"+item.tname+"</td>\n" +
                            "           <td><a href=\"cctpace_detail.jsp?wid="+item.cid+"\">"+item.course+"</a></td>\n" +
                            "           <td><a href=\"updatac.jsp?wid="+item.wid+"="+item.course+"\">"+item.course+"</a></td>\n" +
                            "           <td><a href=\"outlinec.jsp?wid="+item.wid+"="+item.course+"\">"+item.course+"</a></td>\n" +
                            "           <td>"+item.spe+"</td>\n" +
                            "           <td>"+item.tclass+"</td>\n" +
                            "           <td>"+item.zhou+"</td>\n" +
                            "           <td>"+item.planxs+"</td>\n"+
                            "           <td>"+item.lianx+"</td>\n"+
                            "           <td>"+item.testke+"</td>\n"+
                            "           <td>"+item.jiangke+"</td>\n"+

                            "           <td><button type=\"button\" disabled onclick='check("+item.cid+")'>"+a+"</td>\n" +
                            "           <td><button type=\"submit\"><a href=\"remakeadd.jsp?cid="+item.cid+"\">评价</a></button></td>\n" +
                            "       </tr>";
                        $("#tbody").append(str);

                    }else {
                        var str = "<tr>\n" +
                            "           <td>"+item.tname+"</td>\n" +
                            "           <td><a href=\"cctpace_detail.jsp?wid="+item.cid+"\">"+item.course+"</a></td>\n" +
                            "           <td><a href=\"updatac.jsp?wid="+item.wid+"="+item.course+"\">"+item.course+"</a></td>\n" +
                            "           <td><a href=\"outlinec.jsp?wid="+item.wid+"="+item.course+"\">"+item.course+"</a></td>\n" +
                            "           <td>"+item.spe+"</td>\n" +
                            "           <td>"+item.tclass+"</td>\n" +
                            "           <td>"+item.zhou+"</td>\n" +
                            "           <td>"+item.planxs+"</td>\n"+
                            "           <td>"+item.lianx+"</td>\n"+
                            "           <td>"+item.testke+"</td>\n"+
                            "           <td>"+item.jiangke+"</td>\n"+

                            "           <td><button type=\"button\"  onclick='check(" + item.cid + ")'>" + b + "</td>\n" +
                            "           <td><button type=\"submit\"><a href=\"remakeadd.jsp?cid="+item.cid+"\">评价</a></button></td>\n" +
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
    function check(cid){
        if(confirm("确定通过审核")){
            $.ajax({
                url:"/tpace/checktpace",
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
            url:"/tpace/findtpaceLikeUname",
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
                        var a = "已审核";
                        var b = "未审核"
                        if(item.che=="1" ){
                            var str="<tr>\n" +
                                "           <td>"+item.tname+"</td>\n" +
                                "           <td><a href=\"cctpace_detail.jsp?wid="+item.cid+"\">"+item.course+"</a></td>\n" +
                                "           <td><a href=\"updatac.jsp?wid="+item.wid+"="+item.course+"\">"+item.course+"</a></td>\n" +
                                "           <td><a href=\"outlinec.jsp?wid="+item.wid+"="+item.course+"\">"+item.course+"</a></td>\n" +
                                "           <td>"+item.spe+"</td>\n" +
                                "           <td>"+item.tclass+"</td>\n" +
                                "           <td>"+item.zhou+"</td>\n" +
                                "           <td>"+item.planxs+"</td>\n"+
                                "           <td>"+item.lianx+"</td>\n"+
                                "           <td>"+item.testke+"</td>\n"+
                                "           <td>"+item.jiangke+"</td>\n"+
                                "           <td><button type=\"button\" disabled onclick='check("+item.cid+")'>"+a+"</td>\n" +
                                "       </tr>";
                            $("#tbody").append(str);

                        }else {
                            var str = "<tr>\n" +
                                "           <td>"+item.tname+"</td>\n" +
                                "           <td><a href=\"cctpace_detail.jsp?wid="+item.cid+"\">"+item.course+"</a></td>\n" +
                                "           <td><a href=\"updatac.jsp?wid="+item.wid+"="+item.course+"\">"+item.course+"</a></td>\n" +
                                "           <td><a href=\"outlinec.jsp?wid="+item.wid+"="+item.course+"\">"+item.course+"</a></td>\n" +
                                "           <td>"+item.spe+"</td>\n" +
                                "           <td>"+item.tclass+"</td>\n" +
                                "           <td>"+item.zhou+"</td>\n" +
                                "           <td>"+item.planxs+"</td>\n"+
                                "           <td>"+item.lianx+"</td>\n"+
                                "           <td>"+item.testke+"</td>\n"+
                                "           <td>"+item.jiangke+"</td>\n"+
                                "           <td><button type=\"button\"  onclick='check(" + item.cid + ")'>" + b + "</td>\n" +
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
