package com.tencent.msf.service.protocol.security;

import com.qq.taf.jce.JceInputStream;
import com.qq.taf.jce.JceOutputStream;
import com.qq.taf.jce.JceStruct;

public final class m
  extends JceStruct
{
  static byte[] i;
  static byte[] j;
  static byte[] k;
  public byte[] a = null;
  public String b = "";
  public String c = "";
  public byte d = 0;
  public String e = "";
  public byte f = 0;
  public byte[] g = null;
  public byte[] h = null;
  
  public m() {}
  
  public m(byte[] paramArrayOfByte1, String paramString1, String paramString2, byte paramByte1, String paramString3, byte paramByte2, byte[] paramArrayOfByte2, byte[] paramArrayOfByte3)
  {
    a = paramArrayOfByte1;
    b = paramString1;
    c = paramString2;
    d = paramByte1;
    e = paramString3;
    f = paramByte2;
    g = paramArrayOfByte2;
    h = paramArrayOfByte3;
  }
  
  public void readFrom(JceInputStream paramJceInputStream)
  {
    if (i == null)
    {
      i = (byte[])new byte[1];
      ((byte[])i)[0] = 0;
    }
    a = ((byte[])paramJceInputStream.read(i, 0, true));
    b = paramJceInputStream.readString(1, true);
    c = paramJceInputStream.readString(2, true);
    d = paramJceInputStream.read(d, 3, false);
    e = paramJceInputStream.readString(4, false);
    f = paramJceInputStream.read(f, 5, false);
    if (j == null)
    {
      j = (byte[])new byte[1];
      ((byte[])j)[0] = 0;
    }
    g = ((byte[])paramJceInputStream.read(j, 6, false));
    if (k == null)
    {
      k = (byte[])new byte[1];
      ((byte[])k)[0] = 0;
    }
    h = ((byte[])paramJceInputStream.read(k, 7, false));
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
    paramJceOutputStream.write(f, 5);
    if (g != null) {
      paramJceOutputStream.write(g, 6);
    }
    if (h != null) {
      paramJceOutputStream.write(h, 7);
    }
  }
}
