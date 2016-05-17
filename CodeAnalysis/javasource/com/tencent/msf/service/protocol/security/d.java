package com.tencent.msf.service.protocol.security;

import com.qq.taf.jce.JceInputStream;
import com.qq.taf.jce.JceOutputStream;
import com.qq.taf.jce.JceStruct;

public final class d
  extends JceStruct
{
  public int a = 0;
  public int b = 0;
  public int c = 0;
  public int d = 0;
  public String e = "";
  public int f = 0;
  public String g = "";
  public String h = "";
  public int i = 0;
  
  public d() {}
  
  public d(int paramInt1, int paramInt2, int paramInt3, int paramInt4, String paramString1, int paramInt5, String paramString2, String paramString3, int paramInt6)
  {
    a = paramInt1;
    b = paramInt2;
    c = paramInt3;
    d = paramInt4;
    e = paramString1;
    f = paramInt5;
    g = paramString2;
    h = paramString3;
    i = paramInt6;
  }
  
  public void readFrom(JceInputStream paramJceInputStream)
  {
    a = paramJceInputStream.read(a, 0, true);
    b = paramJceInputStream.read(b, 1, true);
    c = paramJceInputStream.read(c, 2, true);
    d = paramJceInputStream.read(d, 3, true);
    e = paramJceInputStream.readString(4, true);
    f = paramJceInputStream.read(f, 5, true);
    g = paramJceInputStream.readString(6, true);
    h = paramJceInputStream.readString(7, true);
    i = paramJceInputStream.read(i, 8, true);
  }
  
  public void writeTo(JceOutputStream paramJceOutputStream)
  {
    paramJceOutputStream.write(a, 0);
    paramJceOutputStream.write(b, 1);
    paramJceOutputStream.write(c, 2);
    paramJceOutputStream.write(d, 3);
    paramJceOutputStream.write(e, 4);
    paramJceOutputStream.write(f, 5);
    paramJceOutputStream.write(g, 6);
    paramJceOutputStream.write(h, 7);
    paramJceOutputStream.write(i, 8);
  }
}
