package com.tencent.msf.service.protocol.QQWiFi;

import com.qq.taf.jce.JceInputStream;
import com.qq.taf.jce.JceOutputStream;
import com.qq.taf.jce.JceStruct;
import java.util.ArrayList;

public final class a
  extends JceStruct
{
  static ArrayList e;
  public ArrayList a = null;
  public String b = "";
  public String c = "";
  public int d = 0;
  
  public a() {}
  
  public a(ArrayList paramArrayList, String paramString1, String paramString2, int paramInt)
  {
    a = paramArrayList;
    b = paramString1;
    c = paramString2;
    d = paramInt;
  }
  
  public void readFrom(JceInputStream paramJceInputStream)
  {
    if (e == null)
    {
      e = new ArrayList();
      d localD = new d();
      e.add(localD);
    }
    a = ((ArrayList)paramJceInputStream.read(e, 1, false));
    b = paramJceInputStream.readString(2, false);
    c = paramJceInputStream.readString(3, false);
    d = paramJceInputStream.read(d, 4, false);
  }
  
  public void writeTo(JceOutputStream paramJceOutputStream)
  {
    if (a != null) {
      paramJceOutputStream.write(a, 1);
    }
    if (b != null) {
      paramJceOutputStream.write(b, 2);
    }
    if (c != null) {
      paramJceOutputStream.write(c, 3);
    }
    paramJceOutputStream.write(d, 4);
  }
}
