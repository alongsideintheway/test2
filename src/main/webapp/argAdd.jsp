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
    <script type="application/javascript">

        var ue = UE.getEditor('editor');

        function commit(){
            $("#form3").submit();
        }
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
<body>
<form action="#" method="post" class="definewidth m20" enctype="multipart/form-data">
    <table class="table table-bordered table-hover m10" style="margin-left:10px;margin-top:3px;">

<tr>
    <td>课程：</td>
    <td><select
            id="course">
        <%
            List<String> list=new ArrayList<String>();
            Class.forName("com.mysql.jdbc.Driver");
           Connection connection = DriverManager.getConnection("jdbc:mysql://localhost:3306/bysj","root","root");
           Statement statement = connection.createStatement();
           String sql = "SELECT course FROM course";
           ResultSet rst = statement.executeQuery(sql);
            while(rst.next())
            {
                list.add(rst.getString("course"));
            }
            connection.close();
        %>



            <%for(int i=0;i<list.size();i++){%>

            <option><%=list.get(i)%></option>

            <%}%>


    </select></td>
</tr>

        <tr>
            <td >教师名：</td>
            <td>
                <select id="wid">
                    <option datatype="int" value="10086"/>&nbsp;赵彩霞(10086)</option>
                    <option datatype="int" value="10022"/>&nbsp;王一鸣(10022)</option>
                    <option datatype="int" value="10024"/>&nbsp;昭理(10024)</option>
                    <option datatype="int" value="10011"/>&nbsp;程鹤(10011)</option>
                    <option datatype="int" value="10003"/>&nbsp;月小桂(10003)</option>
                    <option datatype="int" value="10006"/>&nbsp;赵怡婷(10006)</option>
                </select>
            </td>
        </tr>

        <tr>
            <td >授课专业：</td>
            <td>
                <select id="twh">
                    <option value="计科"/>&nbsp;计科</option>
                    <option value="网工"/>&nbsp;网工</option>
                    <option value="通信"/>&nbsp;通信</option>
                    <option value="软件"/>&nbsp;软件</option>
                </select>
            </td>
        </tr>
        <tr>
            <td >授课年级：</td>
            <td>
                <select id="tage">
                    <option value="2020"/>18级</option>
                    <option value="2021"/>19级</option>
                </select>
            </td>
        </tr>
        <tr>
            <td >授课班级：</td>
            <td>
                <select id="tclass">
                    <option value="计科181"/>计科181</option>
                    <option value="计科182"/>计科182</option>
                    <option value="网工181"/>网工181</option>
                    <option value="通信181"/>通信181</option>
                    <option value="软件181"/>软件181</option>
                    <option value="计科191"/>计科191</option>
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
                <button type="button"  id="saveBtn"  >保&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp存</button> &nbsp;&nbsp;<button type="button"><a href="arg.jsp"> 返回列表</a></button>
            </td>
        </tr>
    </table>
</form>

</body>
<script>
    $("#saveBtn").click(function () {
        var wid = $("#wid").val();
        var course =$("#course").val();

        var twh = $("#twh").val();
        var tage = $("#tage").val();
        var tclass = $("#tclass").val();


        $.ajax({
            url:"arg/argAdd",
            type:"post",
            dataType:"json",
            data:{
                "course":course,
                "wid":wid,

                "twh":twh,

                "tage":tage,
                "tclass":tclass,

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

