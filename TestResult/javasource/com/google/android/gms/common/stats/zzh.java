package com.google.android.gms.common.stats;

import android.content.ComponentName;
import android.content.Context;
import android.content.Intent;
import android.content.IntentFilter;
import android.os.PowerManager;
import android.os.SystemClock;
import android.text.TextUtils;
import android.util.Log;
import com.google.android.gms.internal.zzkq;
import com.google.android.gms.internal.zzll;
import com.google.android.gms.internal.zzlv;
import java.util.List;

public class zzh
{
  private static String TAG = "WakeLockTracker";
  private static Integer zzafB;
  private static final ComponentName zzafz = new ComponentName("com.google.android.gms", "com.google.android.gms.common.stats.GmsCoreStatsService");
  private static zzh zzaga = new zzh();
  private static IntentFilter zzagb = new IntentFilter("android.intent.action.BATTERY_CHANGED");
  
  public zzh() {}
  
  private static int getLogLevel()
  {
    try
    {
      if (zzll.zzjk()) {
        return ((Integer)zzc.zzb.zzafD.get()).intValue();
      }
      int i = zzd.LOG_LEVEL_OFF;
      return i;
    }
    catch (SecurityException localSecurityException) {}
    return zzd.LOG_LEVEL_OFF;
  }
  
  private int zzal(Context paramContext)
  {
    int k = 1;
    Intent localIntent = paramContext.getApplicationContext().registerReceiver(null, zzagb);
    label32:
    boolean bool;
    label52:
    int j;
    if (localIntent == null)
    {
      i = 0;
      if ((i & 0x7) == 0) {
        break label84;
      }
      i = 1;
      if (!zzlv.zzpW()) {
        break label89;
      }
      bool = ((PowerManager)paramContext.getSystemService("power")).isInteractive();
      if (!bool) {
        break label106;
      }
      j = 1;
      label59:
      if (i == 0) {
        break label111;
      }
    }
    label84:
    label89:
    label106:
    label111:
    for (int i = k;; i = 0)
    {
      return j << 1 | i;
      i = localIntent.getIntExtra("plugged", 0);
      break;
      i = 0;
      break label32;
      bool = ((PowerManager)paramContext.getSystemService("power")).isScreenOn();
      break label52;
      j = 0;
      break label59;
    }
  }
  
  private float zzam(Context paramContext)
  {
    IntentFilter localIntentFilter = new IntentFilter("android.intent.action.BATTERY_CHANGED");
    paramContext = paramContext.getApplicationContext().registerReceiver(null, localIntentFilter);
    float f = NaN.0F;
    if (paramContext != null)
    {
      int i = paramContext.getIntExtra("level", -1);
      int j = paramContext.getIntExtra("scale", -1);
      f = i / j;
    }
    return f;
  }
  
  private static boolean zzan(Context paramContext)
  {
    if (zzafB == null) {
      zzafB = Integer.valueOf(getLogLevel());
    }
    return zzafB.intValue() != zzd.LOG_LEVEL_OFF;
  }
  
  public static zzh zzpL()
  {
    return zzaga;
  }
  
  public void zza(Context paramContext, String paramString1, int paramInt1, String paramString2, String paramString3, int paramInt2, List<String> paramList)
  {
    if (!zzan(paramContext)) {}
    long l;
    do
    {
      return;
      if (TextUtils.isEmpty(paramString1))
      {
        Log.e(TAG, "missing wakeLock key. " + paramString1);
        return;
      }
      l = System.currentTimeMillis();
    } while ((7 != paramInt1) && (8 != paramInt1) && (10 != paramInt1) && (11 != paramInt1));
    paramString1 = new WakeLockEvent(l, paramInt1, paramString2, paramInt2, paramList, paramString1, SystemClock.elapsedRealtime(), zzal(paramContext), paramString3, paramContext.getPackageName(), zzam(paramContext));
    try
    {
      paramContext.startService(new Intent().setComponent(zzafz).putExtra("com.google.android.gms.common.stats.EXTRA_LOG_EVENT", paramString1));
      return;
    }
    catch (Exception paramContext)
    {
      Log.wtf(TAG, paramContext);
    }
  }
}
