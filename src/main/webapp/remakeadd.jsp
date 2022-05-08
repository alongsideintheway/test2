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
            <td>评分：</td>
            <td>
                <input type="number"  id=grade placeholder="60--100" >
            </td>
        </tr>
        <tr>
            <td >总体评价及建议：</td>

            <td><textarea id="remake" rows="5" cols="30"></textarea></td>

        </tr>

            <td></td>
            <td>
                <button type="button"  id="saveBtn"  >保&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp存</button> &nbsp;&nbsp;<button type="button"><a href="javascript:history.back(-1)">返回列表</a></button>
            </td>
        </tr>
    </table>
</form>
<script>
    var cid = location.search.split("=")[1];
    $("#saveBtn").click(function () {
        var grade = $("#grade").val();
        var remake = $("#remake").val();



        $.ajax({
            url:"tpace/remakeAdd",
            type:"post",
            dataType:"json",
            data:{
                "cid":cid,
               "grade":grade,
                "remake":remake
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


