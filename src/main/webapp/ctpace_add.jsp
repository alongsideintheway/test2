<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title></title>
    <meta charset="UTF-8">
    <link rel="stylesheet" type="text/css" href="css/bootstrap.css" />
    <link rel="stylesheet" type="text/css" href="css/bootstrap-responsive.css" />
    <link rel="stylesheet" type="text/css" href="css/style.css" />
    <script type="text/javascript" src="js/bootstrap.js"></script>
    <script type="text/javascript" src="js/ckform.js"></script>
    <script type="text/javascript" src="js/common.js"></script>
    <script type="text/javascript" src="js/jquerypicture.js"></script>
    <script src="js/jquery.min.js?v=2.1.4"></script>

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
<body><br>
&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp
<font color="#777777"><strong>添加进度表：</strong></font>
<form id="typeForm" action="#" method="post" class="definewidth m20" >
    <table style="margin-left:10px;margin-top:3px;">
        <tr>
            <td>课程：</td>
            <td>
                <select id="course">
                    <option value="c语言程序设计基础"/>&nbsp;c语言程序设计基础</option>
                    <option value="java面向对象编程"/>&nbsp;java面向对象编程</option>
                    <option value="Python编程"/>Python编程</option>
                    <option value="数据结构"/>数据结构</option>
                    <option value="计算机网络"/>计算机网络</option>
                    <option value="操作系统"/>操作系统</option>
                    <option value="数字逻辑"/>数字逻辑</option>
                </select>
            </td>
        </tr>
        <tr>
            <td >授课专业：</td>
            <td>
                <select id="spe">
                    <option value="计科"/>&nbsp;计科</option>
                    <option value="网工"/>&nbsp;网工</option>
                    <option value="通信"/>&nbsp;通信</option>
                    <option value="软件"/>&nbsp;软件</option>
                </select>
            </td>
        </tr>
        <tr>
            <td >授课班级：</td>
            <td>
                <select id="tclass">
                    <option value="计科181"/>计科181</option>
                    <option value="计科182"/>计科182</option>
                </select>
            </td>
        </tr>
        <tr>
            <td >参考书籍：</td>
            <td>
           <input type="text" id="textb">
            </td>
        </tr>

        <tr>
            <td>周数：</td>
            <td><input type="number" id="zhou" /></td>
        </tr>

        <tr>
            <td>计划课时：</td>
            <td><input type="number" id="planxs" /></td>
        </tr>

        <tr>
            <td>讲课：</td>
            <td><input type="number" id="jiangke" /></td>
        </tr>
        <tr>
            <td>实验课：</td>
            <td><input type="number" id="testke" /></td>
        </tr>
        <tr>
            <td>习题课：</td>
            <td><input type="number" id="lianx" /></td>
        </tr>
        <tr>
            <td></td>
            <td>
                <button type="button"  id="saveBtn"  >保&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp存</button> &nbsp;&nbsp;<button type="button"><a href="ctpace.jsp"> 返回列表</a></button>
            </td>
        </tr>
    </table>
</form>
<script>
    $("#saveBtn").click(function () {
        var wid = sessionStorage.getItem("wid");
        var course = $("#course").val();
        var spe = $("#spe").val();
        var tclass = $("#tclass").val();
        var textb = $("#textb").val();
        var planxs = $("#planxs").val();
        var testke = $("#testke").val();
        var jiangke = $("#jiangke").val();
        var lianx = $("#lianx").val();
        var zhou = $("#zhou").val();

        $.ajax({
            url:"tpace/ctpaceAdd",
            type:"post",
            dataType:"json",
            data:{
                "wid":wid,
                "course":course,
                "spe":spe,
                "tclass":tclass,
                "textb":textb,
                "planxs":planxs,
                "testke":testke,
                "jiangke":jiangke,
                "lianx":lianx,
                "zhou":zhou
            },
            success:function (obj){
                if(obj.code==9001){
                    alert(obj.msg);

                }else{
                    alert(obj.msg);
                }
            }
        })
    })
</script>
</body>
</html>


