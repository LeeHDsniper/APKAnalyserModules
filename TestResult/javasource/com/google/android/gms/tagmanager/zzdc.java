package com.google.android.gms.tagmanager;

import android.content.Context;
import com.google.android.gms.analytics.GoogleAnalytics;
import com.google.android.gms.analytics.Logger;
import com.google.android.gms.analytics.Tracker;

public class zzdc
{
  private Context mContext;
  private Tracker zzKq;
  private GoogleAnalytics zzKs;
  
  public zzdc(Context paramContext)
  {
    mContext = paramContext;
  }
  
  private void zzeW(String paramString)
  {
    try
    {
      if (zzKs == null)
      {
        zzKs = GoogleAnalytics.getInstance(mContext);
        zzKs.setLogger(new zza());
        zzKq = zzKs.newTracker(paramString);
      }
      return;
    }
    finally
    {
      paramString = finally;
      throw paramString;
    }
  }
  
  public Tracker zzeV(String paramString)
  {
    zzeW(paramString);
    return zzKq;
  }
  
  static class zza
    implements Logger
  {
    zza() {}
    
    private static int zzjl(int paramInt)
    {
      switch (paramInt)
      {
      case 6: 
      default: 
        return 3;
      case 5: 
        return 2;
      case 3: 
      case 4: 
        return 1;
      }
      return 0;
    }
    
    public void error(String paramString)
    {
      zzbg.e(paramString);
    }
    
    public int getLogLevel()
    {
      return zzjl(zzbg.getLogLevel());
    }
    
    public void setLogLevel(int paramInt)
    {
      zzbg.zzaE("GA uses GTM logger. Please use TagManager.setLogLevel(int) instead.");
    }
    
    public void warn(String paramString)
    {
      zzbg.zzaE(paramString);
    }
  }
}
