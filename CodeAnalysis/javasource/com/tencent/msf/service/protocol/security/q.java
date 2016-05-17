package com.tencent.msf.service.protocol.security;

import com.qq.taf.jce.JceInputStream;
import com.qq.taf.jce.JceOutputStream;
import com.qq.taf.jce.JceStruct;

public final class q
  extends JceStruct
{
  static byte[] d;
  public long a = 0L;
  public int b = 0;
  public byte[] c = null;
  
  public q() {}
  
  public q(long paramLong, int paramInt, byte[] paramArrayOfByte)
  {
    a = paramLong;
    b = paramInt;
    c = paramArrayOfByte;
  }
  
  public void readFrom(JceInputStream paramJceInputStream)
  {
    a = paramJceInputStream.read(a, 0, true);
    b = paramJceInputStream.read(b, 1, true);
    if (d == null)
    {
      d = (byte[])new byte[1];
      ((byte[])d)[0] = 0;
    }
    c = ((byte[])paramJceInputStream.read(d, 2, true));
  }
  
  public void writeTo(JceOutputStream paramJceOutputStream)
  {
    paramJceOutputStream.write(a, 0);
    paramJceOutputStream.write(b, 1);
    paramJceOutputStream.write(c, 2);
  }
}
