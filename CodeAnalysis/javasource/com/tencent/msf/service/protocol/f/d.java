package com.tencent.msf.service.protocol.f;

import com.qq.taf.jce.JceInputStream;
import com.qq.taf.jce.JceOutputStream;
import com.qq.taf.jce.JceStruct;

public final class d
  extends JceStruct
{
  public String a = "";
  public long b = 0L;
  public short c = 0;
  public short d = 0;
  public byte e = 0;
  public long f = 0L;
  public byte g = 0;
  public byte h = 0;
  public int i = 64;
  
  public d() {}
  
  public d(String paramString, long paramLong1, short paramShort1, short paramShort2, byte paramByte1, long paramLong2, byte paramByte2, byte paramByte3, int paramInt)
  {
    a = paramString;
    b = paramLong1;
    c = paramShort1;
    d = paramShort2;
    e = paramByte1;
    f = paramLong2;
    g = paramByte2;
    h = paramByte3;
    i = paramInt;
  }
  
  public void readFrom(JceInputStream paramJceInputStream)
  {
    a = paramJceInputStream.readString(1, true);
    b = paramJceInputStream.read(b, 2, true);
    c = paramJceInputStream.read(c, 3, true);
    d = paramJceInputStream.read(d, 4, true);
    e = paramJceInputStream.read(e, 5, true);
    f = paramJceInputStream.read(f, 6, false);
    g = paramJceInputStream.read(g, 7, false);
    h = paramJceInputStream.read(h, 8, false);
    i = paramJceInputStream.read(i, 9, false);
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
  }
}
