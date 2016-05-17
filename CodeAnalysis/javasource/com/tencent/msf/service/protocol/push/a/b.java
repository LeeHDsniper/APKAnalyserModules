package com.tencent.msf.service.protocol.push.a;

import com.qq.taf.jce.JceInputStream;
import com.qq.taf.jce.JceOutputStream;
import com.qq.taf.jce.JceStruct;
import java.util.ArrayList;

public final class b
  extends JceStruct
{
  static ArrayList j;
  static ArrayList k;
  static ArrayList l;
  static ArrayList m;
  public short a = 0;
  public ArrayList b = null;
  public ArrayList c = null;
  public ArrayList d = null;
  public ArrayList e = null;
  public long f = 0L;
  public long g = 0L;
  public long h = 0L;
  public long i = 0L;
  
  public b() {}
  
  public b(short paramShort, ArrayList paramArrayList1, ArrayList paramArrayList2, ArrayList paramArrayList3, ArrayList paramArrayList4, long paramLong1, long paramLong2, long paramLong3, long paramLong4)
  {
    a = paramShort;
    b = paramArrayList1;
    c = paramArrayList2;
    d = paramArrayList3;
    e = paramArrayList4;
    f = paramLong1;
    g = paramLong2;
    h = paramLong3;
    i = paramLong4;
  }
  
  public void readFrom(JceInputStream paramJceInputStream)
  {
    a = paramJceInputStream.read(a, 0, false);
    Object localObject;
    if (j == null)
    {
      j = new ArrayList();
      localObject = new a();
      j.add(localObject);
    }
    b = ((ArrayList)paramJceInputStream.read(j, 1, false));
    if (k == null)
    {
      k = new ArrayList();
      localObject = (byte[])new byte[1];
      ((byte[])localObject)[0] = 0;
      k.add(localObject);
    }
    c = ((ArrayList)paramJceInputStream.read(k, 2, false));
    if (l == null)
    {
      l = new ArrayList();
      l.add(Long.valueOf(0L));
    }
    d = ((ArrayList)paramJceInputStream.read(l, 3, false));
    if (m == null)
    {
      m = new ArrayList();
      localObject = (byte[])new byte[1];
      ((byte[])localObject)[0] = 0;
      m.add(localObject);
    }
    e = ((ArrayList)paramJceInputStream.read(m, 4, false));
    f = paramJceInputStream.read(f, 5, false);
    g = paramJceInputStream.read(g, 6, false);
    h = paramJceInputStream.read(h, 7, false);
    i = paramJceInputStream.read(i, 8, false);
  }
  
  public void writeTo(JceOutputStream paramJceOutputStream)
  {
    paramJceOutputStream.write(a, 0);
    if (b != null) {
      paramJceOutputStream.write(b, 1);
    }
    if (c != null) {
      paramJceOutputStream.write(c, 2);
    }
    if (d != null) {
      paramJceOutputStream.write(d, 3);
    }
    if (e != null) {
      paramJceOutputStream.write(e, 4);
    }
    paramJceOutputStream.write(f, 5);
    paramJceOutputStream.write(g, 6);
    paramJceOutputStream.write(h, 7);
    paramJceOutputStream.write(i, 8);
  }
}
