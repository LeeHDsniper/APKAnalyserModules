package com.tencent.msf.service.protocol.security;

import com.qq.taf.jce.JceInputStream;
import com.qq.taf.jce.JceOutputStream;
import com.qq.taf.jce.JceStruct;

public final class p
  extends JceStruct
{
  static byte[] f;
  static byte[] g;
  static byte[] h;
  public byte[] a = null;
  public String b = "";
  public String c = "";
  public byte[] d = null;
  public byte[] e = null;
  
  public p() {}
  
  public p(byte[] paramArrayOfByte1, String paramString1, String paramString2, byte[] paramArrayOfByte2, byte[] paramArrayOfByte3)
  {
    a = paramArrayOfByte1;
    b = paramString1;
    c = paramString2;
    d = paramArrayOfByte2;
    e = paramArrayOfByte3;
  }
  
  public void readFrom(JceInputStream paramJceInputStream)
  {
    if (f == null)
    {
      f = (byte[])new byte[1];
      ((byte[])f)[0] = 0;
    }
    a = ((byte[])paramJceInputStream.read(f, 0, true));
    b = paramJceInputStream.readString(1, true);
    c = paramJceInputStream.readString(2, true);
    if (g == null)
    {
      g = (byte[])new byte[1];
      ((byte[])g)[0] = 0;
    }
    d = ((byte[])paramJceInputStream.read(g, 3, true));
    if (h == null)
    {
      h = (byte[])new byte[1];
      ((byte[])h)[0] = 0;
    }
    e = ((byte[])paramJceInputStream.read(h, 4, false));
  }
  
  public void writeTo(JceOutputStream paramJceOutputStream)
  {
    paramJceOutputStream.write(a, 0);
    paramJceOutputStream.write(b, 1);
    paramJceOutputStream.write(c, 2);
    paramJceOutputStream.write(d, 3);
    if (e != null) {
      paramJceOutputStream.write(e, 4);
    }
  }
}
