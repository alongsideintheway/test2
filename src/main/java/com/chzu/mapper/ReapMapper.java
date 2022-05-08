package com.chzu.mapper;

import com.chzu.pojo.Reap;

import java.util.List;

public interface ReapMapper {
    List<Reap> findBywid(int wid);

    int reapDelete(int id);

    int reapAdd(Reap reap);

    List<Reap> findAll();

    int checkreap(int id);

    List<Reap> findReapLikeUname(String tname);
}
