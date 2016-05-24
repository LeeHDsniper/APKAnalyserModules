package com.google.android.gms.internal;

import android.content.Context;
import android.content.Intent;
import android.content.IntentFilter;
import android.content.pm.ActivityInfo;
import android.content.pm.PackageInfo;
import android.content.pm.PackageManager;
import android.content.pm.PackageManager.NameNotFoundException;
import android.content.pm.ResolveInfo;
import android.content.res.Resources;
import android.media.AudioManager;
import android.net.ConnectivityManager;
import android.net.NetworkInfo;
import android.net.NetworkInfo.DetailedState;
import android.net.Uri;
import android.os.Build;
import android.os.Build.VERSION;
import android.telephony.TelephonyManager;
import android.util.DisplayMetrics;
import com.google.android.gms.ads.internal.client.zzk;
import com.google.android.gms.ads.internal.util.client.zza;
import com.google.android.gms.ads.internal.zzp;
import com.google.android.gms.common.GooglePlayServicesUtil;
import java.util.Locale;

@zzgk
public final class zzgr
{
  public final int zzDI;
  public final int zzDJ;
  public final float zzDK;
  public final int zzFB;
  public final boolean zzFC;
  public final boolean zzFD;
  public final String zzFE;
  public final String zzFF;
  public final boolean zzFG;
  public final boolean zzFH;
  public final boolean zzFI;
  public final boolean zzFJ;
  public final String zzFK;
  public final String zzFL;
  public final int zzFM;
  public final int zzFN;
  public final int zzFO;
  public final int zzFP;
  public final int zzFQ;
  public final int zzFR;
  public final double zzFS;
  public final boolean zzFT;
  public final boolean zzFU;
  public final int zzFV;
  public final String zzFW;
  
  zzgr(int paramInt1, boolean paramBoolean1, boolean paramBoolean2, String paramString1, String paramString2, boolean paramBoolean3, boolean paramBoolean4, boolean paramBoolean5, boolean paramBoolean6, String paramString3, String paramString4, int paramInt2, int paramInt3, int paramInt4, int paramInt5, int paramInt6, int paramInt7, float paramFloat, int paramInt8, int paramInt9, double paramDouble, boolean paramBoolean7, boolean paramBoolean8, int paramInt10, String paramString5)
  {
    zzFB = paramInt1;
    zzFC = paramBoolean1;
    zzFD = paramBoolean2;
    zzFE = paramString1;
    zzFF = paramString2;
    zzFG = paramBoolean3;
    zzFH = paramBoolean4;
    zzFI = paramBoolean5;
    zzFJ = paramBoolean6;
    zzFK = paramString3;
    zzFL = paramString4;
    zzFM = paramInt2;
    zzFN = paramInt3;
    zzFO = paramInt4;
    zzFP = paramInt5;
    zzFQ = paramInt6;
    zzFR = paramInt7;
    zzDK = paramFloat;
    zzDI = paramInt8;
    zzDJ = paramInt9;
    zzFS = paramDouble;
    zzFT = paramBoolean7;
    zzFU = paramBoolean8;
    zzFV = paramInt10;
    zzFW = paramString5;
  }
  
  public static final class zza
  {
    private int zzDI;
    private int zzDJ;
    private float zzDK;
    private int zzFB;
    private boolean zzFC;
    private boolean zzFD;
    private String zzFE;
    private String zzFF;
    private boolean zzFG;
    private boolean zzFH;
    private boolean zzFI;
    private boolean zzFJ;
    private String zzFK;
    private String zzFL;
    private int zzFM;
    private int zzFN;
    private int zzFO;
    private int zzFP;
    private int zzFQ;
    private int zzFR;
    private double zzFS;
    private boolean zzFT;
    private boolean zzFU;
    private int zzFV;
    private String zzFW;
    
    public zza(Context paramContext)
    {
      PackageManager localPackageManager = paramContext.getPackageManager();
      zzA(paramContext);
      zza(paramContext, localPackageManager);
      zzB(paramContext);
      Locale localLocale = Locale.getDefault();
      boolean bool1;
      if (zza(localPackageManager, "geo:0,0?q=donuts") != null)
      {
        bool1 = true;
        zzFC = bool1;
        if (zza(localPackageManager, "http://www.google.com") == null) {
          break label128;
        }
        bool1 = bool2;
        label63:
        zzFD = bool1;
        zzFF = localLocale.getCountry();
        zzFG = zzk.zzcE().zzgH();
        zzFH = GooglePlayServicesUtil.zzag(paramContext);
        zzFK = localLocale.getLanguage();
        zzFL = zza(localPackageManager);
        paramContext = paramContext.getResources();
        if (paramContext != null) {
          break label133;
        }
      }
      label128:
      label133:
      do
      {
        return;
        bool1 = false;
        break;
        bool1 = false;
        break label63;
        paramContext = paramContext.getDisplayMetrics();
      } while (paramContext == null);
      zzDK = density;
      zzDI = widthPixels;
      zzDJ = heightPixels;
    }
    
