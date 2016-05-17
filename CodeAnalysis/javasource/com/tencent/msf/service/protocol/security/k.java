package com.tencent.msf.service.protocol.security;

import com.qq.taf.jce.JceInputStream;
import com.qq.taf.jce.JceOutputStream;
import com.qq.taf.jce.JceStruct;

public final class k
  extends JceStruct
{
  static byte[] k;
  static byte[] l;
  public int a = 0;
  public int b = 0;
  public int c = 0;
  public String d = "";
  public int e = 0;
  public int f = 0;
  public byte[] g = null;
  public byte[] h = null;
  public int i = 0;
  public int j = 0;
  
  public k() {}
  
  public k(int paramInt1, int paramInt2, int paramInt3, String paramString, int paramInt4, int paramInt5, byte[] paramArrayOfByte1, byte[] paramArrayOfByte2, int paramInt6, int paramInt7)
  {
    a = paramInt1;
    b = paramInt2;
    c = paramInt3;
    d = paramString;
    e = paramInt4;
    f = paramInt5;
    g = paramArrayOfByte1;
    h = paramArrayOfByte2;
    i = paramInt6;
    j = paramInt7;
  }
  
  public void readFrom(JceInputStream paramJceInputStream)
  {
    a = paramJceInputStream.read(a, 0, true);
    b = paramJceInputStream.read(b, 1, true);
    c = paramJceInputStream.read(c, 2, true);
    d = paramJceInputStream.readString(3, true);
    e = paramJceInputStream.read(e, 4, true);
    f = paramJceInputStream.read(f, 5, true);
    if (k == null)
    {
      k = (byte[])new byte[1];
      ((byte[])k)[0] = 0;
    }
    g = ((byte[])paramJceInputStream.read(k, 6, true));
    if (l == null)
    {
      l = (byte[])new byte[1];
      ((byte[])l)[0] = 0;
    }
    h = ((byte[])paramJceInputStream.read(l, 7, true));
    i = paramJceInputStream.read(i, 8, true);
    j = paramJceInputStream.read(j, 9, false);
  }
  
  public void writeTo(JceOutputStream paramJceOutputStream)
  {
    paramJceOutputStream.write(a, 0);
    paramJceOutputStream.write(b, 1);
    paramJceOutputStream.write(c, 2);
    paramJceOutputStream.write(d, 3);
    paramJceOutputStream.write(e, 4);
    paramJceOutputStream.write(f, 5);
    paramJceOutputStream.write(g, 6);
    paramJceOutputStream.write(h, 7);
    paramJceOutputStream.write(i, 8);
    paramJceOutputStream.write(j, 9);
  }
}
