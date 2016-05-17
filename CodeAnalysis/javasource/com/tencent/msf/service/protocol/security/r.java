package com.tencent.msf.service.protocol.security;

import com.qq.taf.jce.JceInputStream;
import com.qq.taf.jce.JceOutputStream;
import com.qq.taf.jce.JceStruct;

public final class r
  extends JceStruct
{
  static byte[] e;
  public int a = 0;
  public int b = 0;
  public int c = 0;
  public byte[] d = null;
  
  public r() {}
  
  public r(int paramInt1, int paramInt2, int paramInt3, byte[] paramArrayOfByte)
  {
    a = paramInt1;
    b = paramInt2;
    c = paramInt3;
    d = paramArrayOfByte;
  }
  
  public void readFrom(JceInputStream paramJceInputStream)
  {
    a = paramJceInputStream.read(a, 0, true);
    b = paramJceInputStream.read(b, 1, true);
    c = paramJceInputStream.read(c, 2, true);
    if (e == null)
    {
      e = (byte[])new byte[1];
      ((byte[])e)[0] = 0;
    }
    d = ((byte[])paramJceInputStream.read(e, 3, true));
  }
  
  public void writeTo(JceOutputStream paramJceOutputStream)
  {
    paramJceOutputStream.write(a, 0);
    paramJceOutputStream.write(b, 1);
    paramJceOutputStream.write(c, 2);
    paramJceOutputStream.write(d, 3);
  }
}
