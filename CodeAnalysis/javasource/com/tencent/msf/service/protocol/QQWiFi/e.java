package com.tencent.msf.service.protocol.QQWiFi;

import LBS.LBSInfo;
import com.qq.taf.jce.JceInputStream;
import com.qq.taf.jce.JceOutputStream;
import com.qq.taf.jce.JceStruct;

public final class e
  extends JceStruct
{
  static LBSInfo c;
  public LBSInfo a = null;
  public long b = 0L;
  
  public e() {}
  
  public void readFrom(JceInputStream paramJceInputStream)
  {
    if (c == null) {
      c = new LBSInfo();
    }
    a = ((LBSInfo)paramJceInputStream.read(c, 0, false));
    b = paramJceInputStream.read(b, 1, false);
  }
  
  public String toString()
  {
    return "WiFiMapReq [lbsInfo=" + a + ", last_id=" + b + "]";
  }
  
  public void writeTo(JceOutputStream paramJceOutputStream)
  {
    if (a != null) {
      paramJceOutputStream.write(a, 0);
    }
    paramJceOutputStream.write(b, 1);
  }
}
