package com.tencent.msf.service.protocol.g;

import com.qq.taf.jce.JceInputStream;
import com.qq.taf.jce.JceOutputStream;
import com.qq.taf.jce.JceStruct;

public final class f
  extends JceStruct
{
  static byte[] e;
  static byte[] f;
  public byte a = 0;
  public byte[] b = null;
  public String c = "";
  public byte[] d = null;
  
  public f() {}
  
  public f(byte paramByte, byte[] paramArrayOfByte1, String paramString, byte[] paramArrayOfByte2)
  {
    a = paramByte;
    b = paramArrayOfByte1;
    c = paramString;
    d = paramArrayOfByte2;
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
    c = paramJceInputStream.readString(3, true);
    if (f == null)
    {
      f = (byte[])new byte[1];
      ((byte[])f)[0] = 0;
    }
    d = ((byte[])paramJceInputStream.read(f, 4, true));
  }
  
  public void writeTo(JceOutputStream paramJceOutputStream)
  {
    paramJceOutputStream.write(a, 1);
    paramJceOutputStream.write(b, 2);
    paramJceOutputStream.write(c, 3);
    paramJceOutputStream.write(d, 4);
  }
}
