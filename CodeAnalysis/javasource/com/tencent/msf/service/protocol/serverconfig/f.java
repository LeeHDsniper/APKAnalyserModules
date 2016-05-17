package com.tencent.msf.service.protocol.serverconfig;

import com.qq.taf.jce.JceInputStream;
import com.qq.taf.jce.JceOutputStream;
import com.qq.taf.jce.JceStruct;

public final class f
  extends JceStruct
{
  static byte[] d;
  public int a = 0;
  public byte[] b = null;
  public long c = 0L;
  
  public f() {}
  
  public f(int paramInt, byte[] paramArrayOfByte, long paramLong)
  {
    a = paramInt;
    b = paramArrayOfByte;
    c = paramLong;
  }
  
  public void readFrom(JceInputStream paramJceInputStream)
  {
    a = paramJceInputStream.read(a, 1, true);
    if (d == null)
    {
      d = (byte[])new byte[1];
      ((byte[])d)[0] = 0;
    }
    b = ((byte[])paramJceInputStream.read(d, 2, true));
    c = paramJceInputStream.read(c, 3, true);
  }
  
  public void writeTo(JceOutputStream paramJceOutputStream)
  {
    paramJceOutputStream.write(a, 1);
    paramJceOutputStream.write(b, 2);
    paramJceOutputStream.write(c, 3);
  }
}
