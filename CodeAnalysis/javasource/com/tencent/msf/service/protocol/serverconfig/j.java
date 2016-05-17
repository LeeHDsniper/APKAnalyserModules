package com.tencent.msf.service.protocol.serverconfig;

import com.qq.taf.jce.JceInputStream;
import com.qq.taf.jce.JceOutputStream;
import com.qq.taf.jce.JceStruct;

public final class j
  extends JceStruct
{
  public String a = "";
  public int b = 0;
  public byte c = 0;
  public byte d = 0;
  public byte e = 0;
  public int f = 8;
  public byte g = 0;
  
  public j() {}
  
  public j(String paramString, int paramInt1, byte paramByte1, byte paramByte2, byte paramByte3, int paramInt2, byte paramByte4)
  {
    a = paramString;
    b = paramInt1;
    c = paramByte1;
    d = paramByte2;
    e = paramByte3;
    f = paramInt2;
    g = paramByte4;
  }
  
  public void readFrom(JceInputStream paramJceInputStream)
  {
    a = paramJceInputStream.readString(1, true);
    b = paramJceInputStream.read(b, 2, true);
    c = paramJceInputStream.read(c, 3, true);
    d = paramJceInputStream.read(d, 4, true);
    e = paramJceInputStream.read(e, 5, false);
    f = paramJceInputStream.read(f, 6, false);
    g = paramJceInputStream.read(g, 7, false);
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
  }
}
