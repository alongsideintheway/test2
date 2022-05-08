package com.chzu.controller;

import com.chzu.pojo.Reap;
import com.chzu.pojo.Tpace;
import com.chzu.pojo.Tpcontext;
import com.chzu.pojo.Updata;
import com.chzu.service.TpaceService;
import com.chzu.util.ResultVo;
import com.github.pagehelper.PageInfo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.List;

@Controller
@RequestMapping("tpace")
public class TpaceController {
    @Autowired
    private TpaceService tpaceService;
    ResultVo vo = null;
    @RequestMapping("ctpaceAdd")
    @ResponseBody
    public ResultVo ctpaceAdd(int wid,String course,String spe,String tclass,String planxs,String textb,String testke,String jiangke,String lianx,String zhou){
        Tpace tpace = new Tpace();
        tpace.setWid(wid);
        tpace.setSpe(spe);
        tpace.setCourse(course);
        tpace.setTclass(tclass);
        tpace.setPlanxs(planxs);
        tpace.setTestke(testke);
        tpace.setTextb(textb);
        tpace.setJiangke(jiangke);
        tpace.setLianx(lianx);
        tpace.setZhou(zhou);
        int row = tpaceService.tpaceAdd(tpace);
        if (row != 0) {
            vo = new ResultVo(9001, "添加成功");
        } else {
            vo = new ResultVo(9002,"添加失败");
        }
        return vo;

    }

    @RequestMapping("ctpaceBywid")
    @ResponseBody
    public ResultVo ctpaceBywid(int wid){
        List<Tpace> reaps = tpaceService.ctpaceBywid(wid);
        if (reaps != null || reaps.size() > 0) {

            vo = new ResultVo(1001, "查询成功", reaps);

        } else {

            vo = new ResultVo(1002, "查询失败");
        }
        return vo;
    }

    @RequestMapping("remakeAdd")
    @ResponseBody
    public ResultVo remakeAdd(int cid,int grade,String remake){
        Tpace tpace= new Tpace();
        tpace.setCid(cid);
        tpace.setGrade(grade);
        tpace.setRemake(remake);
        int row = tpaceService.remakeAdd(tpace);
        if (row != 0) {
            vo = new ResultVo(9001, "添加成功");
        } else {
            vo = new ResultVo(9002,"添加失败");
        }
        return vo;
    }
    @RequestMapping("ctpaceBycid")
    @ResponseBody
    public ResultVo ctpaceBycid(int cid){
        Tpace tpace = tpaceService.ctpaceBycid(cid);
        if (tpace != null ) {

            vo = new ResultVo(1001, "查询成功",tpace);

        } else {

            vo = new ResultVo(1002, "查询失败");
        }
        return vo;
    }
    @RequestMapping("ctpaceDelete")
    @ResponseBody
    public ResultVo ctpaceDelete(int cid){
        int row = tpaceService.tpaceDelete(cid);
        if (row > 0) {
            vo = new ResultVo(4001, "删除成功");
        } else {
            vo = new ResultVo(4002, "删除失败");
        }
        return vo;
    }

    @RequestMapping("ztpaceBywid")
    @ResponseBody
    public ResultVo ztpaceBywid(int wid){
        List<Tpace> reaps = tpaceService.ztpaceBywid(wid);
        if (reaps != null || reaps.size() > 0) {

            vo = new ResultVo(1001, "查询成功", reaps);

        } else {

            vo = new ResultVo(1002, "查询失败");
        }
        return vo;
    }

    @RequestMapping("ztpaceAdd")
    @ResponseBody
    public ResultVo ztpaceAdd(int wid,String course,String spe,String tclass,String planxs,String textb,String testke,String jiangke,String lianx,String zhou){
        Tpace tpace = new Tpace();
        tpace.setWid(wid);
        tpace.setSpe(spe);
        tpace.setCourse(course);
        tpace.setTclass(tclass);
        tpace.setPlanxs(planxs);
        tpace.setTestke(testke);
        tpace.setTextb(textb);
        tpace.setJiangke(jiangke);
        tpace.setLianx(lianx);
        tpace.setZhou(zhou);
        tpace.setTime(1);
        int row = tpaceService.ztpaceAdd(tpace);
        if (row != 0) {
            vo = new ResultVo(9001, "添加成功");
        } else {
            vo = new ResultVo(9002,"添加失败");
        }
        return vo;
    }

    @RequestMapping("ltpaceBywid")
    @ResponseBody
    public ResultVo ltpaceBywid(int wid){
        List<Tpace> reaps = tpaceService.ltpaceBywid(wid);
        if (reaps != null || reaps.size() > 0) {

            vo = new ResultVo(1001, "查询成功", reaps);

        } else {

            vo = new ResultVo(1002, "查询失败");
        }
        return vo;
    }

