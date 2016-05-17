package com.tencent.msf.service.protocol.push.a;

import com.qq.taf.jce.JceInputStream;
import com.qq.taf.jce.JceOutputStream;
import com.qq.taf.jce.JceStruct;

public final class a
  extends JceStruct
{
  public long a = 0L;
  public int b = 0;
  
  public a() {}
  
  public a(long paramLong, int paramInt)
  {
    a = paramLong;
    b = paramInt;
  }
  
  public void readFrom(JceInputStream paramJceInputStream)
  {
    a = paramJceInputStream.read(a, 0, false);
    b = paramJceInputStream.read(b, 1, false);
  }
  
  public void writeTo(JceOutputStream paramJceOutputStream)
  {
    paramJceOutputStream.write(a, 0);
    paramJceOutputStream.write(b, 1);
  }
}
