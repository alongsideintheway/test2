package com.chzu.controller;

import com.chzu.pojo.User;
import com.chzu.service.UserService;
import com.chzu.util.ResultVo;
import com.github.pagehelper.PageInfo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;

import javax.annotation.Resource;
import java.util.List;


//@Controller
@RestController
@RequestMapping("user")
public class UserController {
    ResultVo vo = null;
    @Autowired
    private UserService userService;

    @RequestMapping("findByAccount")
    @ResponseBody
    public ResultVo findByAccount(int account) {
        System.out.println("账户名为" + account);
        User user = userService.findByAccount(account);
        if (user != null) {
            //邮箱已经注册
            vo = new ResultVo(1001, "账号可以使用", user);
            System.out.println(user.getType());
        } else {
            //邮箱还未注册
            vo = new ResultVo(1002, "该用户无法使用");
        }
        return vo;
    }

    @RequestMapping("findAllUser")
    @ResponseBody
    public ResultVo findAllUser() {
        List<User> users = userService.findAllUser();
        if (users != null || users.size() > 0) {
            vo = new ResultVo(2001, "查询成功", users);
        } else {
            vo = new ResultVo(2002, "查询失败");
        }
        return vo;
    }

    @RequestMapping("findUserLikeUname")
    @ResponseBody
    public ResultVo findUserLikeUname(String uname){
        List<User> users = userService.findUserLikeUname(uname);
        if (users != null || users.size() > 0) {
            vo = new ResultVo(2001, "查询成功", users);
        } else {
            vo = new ResultVo(2002, "查询失败");
        }
        return vo;
    }

    @RequestMapping("deleteUser")
    @ResponseBody
    public ResultVo deleteUser(int wid){
        int t = userService.deleteTeacher(wid);
        int u = userService.deleteUser(wid);
       int  row = u+t;
        if(row>0){
            vo = new ResultVo(4001,"删除成功");
        }else
        {
            vo = new ResultVo(4002,"删除失败");
        }
        return vo;
    }

    @RequestMapping("userAdd")
    @ResponseBody
    public ResultVo userAdd(Integer account,String upass,String uname,Integer type,Integer wid){
        User check = userService.findByAccount(account);
        User check1 = userService.findBywid(wid);
        if(check==null&&check1==null){
            User user = new User(account,upass,type,uname,wid);

            int row = userService.userAdd(user);
            if(row!=0){
                vo = new ResultVo(9001,"已添加成功");
            }else
            {
                vo = new ResultVo(9002,"添加失败");
            }

        }
        if(check!=null){
            vo = new ResultVo(9003, "该账户已经被占用");
        }
        if(check1!=null){
            vo = new ResultVo(9004, "该工号已经被占用");
        }
        return vo;
    }

    @RequestMapping("userfindBywid")
    @ResponseBody
    public ResultVo userfindBywid(Integer wid){
        User user = userService.findBywid(wid);
        if (user != null) {

            vo = new ResultVo(1001, "成功查询", user);
            System.out.println(user.getType());
        } else {

            vo = new ResultVo(1002, "查询失败");
        }
        return vo;
    }

    @RequestMapping("userUpdate")
    @ResponseBody
    public ResultVo userUpdate(Integer account,String upass,String uname,Integer type,Integer wid){

        userService.deleteUser(wid);
        User user = new User(account,upass,type,uname,wid);
        int row = userService.userAdd(user);
       if(row!=0){
           vo=new ResultVo(2001,"修改成功");
       }else
       {
           vo=new ResultVo(2002,"修改失败");
       }
        return vo;
    }

    @RequestMapping("findUserByPage")
    @ResponseBody
    public ResultVo findUserByPage(int currentPage){
        PageInfo<User> userPageInfo = userService.findUserByPage(currentPage);
        if (userPageInfo!=null){
            vo = new ResultVo(5001,"查询成功",userPageInfo);
        }else{
            vo = new ResultVo(5002,"查询失败");
        }
        return vo;
    }
}
