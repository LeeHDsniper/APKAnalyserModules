package com.tencent.msf.service.protocol.serverconfig;

import com.qq.taf.jce.JceInputStream;
import com.qq.taf.jce.JceOutputStream;
import com.qq.taf.jce.JceStruct;

public final class g
  extends JceStruct
{
  static byte[] d;
  public int a = 0;
  public long b = 0L;
  public byte[] c = null;
  
  public g() {}
  
  public g(int paramInt, long paramLong, byte[] paramArrayOfByte)
  {
    a = paramInt;
    b = paramLong;
    c = paramArrayOfByte;
  }
  
  public void readFrom(JceInputStream paramJceInputStream)
  {
    a = paramJceInputStream.read(a, 1, true);
    b = paramJceInputStream.read(b, 2, true);
    if (d == null)
    {
      d = (byte[])new byte[1];
      ((byte[])d)[0] = 0;
    }
    c = ((byte[])paramJceInputStream.read(d, 3, false));
  }
  
  public void writeTo(JceOutputStream paramJceOutputStream)
  {
    paramJceOutputStream.write(a, 1);
    paramJceOutputStream.write(b, 2);
    if (c != null) {
      paramJceOutputStream.write(c, 3);
    }
  }
}
