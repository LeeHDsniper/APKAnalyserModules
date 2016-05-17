package com.tencent.msf.service.protocol.g;

import com.qq.taf.jce.JceInputStream;
import com.qq.taf.jce.JceOutputStream;
import com.qq.taf.jce.JceStruct;
import java.util.ArrayList;

public final class i
  extends JceStruct
{
  static ArrayList k;
  public String a = "";
  public byte b = 0;
  public String c = "";
  public String d = "";
  public String e = "";
  public byte f = 0;
  public byte g = 0;
  public byte h = 0;
  public String i = "";
  public ArrayList j = null;
  
  public i() {}
  
  public i(String paramString1, byte paramByte1, String paramString2, String paramString3, String paramString4, byte paramByte2, byte paramByte3, byte paramByte4, String paramString5, ArrayList paramArrayList)
  {
    a = paramString1;
    b = paramByte1;
    c = paramString2;
    d = paramString3;
    e = paramString4;
    f = paramByte2;
    g = paramByte3;
    h = paramByte4;
    i = paramString5;
    j = paramArrayList;
  }
  
  public void readFrom(JceInputStream paramJceInputStream)
  {
    a = paramJceInputStream.readString(1, true);
    b = paramJceInputStream.read(b, 2, true);
    c = paramJceInputStream.readString(3, true);
    d = paramJceInputStream.readString(4, true);
    e = paramJceInputStream.readString(5, true);
    f = paramJceInputStream.read(f, 6, true);
    g = paramJceInputStream.read(g, 7, true);
    h = paramJceInputStream.read(h, 8, true);
    i = paramJceInputStream.readString(9, true);
    if (k == null)
    {
      k = new ArrayList();
      b localB = new b();
      k.add(localB);
    }
    j = ((ArrayList)paramJceInputStream.read(k, 10, false));
  }
  
  public void writeTo(JceOutputStream paramJceOutputStream)
  {
    paramJceOutputStream.write(a, 1);
    paramJceOutputStream.write(b, 2);
    paramJceOutputStream.write(c, 3);
    paramJceOutputStream.write(d, 4);
    paramJceOutputStream.write(e, 5);
    paramJceOutputStream.write(f, 6);
    paramJceOutputStream.write(g, 7);
    paramJceOutputStream.write(h, 8);
    paramJceOutputStream.write(i, 9);
    if (j != null) {
      paramJceOutputStream.write(j, 10);
    }
  }
}
