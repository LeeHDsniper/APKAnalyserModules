package com.tencent.msf.service.protocol.push;

import com.qq.taf.jce.JceInputStream;
import com.qq.taf.jce.JceOutputStream;
import com.qq.taf.jce.JceStruct;

public final class b
  extends JceStruct
{
  static byte[] q;
  public long a = 0L;
  public long b = 0L;
  public String c = "";
  public int d = 11;
  public byte e = 0;
  public byte f = 0;
  public byte g = 0;
  public int h = 0;
  public int i = 0;
  public int j = 0;
  public int k = 0;
  public int l = 0;
  public byte[] m = null;
  public String n = "";
  public String o = "";
  public String p = "";
  
  public b() {}
  
  public b(long paramLong1, long paramLong2, String paramString1, int paramInt1, byte paramByte1, byte paramByte2, byte paramByte3, int paramInt2, int paramInt3, int paramInt4, int paramInt5, int paramInt6, byte[] paramArrayOfByte, String paramString2, String paramString3, String paramString4)
  {
    a = paramLong1;
    b = paramLong2;
    c = paramString1;
    d = paramInt1;
    e = paramByte1;
    f = paramByte2;
    g = paramByte3;
    h = paramInt2;
    i = paramInt3;
    j = paramInt4;
    k = paramInt5;
    l = paramInt6;
    m = paramArrayOfByte;
    n = paramString2;
    o = paramString3;
    p = paramString4;
  }
  
  public void readFrom(JceInputStream paramJceInputStream)
  {
    a = paramJceInputStream.read(a, 0, true);
    b = paramJceInputStream.read(b, 1, true);
    c = paramJceInputStream.readString(2, true);
    d = paramJceInputStream.read(d, 3, false);
    e = paramJceInputStream.read(e, 4, false);
    f = paramJceInputStream.read(f, 5, false);
    g = paramJceInputStream.read(g, 6, false);
    h = paramJceInputStream.read(h, 7, false);
    i = paramJceInputStream.read(i, 8, false);
    j = paramJceInputStream.read(j, 9, false);
    k = paramJceInputStream.read(k, 10, false);
    l = paramJceInputStream.read(l, 11, false);
    if (q == null)
    {
      q = (byte[])new byte[1];
      ((byte[])q)[0] = 0;
    }
    m = ((byte[])paramJceInputStream.read(q, 12, false));
    n = paramJceInputStream.readString(13, false);
    o = paramJceInputStream.readString(14, false);
    p = paramJceInputStream.readString(15, false);
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
    paramJceOutputStream.write(j, 9);
    paramJceOutputStream.write(k, 10);
    paramJceOutputStream.write(l, 11);
    if (m != null) {
      paramJceOutputStream.write(m, 12);
    }
    if (n != null) {
      paramJceOutputStream.write(n, 13);
    }
    if (o != null) {
      paramJceOutputStream.write(o, 14);
    }
    if (p != null) {
      paramJceOutputStream.write(p, 15);
    }
  }
}
