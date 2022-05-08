package com.chzu.mapper;

import com.chzu.pojo.User;

import java.util.List;

public interface UserMapper {
    User findByAccount(int account);

    List<User> findAllUser();

    List<User> findUserLikeUname(String uname);

    int deleteUser(int wid);

    int userAdd(User user);

    User findBywid(Integer wid);

    int userUpdate(User user);

    int deleteTeacher(int wid);
}
