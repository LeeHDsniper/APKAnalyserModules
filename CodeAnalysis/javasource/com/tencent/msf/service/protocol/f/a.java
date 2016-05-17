package com.tencent.msf.service.protocol.f;

import com.qq.taf.jce.JceInputStream;
import com.qq.taf.jce.JceOutputStream;
import com.qq.taf.jce.JceStruct;

public final class a
  extends JceStruct
{
  public short a = -1;
  public short b = -1;
  public int c = -1;
  public int d = -1;
  
  public a() {}
  
  public a(short paramShort1, short paramShort2, int paramInt1, int paramInt2)
  {
    a = paramShort1;
    b = paramShort2;
    c = paramInt1;
    d = paramInt2;
  }
  
  public void readFrom(JceInputStream paramJceInputStream)
  {
    a = paramJceInputStream.read(a, 0, true);
    b = paramJceInputStream.read(b, 1, true);
    c = paramJceInputStream.read(c, 2, true);
    d = paramJceInputStream.read(d, 3, true);
  }
  
  public void writeTo(JceOutputStream paramJceOutputStream)
  {
    paramJceOutputStream.write(a, 0);
    paramJceOutputStream.write(b, 1);
    paramJceOutputStream.write(c, 2);
    paramJceOutputStream.write(d, 3);
  }
}
