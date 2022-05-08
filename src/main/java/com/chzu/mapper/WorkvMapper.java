package com.chzu.mapper;

import com.chzu.pojo.Workv;

import java.util.List;

public interface WorkvMapper {
    List<Workv> workvfindBywid(int wid);

    List<Workv> findAllworkv();

    List<Workv> findworkvLikeUname(String tname);

    int workvadd(Workv workv);

    int workvDelete(int id);
}
