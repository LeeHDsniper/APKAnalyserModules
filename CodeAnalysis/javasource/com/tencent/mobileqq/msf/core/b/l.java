package com.tencent.mobileqq.msf.core.b;

import com.qq.taf.jce.JceInputStream;
import com.qq.taf.jce.JceOutputStream;
import com.qq.taf.jce.JceStruct;
import java.util.HashMap;
import java.util.Map;

public final class l
  extends JceStruct
{
  static Map e;
  public String a = "";
  public long b = 0L;
  public Map c = null;
  public boolean d = true;
  
  public l() {}
  
  public l(String paramString, long paramLong, Map paramMap, boolean paramBoolean)
  {
    a = paramString;
    b = paramLong;
    c = paramMap;
    d = paramBoolean;
  }
  
  public void readFrom(JceInputStream paramJceInputStream)
  {
    a = paramJceInputStream.readString(1, true);
    b = paramJceInputStream.read(b, 2, true);
    if (e == null)
    {
      e = new HashMap();
      e.put("", "");
    }
    c = ((Map)paramJceInputStream.read(e, 3, true));
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
