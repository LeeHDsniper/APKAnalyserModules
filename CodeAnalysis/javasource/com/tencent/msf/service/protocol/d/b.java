package com.tencent.msf.service.protocol.d;

import com.qq.taf.jce.JceInputStream;
import com.qq.taf.jce.JceOutputStream;
import com.qq.taf.jce.JceStruct;
import java.util.ArrayList;

public final class b
  extends JceStruct
{
  static ArrayList b;
  public ArrayList a = null;
  
  public b() {}
  
  public b(ArrayList paramArrayList)
  {
    a = paramArrayList;
  }
  
  public void readFrom(JceInputStream paramJceInputStream)
  {
    if (b == null)
    {
      b = new ArrayList();
      a localA = new a();
      b.add(localA);
    }
    a = ((ArrayList)paramJceInputStream.read(b, 0, true));
  }
  
  public void writeTo(JceOutputStream paramJceOutputStream)
  {
    paramJceOutputStream.write(a, 0);
  }
}
