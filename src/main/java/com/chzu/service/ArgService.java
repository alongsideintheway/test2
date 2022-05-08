package com.chzu.service;

import com.chzu.mapper.ArgMapper;
import com.chzu.pojo.Arg;
import com.chzu.pojo.User;
import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service("argService")
public class ArgService {
    @Autowired
    private ArgMapper argMapper;

    public int argAdd(Arg arg) {
        return argMapper.argAdd(arg);
    }

    public PageInfo<Arg> findAllarg(int currentPage) {
        PageHelper.startPage(currentPage,10);
        /*查询博客信息集合*/
        List<Arg> args= argMapper.findAllarg();
        /*将查询的博客信息集合设置到分页工具类*/
        PageInfo<Arg> pageInfo = new PageInfo<>(args);

        return pageInfo;
    }

    public int deleteargbyid(int id) {
        return argMapper.deleteargbyid(id);
    }

    public List<Arg> findargLikeUname(String uname) {
        return argMapper.findargLikeUname(uname);
    }

    public List<Arg> findargbywid(int wid) {
        return argMapper.findargbywid(wid);
    }

    public int argUpdate(Arg arg) {
        return argMapper.argUpdate(arg);
    }

    public List<Arg> findBywidargDetail(int wid) {
        return argMapper.findBywidargDetail(wid);
    }
}
