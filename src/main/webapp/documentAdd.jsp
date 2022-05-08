<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title></title>
    <meta charset="UTF-8">
    <link rel="stylesheet" type="text/css" href="css/bootstrap.css" />
    <link rel="stylesheet" type="text/css" href="css/bootstrap-responsive.css" />
    <link rel="stylesheet" type="text/css" href="css/style.css" />
    <script type="text/javascript" src="js/jquery2.js"></script>
    <script type="text/javascript" src="js/jquery2.sorted.js"></script>
    <script type="text/javascript" src="js/bootstrap.js"></script>
    <script type="text/javascript" src="js/ckform.js"></script>
    <script type="text/javascript" src="js/common.js"></script>
    <script type="text/javascript" src="js/jquerypicture.js"></script>
    <script type="text/javascript" charset="utf-8" src="utf8-jsp/ueditor.config.js"></script>
    <script type="text/javascript" charset="utf-8" src="utf8-jsp/ueditor.all.min.js"> </script>
    <script type="text/javascript" charset="utf-8" src="utf8-jsp/lang/zh-cn/zh-cn.js"></script>
    <script type="application/javascript">

        var ue = UE.getEditor('editor');

        function commit(){
            $("#form3").submit();
        }
    </script>
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
<body>
<form action="#" method="post" class="definewidth m20" enctype="multipart/form-data">
<table class="table table-bordered table-hover m10" style="margin-left:10px;margin-top:3px;">
    <tr>
        <td width="10%" class="tableleft">类别</td>
        <td>
            <select name="bigTypeId">
            <option value="0">大类</option>
            <option value='1'>教育</option>
            <option value='7'>娱乐</option>
            </select>
            <select name="bigTypeId">
                <option value="0">小类</option>
                <option value='1'>教育</option>
                <option value='7'>娱乐</option>
            </select>
        </td>
    </tr>
    
   
    <tr>
        <td class="tableleft">博客标题</td>
        <td><input type="text" name="videosName"/></td>
    </tr>
    <tr>
        <td class="tableleft">关键字</td>
        <td><input type="text" name="GoodsNormalPrice"/></td>
    </tr>
    <tr>
        <td class="tableleft">博客内容</td>
        <td>
            <script id="editor" name="forumcontent" type="text/plain" style="width:1024px;height:300px;"></script>
        </td>
    </tr>

    <tr>
        <td class="tableleft"></td>
        <td>
            <button style="margin-left:5px;"type="submit" class="btn btn-primary" type="button"  >保存</button> &nbsp;
            &nbsp;
            <button type="button" class="btn btn-success" name="backid" id="backid">返回列表</button>
        </td>
    </tr>
</table>
</form>

</body>
</html>

