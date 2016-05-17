package com.tencent.msf.service.protocol.f;

import com.qq.taf.jce.JceInputStream;
import com.qq.taf.jce.JceOutputStream;
import com.qq.taf.jce.JceStruct;
import java.util.ArrayList;

public final class f
  extends JceStruct
{
  static b h;
  static ArrayList i;
  static ArrayList j;
  static byte[] k;
  public b a = null;
  public ArrayList b = null;
  public ArrayList c = null;
  public String d = "";
  public String e = "";
  public byte f = 0;
  public byte[] g = null;
  
  public f() {}
  
  public f(b paramB, ArrayList paramArrayList1, ArrayList paramArrayList2, String paramString1, String paramString2, byte paramByte, byte[] paramArrayOfByte)
  {
    a = paramB;
    b = paramArrayList1;
    c = paramArrayList2;
    d = paramString1;
    e = paramString2;
    f = paramByte;
    g = paramArrayOfByte;
  }
  
  public void readFrom(JceInputStream paramJceInputStream)
  {
    if (h == null) {
      h = new b();
    }
    a = ((b)paramJceInputStream.read(h, 0, true));
    if (i == null)
    {
      i = new ArrayList();
      i.add(Long.valueOf(0L));
    }
    b = ((ArrayList)paramJceInputStream.read(i, 1, true));
    if (j == null)
    {
      j = new ArrayList();
      a localA = new a();
      j.add(localA);
    }
    c = ((ArrayList)paramJceInputStream.read(j, 2, true));
    d = paramJceInputStream.readString(3, false);
    e = paramJceInputStream.readString(4, false);
    f = paramJceInputStream.read(f, 5, false);
    if (k == null)
    {
      k = (byte[])new byte[1];
      ((byte[])k)[0] = 0;
    }
    g = ((byte[])paramJceInputStream.read(k, 6, false));
  }
  
  public void writeTo(JceOutputStream paramJceOutputStream)
  {
    paramJceOutputStream.write(a, 0);
    paramJceOutputStream.write(b, 1);
    paramJceOutputStream.write(c, 2);
    if (d != null) {
      paramJceOutputStream.write(d, 3);
    }
    if (e != null) {
      paramJceOutputStream.write(e, 4);
    }
    paramJceOutputStream.write(f, 5);
    if (g != null) {
      paramJceOutputStream.write(g, 6);
    }
  }
}
