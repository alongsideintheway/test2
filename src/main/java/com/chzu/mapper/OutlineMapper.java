package com.chzu.mapper;

import com.chzu.pojo.Outline;
import com.chzu.pojo.Reap;

import java.util.List;

public interface OutlineMapper {
    int outlineAdd(Outline outline);

    List<Outline> findBywid(int wid);

    int outlineDelete(int id);

    Outline findByid(int id);

    List<Outline> findall();

    int checkoutline(int id);

    List<Reap> findoutlineLikeUname(String tname);

    List<Outline> findbywidandcourse(Outline outline);
}
