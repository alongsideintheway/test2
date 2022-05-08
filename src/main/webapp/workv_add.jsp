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
<font color="#777777"><strong>填写工作量：</strong></font>
<form id="typeForm" action="#" method="post" class="definewidth m20" >
    <table style="margin-left:10px;margin-top:3px;">
        <tr>
            <td>学院：</td>
            <td>
                <select id="col">
                    <option value="信息学院"/>&nbsp;信息学院</option>
                </select>
            </td>
        </tr>
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
            <td>课时：</td>
            <td><input type="number" id="alltime" /></td>
        </tr>

        <tr>
            <td>备注：</td>

            <td>
                <select id="note">
                    <option value="计算机教研室"/>&nbsp;计算机教研室</option>
                    <option value="计算机工程系">计算机工程系</option>
                    <option value="网工系">网工系</option>
                    <option value="物联网系">物联网系</option>
                </select>
            </td>
        </tr>

        <tr>
            <td></td>
            <td>
                <button type="button"  id="saveBtn"  >保&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp存</button> <button type="button"><a href="workv.jsp"> 返回列表</a></button>
            </td>
        </tr>
    </table>
</form>
<script>
    $("#saveBtn").click(function () {
        var wid = sessionStorage.getItem("wid");
        var col = $("#col").val();
        var course = $("#course").val();
        var alltime = $("#alltime").val();
        var note = $("#note").val();

        $.ajax({
            url:"workv/workvadd",
            type:"post",
            dataType:"json",
            data:{
                "wid":wid,
                "col":col,
                "course":course,
                "alltime":alltime,
                "note":note
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


