<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html lang="zh">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>帅哥登录</title>
    <link rel="stylesheet" type="text/css" href="css/styles.css">
    <script src="js/jquery.min.js?v=2.1.4"></script>
</head>
<body>
<div class="wrapper">

    <div class="container">
        <h1>计算机系教学材料管理系统</h1>
        <form id="userForm" class="form" action="/index.jsp">
            <span id="error" style="color: red"></span>
            <input type="text" name="uname" id="uname" placeholder="Username">
            <input type="password" name="upass" id="upass" placeholder="Password"><br>
            <input type="button"  value="提交"  id="login-button"/>
        </form>
    </div>
    <ul class="bg-bubbles">
        <li></li>
        <li></li>
    </ul>
</div>
</body>
<script>
    //账号输入框设置失去焦点事件
    $("#uname").blur(function (){
        //清空错误提示内容
        $("#error").html("").css("color","red");
        //根据输入的账户，查询是否已经注册过邮箱
        var account=$("#uname").val();
        //输入账号不能为空
        if(account==null ||$.trim(account).length==0){
            //输入的邮箱为空给出提示
            $("#error").html("账户不能为空");
            return ;
        }
        //发送ajax请求到后台
        $.ajax({
            url:"/user/findByAccount",
            type:"post",
            dataType:"json",
            data:{
                "account":account
            },
            success:function(obj){
                //根据返回的状态码给出提示
                if(obj.code==1001){
                    $("#error").html(obj.msg).css("color","orange");
                }else{
                    $("#error").html(obj.msg).css("color","red");
                }
            }
        })
    })
    $("#login-button").click(function(){
        //清空错误提示内容
        $("#error").html("").css("color","red");
        //获取输入的内容
        var account=$("#uname").val();
        var upass=$("#upass").val();
        if(account==null ||$.trim(account).length==0){
            //输入的邮箱为空给出提示
            $("#error").html("账号不能为空");
            return ;
        }
        if(upass==null ||$.trim(upass).length==0){
            //输入的邮箱为空给出提示
            $("#error").html("密码不能为空");
            return ;
        }
        //验证邮箱是否可用
        //发送ajax请求到后台
        $.ajax({
            url:"/user/findByAccount",
            type:"post",
            dataType:"json",
            data:{
                "account":account
            },
            success:function(obj){
                //根据返回的状态码给出提示
                if(obj.code==1001){
                    //邮箱正常:比较输入的密码和查询用户的密码是否一致
                    if(upass === obj.obj.password) {
                        //密码正确，登录成功，跳转到后台主页面
                        if(obj.obj.type==0) {
                            sessionStorage.setItem("uname", obj.obj.type);
                            location = "http://localhost:8080/index.jsp";
                        }
                        if(obj.obj.type==1) {
                            sessionStorage.setItem("uname", obj.obj.type);
                            sessionStorage.setItem("wid",obj.obj.wid);
                            location = "http://localhost:8080/t_index.jsp";
                        }
                        if(obj.obj.type==2) {
                            sessionStorage.setItem("uname", obj.obj.type);
                            location = "http://localhost:8080/d_index.jsp";
                        }
                        if(obj.obj.type==3) {
                            sessionStorage.setItem("uname", obj.obj.type);
                            location = "http://localhost:8080/o_index.jsp";
                        }
                    }else{
                        //密码不正确
                        $("#error").html("密码错误").css("color","red");
                    }
                }else{
                    $("#error").html(obj.msg).css("color","red");
                }
            }
        })
    })
</script>
</html>
