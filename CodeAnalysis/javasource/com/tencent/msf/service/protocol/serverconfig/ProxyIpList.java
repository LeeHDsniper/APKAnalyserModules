package com.tencent.msf.service.protocol.serverconfig;

import com.qq.taf.jce.JceInputStream;
import com.qq.taf.jce.JceOutputStream;
import com.qq.taf.jce.JceStruct;
import java.util.ArrayList;

public final class ProxyIpList
  extends JceStruct
{
  static ArrayList cache_vIplist;
  public long uService_type = 0L;
  public ArrayList vIplist = null;
  
  public ProxyIpList() {}
  
  public ProxyIpList(long paramLong, ArrayList paramArrayList)
  {
    uService_type = paramLong;
    vIplist = paramArrayList;
  }
  
  public void readFrom(JceInputStream paramJceInputStream)
  {
    uService_type = paramJceInputStream.read(uService_type, 0, true);
    if (cache_vIplist == null)
    {
      cache_vIplist = new ArrayList();
      ProxyIpInfo localProxyIpInfo = new ProxyIpInfo();
      cache_vIplist.add(localProxyIpInfo);
    }
    vIplist = ((ArrayList)paramJceInputStream.read(cache_vIplist, 1, true));
  }
  
  public void writeTo(JceOutputStream paramJceOutputStream)
  {
    paramJceOutputStream.write(uService_type, 0);
    paramJceOutputStream.write(vIplist, 1);
  }
}
