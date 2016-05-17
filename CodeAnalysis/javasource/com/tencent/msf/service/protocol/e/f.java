package com.tencent.msf.service.protocol.e;

import com.qq.taf.jce.JceInputStream;
import com.qq.taf.jce.JceOutputStream;
import com.qq.taf.jce.JceStruct;

public final class f
  extends JceStruct
{
  public int a = 0;
  public int b = 0;
  public int c = 0;
  public String d = "";
  public int e = 0;
  public String f = "";
  public int g = 0;
  
  public f() {}
  
  public f(int paramInt1, int paramInt2, int paramInt3, String paramString1, int paramInt4, String paramString2, int paramInt5)
  {
    a = paramInt1;
    b = paramInt2;
    c = paramInt3;
    d = paramString1;
    e = paramInt4;
    f = paramString2;
    g = paramInt5;
  }
  
  public void readFrom(JceInputStream paramJceInputStream)
  {
    a = paramJceInputStream.read(a, 1, true);
    b = paramJceInputStream.read(b, 2, false);
    c = paramJceInputStream.read(c, 3, false);
    d = paramJceInputStream.readString(4, false);
    e = paramJceInputStream.read(e, 5, false);
    f = paramJceInputStream.readString(6, false);
    g = paramJceInputStream.read(g, 7, false);
  }
  
  public void writeTo(JceOutputStream paramJceOutputStream)
  {
    paramJceOutputStream.write(a, 1);
    paramJceOutputStream.write(b, 2);
    paramJceOutputStream.write(c, 3);
    if (d != null) {
      paramJceOutputStream.write(d, 4);
    }
    paramJceOutputStream.write(e, 5);
    if (f != null) {
      paramJceOutputStream.write(f, 6);
    }
    paramJceOutputStream.write(g, 7);
  }
}
