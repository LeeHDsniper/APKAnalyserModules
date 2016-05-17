package com.tencent.msf.service.protocol.a;

import com.qq.taf.jce.JceInputStream;
import com.qq.taf.jce.JceOutputStream;
import com.qq.taf.jce.JceStruct;

public final class b
  extends JceStruct
{
  public byte a = 0;
  public String b = "";
  public long c = 0L;
  public long d = 0L;
  public long e = 0L;
  
  public b() {}
  
  public b(byte paramByte, String paramString, long paramLong1, long paramLong2, long paramLong3)
  {
    a = paramByte;
    b = paramString;
    c = paramLong1;
    d = paramLong2;
    e = paramLong3;
  }
  
  public void readFrom(JceInputStream paramJceInputStream)
  {
    a = paramJceInputStream.read(a, 0, true);
    b = paramJceInputStream.readString(1, false);
    c = paramJceInputStream.read(c, 2, false);
    d = paramJceInputStream.read(d, 3, false);
    e = paramJceInputStream.read(e, 4, false);
  }
  
  public void writeTo(JceOutputStream paramJceOutputStream)
  {
    paramJceOutputStream.write(a, 0);
    if (b != null) {
      paramJceOutputStream.write(b, 1);
    }
    paramJceOutputStream.write(c, 2);
    paramJceOutputStream.write(d, 3);
    paramJceOutputStream.write(e, 4);
  }
}
