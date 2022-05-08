<%@ page import="java.sql.*" %>
<%@ page import="java.util.List" %>
<%@ page import="java.util.ArrayList" %>
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
<form action="#" method="post" class="definewidth m20" enctype="multipart/form-data">
    <table class="table table-bordered table-hover m10" style="margin-left:10px;margin-top:3px;">

        <tr>
            <td >考核方式：</td>
            <td>
                <select id="khfs">
                    <option value="无"/>&nbsp;无</option>
                    <option  value="考试"/>&nbsp;考试</option>
                    <option  value="考察"/>&nbsp;考察</option>

                </select>
            </td>
        </tr>

        <tr>
            <td >考核材料类型：</td>
            <td>
                <select id="khfslx">
                    <option value="无"/>&nbsp;无</option>
                    <option value="大作业"/>&nbsp;大作业</option>
                    <option value="试卷"/>&nbsp;试卷</option>
                    <option value="纸质"/>&nbsp;纸质</option>
                    <option value="报告"/>&nbsp;报告</option>

                </select>
            </td>
        </tr>
        <tr>
            <td >实验平台：</td>
            <td>
                <select id="sypt">
                    <option value="无"/>&nbsp;无</option>
                    <option value="泛雅"/>泛雅</option>
                    <option value="实验室"/>实验室</option>

                </select>
            </td>
        </tr>
        <tr>
            <td >试卷提交：</td>
            <td>
                <select id="sj">
                    <option datatype="int" value="0"/>否</option>
                    <option datatype="int" value="1"/>是</option>
                </select>
            </td>
        </tr>
        <tr>
            <td >考察材料提交：</td>
            <td>
                <select id="kccl">
                    <option datatype="int" value="0"/>否</option>
                    <option datatype="int" value="1"/>是</option>
                </select>
            </td>
        </tr>
        <tr>
            <td >教学大纲提交：</td>
            <td>
                <select id="jxdg">
                    <option datatype="int" value="0"/>否</option>
                    <option datatype="int" value="1"/>是</option>
                </select>
            </td>
        </tr>
        <tr>
            <td >教学进度表提交：</td>
            <td>
                <select id="jxjd">
                    <option datatype="int" value="0"/>否</option>
                    <option datatype="int" value="1"/>是</option>
                </select>
            </td>
        </tr>
        <tr>
            <td >典型教案提交：</td>
            <td>
                <select id="dxal">
                    <option datatype="int" value="0"/>否</option>
                    <option datatype="int" value="1"/>是</option>
                </select>
            </td>
        </tr>
        <tr>
            <td >小节表提交：</td>
            <td>
                <select id="xjb">
                    <option datatype="int" value="0"/>否</option>
                    <option datatype="int" value="1"/>是</option>
                </select>
            </td>
        </tr>
        <tr>
            <td >记分册提交：</td>
            <td>
                <select id="jfc">
                    <option datatype="int" value="0"/>否</option>
                    <option datatype="int" value="1"/>是</option>
                </select>
            </td>
        </tr>
        <tr>
            <td >考核说明提交：</td>
            <td>
                <select id="kcsm">
                    <option datatype="int" value="0"/>否</option>
                    <option datatype="int" value="1"/>是</option>
                </select>
            </td>
        </tr>


        <%--        <tr>--%>
        <%--            <td >授课时间：</td>--%>
        <%--            <td>--%>
        <%--                <select id="xinq">--%>
        <%--                    <option value="星期一"/>&nbsp;星期一</option>--%>
        <%--                    <option value="星期二"/>&nbsp;星期二</option>--%>
        <%--                    <option value="星期三"/>&nbsp;星期三</option>--%>
        <%--                    <option value="星期四"/>&nbsp;星期四</option>--%>
        <%--                    <option value="星期五"/>&nbsp;星期五</option>--%>
        <%--                    <option value="星期六"/>&nbsp;星期六</option>--%>
        <%--                    <option value="星期天"/>&nbsp;星期天</option>--%>
        <%--                </select>--%>
        <%--                <select id="jie">--%>
        <%--                    <option value="1-2"/>&nbsp;1-2</option>--%>
        <%--                    <option value="3-4"/>&nbsp;3-4</option>--%>
        <%--                    <option value="5-6"/>&nbsp;5-6</option>--%>
        <%--                    <option value="7-8"/>&nbsp;7-8</option>--%>
        <%--                </select>--%>
        <%--            </td>--%>
        <%--        </tr>--%>
        <%--        <tr>--%>
        <%--            <td >授课地点：</td>--%>
        <%--            <td>--%>

        <%--                <select id="loc">--%>
        <%--                    <option value="yf3401"/>&nbsp;yf3041</option>--%>
        <%--                    <option value="x301"/>&nbsp;x301</option>--%>
        <%--                    <option value="yf3201"/>&nbsp;yf3201</option>--%>
        <%--                    <option value="yf2301"/>&nbsp;yf2301</option>--%>
        <%--                    <option value="5302"/>&nbsp;5302</option>--%>
        <%--                    <option value="x408"/>&nbsp;x408</option>--%>
        <%--                    <option value="x506"/>&nbsp;x506</option>--%>
        <%--                </select>--%>
        <%--            </td>--%>
        <%--        </tr>--%>
        <tr>
            <td></td>
            <td>
                <button type="button"  id="saveBtn"  >保&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp存</button> &nbsp;&nbsp;<button type="button"><a href="moq.jsp"> 返回列表</a></button>
            </td>
        </tr>
    </table>
</form>

</body>
<script>
    var cid = location.search.split("=")[1];

    $("#saveBtn").click(function () {
        var khfs = $("#khfs").val();
        var khfslx =$("#khfslx").val();
        var sypt = $("#sypt").val();
        var sj = $("#sj").val();
        var kccl = $("#kccl").val();
        var jxdg = $("#jxdg").val();
        var jxjd = $("#jxjd").val();
        var dxal = $("#dxal").val();
        var xjb = $("#xjb").val();
        var jfc = $("#jfc").val();
        var kcsm = $("#kcsm").val();


        $.ajax({
            url:"tpace/tpaceupdate",
            type:"post",
            dataType:"json",
            data:{
                "cid":cid,
                "khfs":khfs,
                "khfslx":khfslx,
                "sypt":sypt,
                "sj":sj,
                "kccl":kccl,
                "jxdg":jxdg,
                "jxjd":jxjd,
                "dxal":dxal,
                "xjb":xjb,
                "jfc":jfc,
                "kcsm":kcsm
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
</html>

