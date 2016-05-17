package com.tencent.msf.service.protocol.push;

import com.qq.taf.jce.JceInputStream;
import com.qq.taf.jce.JceOutputStream;
import com.qq.taf.jce.JceStruct;

public final class a
  extends JceStruct
{
  public long a = 0L;
  public long b = 0L;
  public byte c = 0;
  
  public a() {}
  
  public a(long paramLong1, long paramLong2, byte paramByte)
  {
    a = paramLong1;
    b = paramLong2;
    c = paramByte;
  }
  
  public void readFrom(JceInputStream paramJceInputStream)
  {
    a = paramJceInputStream.read(a, 0, true);
    b = paramJceInputStream.read(b, 1, true);
    c = paramJceInputStream.read(c, 2, true);
  }
  
  public void writeTo(JceOutputStream paramJceOutputStream)
  {
    paramJceOutputStream.write(a, 0);
    paramJceOutputStream.write(b, 1);
    paramJceOutputStream.write(c, 2);
  }
}
