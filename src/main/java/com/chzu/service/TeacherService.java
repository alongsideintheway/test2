package com.chzu.service;

import com.chzu.mapper.TeacherMapper;
import com.chzu.pojo.Teacher;
import com.chzu.pojo.Updata;
import com.chzu.pojo.User;
import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service("teacherService")
public class TeacherService {
    @Autowired
    private TeacherMapper teacherMapper;

    public Teacher findBywidTeacherDetail(int wid) {
        return teacherMapper.findBywidTeacherDetail(wid);
    }

    public int deleteTeacher(Integer wid) {
        return teacherMapper.deleteTeacher(wid);
    }

    public int addTeacher(Teacher teacher) {
        return teacherMapper.addTeacher(teacher);
    }

    public int updata(Updata updata) {
        return teacherMapper.updata(updata);
    }

    public PageInfo<Teacher> findTeacherByPage(int currentPage) {
        PageHelper.startPage(currentPage,3);
        /*查询博客信息集合*/
        List<Teacher> teachers= teacherMapper.findAllTeacher();
        /*将查询的博客信息集合设置到分页工具类*/
        PageInfo<Teacher> pageInfo = new PageInfo<>(teachers);

        return pageInfo;
    }

    public List<Teacher> findTeacherLikeUname(Teacher teacher) {
        return teacherMapper.findTeacherLikeUname(teacher);
    }
}
