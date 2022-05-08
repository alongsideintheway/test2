package com.chzu.mapper;

import com.chzu.pojo.Updata;

import java.util.List;

public interface UpdataMapper {
    int updata(Updata updata);

    List<Updata> findfilelocationbywid(int wid);

    int deletefilebyid(int id);

    List<Updata> findAll();

    List<Updata> findfileLikeUname(String uname);

    List<Updata> updatabywidandcourse(Updata updata);
}
