package com.tencent.msf.service.protocol.security;

import com.qq.taf.jce.JceInputStream;
import com.qq.taf.jce.JceOutputStream;
import com.qq.taf.jce.JceStruct;

public final class o
  extends JceStruct
{
  static byte[] e;
  static byte[] f;
  public byte[] a = null;
  public String b = "";
  public String c = "";
  public byte[] d = null;
  
  public o() {}
  
  public o(byte[] paramArrayOfByte1, String paramString1, String paramString2, byte[] paramArrayOfByte2)
  {
    a = paramArrayOfByte1;
    b = paramString1;
    c = paramString2;
    d = paramArrayOfByte2;
  }
  
  public void readFrom(JceInputStream paramJceInputStream)
  {
    if (e == null)
    {
      e = (byte[])new byte[1];
      ((byte[])e)[0] = 0;
    }
    a = ((byte[])paramJceInputStream.read(e, 0, true));
    b = paramJceInputStream.readString(1, true);
    c = paramJceInputStream.readString(2, true);
    if (f == null)
    {
      f = (byte[])new byte[1];
      ((byte[])f)[0] = 0;
    }
    d = ((byte[])paramJceInputStream.read(f, 3, true));
  }
  
  public void writeTo(JceOutputStream paramJceOutputStream)
  {
    paramJceOutputStream.write(a, 0);
    paramJceOutputStream.write(b, 1);
    paramJceOutputStream.write(c, 2);
    paramJceOutputStream.write(d, 3);
  }
}
