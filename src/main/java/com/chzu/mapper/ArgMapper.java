package com.chzu.mapper;

import com.chzu.pojo.Arg;

import java.util.List;

public interface ArgMapper {
    int argAdd(Arg arg);

    List<Arg> findAllarg();

    int deleteargbyid(int id);

    List<Arg> findargLikeUname(String uname);

    List<Arg> findargbywid(int wid);

    int argUpdate(Arg arg);

    List<Arg> findBywidargDetail(int wid);
}
