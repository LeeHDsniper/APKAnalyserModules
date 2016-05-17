package com.tencent.msf.service.protocol.e;

import com.qq.taf.jce.JceDisplayer;
import com.qq.taf.jce.JceInputStream;
import com.qq.taf.jce.JceOutputStream;
import com.qq.taf.jce.JceStruct;
import com.qq.taf.jce.JceUtil;
import java.util.ArrayList;

public final class h
  extends JceStruct
{
  static ArrayList e;
  static ArrayList f;
  public ArrayList a = null;
  public int b = 0;
  public ArrayList c = null;
  public byte d = 0;
  
  static
  {
    if (!h.class.desiredAssertionStatus()) {}
    for (boolean bool = true;; bool = false)
    {
      g = bool;
      return;
    }
  }
  
  public h() {}
  
  public h(ArrayList paramArrayList1, int paramInt, ArrayList paramArrayList2, byte paramByte)
  {
    a = paramArrayList1;
    b = paramInt;
    c = paramArrayList2;
    d = paramByte;
  }
  
  public Object clone()
  {
    Object localObject1 = null;
    try
    {
      Object localObject2 = super.clone();
      localObject1 = localObject2;
    }
    catch (CloneNotSupportedException localCloneNotSupportedException)
    {
      while (g) {}
      throw new AssertionError();
    }
    return localObject1;
  }
  
  public void display(StringBuilder paramStringBuilder, int paramInt)
  {
    paramStringBuilder = new JceDisplayer(paramStringBuilder, paramInt);
    paramStringBuilder.display(a, "signatures");
    paramStringBuilder.display(b, "lcid");
    paramStringBuilder.display(c, "uins");
    paramStringBuilder.display(d, "base");
  }
  
  public boolean equals(Object paramObject)
  {
    paramObject = (h)paramObject;
    return (JceUtil.equals(a, a)) && (JceUtil.equals(b, b)) && (JceUtil.equals(c, c)) && (JceUtil.equals(d, d));
  }
  
  public void readFrom(JceInputStream paramJceInputStream)
  {
    if (e == null)
    {
      e = new ArrayList();
      e.add("");
    }
    a = ((ArrayList)paramJceInputStream.read(e, 1, true));
    b = paramJceInputStream.read(b, 2, true);
    if (f == null)
    {
      f = new ArrayList();
      f.add("");
    }
    c = ((ArrayList)paramJceInputStream.read(f, 3, true));
    d = paramJceInputStream.read(d, 4, true);
  }
  
  public void writeTo(JceOutputStream paramJceOutputStream)
  {
    paramJceOutputStream.write(a, 1);
    paramJceOutputStream.write(b, 2);
    paramJceOutputStream.write(c, 3);
    paramJceOutputStream.write(d, 4);
  }
}
