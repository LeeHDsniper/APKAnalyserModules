package com.tencent.msf.service.protocol.g;

import com.qq.taf.jce.JceInputStream;
import com.qq.taf.jce.JceOutputStream;
import com.qq.taf.jce.JceStruct;

public final class l
  extends JceStruct
{
  static byte[] d;
  public byte a = 0;
  public String b = "";
  public byte[] c = null;
  
  public l() {}
  
  public l(byte paramByte, String paramString, byte[] paramArrayOfByte)
  {
    a = paramByte;
    b = paramString;
    c = paramArrayOfByte;
  }
  
  public void readFrom(JceInputStream paramJceInputStream)
  {
    a = paramJceInputStream.read(a, 1, true);
    b = paramJceInputStream.readString(2, true);
    if (d == null)
    {
      d = (byte[])new byte[1];
      ((byte[])d)[0] = 0;
    }
    c = ((byte[])paramJceInputStream.read(d, 3, true));
  }
  
  public void writeTo(JceOutputStream paramJceOutputStream)
  {
    paramJceOutputStream.write(a, 1);
    paramJceOutputStream.write(b, 2);
    paramJceOutputStream.write(c, 3);
  }
}
