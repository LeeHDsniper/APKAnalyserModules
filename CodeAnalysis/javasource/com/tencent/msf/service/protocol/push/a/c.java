package com.tencent.msf.service.protocol.push.a;

import com.qq.taf.jce.JceInputStream;
import com.qq.taf.jce.JceOutputStream;
import com.qq.taf.jce.JceStruct;
import java.util.ArrayList;

public final class c
  extends JceStruct
{
  static ArrayList p;
  static byte[] q;
  static byte[] r;
  public short a = 0;
  public ArrayList b = null;
  public long c = 0L;
  public long d = 0L;
  public byte[] e = null;
  public long f = 0L;
  public byte[] g = null;
  public long h = 0L;
  public long i = 0L;
  public long j = 0L;
  public long k = 0L;
  public long l = 0L;
  public long m = 0L;
  public long n = 0L;
  public short o = 0;
  
  public c() {}
  
  public c(short paramShort1, ArrayList paramArrayList, long paramLong1, long paramLong2, byte[] paramArrayOfByte1, long paramLong3, byte[] paramArrayOfByte2, long paramLong4, long paramLong5, long paramLong6, long paramLong7, long paramLong8, long paramLong9, long paramLong10, short paramShort2)
  {
    a = paramShort1;
    b = paramArrayList;
    c = paramLong1;
    d = paramLong2;
    e = paramArrayOfByte1;
    f = paramLong3;
    g = paramArrayOfByte2;
    h = paramLong4;
    i = paramLong5;
    j = paramLong6;
    k = paramLong7;
    l = paramLong8;
    m = paramLong9;
    n = paramLong10;
    o = paramShort2;
  }
  
  public void readFrom(JceInputStream paramJceInputStream)
  {
    a = paramJceInputStream.read(a, 0, false);
    if (p == null)
    {
      p = new ArrayList();
      a localA = new a();
      p.add(localA);
    }
    b = ((ArrayList)paramJceInputStream.read(p, 1, false));
    c = paramJceInputStream.read(c, 2, false);
    d = paramJceInputStream.read(d, 3, false);
    if (q == null)
    {
      q = (byte[])new byte[1];
      ((byte[])q)[0] = 0;
    }
    e = ((byte[])paramJceInputStream.read(q, 4, false));
    f = paramJceInputStream.read(f, 5, false);
    if (r == null)
    {
      r = (byte[])new byte[1];
      ((byte[])r)[0] = 0;
    }
    g = ((byte[])paramJceInputStream.read(r, 6, false));
    h = paramJceInputStream.read(h, 7, false);
    i = paramJceInputStream.read(i, 8, false);
    j = paramJceInputStream.read(j, 9, false);
    k = paramJceInputStream.read(k, 10, false);
    l = paramJceInputStream.read(l, 11, false);
    m = paramJceInputStream.read(m, 12, false);
    n = paramJceInputStream.read(n, 13, false);
    o = paramJceInputStream.read(o, 14, false);
  }
  
  public void writeTo(JceOutputStream paramJceOutputStream)
  {
    paramJceOutputStream.write(a, 0);
    if (b != null) {
      paramJceOutputStream.write(b, 1);
    }
    paramJceOutputStream.write(c, 2);
    paramJceOutputStream.write(d, 3);
    if (e != null) {
      paramJceOutputStream.write(e, 4);
    }
    paramJceOutputStream.write(f, 5);
    if (g != null) {
      paramJceOutputStream.write(g, 6);
    }
    paramJceOutputStream.write(h, 7);
    paramJceOutputStream.write(i, 8);
    paramJceOutputStream.write(j, 9);
    paramJceOutputStream.write(k, 10);
    paramJceOutputStream.write(l, 11);
    paramJceOutputStream.write(m, 12);
    paramJceOutputStream.write(n, 13);
    paramJceOutputStream.write(o, 14);
  }
}
