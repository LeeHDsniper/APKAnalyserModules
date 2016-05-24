package com.google.android.gms.common;

import android.app.Activity;
import android.app.AlertDialog.Builder;
import android.app.AppOpsManager;
import android.app.Dialog;
import android.app.NotificationManager;
import android.content.Context;
import android.content.DialogInterface.OnCancelListener;
import android.content.Intent;
import android.content.pm.ApplicationInfo;
import android.content.pm.PackageInfo;
import android.content.pm.PackageInstaller;
import android.content.pm.PackageInstaller.SessionInfo;
import android.content.pm.PackageManager;
import android.content.pm.PackageManager.NameNotFoundException;
import android.content.res.Resources;
import android.content.res.Resources.Theme;
import android.os.Build;
import android.os.Bundle;
import android.support.v4.app.Fragment;
import android.support.v4.app.FragmentActivity;
import android.text.TextUtils;
import android.util.Log;
import android.util.TypedValue;
import com.google.android.gms.R.string;
import com.google.android.gms.common.internal.zzg;
import com.google.android.gms.common.internal.zzh;
import com.google.android.gms.common.internal.zzn;
import com.google.android.gms.internal.zzlk;
import com.google.android.gms.internal.zzlv;
import java.util.Iterator;
import java.util.List;
import java.util.concurrent.atomic.AtomicBoolean;

public final class GooglePlayServicesUtil
{
  @Deprecated
  public static final int GOOGLE_PLAY_SERVICES_VERSION_CODE = ;
  public static boolean zzYu = false;
  public static boolean zzYv = false;
  private static int zzYw = -1;
  private static String zzYx = null;
  private static Integer zzYy = null;
  static final AtomicBoolean zzYz = new AtomicBoolean();
  private static final Object zzpm = new Object();
  
  public static Context getRemoteContext(Context paramContext)
  {
    try
    {
      paramContext = paramContext.createPackageContext("com.google.android.gms", 3);
      return paramContext;
    }
    catch (PackageManager.NameNotFoundException paramContext) {}
    return null;
  }
  
  public static Resources getRemoteResource(Context paramContext)
  {
    try
    {
      paramContext = paramContext.getPackageManager().getResourcesForApplication("com.google.android.gms");
      return paramContext;
    }
    catch (PackageManager.NameNotFoundException paramContext) {}
    return null;
  }
  
  @Deprecated
  public static int isGooglePlayServicesAvailable(Context paramContext)
  {
    if (com.google.android.gms.common.internal.zzd.zzacF) {
      return 0;
    }
    PackageManager localPackageManager = paramContext.getPackageManager();
    zzd localZzd;
    try
    {
      paramContext.getResources().getString(R.string.common_google_play_services_unknown_issue);
      if (!"com.google.android.gms".equals(paramContext.getPackageName())) {
        zzad(paramContext);
      }
    }
    catch (Throwable localThrowable)
    {
      for (;;)
      {
        try
        {
          PackageInfo localPackageInfo = localPackageManager.getPackageInfo("com.google.android.gms", 64);
          localZzd = zzd.zzmY();
          if ((!zzlk.zzbX(versionCode)) && (!zzlk.zzao(paramContext))) {
            break;
          }
          if (localZzd.zza(localPackageInfo, zzc.zzbu.zzYt) != null) {
            break label233;
          }
          Log.w("GooglePlayServicesUtil", "Google Play services signature invalid.");
          return 9;
        }
        catch (PackageManager.NameNotFoundException paramContext)
        {
          Log.w("GooglePlayServicesUtil", "Google Play services is missing.");
          return 1;
        }
        localThrowable = localThrowable;
        Log.e("GooglePlayServicesUtil", "The Google Play services resources were not found. Check your project configuration to ensure that the resources are included.");
      }
    }
    try
    {
      zzc.zza localZza = localZzd.zza(localPackageManager.getPackageInfo("com.android.vending", 64), zzc.zzbu.zzYt);
      if (localZza == null)
      {
        Log.w("GooglePlayServicesUtil", "Google Play Store signature invalid.");
        return 9;
      }
    }
    catch (PackageManager.NameNotFoundException localNameNotFoundException)
    {
      if (zzh(paramContext, "com.android.vending"))
      {
        Log.w("GooglePlayServicesUtil", "Google Play Store is updating.");
        if (localZzd.zza(localThrowable, zzc.zzbu.zzYt) == null)
        {
          Log.w("GooglePlayServicesUtil", "Google Play services signature invalid.");
          return 9;
          if (localZzd.zza(localThrowable, new zzc.zza[] { localNameNotFoundException }) == null)
          {
            Log.w("GooglePlayServicesUtil", "Google Play services signature invalid.");
            return 9;
          }
        }
      }
      else
      {
        Log.w("GooglePlayServicesUtil", "Google Play Store is neither installed nor updating.");
        return 9;
      }
    }
    label233:
    int i = zzlk.zzbV(GOOGLE_PLAY_SERVICES_VERSION_CODE);
    if (zzlk.zzbV(versionCode) < i)
    {
      Log.w("GooglePlayServicesUtil", "Google Play services out of date.  Requires " + GOOGLE_PLAY_SERVICES_VERSION_CODE + " but found " + versionCode);
      return 2;
    }
    ApplicationInfo localApplicationInfo = applicationInfo;
    paramContext = localApplicationInfo;
    if (localApplicationInfo == null) {}
    try
    {
      paramContext = localPackageManager.getApplicationInfo("com.google.android.gms", 0);
      if (!enabled) {
        return 3;
      }
    }
    catch (PackageManager.NameNotFoundException paramContext)
    {
      Log.wtf("GooglePlayServicesUtil", "Google Play services missing when getting application info.");
      paramContext.printStackTrace();
      return 1;
    }
    return 0;
  }
  
