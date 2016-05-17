package com.tencent.msf.service.protocol.e;

import com.qq.taf.jce.JceInputStream;
import com.qq.taf.jce.JceOutputStream;
import com.qq.taf.jce.JceStruct;

public final class j
  extends JceStruct
{
  public int a = 0;
  public byte b = 0;
  public int c = 0;
  public int d = 0;
  public String e = "";
  public String f = "";
  public String g = "";
  public int h = 0;
  public byte i = 1;
  public int j = 0;
  public String k = "";
  
  public j() {}
  
  public j(int paramInt1, byte paramByte1, int paramInt2, int paramInt3, String paramString1, String paramString2, String paramString3, int paramInt4, byte paramByte2, int paramInt5, String paramString4)
  {
    a = paramInt1;
    b = paramByte1;
    c = paramInt2;
    d = paramInt3;
    e = paramString1;
    f = paramString2;
    g = paramString3;
    h = paramInt4;
    i = paramByte2;
    j = paramInt5;
    k = paramString4;
  }
  
  public void readFrom(JceInputStream paramJceInputStream)
  {
    a = paramJceInputStream.read(a, 1, true);
    b = paramJceInputStream.read(b, 2, true);
    c = paramJceInputStream.read(c, 3, true);
    d = paramJceInputStream.read(d, 4, true);
    e = paramJceInputStream.readString(5, false);
    f = paramJceInputStream.readString(6, false);
    g = paramJceInputStream.readString(7, false);
    h = paramJceInputStream.read(h, 8, false);
    i = paramJceInputStream.read(i, 9, false);
    j = paramJceInputStream.read(j, 10, false);
    k = paramJceInputStream.readString(11, false);
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
    if (f != null) {
      paramJceOutputStream.write(f, 6);
    }
    if (g != null) {
      paramJceOutputStream.write(g, 7);
    }
    paramJceOutputStream.write(h, 8);
    paramJceOutputStream.write(i, 9);
    paramJceOutputStream.write(j, 10);
    if (k != null) {
      paramJceOutputStream.write(k, 11);
    }
  }
}
