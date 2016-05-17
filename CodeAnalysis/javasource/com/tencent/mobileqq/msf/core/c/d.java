package com.tencent.mobileqq.msf.core.c;

import com.tencent.mobileqq.msf.core.MsfCore;
import com.tencent.mobileqq.msf.core.b.m;
import com.tencent.qphone.base.remote.ToServiceMsg;
import com.tencent.qphone.base.util.QLog;
import java.util.HashMap;
import java.util.Iterator;
import java.util.Map.Entry;
import java.util.Set;
import java.util.concurrent.ConcurrentHashMap;

public class d
{
  MsfCore a;
  private final String b = "StanbyModeStat";
  private ConcurrentHashMap c = new ConcurrentHashMap();
  private ConcurrentHashMap d = new ConcurrentHashMap();
  
  public d(MsfCore paramMsfCore)
  {
    a = paramMsfCore;
  }
  
  private String a(ConcurrentHashMap paramConcurrentHashMap)
  {
    StringBuilder localStringBuilder = new StringBuilder();
    for (;;)
    {
      Map.Entry localEntry;
      try
      {
        paramConcurrentHashMap = paramConcurrentHashMap.entrySet().iterator();
        if (paramConcurrentHashMap.hasNext())
        {
          localEntry = (Map.Entry)paramConcurrentHashMap.next();
          if (paramConcurrentHashMap.hasNext()) {
            localStringBuilder.append((String)localEntry.getKey()).append(":").append(localEntry.getValue()).append("|");
          }
        }
        else
        {
          return localStringBuilder.toString();
        }
      }
      catch (Exception paramConcurrentHashMap)
      {
        QLog.d("StanbyModeStat", 1, "constructReport error");
      }
      localStringBuilder.append((String)localEntry.getKey()).append(":").append(localEntry.getValue());
    }
  }
  
  private void b()
  {
    String str1 = a(c);
    String str2 = a(d);
    HashMap localHashMap = new HashMap();
    localHashMap.put("refusedCmd", str1);
    localHashMap.put("permitCmd", str2);
    localHashMap.put("account", a.getStandyModeManager().h());
    a.statReporter.a("dim.Msf.RecordStanbyModeCMD1", true, 0L, 0L, localHashMap, false, false);
  }
  
  public void a()
  {
    b();
    c.clear();
    d.clear();
  }
  
  public void a(ToServiceMsg paramToServiceMsg)
  {
    int i = 1;
    if (c.containsKey(paramToServiceMsg.getServiceCmd())) {
      i = ((Integer)c.get(paramToServiceMsg.getServiceCmd())).intValue() + 1;
    }
    c.put(paramToServiceMsg.getServiceCmd(), Integer.valueOf(i));
  }
  
  public void b(ToServiceMsg paramToServiceMsg)
  {
    int i = 1;
    if (d.containsKey(paramToServiceMsg.getServiceCmd())) {
      i = ((Integer)d.get(paramToServiceMsg.getServiceCmd())).intValue() + 1;
    }
    d.put(paramToServiceMsg.getServiceCmd(), Integer.valueOf(i));
  }
}