  @Deprecated
  public static boolean isUserRecoverableError(int paramInt)
  {
    switch (paramInt)
    {
    case 4: 
    case 5: 
    case 6: 
    case 7: 
    case 8: 
    default: 
      return false;
    }
    return true;
  }
  
  public static boolean showErrorDialogFragment(int paramInt1, Activity paramActivity, Fragment paramFragment, int paramInt2, DialogInterface.OnCancelListener paramOnCancelListener)
  {
    int i = 0;
    paramFragment = zza(paramInt1, paramActivity, paramFragment, paramInt2, paramOnCancelListener);
    if (paramFragment == null) {
      return false;
    }
    try
    {
      boolean bool = paramActivity instanceof FragmentActivity;
      i = bool;
    }
    catch (NoClassDefFoundError localNoClassDefFoundError)
    {
      for (;;) {}
    }
    if (i != 0)
    {
      paramActivity = ((FragmentActivity)paramActivity).getSupportFragmentManager();
      SupportErrorDialogFragment.newInstance(paramFragment, paramOnCancelListener).show(paramActivity, "GooglePlayServicesErrorDialog");
    }
    for (;;)
    {
      return true;
      if (!zzlv.zzpO()) {
        break;
      }
      paramActivity = paramActivity.getFragmentManager();
      ErrorDialogFragment.newInstance(paramFragment, paramOnCancelListener).show(paramActivity, "GooglePlayServicesErrorDialog");
    }
    throw new RuntimeException("This Activity does not support Fragments.");
  }
  
