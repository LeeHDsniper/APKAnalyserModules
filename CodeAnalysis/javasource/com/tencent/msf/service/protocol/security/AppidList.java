package com.tencent.msf.service.protocol.security;

import com.qq.taf.jce.JceInputStream;
import com.qq.taf.jce.JceOutputStream;
import com.qq.taf.jce.JceStruct;
import java.util.ArrayList;

public final class AppidList
  extends JceStruct
{
  static ArrayList cache_AppidVector;
  public ArrayList AppidVector = null;
  public long nReserved = 0L;
  
  public AppidList() {}
  
  public AppidList(long paramLong, ArrayList paramArrayList)
  {
    nReserved = paramLong;
    AppidVector = paramArrayList;
  }
  
  public void readFrom(JceInputStream paramJceInputStream)
  {
    nReserved = paramJceInputStream.read(nReserved, 0, true);
    if (cache_AppidVector == null)
    {
      cache_AppidVector = new ArrayList();
      cache_AppidVector.add(Long.valueOf(0L));
    }
    AppidVector = ((ArrayList)paramJceInputStream.read(cache_AppidVector, 1, true));
  }
  
  public void writeTo(JceOutputStream paramJceOutputStream)
  {
    paramJceOutputStream.write(nReserved, 0);
    paramJceOutputStream.write(AppidVector, 1);
  }
}
