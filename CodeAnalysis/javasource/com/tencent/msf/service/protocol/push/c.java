package com.tencent.msf.service.protocol.push;

import com.qq.taf.jce.JceInputStream;
import com.qq.taf.jce.JceOutputStream;
import com.qq.taf.jce.JceStruct;
import java.util.HashMap;
import java.util.Map;

public final class c
  extends JceStruct
{
  static Map d;
  public long a = 0L;
  public Map b = null;
  public String c = "";
  
  public c() {}
  
  public c(long paramLong, Map paramMap, String paramString)
  {
    a = paramLong;
    b = paramMap;
    c = paramString;
  }
  
  public void readFrom(JceInputStream paramJceInputStream)
  {
    a = paramJceInputStream.read(a, 0, true);
    if (d == null)
    {
      d = new HashMap();
      SvcMsgPush localSvcMsgPush = new SvcMsgPush();
      d.put(Long.valueOf(0L), localSvcMsgPush);
    }
    b = ((Map)paramJceInputStream.read(d, 1, true));
    c = paramJceInputStream.readString(2, true);
  }
  
  public void writeTo(JceOutputStream paramJceOutputStream)
  {
    paramJceOutputStream.write(a, 0);
    paramJceOutputStream.write(b, 1);
    paramJceOutputStream.write(c, 2);
  }
}
