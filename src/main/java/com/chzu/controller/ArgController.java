package com.chzu.controller;

import com.chzu.pojo.Arg;
import com.chzu.pojo.User;
import com.chzu.service.ArgService;
import com.chzu.util.ResultVo;
import com.github.pagehelper.PageInfo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.sound.sampled.ReverbType;
import java.util.List;

@Controller
@RequestMapping("arg")
public class ArgController {
    @Autowired
    private ArgService argService;
    ResultVo vo =null;

    @RequestMapping("argAdd")
    @ResponseBody
    public ResultVo argAdd(int wid
            ,String twh,
                           String tage,String course,String tclass){
        Arg arg = new Arg();
        arg.setWid(wid);

        arg.setTage(tage);
        arg.setTclass(tclass);




        arg.setTwh(twh);
        arg.setCourse(course);

        int row = argService.argAdd(arg);
        if (row != 0) {
            vo = new ResultVo(9001, "添加成功");
        } else {
            vo = new ResultVo(9002,"添加失败");
        }
        return vo;
    }

    @RequestMapping("findAllarg")
    @ResponseBody
    public ResultVo findAllarg(int currentPage){
        PageInfo<Arg> argPageInfo = argService.findAllarg(currentPage);
        if (argPageInfo!=null){
            vo = new ResultVo(5001,"查询成功",argPageInfo);
        }else{
            vo = new ResultVo(5002,"查询失败");
        }
        return vo;
    }

    @RequestMapping("deleteargbyid")
    @ResponseBody
    public ResultVo deleteargbyid(int id){
        int row = argService.deleteargbyid(id);
        if(row>0){
            vo = new ResultVo(4001,"删除成功");
        }else
        {
            vo = new ResultVo(4002,"删除失败");
        }
        return vo;
    }

    @RequestMapping("findargLikeUname")
    @ResponseBody
    public ResultVo findargLikeUname(String uname){
        List<Arg> users = argService.findargLikeUname(uname);
        if (users != null || users.size() > 0) {
            vo = new ResultVo(2001, "查询成功", users);
        } else {
            vo = new ResultVo(2002, "查询失败");
        }
        return vo;
    }

    @RequestMapping("findargbywid")
    @ResponseBody
    public ResultVo findargbywid(int wid){
        List<Arg> args = argService.findargbywid(wid);
        if(args!=null&&args.size()>0){
            vo = new ResultVo(5001,"查询成功",args);
        }else
        {
            vo = new ResultVo(5002,"查询失败");
        }
        return vo;
    }

    @RequestMapping("argUpdate")
    @ResponseBody
    public ResultVo argUpdate(int id, String czhou,String cxues,String xinq,String loc,String jie,String csex,String classf){
         Arg arg  = new Arg();
         arg.setCzhou(czhou);
         arg.setCxues(cxues);
         arg.setXinq(xinq);
         arg.setLoc(loc);
         arg.setJie(jie);
         arg.setCsex(csex);
         arg.setClassf(classf);
         arg.setId(id);
        int row = argService.argUpdate(arg);
        if(row!=0){
            vo=new ResultVo(2001,"修改成功");
        }else
        {
            vo=new ResultVo(2002,"修改失败");
        }
        return vo;
    }

    @RequestMapping("findBywidargDetail")
    @ResponseBody
    public ResultVo findBywidargDetail(int wid){
        List<Arg> args = argService.findBywidargDetail(wid);
        if(args!=null&&args.size()>0){
            vo = new ResultVo(3001,"查询成功",args);
        }
        else{
            vo = new ResultVo(3002,"查询失败");
        }
        return vo;
    }
}
