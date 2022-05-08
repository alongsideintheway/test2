package com.chzu.controller;

import com.chzu.pojo.User;
import com.chzu.pojo.Workv;
import com.chzu.service.WorkvService;
import com.chzu.util.ResultVo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;

import java.util.List;

@RestController
@RequestMapping("workv")
public class WorkvController {
    @Autowired
    private WorkvService workvService;

    ResultVo vo =null;
    @RequestMapping("workvfindBywid")
    @ResponseBody
    public ResultVo workvfindBywid(int wid){
        List<Workv> workvs  = workvService.workvfindBywid(wid);
        if (workvs != null) {

            vo = new ResultVo(1001, "你已填写工作量",workvs);

        } else {

            vo = new ResultVo(1002, "你未填写工作量");
        }
        return vo;
    }

    @RequestMapping("findAllworkv")
    @ResponseBody
    public ResultVo findAllworkv(){
        List<Workv> users = workvService.findAllworkv();
        if (users != null || users.size() > 0) {
            vo = new ResultVo(2001, "查询成功", users);
        } else {
            vo = new ResultVo(2002, "查询失败");
        }
        return vo;
    }

    @RequestMapping("findworkvLikeUname")
    @ResponseBody
    public ResultVo findworkvLikeUname(String tname){
        List<Workv> workvs = workvService.findworkvLikeUname(tname);
        if (workvs != null || workvs.size() > 0) {
            vo = new ResultVo(2001, "查询成功", workvs);
        } else {
            vo = new ResultVo(2002, "查询失败");
        }
        return vo;

    }

    @RequestMapping("workvadd")
    @ResponseBody
    public ResultVo workvadd(int wid,String col,String course,String alltime,String note){
        Workv workv = new Workv();
        workv.setCol(col);
        workv.setAlltime(alltime);
        workv.setCourse(course);
        workv.setNote(note);
        workv.setWid(wid);
        int row = workvService.workvadd(workv);
        if (row != 0) {
            vo = new ResultVo(9001, "添加成功");
        } else {
            vo = new ResultVo(9002,"添加失败");
        }
        return vo;
    }

    @RequestMapping("workvDelete")
    @ResponseBody
    public ResultVo workvDelete(int id){
        int row = workvService.workvDelete(id);
        if (row > 0) {
            vo = new ResultVo(4001, "删除成功");
        } else {
            vo = new ResultVo(4002, "删除失败");
        }
        return vo;
    }

}
