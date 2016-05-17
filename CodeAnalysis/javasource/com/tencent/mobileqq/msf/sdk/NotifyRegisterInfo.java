package com.tencent.mobileqq.msf.sdk;

import com.qq.taf.jce.JceInputStream;
import com.qq.taf.jce.JceOutputStream;
import com.qq.taf.jce.JceStruct;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Map;

public final class NotifyRegisterInfo
  extends JceStruct
{
  static ArrayList cache_notifyIds;
  static Map cache_notifyProperties;
  public ArrayList notifyIds = null;
  public Map notifyProperties = null;
  public String uin = "";
  
  public NotifyRegisterInfo() {}
  
  public NotifyRegisterInfo(String paramString, ArrayList paramArrayList, Map paramMap)
  {
    uin = paramString;
    notifyIds = paramArrayList;
    notifyProperties = paramMap;
  }
  
  public void readFrom(JceInputStream paramJceInputStream)
  {
    uin = paramJceInputStream.readString(1, true);
    if (cache_notifyIds == null)
    {
      cache_notifyIds = new ArrayList();
      cache_notifyIds.add(Long.valueOf(0L));
    }
    notifyIds = ((ArrayList)paramJceInputStream.read(cache_notifyIds, 2, true));
    if (cache_notifyProperties == null)
    {
      cache_notifyProperties = new HashMap();
      cache_notifyProperties.put(Long.valueOf(0L), "");
    }
    notifyProperties = ((Map)paramJceInputStream.read(cache_notifyProperties, 3, true));
  }
  
  public void writeTo(JceOutputStream paramJceOutputStream)
  {
    paramJceOutputStream.write(uin, 1);
    paramJceOutputStream.write(notifyIds, 2);
    paramJceOutputStream.write(notifyProperties, 3);
  }
}
