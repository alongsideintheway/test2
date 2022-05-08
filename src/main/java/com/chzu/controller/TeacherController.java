package com.chzu.controller;

import com.chzu.pojo.Teacher;
import com.chzu.pojo.User;
import com.chzu.service.TeacherService;
import com.chzu.util.ResultVo;
import com.github.pagehelper.PageInfo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;

import java.util.List;

@RestController
@RequestMapping("teacher")
public class TeacherController {
    ResultVo vo = null;
    @Autowired
    private TeacherService teacherService;
    @RequestMapping("findBywidTeacherDetail")
    @ResponseBody
    public ResultVo findBywidTeacherDetail(int wid){
       Teacher teacher = teacherService.findBywidTeacherDetail(wid);
        if (teacher != null ) {
            vo = new ResultVo(3001, "查询成功",teacher);

        } else {
            vo = new ResultVo(3002, "查询失败");
        }
        return vo;
    }

    @RequestMapping("teacherUpdate")
    @ResponseBody
    public ResultVo teacherUpdate(Integer wid,String name,Integer age,String sex,Integer iphone,String email,String detail,String title){
        teacherService.deleteTeacher(wid);
        Teacher teacher = new Teacher( wid, name,  age,  sex,  detail,  title, iphone,  email);
       int row =  teacherService.addTeacher(teacher);
        if(row!=0){
            vo=new ResultVo(2001,"修改成功");
        }else
        {
            vo=new ResultVo(2002,"修改失败");
        }
        return vo;
    }

    @RequestMapping("findTeacherByPage")
    @ResponseBody
    public ResultVo findTeacherByPage(int currentPage){
        PageInfo<Teacher> userPageInfo = teacherService.findTeacherByPage(currentPage);
        if (userPageInfo!=null){
            vo = new ResultVo(5001,"查询成功",userPageInfo);
        }else{
            vo = new ResultVo(5002,"查询失败");
        }
        return vo;
    }

    @RequestMapping("findTeacherLikeUname")
    @ResponseBody
    public ResultVo findTeacherLikeUname(String uname){
        Teacher teacher = new Teacher();
        teacher.setName(uname);
        List<Teacher> teachers = teacherService.findTeacherLikeUname(teacher);
        if(teachers!=null&&teachers.size()>0){
            vo = new ResultVo(2001,"查询成功",teachers);
        }else{
            vo = new ResultVo(2002,"查询失败");
        }
        return vo;
    }
}
