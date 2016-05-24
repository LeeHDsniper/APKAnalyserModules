package com.google.android.gms.analytics.internal;

public class zzz
  extends zzq<zzaa>
{
  public zzz(zzf paramZzf)
  {
    super(paramZzf, new zza(paramZzf));
  }
  
  private static class zza
    implements zzq.zza<zzaa>
  {
    private final zzf zzLy;
    private final zzaa zzNS;
    
    public zza(zzf paramZzf)
    {
      zzLy = paramZzf;
      zzNS = new zzaa();
    }
    
    public void zzc(String paramString, boolean paramBoolean)
    {
      if ("ga_dryRun".equals(paramString))
      {
        paramString = zzNS;
        if (paramBoolean) {}
        for (int i = 1;; i = 0)
        {
          zzNX = i;
          return;
        }
      }
      zzLy.zzie().zzd("Bool xml configuration name not recognized", paramString);
    }
    
    public void zzd(String paramString, int paramInt)
    {
      if ("ga_dispatchPeriod".equals(paramString))
      {
        zzNS.zzNW = paramInt;
        return;
      }
      zzLy.zzie().zzd("Int xml configuration name not recognized", paramString);
    }
    
    public zzaa zzjX()
    {
      return zzNS;
    }
    
    public void zzl(String paramString1, String paramString2) {}
    
    public void zzm(String paramString1, String paramString2)
    {
      if ("ga_appName".equals(paramString1))
      {
        zzNS.zzNT = paramString2;
        return;
      }
      if ("ga_appVersion".equals(paramString1))
      {
        zzNS.zzNU = paramString2;
        return;
      }
      if ("ga_logLevel".equals(paramString1))
      {
        zzNS.zzNV = paramString2;
        return;
      }
      zzLy.zzie().zzd("String xml configuration name not recognized", paramString1);
    }
  }
}