  private static Dialog zza(int paramInt1, Activity paramActivity, Fragment paramFragment, int paramInt2, DialogInterface.OnCancelListener paramOnCancelListener)
  {
    Object localObject2 = null;
    if (paramInt1 == 0) {
      return null;
    }
    int i = paramInt1;
    if (zzlk.zzao(paramActivity))
    {
      i = paramInt1;
      if (paramInt1 == 2) {
        i = 42;
      }
    }
    Object localObject1 = localObject2;
    if (zzlv.zzpR())
    {
      TypedValue localTypedValue = new TypedValue();
      paramActivity.getTheme().resolveAttribute(16843529, localTypedValue, true);
      localObject1 = localObject2;
      if ("Theme.Dialog.Alert".equals(paramActivity.getResources().getResourceEntryName(resourceId))) {
        localObject1 = new AlertDialog.Builder(paramActivity, 5);
      }
    }
    localObject2 = localObject1;
    if (localObject1 == null) {
      localObject2 = new AlertDialog.Builder(paramActivity);
    }
    ((AlertDialog.Builder)localObject2).setMessage(zzg.zzb(paramActivity, i, zzaf(paramActivity)));
    if (paramOnCancelListener != null) {
      ((AlertDialog.Builder)localObject2).setOnCancelListener(paramOnCancelListener);
    }
    paramOnCancelListener = zzbc(i);
    if (paramFragment == null) {}
    for (paramFragment = new zzh(paramActivity, paramOnCancelListener, paramInt2);; paramFragment = new zzh(paramFragment, paramOnCancelListener, paramInt2))
    {
      paramOnCancelListener = zzg.zzh(paramActivity, i);
      if (paramOnCancelListener != null) {
        ((AlertDialog.Builder)localObject2).setPositiveButton(paramOnCancelListener, paramFragment);
      }
      paramActivity = zzg.zzg(paramActivity, i);
      if (paramActivity != null) {
        ((AlertDialog.Builder)localObject2).setTitle(paramActivity);
      }
      return ((AlertDialog.Builder)localObject2).create();
    }
  }
  
  public static boolean zza(Context paramContext, int paramInt, String paramString)
  {
    boolean bool2 = false;
    if (zzlv.zzpV()) {
      paramContext = (AppOpsManager)paramContext.getSystemService("appops");
    }
    for (;;)
    {
      try
      {
        paramContext.checkPackage(paramInt, paramString);
        bool1 = true;
        return bool1;
      }
      catch (SecurityException paramContext) {}
      paramContext = paramContext.getPackageManager().getPackagesForUid(paramInt);
      boolean bool1 = bool2;
      if (paramString != null)
      {
        bool1 = bool2;
        if (paramContext != null)
        {
          paramInt = 0;
          for (;;)
          {
            bool1 = bool2;
            if (paramInt >= paramContext.length) {
              break;
            }
            if (paramString.equals(paramContext[paramInt])) {
              return true;
            }
            paramInt += 1;
          }
        }
      }
    }
    return false;
  }
  
  @Deprecated
  public static void zzaa(Context paramContext)
    throws GooglePlayServicesRepairableException, GooglePlayServicesNotAvailableException
  {
    int i = isGooglePlayServicesAvailable(paramContext);
    if (i != 0)
    {
      paramContext = zzbc(i);
      Log.e("GooglePlayServicesUtil", "GooglePlayServices not available due to error " + i);
      if (paramContext == null) {
        throw new GooglePlayServicesNotAvailableException(i);
      }
      throw new GooglePlayServicesRepairableException(i, "Google Play Services not available", paramContext);
    }
  }
  
  @Deprecated
  public static void zzac(Context paramContext)
  {
    if (zzYz.getAndSet(true)) {
      return;
    }
    try
    {
      ((NotificationManager)paramContext.getSystemService("notification")).cancel(10436);
      return;
    }
    catch (SecurityException paramContext) {}
  }
  
  private static void zzad(Context paramContext)
  {
    for (;;)
    {
      synchronized (zzpm)
      {
        if (zzYx == null)
        {
          zzYx = paramContext.getPackageName();
          try
          {
            paramContext = getPackageManagergetApplicationInfogetPackageName128metaData;
            if (paramContext == null) {
              continue;
            }
            zzYy = Integer.valueOf(paramContext.getInt("com.google.android.gms.version"));
          }
          catch (PackageManager.NameNotFoundException paramContext)
          {
            Log.wtf("GooglePlayServicesUtil", "This should never happen.", paramContext);
            continue;
          }
          paramContext = zzYy;
          if (paramContext != null) {
            break;
          }
          throw new IllegalStateException("A required meta-data tag in your app's AndroidManifest.xml does not exist.  You must have the following declaration within the <application> element:     <meta-data android:name=\"com.google.android.gms.version\" android:value=\"@integer/google_play_services_version\" />");
          zzYy = null;
        }
      }
      if (!zzYx.equals(paramContext.getPackageName())) {
        throw new IllegalArgumentException("isGooglePlayServicesAvailable should only be called with Context from your application's package. A previous call used package '" + zzYx + "' and this call used package '" + paramContext.getPackageName() + "'.");
      }
    }
    if (paramContext.intValue() != GOOGLE_PLAY_SERVICES_VERSION_CODE) {
      throw new IllegalStateException("The meta-data tag in your app's AndroidManifest.xml does not have the right value.  Expected " + GOOGLE_PLAY_SERVICES_VERSION_CODE + " but" + " found " + paramContext + ".  You must have the" + " following declaration within the <application> element: " + "    <meta-data android:name=\"" + "com.google.android.gms.version" + "\" android:value=\"@integer/google_play_services_version\" />");
    }
  }
  
