package com.tencent.msf.service.protocol.c;

import com.qq.taf.jce.JceInputStream;
import com.qq.taf.jce.JceOutputStream;
import com.qq.taf.jce.JceStruct;

public final class a
  extends JceStruct
{
  static byte[] e;
  public long a = 0L;
  public long b = 0L;
  public short c = 0;
  public byte[] d = null;
  
  public a() {}
  
  public a(long paramLong1, long paramLong2, short paramShort, byte[] paramArrayOfByte)
  {
    a = paramLong1;
    b = paramLong2;
    c = paramShort;
    d = paramArrayOfByte;
  }
  
  public void readFrom(JceInputStream paramJceInputStream)
  {
    a = paramJceInputStream.read(a, 0, true);
    b = paramJceInputStream.read(b, 1, true);
    c = paramJceInputStream.read(c, 2, true);
    if (e == null)
    {
      e = (byte[])new byte[1];
      ((byte[])e)[0] = 0;
    }
    d = ((byte[])paramJceInputStream.read(e, 3, false));
  }
  
  public void writeTo(JceOutputStream paramJceOutputStream)
  {
    paramJceOutputStream.write(a, 0);
    paramJceOutputStream.write(b, 1);
    paramJceOutputStream.write(c, 2);
    if (d != null) {
      paramJceOutputStream.write(d, 3);
    }
  }
}