    public zza(Context paramContext, zzgr paramZzgr)
    {
      PackageManager localPackageManager = paramContext.getPackageManager();
      zzA(paramContext);
      zza(paramContext, localPackageManager);
      zzB(paramContext);
      zzC(paramContext);
      zzFC = zzFC;
      zzFD = zzFD;
      zzFF = zzFF;
      zzFG = zzFG;
      zzFH = zzFH;
      zzFK = zzFK;
      zzFL = zzFL;
      zzDK = zzDK;
      zzDI = zzDI;
      zzDJ = zzDJ;
    }
    
    private void zzA(Context paramContext)
    {
      paramContext = (AudioManager)paramContext.getSystemService("audio");
      zzFB = paramContext.getMode();
      zzFI = paramContext.isMusicActive();
      zzFJ = paramContext.isSpeakerphoneOn();
      zzFM = paramContext.getStreamVolume(3);
      zzFQ = paramContext.getRingerMode();
      zzFR = paramContext.getStreamVolume(2);
    }
    
    private void zzB(Context paramContext)
    {
      boolean bool = false;
      paramContext = paramContext.registerReceiver(null, new IntentFilter("android.intent.action.BATTERY_CHANGED"));
      if (paramContext != null)
      {
        int i = paramContext.getIntExtra("status", -1);
        int j = paramContext.getIntExtra("level", -1);
        int k = paramContext.getIntExtra("scale", -1);
        zzFS = (j / k);
        if ((i == 2) || (i == 5)) {
          bool = true;
        }
        zzFT = bool;
        return;
      }
      zzFS = -1.0D;
      zzFT = false;
    }
    
    private void zzC(Context paramContext)
    {
      zzFW = Build.FINGERPRINT;
    }
    
    private static int zza(Context paramContext, ConnectivityManager paramConnectivityManager, PackageManager paramPackageManager)
    {
      int i = -2;
      if (zzp.zzbx().zza(paramPackageManager, paramContext.getPackageName(), "android.permission.ACCESS_NETWORK_STATE"))
      {
        paramContext = paramConnectivityManager.getActiveNetworkInfo();
        if (paramContext != null) {
          i = paramContext.getType();
        }
      }
      else
      {
        return i;
      }
      return -1;
    }
    
    private static ResolveInfo zza(PackageManager paramPackageManager, String paramString)
    {
      return paramPackageManager.resolveActivity(new Intent("android.intent.action.VIEW", Uri.parse(paramString)), 65536);
    }
    
    private static String zza(PackageManager paramPackageManager)
    {
      Object localObject = zza(paramPackageManager, "market://details?id=com.google.android.gms.ads");
      if (localObject == null) {}
      for (;;)
      {
        return null;
        localObject = activityInfo;
        if (localObject != null) {
          try
          {
            paramPackageManager = paramPackageManager.getPackageInfo(packageName, 0);
            if (paramPackageManager != null)
            {
              paramPackageManager = versionCode + "." + packageName;
              return paramPackageManager;
            }
          }
          catch (PackageManager.NameNotFoundException paramPackageManager) {}
        }
      }
      return null;
    }
    
    private void zza(Context paramContext, PackageManager paramPackageManager)
    {
      TelephonyManager localTelephonyManager = (TelephonyManager)paramContext.getSystemService("phone");
      ConnectivityManager localConnectivityManager = (ConnectivityManager)paramContext.getSystemService("connectivity");
      zzFE = localTelephonyManager.getNetworkOperator();
      zzFN = zza(paramContext, localConnectivityManager, paramPackageManager);
      zzFO = localTelephonyManager.getNetworkType();
      zzFP = localTelephonyManager.getPhoneType();
      if (Build.VERSION.SDK_INT >= 16)
      {
        zzFU = localConnectivityManager.isActiveNetworkMetered();
        if (localConnectivityManager.getActiveNetworkInfo() != null)
        {
          zzFV = localConnectivityManager.getActiveNetworkInfo().getDetailedState().ordinal();
          return;
        }
        zzFV = -1;
        return;
      }
      zzFU = false;
      zzFV = -1;
    }
    
    public zzgr zzfN()
    {
      return new zzgr(zzFB, zzFC, zzFD, zzFE, zzFF, zzFG, zzFH, zzFI, zzFJ, zzFK, zzFL, zzFM, zzFN, zzFO, zzFP, zzFQ, zzFR, zzDK, zzDI, zzDJ, zzFS, zzFT, zzFU, zzFV, zzFW);
    }
  }
}
