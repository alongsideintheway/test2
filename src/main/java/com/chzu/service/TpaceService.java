package com.chzu.service;

import com.chzu.mapper.TpaceMapper;
import com.chzu.pojo.Tpace;
import com.chzu.pojo.Updata;
import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service("tpaceService")
public class TpaceService {
    @Autowired
    private TpaceMapper tpaceMapper;

    public  PageInfo<Tpace> motpacefindAll(int currentPage) {
        /*设置分页参数*/
        PageHelper.startPage(currentPage,3);
        /*查询博客信息集合*/
        List<Tpace> tpaces=tpaceMapper.motpacefindAll();
        /*将查询的博客信息集合设置到分页工具类*/
        PageInfo<Tpace> pageInfo = new PageInfo<>(tpaces);

        return pageInfo;
    }

    public int tpaceAdd(Tpace tpace) {
        return tpaceMapper.tpaceAdd(tpace);
    }

    public List<Tpace> ctpaceBywid(int wid) {
        return tpaceMapper.ctpaceBywid(wid);
    }

    public int tpaceDelete(int cid) {
        return tpaceMapper.tpaceDelete(cid);
    }

    public List<Tpace> ztpaceBywid(int wid) {
        return tpaceMapper.ztpaceBywid(wid);
    }

    public int ztpaceAdd(Tpace tpace) {
        return tpaceMapper.ztpaceAdd(tpace);
    }

    public List<Tpace> ltpaceBywid(int wid) {
        return tpaceMapper.ltpaceBywid(wid);
    }

    public List<Tpace> ctpacefindAll() {
        return tpaceMapper.ctpacefindAll();
    }

    public int checktpace(Tpace tpace) {
        return tpaceMapper.checktpace(tpace);
    }

    public List<Tpace> findtpaceLikeUname(String tname) {
        return tpaceMapper.findtpaceLikeUname(tname);
    }

    public List<Tpace> ztpacefindAll() {
        return tpaceMapper.ztpacefindAll();
    }

    public List<Tpace> findztpaceLikeUname(String tname) {
        return tpaceMapper.findztpaceLikeUname(tname);
    }

    public List<Tpace> mtpacefindAll() {
        return tpaceMapper.mtpacefindAll();
    }

    public List<Tpace> findmtpaceLikeUname(String tname) {
        return tpaceMapper.findmtpaceLikeUname(tname);
    }

    public Tpace ctpaceBycid(int cid) {
        return tpaceMapper.ctpaceBycid(cid);
    }

    public int remakeAdd(Tpace tpace) {
        return tpaceMapper.remakeAdd(tpace);
    }

    public int tpaceupdate(Tpace tpace) {
        return tpaceMapper.tpaceupdate(tpace);
    }
}
