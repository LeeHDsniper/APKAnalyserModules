package com.tencent.msf.service.protocol.e;

import com.qq.taf.jce.JceInputStream;
import com.qq.taf.jce.JceOutputStream;
import com.qq.taf.jce.JceStruct;

public final class c
  extends JceStruct
{
  public int a = 0;
  public String b = "";
  public String c = "";
  public String d = "";
  
  public c() {}
  
  public c(int paramInt, String paramString1, String paramString2, String paramString3)
  {
    a = paramInt;
    b = paramString1;
    c = paramString2;
    d = paramString3;
  }
  
  public void readFrom(JceInputStream paramJceInputStream)
  {
    a = paramJceInputStream.read(a, 1, true);
    b = paramJceInputStream.readString(2, true);
    c = paramJceInputStream.readString(3, false);
    d = paramJceInputStream.readString(4, false);
  }
  
  public void writeTo(JceOutputStream paramJceOutputStream)
  {
    paramJceOutputStream.write(a, 1);
    paramJceOutputStream.write(b, 2);
    if (c != null) {
      paramJceOutputStream.write(c, 3);
    }
    if (d != null) {
      paramJceOutputStream.write(d, 4);
    }
  }
}
