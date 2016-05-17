package com.tencent.mobileqq.msf.sdk;

import com.qq.taf.jce.JceInputStream;
import com.qq.taf.jce.JceOutputStream;
import com.qq.taf.jce.JceStruct;
import java.util.HashMap;
import java.util.Map;

public final class RdmReq
  extends JceStruct
{
  static Map cache_params;
  public long elapse = 0L;
  public String eventName = "";
  public boolean isMerge = false;
  public boolean isRealTime = false;
  public boolean isSucceed = true;
  public Map params = null;
  public int reportType = 0;
  public long size = 0L;
  
  public RdmReq() {}
  
  public RdmReq(int paramInt, String paramString, boolean paramBoolean1, long paramLong1, long paramLong2, Map paramMap, boolean paramBoolean2, boolean paramBoolean3)
  {
    reportType = paramInt;
    eventName = paramString;
    isSucceed = paramBoolean1;
    elapse = paramLong1;
    size = paramLong2;
    params = paramMap;
    isRealTime = paramBoolean2;
    isMerge = paramBoolean3;
  }
  
  public String className()
  {
    return "rdm.RdmReq";
  }
  
  public String fullClassName()
  {
    return "rdm.RdmReq";
  }
  
  public void readFrom(JceInputStream paramJceInputStream)
  {
    reportType = paramJceInputStream.read(reportType, 1, true);
    eventName = paramJceInputStream.readString(2, true);
    isSucceed = paramJceInputStream.read(isSucceed, 3, true);
    elapse = paramJceInputStream.read(elapse, 4, true);
    size = paramJceInputStream.read(size, 5, true);
    if (cache_params == null)
    {
      cache_params = new HashMap();
      cache_params.put("", "");
    }
    params = ((Map)paramJceInputStream.read(cache_params, 6, true));
    isRealTime = paramJceInputStream.read(isRealTime, 7, true);
    isMerge = paramJceInputStream.read(isMerge, 8, true);
  }
  
  public void writeTo(JceOutputStream paramJceOutputStream)
  {
    paramJceOutputStream.write(reportType, 1);
    paramJceOutputStream.write(eventName, 2);
    paramJceOutputStream.write(isSucceed, 3);
    paramJceOutputStream.write(elapse, 4);
    paramJceOutputStream.write(size, 5);
    paramJceOutputStream.write(params, 6);
    paramJceOutputStream.write(isRealTime, 7);
    paramJceOutputStream.write(isMerge, 8);
  }
}
