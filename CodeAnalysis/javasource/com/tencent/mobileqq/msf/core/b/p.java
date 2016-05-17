package com.tencent.mobileqq.msf.core.b;

import com.qq.taf.jce.JceInputStream;
import com.qq.taf.jce.JceOutputStream;
import com.qq.taf.jce.JceStruct;

public final class p
  extends JceStruct
{
  public long a = 0L;
  public long b = 0L;
  public long c = 0L;
  public long d = 0L;
  public long e = 0L;
  public long f = 0L;
  
  public p() {}
  
  public p(long paramLong1, long paramLong2, long paramLong3, long paramLong4, long paramLong5, long paramLong6)
  {
    a = paramLong1;
    b = paramLong2;
    c = paramLong3;
    d = paramLong4;
    e = paramLong5;
    f = paramLong6;
  }
  
  public void readFrom(JceInputStream paramJceInputStream)
  {
    a = paramJceInputStream.read(a, 1, true);
    b = paramJceInputStream.read(b, 2, true);
    c = paramJceInputStream.read(c, 3, true);
    d = paramJceInputStream.read(d, 4, true);
    e = paramJceInputStream.read(e, 5, true);
    f = paramJceInputStream.read(f, 6, true);
  }
  
  public void writeTo(JceOutputStream paramJceOutputStream)
  {
    paramJceOutputStream.write(a, 1);
    paramJceOutputStream.write(b, 2);
    paramJceOutputStream.write(c, 3);
    paramJceOutputStream.write(d, 4);
    paramJceOutputStream.write(e, 5);
    paramJceOutputStream.write(f, 6);
  }
}