    @RequestMapping("ltpaceAdd")
    @ResponseBody
    public ResultVo ltpaceAdd(int wid,String course,String spe,String tclass,String planxs,String textb,String testke,String jiangke,String lianx,String zhou){
        Tpace tpace = new Tpace();
        tpace.setWid(wid);
        tpace.setSpe(spe);
        tpace.setCourse(course);
        tpace.setTclass(tclass);
        tpace.setPlanxs(planxs);
        tpace.setTestke(testke);
        tpace.setTextb(textb);
        tpace.setJiangke(jiangke);
        tpace.setLianx(lianx);
        tpace.setZhou(zhou);
        tpace.setTime(2);
        int row = tpaceService.ztpaceAdd(tpace);
        if (row != 0) {
            vo = new ResultVo(9001, "添加成功");
        } else {
            vo = new ResultVo(9002,"添加失败");
        }
        return vo;
    }

    @RequestMapping("ctpacefindAll")
    @ResponseBody
    public ResultVo ctpacefindAll(){
        List<Tpace> reaps = tpaceService.ctpacefindAll();
        if (reaps != null || reaps.size() > 0) {

            vo = new ResultVo(1001, "查询成功", reaps);

        } else {

            vo = new ResultVo(1002, "查询失败");
        }
        return vo;
    }

    @RequestMapping("checktpace")
    @ResponseBody
    public ResultVo checktpace(int cid){
        Tpace tpace = new Tpace();
        tpace.setCid(cid);
        int row = tpaceService.checktpace(tpace);
        if(row!=0){
            vo= new ResultVo(4001,"审核通过");
        }else
        {
            vo = new ResultVo(4002,"审核失败");
        }
        return vo;
    }

    @RequestMapping("findtpaceLikeUname")
    @ResponseBody
    public ResultVo findtpaceLikeUname(String tname){
        List<Tpace> reaps = tpaceService.findtpaceLikeUname(tname);
        if (reaps != null || reaps.size() > 0) {
            vo = new ResultVo(2001, "查询成功", reaps);
        } else {
            vo = new ResultVo(2002, "查询失败");
        }
        return vo;
    }

    @RequestMapping("ztpacefindAll")
    @ResponseBody
    public ResultVo ztpacefindAll(){
        List<Tpace> reaps = tpaceService.ztpacefindAll();
        if (reaps != null || reaps.size() > 0) {

            vo = new ResultVo(1001, "查询成功", reaps);

        } else {

            vo = new ResultVo(1002, "查询失败");
        }
        return vo;
    }

    @RequestMapping("findztpaceLikeUname")
    @ResponseBody
    public ResultVo findztpaceLikeUname(String tname){
        List<Tpace> reaps = tpaceService.findztpaceLikeUname(tname);
        if (reaps != null || reaps.size() > 0) {
            vo = new ResultVo(2001, "查询成功", reaps);
        } else {
            vo = new ResultVo(2002, "查询失败");
        }
        return vo;
    }

    @RequestMapping("mtpacefindAll")
    @ResponseBody
    public ResultVo mtpacefindAll(){
        List<Tpace> reaps = tpaceService.mtpacefindAll();
        if (reaps != null || reaps.size() > 0) {

            vo = new ResultVo(1001, "查询成功", reaps);

        } else {

            vo = new ResultVo(1002, "查询失败");
        }
        return vo;
    }

    @RequestMapping("findmtpaceLikeUname")
    @ResponseBody
    public ResultVo findmtpaceLikeUname(String tname){
        List<Tpace> reaps = tpaceService.findmtpaceLikeUname(tname);
        if (reaps != null || reaps.size() > 0) {
            vo = new ResultVo(2001, "查询成功", reaps);
        } else {
            vo = new ResultVo(2002, "查询失败");
        }
        return vo;
    }
    @RequestMapping("motpacefindAll")
    @ResponseBody
    public ResultVo motpacefindAll(int currentPage){
        PageInfo<Tpace> tpacePageInfo =tpaceService.motpacefindAll(currentPage);
        if (tpacePageInfo!=null){
            vo = new ResultVo(5001,"查询成功",tpacePageInfo);
        }else{
            vo = new ResultVo(5002,"查询失败");
        }
        return vo;
    }
    @RequestMapping("tpaceupdate")
    @ResponseBody
    public ResultVo tpaceupdate(String khfs,String khfslx,String sypt,int sj,int kccl,int jxdg,int jxjd,int dxal,int xjb,int jfc,int kcsm,int cid){
        Tpace tpace = new Tpace();
        tpace.setCid(cid);
        tpace.setKhfs(khfs);
        tpace.setKhfslx(khfslx);
        tpace.setSypt(sypt);
        tpace.setSj(sj);
        tpace.setKccl(kccl);
        tpace.setJxdg(jxdg);
        tpace.setJxjd(jxjd);
        tpace.setDxal(dxal);
        tpace.setXjb(xjb);
        tpace.setJfc(jfc);
        tpace.setKcsm(kcsm);
        int row = tpaceService.tpaceupdate(tpace);
        if (row!=0){
            vo = new ResultVo(9001,"修改成功");
        }else{
            vo = new ResultVo(9002,"修改失败");
        }
        return vo;
    }
}
