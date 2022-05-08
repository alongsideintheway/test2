package com.chzu.controller;

import com.chzu.pojo.Tpcontext;
import com.chzu.service.TpcontextService;
import com.chzu.util.ResultVo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.List;

@Controller
@RequestMapping("tpcontext")
public class TpcontextController {
    @Autowired
    private TpcontextService tpcontextService;
    ResultVo vo = null;

    @RequestMapping("tpcontextfindbycid")
    @ResponseBody
    public ResultVo tpcontextfindbycid(int cid){
        List<Tpcontext> tpcontextList = tpcontextService.tpcontextfindbycid(cid);
        if(tpcontextList!=null&&tpcontextList.size()>0){
            vo = new ResultVo(3001,"查询成功",tpcontextList);
        }else
        {
            vo= new ResultVo(3002,"未查询到，请添加");
        }
        return vo;
    }

    @RequestMapping("tpcontextAdd")
    @ResponseBody
    public ResultVo tpcontextAdd(int cid,String zdata,String zxs,String jk,String syk,String xtk,String cjian){
        Tpcontext tpcontext = new Tpcontext();
        tpcontext.setCid(cid);
        tpcontext.setCjian(cjian);
        tpcontext.setJk(jk);
        tpcontext.setSyk(syk);
        tpcontext.setZdata(zdata);
        tpcontext.setZxs(zxs);
        tpcontext.setXtk(xtk);
        int row = tpcontextService.tpcontextAdd(tpcontext);
        if (row != 0) {
            vo = new ResultVo(9001, "添加成功");
        } else {
            vo = new ResultVo(9002,"添加失败");
        }
        return vo;
    }


    @RequestMapping("tpcontextDelete")
    @ResponseBody
    public ResultVo tpcontextDelete(int id){
        int row = tpcontextService.tpcontextDelete(id);
        if (row > 0) {
            vo = new ResultVo(4001, "删除成功");
        } else {
            vo = new ResultVo(4002, "删除失败");
        }
        return vo;
    }
}
