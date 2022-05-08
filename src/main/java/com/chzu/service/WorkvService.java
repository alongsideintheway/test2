package com.chzu.service;

import com.chzu.mapper.WorkvMapper;
import com.chzu.pojo.Workv;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service("workvService")
public class WorkvService {

    @Autowired
    private WorkvMapper workvMapper;
    public List<Workv> workvfindBywid(int wid) {
        return workvMapper.workvfindBywid(wid);
    }

    public List<Workv> findAllworkv() {
        return workvMapper.findAllworkv();
    }

    public List<Workv> findworkvLikeUname(String tname) {
        return workvMapper.findworkvLikeUname(tname);
    }


    public int workvadd(Workv workv) {
        return workvMapper.workvadd(workv);
    }

    public int workvDelete(int id) {
        return workvMapper.workvDelete(id);
    }
}
