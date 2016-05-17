package com.tencent.msf.service.protocol.serverconfig;

import com.qq.taf.jce.JceInputStream;
import com.qq.taf.jce.JceOutputStream;
import com.qq.taf.jce.JceStruct;

public final class k
  extends JceStruct
{
  public int a = 0;
  public byte b = 0;
  public byte c = 0;
  public byte d = 0;
  
  public k() {}
  
  public k(int paramInt, byte paramByte1, byte paramByte2, byte paramByte3)
  {
    a = paramInt;
    b = paramByte1;
    c = paramByte2;
    d = paramByte3;
  }
  
  public void readFrom(JceInputStream paramJceInputStream)
  {
    a = paramJceInputStream.read(a, 1, true);
    b = paramJceInputStream.read(b, 2, true);
    c = paramJceInputStream.read(c, 3, true);
    d = paramJceInputStream.read(d, 4, true);
  }
  
  public void writeTo(JceOutputStream paramJceOutputStream)
  {
    paramJceOutputStream.write(a, 1);
    paramJceOutputStream.write(b, 2);
    paramJceOutputStream.write(c, 3);
    paramJceOutputStream.write(d, 4);
  }
}
