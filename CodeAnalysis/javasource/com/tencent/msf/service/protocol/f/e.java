package com.tencent.msf.service.protocol.f;

import com.qq.taf.jce.JceInputStream;
import com.qq.taf.jce.JceOutputStream;
import com.qq.taf.jce.JceStruct;
import java.util.ArrayList;

public final class e
  extends JceStruct
{
  static ArrayList c;
  public ArrayList a = null;
  public int b = 64;
  
  public e() {}
  
  public e(ArrayList paramArrayList, int paramInt)
  {
    a = paramArrayList;
    b = paramInt;
  }
  
  public void readFrom(JceInputStream paramJceInputStream)
  {
    if (c == null)
    {
      c = new ArrayList();
      d localD = new d();
      c.add(localD);
    }
    a = ((ArrayList)paramJceInputStream.read(c, 1, true));
    b = paramJceInputStream.read(b, 2, false);
  }
  
  public void writeTo(JceOutputStream paramJceOutputStream)
  {
    paramJceOutputStream.write(a, 1);
    paramJceOutputStream.write(b, 2);
  }
}
