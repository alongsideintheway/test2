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
        <th>课程</th>
        <th>授课专业</th>
        <th>班级</th>
        <th>考核方式</th>
        <th>考核材料类型</th>
        <th>实验平台</th>
        <th>试卷</th>
        <th>考察材料</th>
        <th>教学大纲</th>
        <th>教学进度表</th>
        <th>典型教案</th>
        <th>小节表</th>
        <th>记分册</th>
        <th>考察说明</th>
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
&nbsp;<div style="text-align: center;">
    <table border: 1px solid transparent !important; style="margin: auto;" width='60%' >
        <tfoot id="tfoot">

        </tfoot>
    </table>
</div>
<script>

    findByPage(1);
    function findByPage(currentPage){
        $.ajax({
            url:"/tpace/motpacefindAll",
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
                        if(item.sj==0){
                            var sj = "否";
                        }
                        if(item.sj==1){
                            var sj = "是";
                        }
                        if(item.kccl==0){
                            var kccl = "否";
                        }
                        if(item.kccl==1){
                            var kccl = "是";
                        }
                        if(item.jxdg==0){
                            var jxdg = "否";
                        }
                        if(item.jxdg==1){
                            var jxdg = "是";
                        }
                        if(item.jxjd==0){
                            var jxjd = "否";
                        }
                        if(item.jxjd==1){
                            var jxjd = "是";
                        }
                        if(item.dxal==0){
                            var dxal = "否";
                        }
                        if(item.dxal==1){
                            var dxal = "是";
                        }
                        if(item.xjb==0){
                            var xjb = "否";
                        }
                        if(item.xjb==1){
                            var xjb = "是";
                        }
                        if(item.jfc==0){
                            var jfc = "否";
                        }
                        if(item.jfc==1){
                            var jfc = "是";
                        }
                        if(item.kcsm==0){
                            var kcsm = "否";
                        }
                        if(item.kcsm==1){
                            var kcsm = "是";
                        }

                        var str="<tr>\n" +
                            "           <td>"+item.tname+"</td>\n" +
                            "           <td>"+item.course+"</td>\n" +
                            "           <td>"+item.spe+"</td>\n" +
                            "           <td>"+item.tclass+"</td>\n" +
                            "           <td>"+item.khfs+"</td>\n" +
                            "           <td>"+item.khfslx+"</td>\n" +
                            "           <td>"+item.sypt+"</td>\n" +
                            "           <td>"+sj+"</td>\n" +
                            "           <td>"+kccl+"</td>\n" +
                            "           <td>"+jxdg+"</td>\n" +
                            "           <td>"+jxjd+"</td>\n" +
                            "           <td>"+dxal+"</td>\n" +
                            "           <td>"+xjb+"</td>\n" +
                            "           <td>"+jfc+"</td>\n" +
                            "           <td>"+kcsm+"</td>\n" +
                            "           <td><button type=\"submit\"><a href=\"updatecl.jsp?wid="+item.cid+"\">修改</a></button></td>\n" +
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
            url:"/tpace/findmtpaceLikeUname",
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