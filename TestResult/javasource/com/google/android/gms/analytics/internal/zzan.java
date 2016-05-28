package com.google.android.gms.analytics.internal;

import android.content.Context;
import android.content.pm.ApplicationInfo;
import android.content.pm.PackageManager;
import android.content.pm.PackageManager.NameNotFoundException;
import android.os.Bundle;

public class zzan
  extends zzd
{
  protected boolean zzKx;
  protected int zzMQ;
  protected String zzNT;
  protected String zzNU;
  protected int zzNW;
  protected boolean zzOL;
  protected boolean zzOM;
  protected boolean zzON;
  
  public zzan(zzf paramZzf)
  {
    super(paramZzf);
  }
  
  private static int zzbt(String paramString)
  {
    paramString = paramString.toLowerCase();
    if ("verbose".equals(paramString)) {
      return 0;
    }
    if ("info".equals(paramString)) {
      return 1;
    }
    if ("warning".equals(paramString)) {
      return 2;
    }
    if ("error".equals(paramString)) {
      return 3;
    }
    return -1;
  }
  
  public int getLogLevel()
  {
    zzio();
    return zzMQ;
  }
  
  void zza(zzaa paramZzaa)
  {
    zzaY("Loading global XML config values");
    String str;
    if (paramZzaa.zzjY())
    {
      str = paramZzaa.zzjZ();
      zzNT = str;
      zzb("XML config - app name", str);
    }
    if (paramZzaa.zzka())
    {
      str = paramZzaa.zzkb();
      zzNU = str;
      zzb("XML config - app version", str);
    }
    int i;
    if (paramZzaa.zzkc())
    {
      i = zzbt(paramZzaa.zzkd());
      if (i >= 0)
      {
        zzMQ = i;
        zza("XML config - log level", Integer.valueOf(i));
      }
    }
    if (paramZzaa.zzke())
    {
      i = paramZzaa.zzkf();
      zzNW = i;
      zzOM = true;
      zzb("XML config - dispatch period (sec)", Integer.valueOf(i));
    }
    if (paramZzaa.zzkg())
    {
      boolean bool = paramZzaa.zzkh();
      zzKx = bool;
      zzON = true;
      zzb("XML config - dry run", Boolean.valueOf(bool));
    }
  }
  
  protected void zzhB()
  {
    zzkW();
  }
  
  public String zzjZ()
  {
    zzio();
    return zzNT;
  }
  
  public int zzkV()
  {
    zzio();
    return zzNW;
  }
  
  protected void zzkW()
  {
    Object localObject1 = getContext();
    try
    {
      localObject1 = ((Context)localObject1).getPackageManager().getApplicationInfo(((Context)localObject1).getPackageName(), 129);
      if (localObject1 == null)
      {
        zzbb("Couldn't get ApplicationInfo to load global config");
        return;
      }
    }
    catch (PackageManager.NameNotFoundException localNameNotFoundException)
    {
      Object localObject2;
      do
      {
        int i;
        do
        {
          do
          {
            for (;;)
            {
              zzd("PackageManager doesn't know about the app package", localNameNotFoundException);
              localObject2 = null;
            }
            localObject2 = metaData;
          } while (localObject2 == null);
          i = ((Bundle)localObject2).getInt("com.google.android.gms.analytics.globalConfigResource");
        } while (i <= 0);
        localObject2 = (zzaa)new zzz(zzia()).zzac(i);
      } while (localObject2 == null);
      zza((zzaa)localObject2);
    }
  }
  
  public String zzkb()
  {
    zzio();
    return zzNU;
  }
  
  public boolean zzkc()
  {
    zzio();
    return zzOL;
  }
  
  public boolean zzke()
  {
    zzio();
    return zzOM;
  }
  
  public boolean zzkg()
  {
    zzio();
    return zzON;
  }
  
  public boolean zzkh()
  {
    zzio();
    return zzKx;
  }
}
