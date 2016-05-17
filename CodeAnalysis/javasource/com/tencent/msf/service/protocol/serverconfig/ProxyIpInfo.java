package com.tencent.msf.service.protocol.serverconfig;

import com.qq.taf.jce.JceInputStream;
import com.qq.taf.jce.JceOutputStream;
import com.qq.taf.jce.JceStruct;

public final class ProxyIpInfo
  extends JceStruct
{
  public int uIp = 0;
  public int uPort = 0;
  public int uType = 0;
  
  public ProxyIpInfo() {}
  
  public ProxyIpInfo(int paramInt1, int paramInt2, int paramInt3)
  {
    uType = paramInt1;
    uIp = paramInt2;
    uPort = paramInt3;
  }
  
  public void readFrom(JceInputStream paramJceInputStream)
  {
    uType = paramJceInputStream.read(uType, 0, true);
    uIp = paramJceInputStream.read(uIp, 1, true);
    uPort = paramJceInputStream.read(uPort, 2, true);
  }
  
  public void writeTo(JceOutputStream paramJceOutputStream)
  {
    paramJceOutputStream.write(uType, 0);
    paramJceOutputStream.write(uIp, 1);
    paramJceOutputStream.write(uPort, 2);
  }
}
