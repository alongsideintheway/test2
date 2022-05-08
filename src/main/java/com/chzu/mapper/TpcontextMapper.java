package com.chzu.mapper;

import com.chzu.pojo.Tpcontext;

import java.util.List;

public interface TpcontextMapper {
    List<Tpcontext> tpcontextfindbycid(int cid);

    int tpcontextAdd(Tpcontext tpcontext);

    int tpcontextDelete(int id);
}
