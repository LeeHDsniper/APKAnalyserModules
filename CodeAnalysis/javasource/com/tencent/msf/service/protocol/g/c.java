package com.tencent.msf.service.protocol.g;

import com.qq.taf.jce.JceInputStream;
import com.qq.taf.jce.JceOutputStream;
import com.qq.taf.jce.JceStruct;

public final class c
  extends JceStruct
{
  static byte[] c;
  public String a = "";
  public byte[] b = null;
  
  public c() {}
  
  public c(String paramString, byte[] paramArrayOfByte)
  {
    a = paramString;
    b = paramArrayOfByte;
  }
  
  public void readFrom(JceInputStream paramJceInputStream)
  {
    a = paramJceInputStream.readString(1, true);
    if (c == null)
    {
      c = (byte[])new byte[1];
      ((byte[])c)[0] = 0;
    }
    b = ((byte[])paramJceInputStream.read(c, 2, true));
  }
  
  public void writeTo(JceOutputStream paramJceOutputStream)
  {
    paramJceOutputStream.write(a, 1);
    paramJceOutputStream.write(b, 2);
  }
}
