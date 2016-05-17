package com.tencent.msf.service.protocol.serverconfig;

import com.qq.taf.jce.JceInputStream;
import com.qq.taf.jce.JceOutputStream;
import com.qq.taf.jce.JceStruct;

public final class d
  extends JceStruct
{
  public long a = 0L;
  public long b = 0L;
  public byte c = 1;
  public String d = "46000";
  public int e = 0;
  public long f = 0L;
  public String g = "";
  public long h = 0L;
  public long i = 0L;
  public long j = 0L;
  public byte k = 0;
  
  public d() {}
  
  public d(long paramLong1, long paramLong2, byte paramByte1, String paramString1, int paramInt, long paramLong3, String paramString2, long paramLong4, long paramLong5, long paramLong6, byte paramByte2)
  {
    a = paramLong1;
    b = paramLong2;
    c = paramByte1;
    d = paramString1;
    e = paramInt;
    f = paramLong3;
    g = paramString2;
    h = paramLong4;
    i = paramLong5;
    j = paramLong6;
    k = paramByte2;
  }
  
  public void readFrom(JceInputStream paramJceInputStream)
  {
    a = paramJceInputStream.read(a, 1, true);
    b = paramJceInputStream.read(b, 2, true);
    c = paramJceInputStream.read(c, 3, true);
    d = paramJceInputStream.readString(4, true);
    e = paramJceInputStream.read(e, 5, true);
    f = paramJceInputStream.read(f, 6, true);
    g = paramJceInputStream.readString(7, true);
    h = paramJceInputStream.read(h, 8, false);
    i = paramJceInputStream.read(i, 9, false);
    j = paramJceInputStream.read(j, 10, false);
    k = paramJceInputStream.read(k, 11, false);
  }
  
  public void writeTo(JceOutputStream paramJceOutputStream)
  {
    paramJceOutputStream.write(a, 1);
    paramJceOutputStream.write(b, 2);
    paramJceOutputStream.write(c, 3);
    paramJceOutputStream.write(d, 4);
    paramJceOutputStream.write(e, 5);
    paramJceOutputStream.write(f, 6);
    paramJceOutputStream.write(g, 7);
    paramJceOutputStream.write(h, 8);
    paramJceOutputStream.write(i, 9);
    paramJceOutputStream.write(j, 10);
    paramJceOutputStream.write(k, 11);
  }
}
