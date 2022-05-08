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
<font color="#777777"><strong>添加成果：</strong></font>
<form id="typeForm" action="#" method="post" class="definewidth m20" >
    <table style="margin-left:10px;margin-top:3px;">
        <tr>
            <td>成果类型：</td>
            <td>
                <select id="type">
                    <option value="个人学术类"/>&nbsp;个人学术类</option>
                    <option value="个人实践类"/>&nbsp;个人实践类</option>
                    <option value="团体学术类"/>&nbsp;团体学术类</option>
                    <option value="团体实践类"/>&nbsp;团体实践类</option>
                    <option value="社会竞赛类"/>&nbsp;社会竞赛类</option>
                </select>
            </td>
        </tr>
        <tr>
            <td>获得奖项：</td>
            <td><input type="text" id="award"/></td>
        </tr>

        <tr>
            <td>详情介绍：</td>
            <td><textarea id="detail"  rows="5" cols="30"></textarea></td>
        </tr>

        <tr>
            <td>获奖时间：</td>
            <td><input type="datetime-local" id="time" /></td>
        </tr>

        <tr>
            <td></td>
            <td>
                <button type="button"  id="saveBtn"  >保&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp存</button> &nbsp;&nbsp;<button type="button"><a href="reap_list.jsp"> 返回列表</a></button>
            </td>
        </tr>
    </table>
</form>
<script>
    $("#saveBtn").click(function () {
        var wid = sessionStorage.getItem("wid");
        var type = $("#type").val();
        var detail = $("#detail").val();
        var time = $("#time").val();
        var award = $("#award").val();

        $.ajax({
            url:"reap/reapAdd",
            type:"post",
            dataType:"json",
            data:{
                "wid":wid,
                "type":type,
                "detail":detail,
                "time":time,
                "award":award
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


