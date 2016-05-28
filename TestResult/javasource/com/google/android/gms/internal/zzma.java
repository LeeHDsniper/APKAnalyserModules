package com.google.android.gms.internal;

import android.content.Context;
import android.content.pm.ApplicationInfo;
import android.content.pm.PackageManager;
import android.content.pm.PackageManager.NameNotFoundException;
import android.os.WorkSource;
import android.util.Log;
import java.lang.reflect.Method;
import java.util.ArrayList;
import java.util.Collections;
import java.util.List;

public class zzma
{
  private static final Method zzagh = ;
  private static final Method zzagi = zzqa();
  private static final Method zzagj = zzqb();
  private static final Method zzagk = zzqc();
  private static final Method zzagl = zzqd();
  
  public static int zza(WorkSource paramWorkSource)
  {
    if (zzagj != null) {
      try
      {
        int i = ((Integer)zzagj.invoke(paramWorkSource, new Object[0])).intValue();
        return i;
      }
      catch (Exception paramWorkSource)
      {
        Log.wtf("WorkSourceUtil", "Unable to assign blame through WorkSource");
      }
    }
    return 0;
  }
  
  public static String zza(WorkSource paramWorkSource, int paramInt)
  {
    if (zzagl != null) {
      try
      {
        paramWorkSource = (String)zzagl.invoke(paramWorkSource, new Object[] { Integer.valueOf(paramInt) });
        return paramWorkSource;
      }
      catch (Exception paramWorkSource)
      {
        Log.wtf("WorkSourceUtil", "Unable to assign blame through WorkSource");
      }
    }
    return null;
  }
  
  public static void zza(WorkSource paramWorkSource, int paramInt, String paramString)
  {
    if (zzagi != null)
    {
      str = paramString;
      if (paramString == null) {
        str = "";
      }
    }
    while (zzagh == null) {
      try
      {
        String str;
        zzagi.invoke(paramWorkSource, new Object[] { Integer.valueOf(paramInt), str });
        return;
      }
      catch (Exception paramWorkSource)
      {
        Log.wtf("WorkSourceUtil", "Unable to assign blame through WorkSource");
        return;
      }
    }
    try
    {
      zzagh.invoke(paramWorkSource, new Object[] { Integer.valueOf(paramInt) });
      return;
    }
    catch (Exception paramWorkSource)
    {
      Log.wtf("WorkSourceUtil", "Unable to assign blame through WorkSource");
    }
  }
  
  public static boolean zzaq(Context paramContext)
  {
    return paramContext.getPackageManager().checkPermission("android.permission.UPDATE_DEVICE_STATS", paramContext.getPackageName()) == 0;
  }
  
  public static List<String> zzb(WorkSource paramWorkSource)
  {
    int j = 0;
    if (paramWorkSource == null) {}
    Object localObject;
    for (int i = 0; i == 0; i = zza(paramWorkSource))
    {
      localObject = Collections.EMPTY_LIST;
      return localObject;
    }
    ArrayList localArrayList = new ArrayList();
    for (;;)
    {
      localObject = localArrayList;
      if (j >= i) {
        break;
      }
      localObject = zza(paramWorkSource, j);
      if (!zzlz.zzcB((String)localObject)) {
        localArrayList.add(localObject);
      }
      j += 1;
    }
  }
  
  public static WorkSource zze(int paramInt, String paramString)
  {
    WorkSource localWorkSource = new WorkSource();
    zza(localWorkSource, paramInt, paramString);
    return localWorkSource;
  }
  
  public static WorkSource zzj(Context paramContext, String paramString)
  {
    if (paramContext == null) {
      return null;
    }
    try
    {
      paramContext = paramContext.getPackageManager().getApplicationInfo(paramString, 0);
      if (paramContext == null)
      {
        Log.e("WorkSourceUtil", "Could not get applicationInfo from package: " + paramString);
        return null;
      }
    }
    catch (PackageManager.NameNotFoundException paramContext)
    {
      Log.e("WorkSourceUtil", "Could not find package: " + paramString);
      return null;
    }
    return zze(uid, paramString);
  }
  
  private static Method zzpZ()
  {
    try
    {
      Method localMethod = WorkSource.class.getMethod("add", new Class[] { Integer.TYPE });
      return localMethod;
    }
    catch (Exception localException) {}
    return null;
  }
  
  private static Method zzqa()
  {
    Method localMethod = null;
    if (zzlv.zzpU()) {}
    try
    {
      localMethod = WorkSource.class.getMethod("add", new Class[] { Integer.TYPE, String.class });
      return localMethod;
    }
    catch (Exception localException) {}
    return null;
  }
  
  private static Method zzqb()
  {
    try
    {
      Method localMethod = WorkSource.class.getMethod("size", new Class[0]);
      return localMethod;
    }
    catch (Exception localException) {}
    return null;
  }
  
  private static Method zzqc()
  {
    try
    {
      Method localMethod = WorkSource.class.getMethod("get", new Class[] { Integer.TYPE });
      return localMethod;
    }
    catch (Exception localException) {}
    return null;
  }
  
  private static Method zzqd()
  {
    Method localMethod = null;
    if (zzlv.zzpU()) {}
    try
    {
      localMethod = WorkSource.class.getMethod("getName", new Class[] { Integer.TYPE });
      return localMethod;
    }
    catch (Exception localException) {}
    return null;
  }
}
