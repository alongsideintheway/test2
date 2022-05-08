package com.chzu.service;

import com.chzu.mapper.ReapMapper;
import com.chzu.pojo.Reap;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service("reapService")
public class ReapService {
    @Autowired
    private ReapMapper reapMapper;

    public List<Reap> findBywid(int wid) {
        return reapMapper.findBywid(wid);
    }

    public int reapDelete(int id) {
        return reapMapper.reapDelete(id);
    }

    public int reapAdd(Reap reap) {
        return reapMapper.reapAdd(reap);
    }

    public List<Reap> findAll() {
        return reapMapper.findAll();
    }

    public int checkreap(int id) {
        return reapMapper.checkreap(id);
    }

    public List<Reap> findReapLikeUname(String tname) {
        return reapMapper.findReapLikeUname(tname);
    }
}
