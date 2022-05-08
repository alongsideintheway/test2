<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title></title>
    <meta charset="UTF-8">
    <link rel="stylesheet" type="text/css" href="css/bootstrap.css" />
    <link rel="stylesheet" type="text/css" href="css/bootstrap-responsive.css" />
    <link rel="stylesheet" type="text/css" href="css/style.css" />
    <script type="text/javascript" src="js/jquery2.js"></script>
    <script type="text/javascript" src="js/jquery2.sorted.js"></script>
    <script type="text/javascript" src="js/bootstrap.js"></script>
    <script type="text/javascript" src="js/ckform.js"></script>
    <script type="text/javascript" src="js/common.js"></script>
    <script type="text/javascript" src="js/jquerypicture.js"></script>
    <script type="text/javascript" charset="utf-8" src="utf8-jsp/ueditor.config.js"></script>
    <script type="text/javascript" charset="utf-8" src="utf8-jsp/ueditor.all.min.js"> </script>
    <script type="text/javascript" charset="utf-8" src="utf8-jsp/lang/zh-cn/zh-cn.js"></script>
    <script type="application/javascript">

        var ue = UE.getEditor('profile');

    </script>
    <script type="application/javascript">

        var ue = UE.getEditor('goal');

    </script>
    <script type="application/javascript">

        var ue = UE.getEditor('context');

    </script>

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
<font color="#777777"><strong>上传大纲：</strong></font>
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
            <td>学院：</td>
            <td>
                <select id="col">
                    <option value="信息学院"/>&nbsp;信息学院</option>
                </select>
            </td>
        </tr>

        <tr>
            <td>课程性质：</td>
            <td>
                <select id="ctype">
                    <option value="必修"/>&nbsp;必修</option>
                    <option value="选修"/>&nbsp;选修</option>
                </select>
            </td>
        </tr>

        <tr>
            <td>考核方式：</td>
            <td>
                <select id="ttype">
                    <option value="考试"/>&nbsp;考试</option>
                    <option value="考察"/>&nbsp;考察</option>
                </select>
            </td>
        </tr>
        <tr>
            <td>适用专业：</td>
            <td>
                <select id="spe">
                    <option value="计算机科学与技术"/>&nbsp;计算机科学与技术</option>
                    <option value="软件工程"/>软件工程</option>
                    <option value="通信技术"/>通信技术</option>
                    <option value="物联网"/>物联网</option>
                    <option value="网络工程"/>网络工程</option>
                </select>
            </td>
        </tr>
        <tr>
            <td>先修课程：</td>
            <td>
                <select id="firstc">
                    <option value="无">无</option>
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
            <td>课程介绍：</td>
            <td>
                <script id="profile" name="forumcontent" type="text/plain" style="width:1024px;height:300px;"></script>
            </td>
        </tr>
        <tr>
            <td>课程目标：</td>
            <td>
                <script id="goal" name="forumcontent" type="text/plain" style="width:1024px;height:300px;"></script>
            </td>

        </tr>
        <tr>
            <td>课程内容：</td>
            <td>
                <script id="context" name="forumcontent" type="text/plain" style="width:1024px;height:300px;"></script>
            </td>

        </tr>
       <tr>
           <td>总课时：</td>
           <td><input type="text" id="alltime"></td>
       </tr>
        <tr>
            <td></td>
            <td>
                <button type="button"  id="saveBtn"  >保&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp存</button> &nbsp;&nbsp;<button type="button"><a href="t_index.jsp"> 返回列表</a></button>
            </td>
        </tr>
    </table>
</form>
<script>
    $("#saveBtn").click(function () {
        var wid = sessionStorage.getItem("wid");
        var ctype = $("#ctype").val();
        var context = UE.getEditor('context').getContentTxt();
        var alltime = $("#alltime").val();
        var ttype = $("#ttype").val();
        var course = $("#course").val();
        var spe = $("#spe").val();
        var col = $("#col").val();
        var profile = UE.getEditor('profile').getContentTxt();
        var goal = UE.getEditor('goal').getContentTxt();
        var firstc = $("#firstc").val();

        $.ajax({
            url:"outline/outlineAdd",
            type:"post",
            dataType:"json",
            data:{
                "wid":wid,
                "ttype":ttype,
                "ctype":ctype,
                "alltime":alltime,
                "context":context,
                "course":course,
                "spe":spe,
                "col":col,
                "profile":profile,
                "goal":goal,
                "firstc":firstc
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


