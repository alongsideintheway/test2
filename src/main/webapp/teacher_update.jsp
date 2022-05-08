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
            font-size: larger;
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
<font color="#777777"><strong>修改信息：</strong></font>
<form id="contant">

</form>
<form   method="post" >


    <input type="hidden" id="wid"  name="wid"/>
    <input type="hidden" id="title"  name="title"/>
    <tr>
        <td>姓名：</td>
        <td><input type="text" id="name"  name="name"/></td>
    </tr>
    <br>
    <tr>
        <td>年龄：</td>
        <td><input type="text" id="age"  name="age"/></td>
    </tr>
    <br>
    <tr>
        <td>性别：</td>
        <td>
            <input type="radio"  name="sex" value="男" >男
            <input type="radio" name="sex" value="女">女
           </td>
        </td>
    </tr>
    <br>
    <tr>
        <td>简历：</td>
        <td><textarea id="detail" name="detail" rows="5" cols="30"></textarea></td>
    </tr>
    <br>
   <%-- <tr>
        <td>职称：</td>
        <td><input type="text" id="title"  name="title"/></td>
    </tr>
    <br>--%>
    <tr>
        <td>电话：</td>
        <td><input type="number" id="iphone"  name="iphone"/></td>
    </tr>
    <br>
    <tr>
        <td>email：</td>
        <td><input type="text" id="email"  name="email"/></td>
    </tr>
    <br>
    <tr>
        <td>
            <button id="updateBtn"  type="button"  >保存</button> &nbsp;&nbsp;<button type="button" > <a href="teacher_detail.jsp"> 返回列表</a></button>
        </td>
    </tr>

</form>
<script>
    var wid = sessionStorage.getItem("wid");
    $.ajax({
        url:"/teacher/findBywidTeacherDetail",
        type:"post",
        dataType:"json",
        data:{
            "wid":wid
        },
        success:function (obj){

            $("#name").val(obj.obj.name);
            $("#wid").val(obj.obj.wid);
            $("#detail").val(obj.obj.detail);
            $("#title").val(obj.obj.title);
            $('input:radio:checked').val(obj.obj.sex);
            $("#iphone").val(obj.obj.iphone);
            $("#age").val(obj.obj.age);
            $("#email").val(obj.obj.email);
        }
    })
</script>
<script>
    $("#updateBtn").click(function (){

        var name = $("#name").val();
        var wid = $("#wid").val();
        var detail = $("#detail").val();
        var sex = $('input:radio:checked').val();
        var title = $("#title").val();
        var age = $("#age").val();
        var email=$("#email").val();
        var iphone =$("#iphone").val();

        if(name==null||name==undefined||$.trim(name).length==0){
            alert("姓名不能为空！");
            return;
        }



        $.ajax({
            url: "/teacher/teacherUpdate",
            type: "post",
            dataType: "json",
            data:{
                "name":name,
                "wid":wid,
                "detail":detail,
                "sex":sex,
                "title":title,
                "age":age,
                "email":email,
                "iphone":iphone
            },
            success: function (obj) {
                console.log(obj)
                if(obj.code==2001){
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
