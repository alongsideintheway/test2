package com.chzu.mapper;

import com.chzu.pojo.Tpace;

import java.util.List;

public interface TpaceMapper {
    int tpaceAdd(Tpace tpace);

    List<Tpace> ctpaceBywid(int wid);

    int tpaceDelete(int cid);

    List<Tpace> ztpaceBywid(int wid);

    int ztpaceAdd(Tpace tpace);

    List<Tpace> ltpaceBywid(int wid);

    List<Tpace> ctpacefindAll();

    int checktpace(Tpace tpace);

    List<Tpace> findtpaceLikeUname(String tname);

    List<Tpace> ztpacefindAll();

    List<Tpace> findztpaceLikeUname(String tname);

    List<Tpace> mtpacefindAll();

    List<Tpace> findmtpaceLikeUname(String tname);

    Tpace ctpaceBycid(int cid);

    int remakeAdd(Tpace tpace);

    List<Tpace> motpacefindAll();

    int tpaceupdate(Tpace tpace);
}
