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
<h3><strong>基本信息：</strong></h3>
   <table class="table table-condensed" id="t_detail">
   <%--            <tr>
	              <td width="18%" height="30" align="center">教师工号：</td>
	              <td width="82%" class="word_grey" id="wid"></td>
	            </tr>
				<tr>              
	              <td width="18%" height="30" align="center">姓名：</td>
	              <td width="82%" class="word_grey" id="name"></td>
	            </tr>
	            <tr>
	              <td height="28" align="center">年龄：</td>
	              <td height="28" id="age"></td>
	            </tr>
				<tr>
	              <td height="28" align="center">性别：</td>
	              <td height="28" id="sex"></td>
	            </tr>
	            <tr>
	              <td height="28" align="center">简历：</td>
	              <td height="28" id="detail"></td>
	            </tr> 
			   
	            <tr>
	              <td height="28" align="center">职称：</td>
	              <td height="28" id="tit"></td>
	            </tr>
	   <tr>
		   <td height="28" align="center">电话：</td>
		   <td height="28" id="phone"></td>
	   </tr>
	   <tr>
		   <td height="28" align="center">邮箱：</td>
		   <td height="28" id="email"></td>
	   </tr>--%>
   </table>
       
<script>
	//获取传入wid
	var wid = location.search.split("=")[1];
	console.log(wid);
	$.ajax({
		url:"/teacher/findBywidTeacherDetail",
		type:"post",
	dataType:"json",
		data:{
            "wid":wid
		},
		success:function (obj){
			if(obj.code==3001){
				var str="      <tr>              \n" +
						"\t              <td width=\"18%\" height=\"30\" align=\"center\">教师工号：</td>\n" +
						"\t              <td width=\"82%\" class=\"word_grey\" id=\"wid\">"+obj.obj.wid+"</td>\n" +
						"\t            </tr>\n" +
						"\t\t\t\t<tr>              \n" +
						"\t              <td width=\"18%\" height=\"30\" align=\"center\">姓名：</td>\n" +
						"\t              <td width=\"82%\" class=\"word_grey\" id=\"name\">"+obj.obj.name+"</td>\n" +
						"\t            </tr>\n" +
						"\t            <tr>\n" +
						"\t              <td height=\"28\" align=\"center\">年龄：</td>\n" +
						"\t              <td height=\"28\" id=\"age\">"+obj.obj.age+"</td>\n" +
						"\t            </tr>\n" +
						"\t\t\t\t<tr>\n" +
						"\t              <td height=\"28\" align=\"center\">性别：</td>\n" +
						"\t              <td height=\"28\" id=\"sex\">"+obj.obj.sex+"</td>\n" +
						"\t            </tr>\n" +
						"\t            <tr>\n" +
						"\t              <td height=\"28\" align=\"center\">简历：</td>\n" +
						"\t              <td height=\"50\" id=\"detail\">"+obj.obj.detail+"</td>\n" +
						"\t            </tr> \n" +
						"\t\t\t   \n" +
						"\t            <tr>\n" +
						"\t              <td height=\"28\" align=\"center\">职称：</td>\n" +
						"\t              <td height=\"28\" id=\"tit\">"+obj.obj.title+"</td>\n" +
						"\t            </tr>\n" +
						"\t   <tr>\n" +
						"\t\t   <td height=\"28\" align=\"center\">电话：</td>\n" +
						"\t\t   <td height=\"28\" id=\"phone\">"+obj.obj.iphone+"</td>\n" +
						"\t   </tr>\n" +
						"\t   <tr>\n" +
						"\t\t   <td height=\"28\" align=\"center\">邮箱：</td>\n" +
						"\t\t   <td height=\"28\" id=\"email\">"+obj.obj.email+"</td>\n" +
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
