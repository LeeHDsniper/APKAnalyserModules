package com.tencent.msf.service.protocol.g;

import com.qq.taf.jce.JceInputStream;
import com.qq.taf.jce.JceOutputStream;
import com.qq.taf.jce.JceStruct;
import java.util.ArrayList;

public final class j
  extends JceStruct
{
  static byte[] f;
  static byte[] g;
  static ArrayList h;
  public byte a = 0;
  public byte[] b = null;
  public String c = "";
  public byte[] d = null;
  public ArrayList e = null;
  
  public j() {}
  
  public j(byte paramByte, byte[] paramArrayOfByte1, String paramString, byte[] paramArrayOfByte2, ArrayList paramArrayList)
  {
    a = paramByte;
    b = paramArrayOfByte1;
    c = paramString;
    d = paramArrayOfByte2;
    e = paramArrayList;
  }
  
  public void readFrom(JceInputStream paramJceInputStream)
  {
    a = paramJceInputStream.read(a, 1, true);
    if (f == null)
    {
      f = (byte[])new byte[1];
      ((byte[])f)[0] = 0;
    }
    b = ((byte[])paramJceInputStream.read(f, 2, true));
    c = paramJceInputStream.readString(3, true);
    if (g == null)
    {
      g = (byte[])new byte[1];
      ((byte[])g)[0] = 0;
    }
    d = ((byte[])paramJceInputStream.read(g, 4, true));
    if (h == null)
    {
      h = new ArrayList();
      b localB = new b();
      h.add(localB);
    }
    e = ((ArrayList)paramJceInputStream.read(h, 5, false));
  }
  
  public void writeTo(JceOutputStream paramJceOutputStream)
  {
    paramJceOutputStream.write(a, 1);
    paramJceOutputStream.write(b, 2);
    paramJceOutputStream.write(c, 3);
    paramJceOutputStream.write(d, 4);
    if (e != null) {
      paramJceOutputStream.write(e, 5);
    }
  }
}
