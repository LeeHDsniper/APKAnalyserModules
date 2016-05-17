package com.tencent.msf.service.protocol.QQWiFi;

import com.qq.taf.jce.JceInputStream;
import com.qq.taf.jce.JceOutputStream;
import com.qq.taf.jce.JceStruct;

public final class d
  extends JceStruct
{
  public String a = "";
  public String b = "";
  public short c = 0;
  
  public d() {}
  
  public d(String paramString1, String paramString2, short paramShort)
  {
    a = paramString1;
    b = paramString2;
    c = paramShort;
  }
  
  public void readFrom(JceInputStream paramJceInputStream)
  {
    a = paramJceInputStream.readString(0, true);
    b = paramJceInputStream.readString(1, false);
    c = paramJceInputStream.read(c, 2, false);
  }
  
  public void writeTo(JceOutputStream paramJceOutputStream)
  {
    paramJceOutputStream.write(a, 0);
    if (b != null) {
      paramJceOutputStream.write(b, 1);
    }
    paramJceOutputStream.write(c, 2);
  }
}
