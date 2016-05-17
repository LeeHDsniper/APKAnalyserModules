package com.tencent.msf.service.protocol.g;

import com.qq.taf.jce.JceInputStream;
import com.qq.taf.jce.JceOutputStream;
import com.qq.taf.jce.JceStruct;

public final class e
  extends JceStruct
{
  static byte[] d;
  public String a = "";
  public String b = "";
  public byte[] c = null;
  
  public e() {}
  
  public e(String paramString1, String paramString2, byte[] paramArrayOfByte)
  {
    a = paramString1;
    b = paramString2;
    c = paramArrayOfByte;
  }
  
  public void readFrom(JceInputStream paramJceInputStream)
  {
    a = paramJceInputStream.readString(1, true);
    b = paramJceInputStream.readString(2, true);
    if (d == null)
    {
      d = (byte[])new byte[1];
      ((byte[])d)[0] = 0;
    }
    c = ((byte[])paramJceInputStream.read(d, 3, false));
  }
  
  public void writeTo(JceOutputStream paramJceOutputStream)
  {
    paramJceOutputStream.write(a, 1);
    paramJceOutputStream.write(b, 2);
    if (c != null) {
      paramJceOutputStream.write(c, 3);
    }
  }
}
