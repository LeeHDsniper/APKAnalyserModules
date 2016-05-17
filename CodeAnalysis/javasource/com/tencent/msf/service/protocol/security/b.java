package com.tencent.msf.service.protocol.security;

import com.qq.taf.jce.JceInputStream;
import com.qq.taf.jce.JceOutputStream;
import com.qq.taf.jce.JceStruct;

public final class b
  extends JceStruct
{
  static byte[] g;
  static byte[] h;
  static byte[] i;
  public byte[] a = null;
  public int b = 0;
  public int c = 0;
  public byte[] d = null;
  public int e = 0;
  public byte[] f = null;
  
  public b() {}
  
  public b(byte[] paramArrayOfByte1, int paramInt1, int paramInt2, byte[] paramArrayOfByte2, int paramInt3, byte[] paramArrayOfByte3)
  {
    a = paramArrayOfByte1;
    b = paramInt1;
    c = paramInt2;
    d = paramArrayOfByte2;
    e = paramInt3;
    f = paramArrayOfByte3;
  }
  
  public void readFrom(JceInputStream paramJceInputStream)
  {
    if (g == null)
    {
      g = (byte[])new byte[1];
      ((byte[])g)[0] = 0;
    }
    a = ((byte[])paramJceInputStream.read(g, 0, true));
    b = paramJceInputStream.read(b, 1, true);
    c = paramJceInputStream.read(c, 2, true);
    if (h == null)
    {
      h = (byte[])new byte[1];
      ((byte[])h)[0] = 0;
    }
    d = ((byte[])paramJceInputStream.read(h, 3, true));
    e = paramJceInputStream.read(e, 4, true);
    if (i == null)
    {
      i = (byte[])new byte[1];
      ((byte[])i)[0] = 0;
    }
    f = ((byte[])paramJceInputStream.read(i, 5, false));
  }
  
  public void writeTo(JceOutputStream paramJceOutputStream)
  {
    paramJceOutputStream.write(a, 0);
    paramJceOutputStream.write(b, 1);
    paramJceOutputStream.write(c, 2);
    paramJceOutputStream.write(d, 3);
    paramJceOutputStream.write(e, 4);
    if (f != null) {
      paramJceOutputStream.write(f, 5);
    }
  }
}
