package com.tencent.msf.service.protocol.push;

import com.qq.taf.jce.JceInputStream;
import com.qq.taf.jce.JceOutputStream;
import com.qq.taf.jce.JceStruct;
import java.util.HashMap;
import java.util.Map;

public final class d
  extends JceStruct
{
  static Map h;
  public long a = 0L;
  public byte b = 0;
  public String c = "";
  public Map d = null;
  public int e = 300;
  public byte f = 0;
  public String g = "";
  
  public d() {}
  
  public d(long paramLong, byte paramByte1, String paramString1, Map paramMap, int paramInt, byte paramByte2, String paramString2)
  {
    a = paramLong;
    b = paramByte1;
    c = paramString1;
    d = paramMap;
    e = paramInt;
    f = paramByte2;
    g = paramString2;
  }
  
  public void readFrom(JceInputStream paramJceInputStream)
  {
    a = paramJceInputStream.read(a, 0, true);
    b = paramJceInputStream.read(b, 1, true);
    c = paramJceInputStream.readString(2, true);
    if (h == null)
    {
      h = new HashMap();
      SvcMsgPush localSvcMsgPush = new SvcMsgPush();
      h.put(Long.valueOf(0L), localSvcMsgPush);
    }
    d = ((Map)paramJceInputStream.read(h, 3, true));
    e = paramJceInputStream.read(e, 4, false);
    f = paramJceInputStream.read(f, 5, false);
    g = paramJceInputStream.readString(6, false);
  }
  
  public void writeTo(JceOutputStream paramJceOutputStream)
  {
    paramJceOutputStream.write(a, 0);
    paramJceOutputStream.write(b, 1);
    paramJceOutputStream.write(c, 2);
    paramJceOutputStream.write(d, 3);
    paramJceOutputStream.write(e, 4);
    paramJceOutputStream.write(f, 5);
    if (g != null) {
      paramJceOutputStream.write(g, 6);
    }
  }
}
