package com.tencent.msf.service.protocol.g;

import com.qq.taf.jce.JceInputStream;
import com.qq.taf.jce.JceOutputStream;
import com.qq.taf.jce.JceStruct;

public final class h
  extends JceStruct
{
  static byte[] e;
  static byte[] f;
  public byte a = 0;
  public byte[] b = null;
  public byte[] c = null;
  public String d = "";
  
  public h() {}
  
  public h(byte paramByte, byte[] paramArrayOfByte1, byte[] paramArrayOfByte2, String paramString)
  {
    a = paramByte;
    b = paramArrayOfByte1;
    c = paramArrayOfByte2;
    d = paramString;
  }
  
  public void readFrom(JceInputStream paramJceInputStream)
  {
    a = paramJceInputStream.read(a, 1, true);
    if (e == null)
    {
      e = (byte[])new byte[1];
      ((byte[])e)[0] = 0;
    }
    b = ((byte[])paramJceInputStream.read(e, 2, true));
    if (f == null)
    {
      f = (byte[])new byte[1];
      ((byte[])f)[0] = 0;
    }
    c = ((byte[])paramJceInputStream.read(f, 3, true));
    d = paramJceInputStream.readString(4, true);
  }
  
  public void writeTo(JceOutputStream paramJceOutputStream)
  {
    paramJceOutputStream.write(a, 1);
    paramJceOutputStream.write(b, 2);
    paramJceOutputStream.write(c, 3);
    paramJceOutputStream.write(d, 4);
  }
}