  public static String zzaf(Context paramContext)
  {
    Object localObject2 = getApplicationInfoname;
    Object localObject1 = localObject2;
    if (TextUtils.isEmpty((CharSequence)localObject2))
    {
      localObject1 = paramContext.getPackageName();
      localObject2 = paramContext.getApplicationContext().getPackageManager();
    }
    try
    {
      paramContext = ((PackageManager)localObject2).getApplicationInfo(paramContext.getPackageName(), 0);
      if (paramContext != null) {
        localObject1 = ((PackageManager)localObject2).getApplicationLabel(paramContext).toString();
      }
      return localObject1;
    }
    catch (PackageManager.NameNotFoundException paramContext)
    {
      for (;;)
      {
        paramContext = null;
      }
    }
  }
  
  public static boolean zzag(Context paramContext)
  {
    paramContext = paramContext.getPackageManager();
    return (zzlv.zzpX()) && (paramContext.hasSystemFeature("com.google.sidewinder"));
  }
  
  public static boolean zzb(PackageManager paramPackageManager)
  {
    synchronized (zzpm)
    {
      int i = zzYw;
      if (i == -1) {}
      try
      {
        paramPackageManager = paramPackageManager.getPackageInfo("com.google.android.gms", 64);
        if (zzd.zzmY().zza(paramPackageManager, new zzc.zza[] { zzc.zzYm[1] }) != null) {}
        for (zzYw = 1; zzYw != 0; zzYw = 0) {
          return true;
        }
      }
      catch (PackageManager.NameNotFoundException paramPackageManager)
      {
        for (;;)
        {
          zzYw = 0;
        }
      }
    }
    return false;
  }
  
  @Deprecated
  public static boolean zzb(PackageManager paramPackageManager, String paramString)
  {
    return zzd.zzmY().zzb(paramPackageManager, paramString);
  }
  
  @Deprecated
  public static Intent zzbc(int paramInt)
  {
    switch (paramInt)
    {
    default: 
      return null;
    case 1: 
    case 2: 
      return zzn.zzcp("com.google.android.gms");
    case 42: 
      return zzn.zzoM();
    }
    return zzn.zzcn("com.google.android.gms");
  }
  
  public static boolean zzc(PackageManager paramPackageManager)
  {
    return (zzb(paramPackageManager)) || (!zzmX());
  }
  
  @Deprecated
  public static boolean zzd(Context paramContext, int paramInt)
  {
    if (paramInt == 18) {
      return true;
    }
    if (paramInt == 1) {
      return zzh(paramContext, "com.google.android.gms");
    }
    return false;
  }
  
  public static boolean zze(Context paramContext, int paramInt)
  {
    return (zza(paramContext, paramInt, "com.google.android.gms")) && (zzb(paramContext.getPackageManager(), "com.google.android.gms"));
  }
  
  public static boolean zzh(Context paramContext, String paramString)
  {
    if (zzlv.zzpX())
    {
      paramContext = paramContext.getPackageManager().getPackageInstaller().getAllSessions().iterator();
      do
      {
        if (!paramContext.hasNext()) {
          break;
        }
      } while (!paramString.equals(((PackageInstaller.SessionInfo)paramContext.next()).getAppPackageName()));
      return true;
    }
    paramContext = paramContext.getPackageManager();
    try
    {
      boolean bool = getApplicationInfo8192enabled;
      if (bool) {
        return true;
      }
    }
    catch (PackageManager.NameNotFoundException paramContext) {}
    return false;
  }
  
  private static int zzmW()
  {
    return 7895000;
  }
  
  public static boolean zzmX()
  {
    if (zzYu) {
      return zzYv;
    }
    return "user".equals(Build.TYPE);
  }
}
