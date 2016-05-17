package com.tencent.msf.service.protocol.e;

import com.qq.taf.jce.JceInputStream;
import com.qq.taf.jce.JceOutputStream;
import com.qq.taf.jce.JceStruct;

public final class d
  extends JceStruct
{
  static byte[] d;
  public int a = 0;
  public boolean b = false;
  public byte[] c = null;
  
  public d() {}
  
  public d(int paramInt, boolean paramBoolean, byte[] paramArrayOfByte)
  {
    a = paramInt;
    b = paramBoolean;
    c = paramArrayOfByte;
  }
  
  public void readFrom(JceInputStream paramJceInputStream)
  {
    a = paramJceInputStream.read(a, 1, true);
    b = paramJceInputStream.read(b, 2, false);
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
