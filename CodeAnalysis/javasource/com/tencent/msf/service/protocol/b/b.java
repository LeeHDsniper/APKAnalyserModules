package com.tencent.msf.service.protocol.b;

import com.qq.taf.jce.JceInputStream;
import com.qq.taf.jce.JceOutputStream;
import com.qq.taf.jce.JceStruct;
import java.util.ArrayList;

public final class b
  extends JceStruct
{
  static ArrayList f;
  static byte[] g;
  public short a = 0;
  public ArrayList b = null;
  public byte[] c = null;
  public long d = 0L;
  public long e = 0L;
  
  public b() {}
  
  public b(short paramShort, ArrayList paramArrayList, byte[] paramArrayOfByte, long paramLong1, long paramLong2)
  {
    a = paramShort;
    b = paramArrayList;
    c = paramArrayOfByte;
    d = paramLong1;
    e = paramLong2;
  }
  
  public void readFrom(JceInputStream paramJceInputStream)
  {
    a = paramJceInputStream.read(a, 0, false);
    if (f == null)
    {
      f = new ArrayList();
      a localA = new a();
      f.add(localA);
    }
    b = ((ArrayList)paramJceInputStream.read(f, 1, false));
    if (g == null)
    {
      g = (byte[])new byte[1];
      ((byte[])g)[0] = 0;
    }
    c = ((byte[])paramJceInputStream.read(g, 2, false));
    d = paramJceInputStream.read(d, 3, false);
    e = paramJceInputStream.read(e, 4, false);
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
    paramJceOutputStream.write(d, 3);
    paramJceOutputStream.write(e, 4);
  }
}
