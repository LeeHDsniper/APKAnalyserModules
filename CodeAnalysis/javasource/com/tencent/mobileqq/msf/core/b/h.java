package com.tencent.mobileqq.msf.core.b;

import com.qq.taf.jce.JceInputStream;
import com.qq.taf.jce.JceOutputStream;
import com.qq.taf.jce.JceStruct;
import java.util.ArrayList;

public final class h
  extends JceStruct
{
  static ArrayList b;
  public ArrayList a = null;
  
  public h() {}
  
  public h(ArrayList paramArrayList)
  {
    a = paramArrayList;
  }
  
  public void readFrom(JceInputStream paramJceInputStream)
  {
    if (b == null)
    {
      b = new ArrayList();
      l localL = new l();
      b.add(localL);
    }
    a = ((ArrayList)paramJceInputStream.read(b, 1, true));
  }
  
  public void writeTo(JceOutputStream paramJceOutputStream)
  {
    paramJceOutputStream.write(a, 1);
  }
}
