package com.tencent.msf.service.protocol.security;

import com.qq.taf.jce.JceInputStream;
import com.qq.taf.jce.JceOutputStream;
import com.qq.taf.jce.JceStruct;

public final class l
  extends JceStruct
{
  static byte[] d;
  static byte[] e;
  public int a = 0;
  public byte[] b = null;
  public byte[] c = null;
  
  public l() {}
  
  public l(int paramInt, byte[] paramArrayOfByte1, byte[] paramArrayOfByte2)
  {
    a = paramInt;
    b = paramArrayOfByte1;
    c = paramArrayOfByte2;
  }
  
  public void readFrom(JceInputStream paramJceInputStream)
  {
    a = paramJceInputStream.read(a, 0, true);
    if (d == null)
    {
      d = (byte[])new byte[1];
      ((byte[])d)[0] = 0;
    }
    b = ((byte[])paramJceInputStream.read(d, 1, true));
    if (e == null)
    {
      e = (byte[])new byte[1];
      ((byte[])e)[0] = 0;
    }
    c = ((byte[])paramJceInputStream.read(e, 2, true));
  }
  
  public void writeTo(JceOutputStream paramJceOutputStream)
  {
    paramJceOutputStream.write(a, 0);
    paramJceOutputStream.write(b, 1);
    paramJceOutputStream.write(c, 2);
  }
}
