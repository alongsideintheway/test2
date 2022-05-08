
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
<form class="form-inline definewidth m20" action="#" method="get">
    <font color="#777777"><strong>审核评价：</strong></font>

</form>
<table class="table table-condensed" id="t_detail">

</table>

<script>
    //获取传入wid
    var cid = location.search.split("=")[1];

    $.ajax({
        url:"/tpace/ctpaceBycid",
        type:"post",
        dataType:"json",
        data:{
            "cid":cid
        },
        success:function (obj){
            if(obj.code==1001){
                var str="      <tr>              \n" +
                    "\t              <td width=\"18%\" height=\"30\" align=\"center\">成绩：</td>\n" +
                    "\t              <td width=\"82%\" class=\"word_grey\" id=\"wid\">"+obj.obj.grade+"</td>\n" +
                    "\t            </tr>\n" +
                    "\t\t\t\t<tr>              \n" +
                    "\t              <td width=\"18%\" height=\"30\" align=\"center\">评价：</td>\n" +
                    "\t              <td width=\"82%\" class=\"word_grey\" id=\"name\">"+obj.obj.remake+"</td>\n" +
                    "\t   </tr>";
                $("#t_detail").append(str);
                alert(obj.msg);
            }else
                alert(obj.msg);

        }

    })
</script>
</body>
</html>