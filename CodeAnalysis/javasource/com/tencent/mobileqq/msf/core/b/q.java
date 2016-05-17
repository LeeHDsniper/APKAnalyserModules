package com.tencent.mobileqq.msf.core.b;

import com.qq.taf.jce.JceInputStream;
import com.qq.taf.jce.JceOutputStream;
import com.qq.taf.jce.JceStruct;
import java.util.HashMap;
import java.util.Map;

public final class q
  extends JceStruct
{
  static Map d;
  static Map e;
  public String a = "";
  public Map b = null;
  public Map c = null;
  
  public q() {}
  
  public q(String paramString, Map paramMap1, Map paramMap2)
  {
    a = paramString;
    b = paramMap1;
    c = paramMap2;
  }
  
  public void readFrom(JceInputStream paramJceInputStream)
  {
    a = paramJceInputStream.readString(1, true);
    if (d == null)
    {
      d = new HashMap();
      d.put("", Long.valueOf(0L));
    }
    b = ((Map)paramJceInputStream.read(d, 2, true));
    if (e == null)
    {
      e = new HashMap();
      e.put("", Long.valueOf(0L));
    }
    c = ((Map)paramJceInputStream.read(e, 3, true));
  }
  
  public void writeTo(JceOutputStream paramJceOutputStream)
  {
    paramJceOutputStream.write(a, 1);
    paramJceOutputStream.write(b, 2);
    paramJceOutputStream.write(c, 3);
  }
}
