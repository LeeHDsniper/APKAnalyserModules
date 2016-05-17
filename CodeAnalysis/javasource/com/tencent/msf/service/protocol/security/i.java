package com.tencent.msf.service.protocol.security;

import com.qq.taf.jce.JceInputStream;
import com.qq.taf.jce.JceOutputStream;
import com.qq.taf.jce.JceStruct;

public final class i
  extends JceStruct
{
  static byte[] d;
  public byte[] a = null;
  public String b = "";
  public String c = "";
  
  public i() {}
  
  public i(byte[] paramArrayOfByte, String paramString1, String paramString2)
  {
    a = paramArrayOfByte;
    b = paramString1;
    c = paramString2;
  }
  
  public void readFrom(JceInputStream paramJceInputStream)
  {
    if (d == null)
    {
      d = (byte[])new byte[1];
      ((byte[])d)[0] = 0;
    }
    a = ((byte[])paramJceInputStream.read(d, 1, true));
    b = paramJceInputStream.readString(2, true);
    c = paramJceInputStream.readString(3, true);
  }
  
  public void writeTo(JceOutputStream paramJceOutputStream)
  {
    paramJceOutputStream.write(a, 1);
    paramJceOutputStream.write(b, 2);
    paramJceOutputStream.write(c, 3);
  }
}
