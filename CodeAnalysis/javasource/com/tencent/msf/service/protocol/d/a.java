package com.tencent.msf.service.protocol.d;

import com.qq.taf.jce.JceInputStream;
import com.qq.taf.jce.JceOutputStream;
import com.qq.taf.jce.JceStruct;

public final class a
  extends JceStruct
{
  static byte[] f;
  static byte[] g;
  public byte[] a = null;
  public int b = 0;
  public int c = 0;
  public byte[] d = null;
  public byte e = 0;
  
  public a() {}
  
  public a(byte[] paramArrayOfByte1, int paramInt1, int paramInt2, byte[] paramArrayOfByte2, byte paramByte)
  {
    a = paramArrayOfByte1;
    b = paramInt1;
    c = paramInt2;
    d = paramArrayOfByte2;
    e = paramByte;
  }
  
  public void readFrom(JceInputStream paramJceInputStream)
  {
    if (f == null)
    {
      f = (byte[])new byte[1];
      ((byte[])f)[0] = 0;
    }
    a = ((byte[])paramJceInputStream.read(f, 0, true));
    b = paramJceInputStream.read(b, 1, true);
    c = paramJceInputStream.read(c, 2, true);
    if (g == null)
    {
      g = (byte[])new byte[1];
      ((byte[])g)[0] = 0;
    }
    d = ((byte[])paramJceInputStream.read(g, 3, true));
    e = paramJceInputStream.read(e, 4, false);
  }
  
  public void writeTo(JceOutputStream paramJceOutputStream)
  {
    paramJceOutputStream.write(a, 0);
    paramJceOutputStream.write(b, 1);
    paramJceOutputStream.write(c, 2);
    paramJceOutputStream.write(d, 3);
    paramJceOutputStream.write(e, 4);
  }
}
