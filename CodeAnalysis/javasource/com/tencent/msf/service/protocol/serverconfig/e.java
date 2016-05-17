package com.tencent.msf.service.protocol.serverconfig;

import com.qq.taf.jce.JceInputStream;
import com.qq.taf.jce.JceOutputStream;
import com.qq.taf.jce.JceStruct;
import java.util.ArrayList;

public final class e
  extends JceStruct
{
  static ArrayList o;
  static ArrayList p;
  static ArrayList q;
  static ArrayList r;
  static byte[] s;
  public int a = 0;
  public ArrayList b = null;
  public ArrayList c = null;
  public int d = 0;
  public int e = 86400;
  public byte f = 0;
  public byte g = 0;
  public int h = 1;
  public int i = 5;
  public long j = 0L;
  public int k = 0;
  public ArrayList l = null;
  public ArrayList m = null;
  public byte[] n = null;
  
  public e() {}
  
  public e(int paramInt1, ArrayList paramArrayList1, ArrayList paramArrayList2, int paramInt2, int paramInt3, byte paramByte1, byte paramByte2, int paramInt4, int paramInt5, long paramLong, int paramInt6, ArrayList paramArrayList3, ArrayList paramArrayList4, byte[] paramArrayOfByte)
  {
    a = paramInt1;
    b = paramArrayList1;
    c = paramArrayList2;
    d = paramInt2;
    e = paramInt3;
    f = paramByte1;
    g = paramByte2;
    h = paramInt4;
    i = paramInt5;
    j = paramLong;
    k = paramInt6;
    l = paramArrayList3;
    m = paramArrayList4;
    n = paramArrayOfByte;
  }
  
  public void readFrom(JceInputStream paramJceInputStream)
  {
    a = paramJceInputStream.read(a, 1, true);
    j localJ;
    if (o == null)
    {
      o = new ArrayList();
      localJ = new j();
      o.add(localJ);
    }
    b = ((ArrayList)paramJceInputStream.read(o, 2, true));
    if (p == null)
    {
      p = new ArrayList();
      localJ = new j();
      p.add(localJ);
    }
    c = ((ArrayList)paramJceInputStream.read(p, 3, true));
    d = paramJceInputStream.read(d, 4, true);
    e = paramJceInputStream.read(e, 5, true);
    f = paramJceInputStream.read(f, 6, false);
    g = paramJceInputStream.read(g, 7, false);
    h = paramJceInputStream.read(h, 8, false);
    i = paramJceInputStream.read(i, 9, false);
    j = paramJceInputStream.read(j, 10, false);
    k = paramJceInputStream.read(k, 11, false);
    if (q == null)
    {
      q = new ArrayList();
      localJ = new j();
      q.add(localJ);
    }
    l = ((ArrayList)paramJceInputStream.read(q, 12, false));
    if (r == null)
    {
      r = new ArrayList();
      localJ = new j();
      r.add(localJ);
    }
    m = ((ArrayList)paramJceInputStream.read(r, 13, false));
    if (s == null)
    {
      s = (byte[])new byte[1];
      ((byte[])s)[0] = 0;
    }
    n = ((byte[])paramJceInputStream.read(s, 14, false));
  }
  
  public void writeTo(JceOutputStream paramJceOutputStream)
  {
    paramJceOutputStream.write(a, 1);
    paramJceOutputStream.write(b, 2);
    paramJceOutputStream.write(c, 3);
    paramJceOutputStream.write(d, 4);
    paramJceOutputStream.write(e, 5);
    paramJceOutputStream.write(f, 6);
    paramJceOutputStream.write(g, 7);
    paramJceOutputStream.write(h, 8);
    paramJceOutputStream.write(i, 9);
    paramJceOutputStream.write(j, 10);
    paramJceOutputStream.write(k, 11);
    if (l != null) {
      paramJceOutputStream.write(l, 12);
    }
    if (m != null) {
      paramJceOutputStream.write(m, 13);
    }
    if (n != null) {
      paramJceOutputStream.write(n, 14);
    }
  }
}
