package com.chzu.service;

import com.chzu.mapper.UserMapper;
import com.chzu.pojo.User;
import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service("userService")
public class UserService {
    @Autowired
    private UserMapper userMapper;
    public User findByAccount(int account) {

        return userMapper.findByAccount(account);
    }

    public List<User> findAllUser() {
        return userMapper.findAllUser();
    }

    public List<User> findUserLikeUname(String uname) {
        return userMapper.findUserLikeUname(uname);
    }

    public int deleteUser(int wid) {
        return userMapper.deleteUser(wid);
    }

    public int userAdd(User user) {
        return userMapper.userAdd(user);
    }

    public User findBywid(Integer wid) {
        return userMapper.findBywid(wid);
    }

    public int userUpdate(User user) {
        return userMapper.userUpdate(user);
    }

    public int deleteTeacher(int wid) {
        return userMapper.deleteTeacher(wid);
    }

    public PageInfo<User> findUserByPage(int currentPage) {
        /*设置分页参数*/
        PageHelper.startPage(currentPage,3);
        /*查询博客信息集合*/
        List<User> users= userMapper.findAllUser();
        /*将查询的博客信息集合设置到分页工具类*/
        PageInfo<User> pageInfo = new PageInfo<>(users);

        return pageInfo;
    }
}
