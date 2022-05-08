<%--
  Created by IntelliJ IDEA.
  User: xcdnd
  Date: 2022/3/20
  Time: 17:31
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title></title>
    <meta charset="UTF-8">
    <link rel="stylesheet" type="text/css" href="css/bootstrap.css" />
    <link rel="stylesheet" type="text/css" href="css/bootstrap-responsive.css" />
    <link rel="stylesheet" type="text/css" href="css/style.css" />
    <script src="js/jquery-3.5.1.min.js"></script>
    <script type="text/javascript" src="js/bootstrap.js"></script>
    <script type="text/javascript" src="js/ckform.js"></script>
    <script type="text/javascript" src="js/common.js"></script>
    <script type="text/javascript" src="js/jquerypicture.js"></script>


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
<font color="#777777"><strong>添加用户：</strong></font>
<form action="#" method="post" >
    <table style="margin-left:10px;margin-top:3px;">
        <%--页面传递的typeid 充当typePid--%>
        <tr>
            <td>用户名：</td>
            <td><input type="number" id="account" name="account" style="width:400px;" /></td>
        </tr>

        <tr>
            <td>密码：</td>
            <td><input type="text" id="upass" name="upss" style="width:400px;" /></td>
        </tr>

            <tr>
                <td>姓名：</td>
                <td><input type="text" id="uname"name="uname" style="width:400px;"/></td>
            </tr>

            <tr>
                <td>类别：</td>
                <td>
                  <%--  <input type="text" id="type" name="wid" style="width:400px;"/></td>--%>
                <input type="radio"  name="type" value="0" checked="checked">管理员
                    <input type="radio" name="type" value="1">教师
                    <input type="radio"  name="type" value="2" >系主任
                    <input type="radio"  name="type" value="3">督导员</td>
            </tr>

            <tr>
                <td>工号：</td>
                <td><input type="text" id="wid" name="wid" style="width:400px;"/></td>
            </tr>
        <tr>
            <td></td>
            <td>
                <button style="margin-left:5px;"type="button"  id="saveBtn" >保&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp存</button> &nbsp;&nbsp;<button type="button"><a href="user_list.jsp"> 返回列表</a></button>
            </td>
        </tr>
    </table>
</form>

</body>
<script>
    $("#saveBtn").click(function (){
       var account = $("#account").val();
       var upass = $("#upass").val();
       var uname = $("#uname").val();
       var type = $('input:radio:checked').val();
       var wid = $("#wid").val();

        if(account==null||account==undefined||$.trim(account).length==0){
            alert("帐号不能为空！");
            return;
        }
        if(upass==null||upass==undefined||$.trim(upass).length==0){
            alert("密码不能为空！");
            return;
        }
        if(uname==null||uname==undefined||$.trim(uname).length==0){
            alert("姓名不能为空！");
            return;
        }
        if(type==null||type==undefined||$.trim(type).length==0){
            alert("类型不能为空！");
            return;
        }
        if(wid==null||uname==undefined||$.trim(wid).length==0){
            alert("工号不能为空！");
            return;
        }
        $.ajax({
            url: "/user/userAdd",
            type: "post",
            dataType: "json",
            data:{
                "account":account,
                "upass":upass,
                "type":type,
                "uname":uname,
                "wid":wid
            },
            success: function (obj) {
                console.log(obj)
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



