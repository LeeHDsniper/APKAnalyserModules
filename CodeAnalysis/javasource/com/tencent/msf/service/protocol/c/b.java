package com.tencent.msf.service.protocol.c;

import com.qq.taf.jce.JceInputStream;
import com.qq.taf.jce.JceOutputStream;
import com.qq.taf.jce.JceStruct;
import java.util.ArrayList;

public final class b
  extends JceStruct
{
  static ArrayList d;
  public long a = 0L;
  public ArrayList b = null;
  public int c = 0;
  
  public b() {}
  
  public b(long paramLong, ArrayList paramArrayList, int paramInt)
  {
    a = paramLong;
    b = paramArrayList;
    c = paramInt;
  }
  
  public void readFrom(JceInputStream paramJceInputStream)
  {
    a = paramJceInputStream.read(a, 0, true);
    if (d == null)
    {
      d = new ArrayList();
      a localA = new a();
      d.add(localA);
    }
    b = ((ArrayList)paramJceInputStream.read(d, 1, true));
    c = paramJceInputStream.read(c, 2, true);
  }
  
  public void writeTo(JceOutputStream paramJceOutputStream)
  {
    paramJceOutputStream.write(a, 0);
    paramJceOutputStream.write(b, 1);
    paramJceOutputStream.write(c, 2);
  }
}
