<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title></title>
    <meta charset="UTF-8">
    <link rel="stylesheet" type="text/css" href="css/bootstrap.css" />
    <link rel="stylesheet" type="text/css" href="css/bootstrap-responsive.css" />
    <link rel="stylesheet" type="text/css" href="css/style.css" />
    <%--<script type="text/javascript" src="js/jquery.js"></script>
    <script type="text/javascript" src="js/jquery.sorted.js"></script>--%>
    <script src="js/jquery-3.5.1.min.js"></script>
    <script type="text/javascript" src="js/bootstrap.js"></script>
    <script type="text/javascript" src="js/ckform.js"></script>
    <script type="text/javascript" src="js/common.js"></script>
    <script type="text/javascript" src="js/showdate.js"></script>
    <script src="js/jquery.min.js?v=2.1.4"></script>
    <style type="text/css">
        body {font-size: 20px;
            padding-bottom: 40px;
            background-color:#e9e7ef;
            font-size:17px;
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
<h3><strong>大纲具体：</strong></h3>
<table class="table table-condensed" id="t_detail">

</table>

<script>
    //获取传入wid
    var id = location.search.split("=")[1];
    console.log(id);
    $.ajax({
        url:"/outline/findByidoutlineDetail",
        type:"post",
        dataType:"json",
        data:{
            "id":id
        },
        success:function (obj){
            if(obj.code==3001){
                var str="<tr>\n" +
                    "\t              <td height=\"28\" align=\"center\">课程介绍：</td>\n" +
                    "\t              <td height=\"28\" id=\"email\">"+obj.obj.profile+"</td>\n" +
                    "\t            </tr>\n" +
                    "\t\t\t\t  <tr>\n" +
                    "\t\t\t\t\t  <td height=\"28\" align=\"center\">课程目标：</td>\n" +
                    "\t\t\t\t\t  <td height=\"28\" id=\"content\">"+obj.obj.goal+"<td>\n"+
                    "\t\t\t\t  </tr>\n" +
                    "\t            <tr>\n" +
                    "\t              <td height=\"28\" align=\"center\">课程内容：</td>\n" +
                    "\t              <td height=\"28\" id=\"time\" >"+obj.obj.context+"</td>\n" +
                    "\t            </tr>";

                $("#t_detail").append(str);
                alert(obj.msg);
            }else
                alert(obj.msg);

        }

    })
</script>
</body>
</html>
<%--var str="<tr>\n" +--%>
<%--"        <td>课程介绍：</td>\n" +--%>
<%--"        <td><textarea id=\"profile\" name=\"detail\" rows=\"5\" cols=\"30\">"+obj.obj.profile+"</textarea></td>\n" +--%>
<%--"    </tr>\n" +--%>
<%--"    <tr>\n" +--%>
<%--    "        <td>课程目标：</td>\n" +--%>
<%--    "        <td><textarea id=\"goal\" name=\"detail\" rows=\"5\" cols=\"30\">"+obj.obj.goal+"</textarea></td>\n" +--%>
<%--    "    </tr>\n" +--%>
<%--"    <tr>\n" +--%>
<%--    "        <td>课程内容：</td>\n" +--%>
<%--    "        <td><textarea id=\"context\" name=\"detail\" rows=\"5\" cols=\"30\">"+obj.obj.context+"</textarea></td>\n" +--%>
<%--    "    </tr>\n" +--%>
<%--"    <tr>";--%>