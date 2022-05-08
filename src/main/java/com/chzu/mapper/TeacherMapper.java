package com.chzu.mapper;

import com.chzu.pojo.Teacher;
import com.chzu.pojo.Updata;

import java.util.List;

public interface TeacherMapper {
    Teacher findBywidTeacherDetail(int wid);

   int deleteTeacher(Integer wid);

    int addTeacher(Teacher teacher);


    int updata(Updata updata);

    List<Teacher> findAllTeacher();

    List<Teacher> findTeacherLikeUname(Teacher teacher);
}
