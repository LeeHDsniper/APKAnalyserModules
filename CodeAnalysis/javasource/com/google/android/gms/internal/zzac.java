package com.google.android.gms.internal;

import android.content.Context;
import android.content.pm.PackageInfo;
import android.content.pm.PackageManager;
import android.content.pm.PackageManager.NameNotFoundException;
import android.net.http.AndroidHttpClient;
import android.os.Build.VERSION;
import java.io.File;

public class zzac
{
  public static zzl zza(Context paramContext)
  {
    return zza(paramContext, null);
  }
  
  public static zzl zza(Context paramContext, zzy paramZzy)
  {
    File localFile = new File(paramContext.getCacheDir(), "volley");
    Object localObject = "volley/0";
    try
    {
      String str = paramContext.getPackageName();
      paramContext = paramContext.getPackageManager().getPackageInfo(str, 0);
      paramContext = str + "/" + versionCode;
      localObject = paramContext;
    }
    catch (PackageManager.NameNotFoundException paramContext)
    {
      label118:
      for (;;) {}
    }
    paramContext = paramZzy;
    if (paramZzy == null) {
      if (Build.VERSION.SDK_INT < 9) {
        break label118;
      }
    }
    for (paramContext = new zzz();; paramContext = new zzw(AndroidHttpClient.newInstance((String)localObject)))
    {
      paramContext = new zzt(paramContext);
      paramContext = new zzl(new zzv(localFile), paramContext);
      paramContext.start();
      return paramContext;
    }
  }
}
