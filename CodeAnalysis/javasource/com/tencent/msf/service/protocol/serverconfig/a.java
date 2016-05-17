package com.tencent.msf.service.protocol.serverconfig;

import com.qq.taf.jce.JceInputStream;
import com.qq.taf.jce.JceOutputStream;
import com.qq.taf.jce.JceStruct;

public final class a
  extends JceStruct
{
  static k g;
  static k h;
  public int a = 0;
  public k b = null;
  public k c = null;
  public byte d = 0;
  public int e = 0;
  public long f;
  
  public a() {}
  
  public a(int paramInt1, k paramK1, k paramK2, byte paramByte, int paramInt2)
  {
    a = paramInt1;
    b = paramK1;
    c = paramK2;
    d = paramByte;
    e = paramInt2;
  }
  
  public void readFrom(JceInputStream paramJceInputStream)
  {
    a = paramJceInputStream.read(a, 1, true);
    if (g == null) {
      g = new k();
    }
    b = ((k)paramJceInputStream.read(g, 2, false));
    if (h == null) {
      h = new k();
    }
    c = ((k)paramJceInputStream.read(h, 3, false));
    d = paramJceInputStream.read(d, 4, false);
    e = paramJceInputStream.read(e, 5, false);
  }
  
  public void writeTo(JceOutputStream paramJceOutputStream)
  {
    paramJceOutputStream.write(a, 1);
    if (b != null) {
      paramJceOutputStream.write(b, 2);
    }
    if (c != null) {
      paramJceOutputStream.write(c, 3);
    }
    paramJceOutputStream.write(d, 4);
    paramJceOutputStream.write(e, 5);
  }
}
