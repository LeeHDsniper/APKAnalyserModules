package com.tencent.msf.service.protocol.QQWiFi;

import com.qq.taf.jce.JceInputStream;
import com.qq.taf.jce.JceOutputStream;
import com.qq.taf.jce.JceStruct;
import java.util.ArrayList;

public final class b
  extends JceStruct
{
  static ArrayList e;
  public int a = 0;
  public ArrayList b = null;
  public int c = 0;
  public int d = 0;
  
  public b() {}
  
  public b(int paramInt1, ArrayList paramArrayList, int paramInt2, int paramInt3)
  {
    a = paramInt1;
    b = paramArrayList;
    c = paramInt2;
    d = paramInt3;
  }
  
  public void readFrom(JceInputStream paramJceInputStream)
  {
    a = paramJceInputStream.read(a, 0, true);
    if (e == null)
    {
      e = new ArrayList();
      WiFiService localWiFiService = new WiFiService();
      e.add(localWiFiService);
    }
    b = ((ArrayList)paramJceInputStream.read(e, 1, false));
    c = paramJceInputStream.read(c, 2, false);
    d = paramJceInputStream.read(d, 3, false);
  }
  
  public void writeTo(JceOutputStream paramJceOutputStream)
  {
    paramJceOutputStream.write(a, 0);
    if (b != null) {
      paramJceOutputStream.write(b, 1);
    }
    paramJceOutputStream.write(c, 2);
    paramJceOutputStream.write(d, 3);
  }
}
