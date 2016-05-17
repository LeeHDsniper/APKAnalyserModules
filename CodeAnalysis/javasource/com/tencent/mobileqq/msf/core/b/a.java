package com.tencent.mobileqq.msf.core.b;

import com.qq.taf.jce.JceInputStream;
import com.qq.taf.jce.JceOutputStream;
import com.qq.taf.jce.JceStruct;
import java.util.HashMap;
import java.util.Map;

public final class a
  extends JceStruct
{
  static Map d;
  public Map a = null;
  public long b = 0L;
  public long c = 0L;
  
  public a() {}
  
  public a(Map paramMap, long paramLong1, long paramLong2)
  {
    a = paramMap;
    b = paramLong1;
    c = paramLong2;
  }
  
  public void readFrom(JceInputStream paramJceInputStream)
  {
    if (d == null)
    {
      d = new HashMap();
      q localQ = new q();
      d.put("", localQ);
    }
    a = ((Map)paramJceInputStream.read(d, 1, true));
    b = paramJceInputStream.read(b, 2, true);
    c = paramJceInputStream.read(c, 3, true);
  }
  
  public void writeTo(JceOutputStream paramJceOutputStream)
  {
    paramJceOutputStream.write(a, 1);
    paramJceOutputStream.write(b, 2);
    paramJceOutputStream.write(c, 3);
  }
}
