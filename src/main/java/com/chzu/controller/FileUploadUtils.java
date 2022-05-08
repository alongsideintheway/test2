package com.chzu.controller;

import com.chzu.pojo.Reap;
import com.chzu.pojo.Updata;
import com.chzu.pojo.User;
import com.chzu.service.TeacherService;
import com.chzu.service.UpdataService;
import com.chzu.util.ResultVo;
import com.github.pagehelper.PageInfo;
import com.google.common.annotations.VisibleForTesting;
import org.apache.commons.io.FileUtils;
import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.sound.sampled.ReverbType;
import java.io.File;
import java.io.IOException;
import java.io.UnsupportedEncodingException;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;
import java.util.List;

@Controller
@RequestMapping("/file")
public class FileUploadUtils {
    @Autowired
    private UpdataService updataService;

    ResultVo vo = null;
    @RequestMapping("/fileupload")
    public   void upload(MultipartFile file,int wid, HttpServletRequest request, HttpServletResponse response ,String course,String profile) throws IOException {
        System.out.println(course);
        System.out.println(wid);
        System.out.println(profile);
        SimpleDateFormat sdf = new SimpleDateFormat("yyyyMMddHHmmssSS");
        String res = sdf.format(new Date());

        // uploads文件夹位置
        String rootPath = request.getSession().getServletContext().getRealPath("resource/uploads/");
        // 原始名称
        String originalFileName = file.getOriginalFilename();
        // 新文件名
        String newFileName = "sliver" + res + originalFileName.substring(originalFileName.lastIndexOf("."));
        // 创建年月文件夹
        Calendar date = Calendar.getInstance();
        File dateDirs = new File(date.get(Calendar.YEAR) + File.separator + (date.get(Calendar.MONTH)+1));

        // 新文件
        File newFile = new File(rootPath + File.separator + dateDirs + File.separator + newFileName);
        // 判断目标文件所在目录是否存在
        if( !newFile.getParentFile().exists()) {
            // 如果目标文件所在的目录不存在，则创建父目录
            newFile.getParentFile().mkdirs();
        }
        String url  = newFile.toString();
        System.out.println(url);
        Updata updata = new Updata();
        updata.setUpdatalocation(url);
        updata.setWid(wid);
        updata.setCourse(course);
        updata.setProfile(profile);
     int row =  updataService.updata(updata);
     System.out.println(row);
        // 将内存中的数据写入磁盘
        file.transferTo(newFile);
        // 完整的url
        String fileUrl = date.get(Calendar.YEAR) + "/" + (date.get(Calendar.MONTH)+1) + "/" + newFileName;
        System.out.println(fileUrl);
        response.sendRedirect("/updata_list.jsp");
    }


    @RequestMapping("/downLoad")
    public ResponseEntity<byte[]> down(String wid) throws Exception {

        File file = new File(wid);
        String douName = file.getName();
        HttpHeaders httpHeaders = new HttpHeaders();
        String name = new String(douName.getBytes("UTF-8"),"ISO-8859-1");
        httpHeaders.setContentDispositionFormData("attachment", name);
        httpHeaders.setContentType(MediaType.APPLICATION_OCTET_STREAM);
        return new ResponseEntity<byte[]>(
                FileUtils.readFileToByteArray(file),    //把一个文件转换成字节数组返回
                httpHeaders,                                                //http请求头
                HttpStatus.OK                                      //200
        );
    }

    @RequestMapping("findfilelocationbywid")
    @ResponseBody
    private ResultVo findfilelocationbywid(int currentPage,int wid){
        PageInfo<Updata> userPageInfo = updataService.findfilelocationbywid(currentPage,wid);
        if (userPageInfo!=null){
            vo = new ResultVo(5001,"查询成功",userPageInfo);
        }else{
            vo = new ResultVo(5002,"查询失败");
        }
        return vo;
    }

    @RequestMapping("deletefile")
    @ResponseBody
    private ResultVo deletefile(int id){
        int row = updataService.deletefilebyid(id);
        if(row>0){
            vo = new ResultVo(4001,"删除成功");
        }else
        {
            vo = new ResultVo(4002,"删除失败");
        }
        return vo;
    }

    @RequestMapping("findAll")
    @ResponseBody
    private ResultVo findAll(int currentPage){
        PageInfo<Updata> userPageInfo = updataService.findAll(currentPage);
        if (userPageInfo!=null){
            vo = new ResultVo(5001,"查询成功",userPageInfo);
        }else{
            vo = new ResultVo(5002,"查询失败");
        }
        return vo;
    }

    @RequestMapping("findfileLikeUname")
    @ResponseBody
    private ResultVo findfileLikeUname(String uname){
        List<Updata> reaps = updataService.findfileLikeUname(uname);
        if (reaps != null || reaps.size() > 0) {
            vo = new ResultVo(2001, "查询成功", reaps);
        } else {
            vo = new ResultVo(2002, "查询失败");
        }
        return vo;

    }
    @RequestMapping("updatabywidandcourse")
    @ResponseBody
    private ResultVo updatabywidandcourse(int wid,String course){
        Updata updata = new Updata();
        updata.setCourse(course);
        updata.setWid(wid);
        List<Updata> updatas = updataService.updatabywidandcourse(updata);
        if (updatas!=null&&updatas.size()>0){
            vo = new ResultVo(5001,"查询成功",updatas);
        }else{
            vo = new ResultVo(5002,"查询失败");
        }
        return vo;
    }

}
