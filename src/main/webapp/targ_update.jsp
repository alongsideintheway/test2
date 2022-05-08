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
<font color="#777777"><strong>实际任务报告填写：</strong></font>
<form id="contant">

</form>
<form   method="post" >


    <input type="hidden" id="account"  name="account"/>
    <input type="hidden" id="wid"  name="wid"/>
    <input type="hidden" id="uname"  name="uname"/>
    <tr>
        <td>上课周数：</td>
        <td><input type="number" id="czhou"  /></td>
    </tr>
    <br>
    <tr>
        <td>周学时数：</td>
        <td>
        <td><input type="number" id="cxues"  /></td>
        </td>
    </tr>
    <br>
    <tr>
        <td>课程性质：</td>
        <td>

            <select id="csex">
                <option value="实验"/>&nbsp;实验</option>
                <option value="讲课"/>&nbsp;讲课</option>
            </select>
        </td>
    </tr>
    <br>
    <tr>
        <td>上课形式：</td>
        <td>

            <select id="classf">
                <option value="单班"/>&nbsp;单班</option>
                <option value="多班"/>&nbsp;多班</option>
            </select>
        </td>
    </tr>
    <br>
            <tr>
                <td >授课时间：</td>
                <td>
                    <select id="xinq">
                        <option value="星期一"/>&nbsp;星期一</option>
                        <option value="星期二"/>&nbsp;星期二</option>
                        <option value="星期三"/>&nbsp;星期三</option>
                        <option value="星期四"/>&nbsp;星期四</option>
                        <option value="星期五"/>&nbsp;星期五</option>
                        <option value="星期六"/>&nbsp;星期六</option>
                        <option value="星期天"/>&nbsp;星期天</option>
                    </select>
                    <select id="jie">
                        <option value="1-2"/>&nbsp;1-2</option>
                        <option value="3-4"/>&nbsp;3-4</option>
                        <option value="5-6"/>&nbsp;5-6</option>
                        <option value="7-8"/>&nbsp;7-8</option>
                    </select>
                </td>
            </tr>
    <br>
            <tr>
                <td >授课地点：</td>
                <td>

                    <select id="loc">
                        <option value="yf3401"/>&nbsp;yf3041</option>
                        <option value="x301"/>&nbsp;x301</option>
                        <option value="yf3201"/>&nbsp;yf3201</option>
                        <option value="yf2301"/>&nbsp;yf2301</option>
                        <option value="5302"/>&nbsp;5302</option>
                        <option value="x408"/>&nbsp;x408</option>
                        <option value="x506"/>&nbsp;x506</option>
                    </select>
                </td>
            </tr>
    <br>
    <tr>
        <td>
            <button id="updateBtn"  type="button"  >保存</button> &nbsp;&nbsp;<button type="button" > <a href="targ_list.jsp"> 返回列表</a></button>
        </td>
    </tr>

</form>


<script>
var id = location.search.split("=")[1];
    $("#updateBtn").click(function (){
        var czhou = $("#czhou").val();
        var cxues = $("#cxues").val();
        var xinq = $("#xinq").val();
        var jie = $("#jie").val();
        var loc = $("#loc").val();
        var csex = $("#csex").val();
        var classf = $("#classf").val();
        $.ajax({
            url: "/arg/argUpdate",
            type: "post",
            dataType: "json",
            data:{
                "id":id,
                "czhou":czhou,
                "cxues":cxues,
                "xinq":xinq,
                "jie":jie,
                "loc":loc,
                "csex":csex,
                "classf":classf
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

