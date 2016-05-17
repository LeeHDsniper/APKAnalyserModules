package com.tencent.feedback.eup;

import com.tencent.feedback.common.e;
import java.util.Locale;

public class CrashStrategyBean
  implements Cloneable
{
  public static final String format = "[MSNum:%d ,Wifi:%d,GPRS:%d,ODay:%d,isMerged:%b,AfQ:%b,Silent:%b,mLog:%d,tag:%s,assert:%s, interval:%s, limit:%s]";
  private int a = 10;
  private int b = 10;
  private int c = 3;
  private int d = 10;
  private boolean e = true;
  private boolean f = false;
  private boolean g = true;
  private int h = 100;
  private String i = null;
  private boolean j = false;
  private String k = null;
  private int l = 5000;
  private int m = 3;
  private int n = 100;
  private boolean o = false;
  private int p = 60;
  private int q = 50;
  private boolean r = true;
  private boolean s = false;
  private boolean t = false;
  
  public CrashStrategyBean() {}
  
  public CrashStrategyBean clone()
    throws CloneNotSupportedException
  {
    try
    {
      CrashStrategyBean localCrashStrategyBean = new CrashStrategyBean();
      localCrashStrategyBean.setEnableAfterQuery(f);
      localCrashStrategyBean.setMaxStoredNum(a);
      localCrashStrategyBean.setMaxUploadNum_GPRS(c);
      localCrashStrategyBean.setMaxUploadNum_Wifi(b);
      localCrashStrategyBean.setMerged(e);
      localCrashStrategyBean.setRecordOverDays(d);
      localCrashStrategyBean.setSilentUpload(g);
      localCrashStrategyBean.setMaxLogRow(h);
      localCrashStrategyBean.setOnlyLogTag(i);
      localCrashStrategyBean.setAssertEnable(o);
      localCrashStrategyBean.setAssertTaskInterval(p);
      localCrashStrategyBean.setAssertLimitCount(q);
      return localCrashStrategyBean;
    }
    finally
    {
      localObject = finally;
      throw localObject;
    }
  }
  
  public int getAssertLimitCount()
  {
    try
    {
      int i1 = q;
      return i1;
    }
    finally
    {
      localObject = finally;
      throw localObject;
    }
  }
  
  public int getAssertTaskInterval()
  {
    try
    {
      int i1 = p;
      return i1;
    }
    finally
    {
      localObject = finally;
      throw localObject;
    }
  }
  
  public int getCrashSdcardMaxSize()
  {
    try
    {
      int i1 = l;
      return i1;
    }
    finally
    {
      localObject = finally;
      throw localObject;
    }
  }
  
  public int getMaxLogRow()
  {
    try
    {
      int i1 = h;
      return i1;
    }
    finally
    {
      localObject = finally;
      throw localObject;
    }
  }
  
  public int getMaxStackFrame()
  {
    try
    {
      int i1 = m;
      return i1;
    }
    finally
    {
      localObject = finally;
      throw localObject;
    }
  }
  
  public int getMaxStackLine()
  {
    try
    {
      int i1 = n;
      return i1;
    }
    finally
    {
      localObject = finally;
      throw localObject;
    }
  }
  
  public int getMaxStoredNum()
  {
    try
    {
      int i1 = a;
      return i1;
    }
    finally
    {
      localObject = finally;
      throw localObject;
    }
  }
  
  public int getMaxUploadNum_GPRS()
  {
    try
    {
      int i1 = c;
      return i1;
    }
    finally
    {
      localObject = finally;
      throw localObject;
    }
  }
  
  public int getMaxUploadNum_Wifi()
  {
    try
    {
      int i1 = b;
      return i1;
    }
    finally
    {
      localObject = finally;
      throw localObject;
    }
  }
  
  public String getOnlyLogTag()
  {
    try
    {
      String str = i;
      return str;
    }
    finally
    {
      localObject = finally;
      throw localObject;
    }
  }
  
  public int getRecordOverDays()
  {
    try
    {
      int i1 = d;
      return i1;
    }
    finally
    {
      localObject = finally;
      throw localObject;
    }
  }
  
  public String getStoreDirectoryPath()
  {
    try
    {
      String str = k;
      return str;
    }
    finally
    {
      localObject = finally;
      throw localObject;
    }
  }
  
  public boolean isAssertOn()
  {
    try
    {
      boolean bool = o;
      return bool;
    }
    finally
    {
      localObject = finally;
      throw localObject;
    }
  }
  
  public boolean isBroadcast()
  {
    try
    {
      boolean bool = s;
      return bool;
    }
    finally
    {
      localObject = finally;
      throw localObject;
    }
  }
  
  public boolean isEnableAfterQuery()
  {
    try
    {
      boolean bool = f;
      return bool;
    }
    finally
    {
      localObject = finally;
      throw localObject;
    }
  }
  
  public boolean isMerged()
  {
    try
    {
      boolean bool = e;
      return bool;
    }
    finally
    {
      localObject = finally;
      throw localObject;
    }
  }
  
  public boolean isOpenANR()
  {
    try
    {
      boolean bool = r;
      return bool;
    }
    finally
    {
      localObject = finally;
      throw localObject;
    }
  }
  
  public boolean isReceiveBroadcast()
  {
    try
    {
      boolean bool = t;
      return bool;
    }
    finally
    {
      localObject = finally;
      throw localObject;
    }
  }
  
  public boolean isSilentUpload()
  {
    try
    {
      boolean bool = g;
      return bool;
    }
    finally
    {
      localObject = finally;
      throw localObject;
    }
  }
  
  public boolean isStoreCrashSdcard()
  {
    try
    {
      boolean bool = j;
      return bool;
    }
    finally
    {
      localObject = finally;
      throw localObject;
    }
  }
  
  public void setAssertEnable(boolean paramBoolean)
  {
    try
    {
      o = paramBoolean;
      return;
    }
    finally
    {
      localObject = finally;
      throw localObject;
    }
  }
  
  public void setAssertLimitCount(int paramInt)
  {
    if (paramInt < 50) {}
    for (;;)
    {
      try
      {
        e.a("rqdp{The trigger count of the assert store is smaller than the default count.} [%s]", new Object[] { Integer.valueOf(paramInt) });
      }
      finally {}
      q = paramInt;
      return;
      paramInt = 50;
      continue;
      if (paramInt <= 0) {}
    }
  }
  
  public void setAssertTaskInterval(int paramInt)
  {
    if (paramInt < 60) {}
    for (;;)
    {
      try
      {
        e.a("rqdp{The interval of assert check task is smaller than the default time.} [%s s]", new Object[] { Integer.valueOf(paramInt) });
      }
      finally {}
      p = paramInt;
      return;
      paramInt = 60;
      continue;
      if (paramInt <= 0) {}
    }
  }
  
  public void setBroadcast(boolean paramBoolean)
  {
    try
    {
      s = paramBoolean;
      return;
    }
    finally
    {
      localObject = finally;
      throw localObject;
    }
  }
  
  public void setCrashSdcardMaxSize(int paramInt)
  {
    if (paramInt > 0) {}
    try
    {
      l = paramInt;
      return;
    }
    finally
    {
      localObject = finally;
      throw localObject;
    }
  }
  
  public void setEnableAfterQuery(boolean paramBoolean)
  {
    try
    {
      f = paramBoolean;
      return;
    }
    finally
    {
      localObject = finally;
      throw localObject;
    }
  }
  
  public void setMaxLogRow(int paramInt)
  {
    if (paramInt > 0) {}
    try
    {
      h = paramInt;
      return;
    }
    finally
    {
      localObject = finally;
      throw localObject;
    }
  }
  
  public void setMaxStackFrame(int paramInt)
  {
    try
    {
      m = paramInt;
      return;
    }
    finally
    {
      localObject = finally;
      throw localObject;
    }
  }
  
  public void setMaxStackLine(int paramInt)
  {
    try
    {
      n = paramInt;
      return;
    }
    finally
    {
      localObject = finally;
      throw localObject;
    }
  }
  
  public void setMaxStoredNum(int paramInt)
  {
    if ((paramInt > 0) && (paramInt <= 20)) {}
    try
    {
      a = paramInt;
      return;
    }
    finally
    {
      localObject = finally;
      throw localObject;
    }
  }
  
  public void setMaxUploadNum_GPRS(int paramInt)
  {
    if (paramInt > 0) {}
    try
    {
      c = paramInt;
      return;
    }
    finally
    {
      localObject = finally;
      throw localObject;
    }
  }
  
  public void setMaxUploadNum_Wifi(int paramInt)
  {
    if (paramInt > 0) {}
    try
    {
      b = paramInt;
      return;
    }
    finally
    {
      localObject = finally;
      throw localObject;
    }
  }
  
  public void setMerged(boolean paramBoolean)
  {
    try
    {
      e = paramBoolean;
      return;
    }
    finally
    {
      localObject = finally;
      throw localObject;
    }
  }
  
  public void setOnlyLogTag(String paramString)
  {
    try
    {
      i = paramString;
      return;
    }
    finally
    {
      paramString = finally;
      throw paramString;
    }
  }
  
  public void setOpenANR(boolean paramBoolean)
  {
    try
    {
      r = paramBoolean;
      return;
    }
    finally
    {
      localObject = finally;
      throw localObject;
    }
  }
  
  public void setReceiveBroadcast(boolean paramBoolean)
  {
    try
    {
      t = paramBoolean;
      return;
    }
    finally
    {
      localObject = finally;
      throw localObject;
    }
  }
  
  public void setRecordOverDays(int paramInt)
  {
    if (paramInt > 0) {}
    try
    {
      d = paramInt;
      return;
    }
    finally
    {
      localObject = finally;
      throw localObject;
    }
  }
  
  public void setSilentUpload(boolean paramBoolean)
  {
    try
    {
      g = paramBoolean;
      return;
    }
    finally
    {
      localObject = finally;
      throw localObject;
    }
  }
  
  public void setStoreCrashSdcard(boolean paramBoolean)
  {
    try
    {
      j = paramBoolean;
      return;
    }
    finally
    {
      localObject = finally;
      throw localObject;
    }
  }
  
  public void setStoreDirectoryPath(String paramString)
  {
    try
    {
      k = paramString;
      return;
    }
    finally
    {
      paramString = finally;
      throw paramString;
    }
  }
  
  public String toString()
  {
    try
    {
      String str1 = String.format(Locale.US, "[MSNum:%d ,Wifi:%d,GPRS:%d,ODay:%d,isMerged:%b,AfQ:%b,Silent:%b,mLog:%d,tag:%s,assert:%s, interval:%s, limit:%s]", new Object[] { Integer.valueOf(a), Integer.valueOf(b), Integer.valueOf(c), Integer.valueOf(d), Boolean.valueOf(e), Boolean.valueOf(f), Boolean.valueOf(g), Integer.valueOf(h), i, Boolean.valueOf(o), Integer.valueOf(q), Integer.valueOf(p) });
      return str1;
    }
    catch (Throwable localThrowable)
    {
      for (;;)
      {
        if (!e.a(localThrowable)) {
          localThrowable.printStackTrace();
        }
        String str2 = "error";
      }
    }
    finally {}
  }
}
