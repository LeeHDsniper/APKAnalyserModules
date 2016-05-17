package com.tencent.msf.service.protocol.security;

import com.qq.taf.jce.JceInputStream;
import com.qq.taf.jce.JceOutputStream;
import com.qq.taf.jce.JceStruct;

public final class n
  extends JceStruct
{
  static byte[] h;
  static byte[] i;
  static byte[] j;
  public byte[] a = null;
  public String b = "";
  public String c = "";
  public byte d = 0;
  public byte e = 0;
  public byte[] f = null;
  public byte[] g = null;
  
  public n() {}
  
  public n(byte[] paramArrayOfByte1, String paramString1, String paramString2, byte paramByte1, byte paramByte2, byte[] paramArrayOfByte2, byte[] paramArrayOfByte3)
  {
    a = paramArrayOfByte1;
    b = paramString1;
    c = paramString2;
    d = paramByte1;
    e = paramByte2;
    f = paramArrayOfByte2;
    g = paramArrayOfByte3;
  }
  
  public void readFrom(JceInputStream paramJceInputStream)
  {
    if (h == null)
    {
      h = (byte[])new byte[1];
      ((byte[])h)[0] = 0;
    }
    a = ((byte[])paramJceInputStream.read(h, 0, true));
    b = paramJceInputStream.readString(1, true);
    c = paramJceInputStream.readString(2, false);
    d = paramJceInputStream.read(d, 3, false);
    e = paramJceInputStream.read(e, 4, false);
    if (i == null)
    {
      i = (byte[])new byte[1];
      ((byte[])i)[0] = 0;
    }
    f = ((byte[])paramJceInputStream.read(i, 5, false));
    if (j == null)
    {
      j = (byte[])new byte[1];
      ((byte[])j)[0] = 0;
    }
    g = ((byte[])paramJceInputStream.read(j, 6, false));
  }
  
  public void writeTo(JceOutputStream paramJceOutputStream)
  {
    paramJceOutputStream.write(a, 0);
    paramJceOutputStream.write(b, 1);
    if (c != null) {
      paramJceOutputStream.write(c, 2);
    }
    paramJceOutputStream.write(d, 3);
    paramJceOutputStream.write(e, 4);
    if (f != null) {
      paramJceOutputStream.write(f, 5);
    }
    if (g != null) {
      paramJceOutputStream.write(g, 6);
    }
  }
}
