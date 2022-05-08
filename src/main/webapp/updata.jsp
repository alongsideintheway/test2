<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>file upload</title>
    <script src="js/jquery-3.5.1.min.js"></script>
</head>
<body>
<div style="width:100%;text-align:center">
    <form action="./file/fileupload" method="post" enctype="multipart/form-data">

        <label>文件上传</label>
        <td>课程：</td>
        <td>
            <select id="course" name="course">
                <option value="c语言程序设计基础"/>&nbsp;c语言程序设计基础</option>
                <option value="java面向对象编程"/>&nbsp;java面向对象编程</option>
                <option value="Python编程"/>Python编程</option>
                <option value="数据结构"/>数据结构</option>
                <option value="计算机网络"/>计算机网络</option>
                <option value="操作系统"/>操作系统</option>
                <option value="数字逻辑"/>数字逻辑</option>
            </select>
        </td>
        <br>
        <input type="hidden" id="wid"  name="wid" >
        <input type="file" name="file"><br>
        内容简介：<input type="text" name="profile" placeholder="例如第一章第三节线性表"><br>
        <input type="submit" value="提交">

    </form>
</div>

<script>
    const wid = sessionStorage.getItem("wid");
       $("#wid").val(wid);
</script>
</body>
</html>
