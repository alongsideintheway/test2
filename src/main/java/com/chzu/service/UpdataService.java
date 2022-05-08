package com.chzu.service;

import com.chzu.mapper.UpdataMapper;
import com.chzu.mapper.UserMapper;
import com.chzu.pojo.Updata;
import com.chzu.pojo.User;
import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service("updataService")
public class UpdataService {
    @Autowired
    private UpdataMapper updataMapper;

    public int updata(Updata updata) {
        return updataMapper.updata(updata);
    }

    public PageInfo<Updata> findfilelocationbywid(int currentPage, int wid) {
        /*设置分页参数*/
        PageHelper.startPage(currentPage,3);
        /*查询博客信息集合*/
        List<Updata> updatas=updataMapper.findfilelocationbywid(wid);
        /*将查询的博客信息集合设置到分页工具类*/
        PageInfo<Updata> pageInfo = new PageInfo<>(updatas);

        return pageInfo;
    }

    public int deletefilebyid(int id) {
        return updataMapper.deletefilebyid(id);
    }

    public PageInfo<Updata> findAll( int currentPage) {
        PageHelper.startPage(currentPage,3);
        /*查询博客信息集合*/
        List<Updata> updatas=updataMapper.findAll();
        /*将查询的博客信息集合设置到分页工具类*/
        PageInfo<Updata> pageInfo = new PageInfo<>(updatas);

        return pageInfo;
    }

    public List<Updata> findfileLikeUname(String uname) {
        return updataMapper.findfileLikeUname(uname);
    }

    public List<Updata> updatabywidandcourse(Updata updata) {
        return updataMapper.updatabywidandcourse(updata);
    }
}
