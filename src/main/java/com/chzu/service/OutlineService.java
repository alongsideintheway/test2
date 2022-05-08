package com.chzu.service;

import com.chzu.mapper.OutlineMapper;
import com.chzu.pojo.Outline;
import com.chzu.pojo.Reap;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service("outlineService")
public class OutlineService {
    @Autowired
    private OutlineMapper outlineMapper;
    public int outlineAdd(Outline outline) {
        return outlineMapper.outlineAdd(outline);
    }

    public List<Outline> findBywid(int wid) {
        return outlineMapper.findBywid(wid);
    }

    public int outlineDelete(int id) {
        return outlineMapper.outlineDelete(id);
    }

    public Outline findByid(int id) {
        return outlineMapper.findByid(id);
    }

    public List<Outline> findall() {
        return outlineMapper.findall();
    }

    public int checkoutline(int id) {
        return outlineMapper.checkoutline(id);
    }

    public List<Reap> findoutlineLikeUname(String tname) {
        return outlineMapper.findoutlineLikeUname(tname);
    }

    public List<Outline> findbywidandcourse(Outline outline) {
        return outlineMapper.findbywidandcourse(outline);
    }
}
