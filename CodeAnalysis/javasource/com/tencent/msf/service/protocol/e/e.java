package com.tencent.msf.service.protocol.e;

import com.qq.taf.jce.JceInputStream;
import com.qq.taf.jce.JceOutputStream;
import com.qq.taf.jce.JceStruct;
import java.util.ArrayList;

public final class e
  extends JceStruct
{
  static ArrayList f;
  public int a = 0;
  public int b = 0;
  public ArrayList c = null;
  public int d = 0;
  public int e = 0;
  
  public e() {}
  
  public e(int paramInt1, int paramInt2, ArrayList paramArrayList, int paramInt3, int paramInt4)
  {
    a = paramInt1;
    b = paramInt2;
    c = paramArrayList;
    d = paramInt3;
    e = paramInt4;
  }
  
  public void readFrom(JceInputStream paramJceInputStream)
  {
    a = paramJceInputStream.read(a, 1, false);
    b = paramJceInputStream.read(b, 2, false);
    if (f == null)
    {
      f = new ArrayList();
      f.add("");
    }
    c = ((ArrayList)paramJceInputStream.read(f, 3, false));
    d = paramJceInputStream.read(d, 4, false);
    e = paramJceInputStream.read(e, 5, false);
  }
  
  public void writeTo(JceOutputStream paramJceOutputStream)
  {
    paramJceOutputStream.write(a, 1);
    paramJceOutputStream.write(b, 2);
    if (c != null) {
      paramJceOutputStream.write(c, 3);
    }
    paramJceOutputStream.write(d, 4);
    paramJceOutputStream.write(e, 5);
  }
}
