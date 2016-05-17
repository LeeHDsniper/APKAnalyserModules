package com.tencent.msf.service.protocol.QQWiFi;

import com.qq.taf.jce.JceInputStream;
import com.qq.taf.jce.JceOutputStream;
import com.qq.taf.jce.JceStruct;

public final class c
  extends JceStruct
{
  public String a = "";
  public int b = 0;
  
  public c() {}
  
  public void readFrom(JceInputStream paramJceInputStream)
  {
    a = paramJceInputStream.readString(0, true);
    b = paramJceInputStream.read(b, 1, true);
  }
  
  public String toString()
  {
    return "NearbyAvailWiFiInfoRsp [msg=" + a + "]" + "[ status=" + b + "]";
  }
  
  public void writeTo(JceOutputStream paramJceOutputStream)
  {
    paramJceOutputStream.write(a, 0);
    paramJceOutputStream.write(b, 1);
  }
}
