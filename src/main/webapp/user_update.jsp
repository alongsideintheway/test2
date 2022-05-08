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


        <input type="hidden" id="account"  name="account"/>
    <input type="hidden" id="wid"  name="wid"/>
    <input type="hidden" id="uname"  name="uname"/>
        <tr>
            <td>密码：</td>
            <td><input type="text" id="password"  name="password"/></td>
        </tr>
    <br>
        <tr>
            <td>权限：</td>
            <td>
                <input type="radio"  name="type" value="0" >管理员
                <input type="radio" name="type" value="1">教师
                <input type="radio"  name="type" value="2" >系主任
                <input type="radio"  name="type" value="3">督导员</td>
            </td>
        </tr>
    <br>
        <tr>
            <td>
                <button id="updateBtn"  type="button"  >保存</button> &nbsp;&nbsp;<button type="button" > <a href="user_list.jsp"> 返回列表</a></button>
            </td>
        </tr>

</form>
<script>
  var wid = location.search.split("=")[1];
  $.ajax({
      url:"/user/userfindBywid",
      type:"post",
      dataType:"json",
      data:{
          "wid":wid
      },
      success:function (obj){
     var str=" <tr>\n" +
         "            <td>工号：</td>\n" +
         "            <td>"+obj.obj.wid+"</td>\n" +
         "        </tr>\n" +
         "        <tr>\n" +
         "            <td>姓名：</td>\n" +
         "            <td>"+obj.obj.uname+"</td>\n" +
         "        </tr>"
          $("#contant").append(str);
          $("#account").val(obj.obj.account);
          $("#wid").val(obj.obj.wid);
          $("#uname").val(obj.obj.uname);
          $("#password").val(obj.obj.password);
          $('input:radio:checked').val(obj.obj.type);

      }
  })
</script>
<script>
    $("#updateBtn").click(function (){

        var account = $("#account").val();
        var upass = $("#password").val();
        var uname = $("#uname").val();
        var type = $('input:radio:checked').val();
        var wid = $("#wid").val();

        if(upass==null||upass==undefined||$.trim(upass).length==0){
            alert("密码不能为空！");
            return;
        }



        $.ajax({
            url: "/user/userUpdate",
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

