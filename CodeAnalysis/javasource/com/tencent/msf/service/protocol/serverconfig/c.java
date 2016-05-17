package com.tencent.msf.service.protocol.serverconfig;

import com.qq.taf.jce.JceInputStream;
import com.qq.taf.jce.JceOutputStream;
import com.qq.taf.jce.JceStruct;

public final class c
  extends JceStruct
{
  static byte[] e;
  public long a = 0L;
  public long b = 0L;
  public String c = "";
  public byte[] d = null;
  
  public c() {}
  
  public c(long paramLong1, long paramLong2, String paramString, byte[] paramArrayOfByte)
  {
    a = paramLong1;
    b = paramLong2;
    c = paramString;
    d = paramArrayOfByte;
  }
  
  public void readFrom(JceInputStream paramJceInputStream)
  {
    a = paramJceInputStream.read(a, 1, true);
    b = paramJceInputStream.read(b, 2, true);
    c = paramJceInputStream.readString(3, true);
    if (e == null)
    {
      e = (byte[])new byte[1];
      ((byte[])e)[0] = 0;
    }
    d = ((byte[])paramJceInputStream.read(e, 4, true));
  }
  
  public void writeTo(JceOutputStream paramJceOutputStream)
  {
    paramJceOutputStream.write(a, 1);
    paramJceOutputStream.write(b, 2);
    paramJceOutputStream.write(c, 3);
    paramJceOutputStream.write(d, 4);
  }
}
