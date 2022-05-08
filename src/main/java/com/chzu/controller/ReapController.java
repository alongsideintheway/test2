package com.chzu.controller;

import com.chzu.pojo.Reap;
import com.chzu.service.ReapService;
import com.chzu.util.ResultVo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;

import java.util.Date;
import java.util.List;

@RestController
@RequestMapping("reap")
public class ReapController {
    ResultVo vo = null;
    @Autowired
    private ReapService reapService;

    @RequestMapping("reapfindBywid")
    @ResponseBody
    public ResultVo reapfindBywid(int wid) {
        List<Reap> reaps = reapService.findBywid(wid);
        if (reaps != null || reaps.size() > 0) {

            vo = new ResultVo(1001, "查询成功", reaps);

        } else {

            vo = new ResultVo(1002, "查询失败");
        }
        return vo;
    }

    @RequestMapping("reapDelete")
    @ResponseBody
    public ResultVo reapDelete(int id) {
        int row = reapService.reapDelete(id);
        if (row > 0) {
            vo = new ResultVo(4001, "删除成功");
        } else {
            vo = new ResultVo(4002, "删除失败");
        }
        return vo;
    }

    @RequestMapping("reapAdd")
    @ResponseBody
    public ResultVo reapAdd(int wid, String award, String type, String detail, String time) {
        Reap reap = new Reap();
        reap.setAward(award);
        reap.setWid(wid);
        reap.setType(type);
        reap.setDetail(detail);
        reap.setTime(time);
        int row = reapService.reapAdd(reap);
        if (row != 0) {
            vo = new ResultVo(9001, "添加成功");
        } else {
            vo = new ResultVo(9002,"添加失败");
        }
        return vo;
    }

    @RequestMapping("reapfindAll")
    @ResponseBody
    public ResultVo reapfindAll(){
        List<Reap> reaps = reapService.findAll();
        if (reaps != null || reaps.size() > 0) {

            vo = new ResultVo(1001, "查询成功", reaps);

        } else {

            vo = new ResultVo(1002, "查询失败");
        }
        return vo;
    }

    @RequestMapping("checkreap")
    @ResponseBody
    public ResultVo checkreap(int id){
        int row = reapService.checkreap(id);
        if(row!=0){
            vo= new ResultVo(4001,"审核通过");
        }else
        {
            vo = new ResultVo(4002,"审核失败");
        }
        return vo;
    }

    @RequestMapping("findReapLikeUname")
    @ResponseBody
    public ResultVo findReapLikeUname(String tname){
        List<Reap> reaps = reapService.findReapLikeUname(tname);
        if (reaps != null || reaps.size() > 0) {
            vo = new ResultVo(2001, "查询成功", reaps);
        } else {
            vo = new ResultVo(2002, "查询失败");
        }
        return vo;
    }
}
