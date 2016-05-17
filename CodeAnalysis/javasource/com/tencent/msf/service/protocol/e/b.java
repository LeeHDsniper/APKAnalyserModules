package com.tencent.msf.service.protocol.e;

import com.qq.taf.jce.JceInputStream;
import com.qq.taf.jce.JceOutputStream;
import com.qq.taf.jce.JceStruct;
import java.util.ArrayList;

public final class b
  extends JceStruct
{
  static ArrayList f;
  public ArrayList a = null;
  public int b = 0;
  public byte c = 1;
  public String d = "46000";
  public int e = 0;
  
  public b() {}
  
  public b(ArrayList paramArrayList, int paramInt1, byte paramByte, String paramString, int paramInt2)
  {
    a = paramArrayList;
    b = paramInt1;
    c = paramByte;
    d = paramString;
    e = paramInt2;
  }
  
  public void readFrom(JceInputStream paramJceInputStream)
  {
    if (f == null)
    {
      f = new ArrayList();
      f.add("");
    }
    a = ((ArrayList)paramJceInputStream.read(f, 1, true));
    b = paramJceInputStream.read(b, 2, true);
    c = paramJceInputStream.read(c, 3, false);
    d = paramJceInputStream.readString(4, false);
    e = paramJceInputStream.read(e, 5, false);
  }
  
  public void writeTo(JceOutputStream paramJceOutputStream)
  {
    paramJceOutputStream.write(a, 1);
    paramJceOutputStream.write(b, 2);
    paramJceOutputStream.write(c, 3);
    if (d != null) {
      paramJceOutputStream.write(d, 4);
    }
    paramJceOutputStream.write(e, 5);
  }
}
