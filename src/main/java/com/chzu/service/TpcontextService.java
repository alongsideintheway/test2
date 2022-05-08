package com.chzu.service;

import com.chzu.mapper.TpaceMapper;
import com.chzu.mapper.TpcontextMapper;
import com.chzu.pojo.Tpcontext;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service("tpcontextService")
public class TpcontextService {
    @Autowired
    private TpcontextMapper tpcontextMapper;

    public List<Tpcontext> tpcontextfindbycid(int cid) {
        return tpcontextMapper.tpcontextfindbycid(cid);
    }

    public int tpcontextAdd(Tpcontext tpcontext) {
        return tpcontextMapper.tpcontextAdd(tpcontext);
    }

    public int tpcontextDelete(int id) {
        return tpcontextMapper.tpcontextDelete(id);
    }
}
