package com.chzu.controller;

import com.chzu.pojo.Outline;
import com.chzu.pojo.Reap;
import com.chzu.service.OutlineService;
import com.chzu.util.ResultVo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.List;

@Controller
@RequestMapping("outline")
public class OutlineController {
    @Autowired
    private OutlineService outlineService;

    ResultVo vo = null;
    @RequestMapping("outlineAdd")
    @ResponseBody
    public ResultVo outlineAdd(int wid,String alltime,String ttype,String ctype,String spe,String col,String course,String profile,String goal,String context,String firstc){
        Outline outline = new Outline();
        outline.setAlltime(alltime);
        outline.setCol(col);
        outline.setContext(context);
        outline.setCtype(ctype);
        outline.setFirstc(firstc);
        outline.setTtype(ttype);
        outline.setCourse(course);
        outline.setSpe(spe);
        outline.setGoal(goal);
        outline.setProfile(profile);
        outline.setWid(wid);
        int row = outlineService.outlineAdd(outline);
        if (row != 0) {
            vo = new ResultVo(9001, "添加成功");
        } else {
            vo = new ResultVo(9002,"添加失败");
        }
        return vo;
    }

    @RequestMapping("outlinefindbywid")
    @ResponseBody
    public ResultVo outlinefindbywid(int wid){
        List<Outline> reaps = outlineService.findBywid(wid);
        if (reaps != null || reaps.size() > 0) {

            vo = new ResultVo(1001, "查询成功", reaps);

        } else {

            vo = new ResultVo(1002, "查询失败");
        }
        return vo;
    }

    @RequestMapping("outlineDelete")
    @ResponseBody
    public ResultVo outlineDelete(int id){
        int row = outlineService.outlineDelete(id);
        if (row > 0) {
            vo = new ResultVo(4001, "删除成功");
        } else {
            vo = new ResultVo(4002, "删除失败");
        }
        return vo;
    }

    @RequestMapping("findByidoutlineDetail")
    @ResponseBody
    public ResultVo findByidoutlineDetail(int id) {
        Outline outline = outlineService.findByid(id);
        if (outline != null) {
            vo = new ResultVo(3001, "查询成功", outline);
        } else {
            vo = new ResultVo(3002, "查询失败");
        }
        return vo;
    }

    @RequestMapping("outlinefindall")
    @ResponseBody
    public ResultVo outlinefindall(){
        List<Outline> reaps = outlineService.findall();
        if (reaps != null || reaps.size() > 0) {

            vo = new ResultVo(1001, "查询成功", reaps);

        } else {

            vo = new ResultVo(1002, "查询失败");
        }
        return vo;
    }

    @RequestMapping("outlinecheck")
    @ResponseBody
    public ResultVo outlinecheck(int id){
        int row = outlineService.checkoutline(id);
        if(row!=0){
            vo= new ResultVo(4001,"审核通过");
        }else
        {
            vo = new ResultVo(4002,"审核失败");
        }
        return vo;
    }

    @RequestMapping("findoutlineLikeUname")
    @ResponseBody
    public ResultVo findoutlineLikeUname(String tname){
        List<Reap> reaps = outlineService.findoutlineLikeUname(tname);
        if (reaps != null || reaps.size() > 0) {
            vo = new ResultVo(2001, "查询成功", reaps);
        } else {
            vo = new ResultVo(2002, "查询失败");
        }
        return vo;
    }
    @RequestMapping("outlinefindbywidandcourse")
    @ResponseBody
    public ResultVo outlinefindbywidandcourse(int wid,String course){
        Outline outline = new Outline();
        outline.setWid(wid);
        outline.setCourse(course);
        List<Outline> reaps = outlineService.findbywidandcourse(outline);
        if (reaps != null || reaps.size() > 0) {

            vo = new ResultVo(1001, "查询成功", reaps);

        } else {

            vo = new ResultVo(1002, "查询失败");
        }
        return vo;
    }

}
