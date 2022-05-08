<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <meta charset="utf-8">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <link href="css/adminStyle.css" rel="stylesheet" type="text/css" />
    <title>计算机系教材管理系统</title>
    <script type="text/javascript" src="js/jquery1.js"></script>
    <script type="text/javascript">
        $(document).ready(
            function() {
                $(".div2").click(
                    function() {
                        $(this).next("div").slideToggle("slow").siblings(
                            ".div3:visible").slideUp("slow");
                    });
            });
        function openurl(url) {
            var rframe = parent.document.getElementById("rightFrame");
            rframe.src = url;
        }
    </script>
    <style>
        body {
            margin: 0;
            font-family: 微软雅黑;
            background-image: url(images/chzu.jpg);

            background-size: cover;
            background-attachment: fixed;
            background-color: #DDDDDD

        }

        .top1 {
            position: absolute;
            top: 0px;
            width: 100%;
            height: 20px;
            text-align: center;
            color: #FFFFFF;
            font-size: 17px;
            font-height: 20px;
            font-family: 楷体;
            background-color: #888888
        }

        .title {
            float:left;
            font-size: 50px;
            font-height: 55px;
            font-family: 楷体;
        }

        .top2 {
            position: absolute;
            width: 100%;
            height: 97px;
            text-align: center;
            color: #0e0e0e;
            background-color: #0e90d2;
        }

        .left {
            position: absolute;
            left: 0px;
            top: 97px;
            width: 200px;
            height: 85%;
            border-right: 1px solid #9370DB;
            color: #000000;
            font-size: 20px;
            text-align: center;
            background-color: #00b7ee;
        }

        .right {
            position: absolute;
            left: 200px;
            top:97px;
            width: 85.2%;
            height: 85%;
            border-top: 0px solid #484860;
            font-size: 14px;
            text-align: center;
        }

        .end {
            position: absolute;
            bottom: 0px;
            width: 100%;
            height: 30px;
            text-align: center;
            color: #556B2F;
            font-size: 17px;
            font-height: 20px;
            font-family: 楷体;
            background-color: #C0C0C0
        }

        .div1 {
            text-align: center;
            width: 200px;
            padding-top: 10px;
        }

        .div2 {
            height: 40px;
            line-height: 40px;
            cursor: pointer;
            font-size: 18px;
            position: relative;
            border-bottom: #ccc 0px dotted;
        }

        .spgl {
            position: absolute;
            height: 20px;
            width: 20px;
            left: 40px;
            top: 10px;
            background: url(images/1.png);
        }

        .yhgl {
            position: absolute;
            height: 20px;
            width: 20px;
            left: 40px;
            top: 10px;
            background: url(images/4.png);
        }

        .gggl {
            position: absolute;
            height: 20px;
            width: 20px;
            left: 40px;
            top: 10px;
            background: url(images/4.png);
        }

        .zlgl {
            position: absolute;
            height: 20px;
            width: 20px;
            left: 40px;
            top: 10px;
            background: url(images/4.png);
        }

        .pjgl {
            position: absolute;
            height: 20px;
            width: 20px;
            left: 40px;
            top: 10px;
            background: url(images/4.png);
        }

        .tcht {
            position: absolute;
            height: 20px;
            width: 20px;
            left: 40px;
            top: 10px;
            background: url(images/2.png);
        }

        .div3 {
            display: none;
            cursor: pointer;
            font-size: 15px;
        }

        .div3 ul {
            margin: 0;
            padding: 0;
        }

        .div3 li {
            height: 30px;
            line-height: 30px;
            list-style: none;
            border-bottom: #ccc 1px dotted;
            text-align: center;
        }

        .a {
            text-decoration: none;
            color: #000000;
            font-size: 15px;
        }

        .a1 {
            text-decoration: none;
            color: #000000;
            font-size: 18px;
        }
    </style>
</head>
<body>
<div class="top2">
    <div class="title" >
        计算机系教学材料管理系统
    </div>
    <div class="fr top-link">
        <a href="admin_list.html" target="mainCont" title="DeathGhost"><i
                class="adminIcon"></i>
            <span id="UserType">管理员：DeathGhost</span></a>
    </div>
</div>

<div class="left">
    <div class="div1">
        <div class="left_top">
            <img src="images/bbb_01.jpg"><img src="images/bbb_02.jpg" id="2"><img src="images/bbb_03.jpg"><img
                src="images/bbb_04.jpg">
        </div>


        <div class="div2">
            <div class="spgl"></div>
            个人管理
        </div>
        <div class="div3">
            <ul>
                <li><a class="a" href="javascript:void(0);"
                       onClick="openurl('teacher_detail.jsp');">信息展示</a></li>

            </ul>
            <ul>
                <li><a class="a" href="javascript:void(0);"
                       onClick="openurl('teacher_update.jsp');">信息修改</a></li>

            </ul>
            <ul>
                <li><a class="a" href="javascript:void(0);"
                       onClick="openurl('updata_list.jsp');">课件查看</a></li>

            </ul>
            </ul>
            <ul>
                <li><a class="a" href="javascript:void(0);"
                       onClick="openurl('outline_list.jsp');">大纲查看</a></li>

            </ul>
            </ul>
            <ul>
                <li><a class="a" href="javascript:void(0);"
                       onClick="openurl('targ.jsp');">教学任务</a></li>

            </ul>
        </div>
        <div class="div2">
            <div class="spgl"></div>
            教学成果
        </div>
        <div class="div3">
            <ul>
                <li><a class="a" href="javascript:void(0);"
                       onClick="openurl('reap_list.jsp');">成果列表</a></li>

            </ul>
        </div>
        <div class="div2">
            <div class="gggl"></div>
            教学材料
        </div>
        <div class="div3">

            <ul>
                <li><a class="a" href="javascript:void(0);"
                       onClick="openurl('workv.jsp');">填写工作量</a></li>

            </ul>

            <ul>
                <li><a class="a" href="javascript:void(0);"
                       onClick="openurl('updata.jsp');">上传课件</a></li>

            </ul>

            <ul>
                <li><a class="a" href="outline.jsp">上传大纲</a></li>

            </ul>

            <ul>
                <li><a class="a" href="javascript:void(0);"
                       onClick="openurl('targ_list.jsp');">填写任务报告单</a></li>

            </ul>


        </div>
        <div class="div2">
            <div class="spgl"></div>
            教学进度
        </div>
        <div class="div3">
            <ul>
                <li><a class="a" href="javascript:void(0);"
                       onClick="openurl('alltpace_list.jsp');">教学进度表</a></li>

            </ul>
        </div>
        <a class="a1" href="login.jsp"><div class="div2">
            <div class="tcht"></div>
            退出后台
        </div>
        </a>
    </div>
</div>

<div class="right">
    <iframe id="rightFrame" name="rightFrame" width="100%" height="100%"
            scrolling="no" marginheight="0" marginwidth="0" align="center"
            style="border: 0px solid #CCC; margin: 0; padding: 0;" >

    </iframe>


</div>

</body>
<script>
    var uname= sessionStorage.getItem("uname");
    if(uname == 0){
        $("#UserType").html("身份："+"管理员");
    }
    if(uname == 1 ){
        $("#UserType").html("身份："+"教师");
    }
    if(uname == 2){
        $("#UserType").html("身份："+"系主任");
    }
    if(uname == 3){
        $("#UserType").html("身份："+"督导员");
    }
</script>
</html>
