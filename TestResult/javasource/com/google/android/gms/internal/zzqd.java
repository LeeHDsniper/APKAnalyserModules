package com.google.android.gms.internal;

import android.content.Context;
import android.os.PowerManager;
import android.os.PowerManager.WakeLock;
import android.os.WorkSource;
import android.text.TextUtils;
import android.util.Log;
import com.google.android.gms.common.internal.zzd;
import com.google.android.gms.common.internal.zzx;
import com.google.android.gms.common.stats.zzf;
import com.google.android.gms.common.stats.zzh;

public class zzqd
{
  private static boolean DEBUG = false;
  private static String TAG = "WakeLock";
  private final Context mContext;
  private int zzaOA;
  private final PowerManager.WakeLock zzaOu;
  private WorkSource zzaOv;
  private final int zzaOw;
  private final String zzaOx;
  private boolean zzaOy = true;
  private int zzaOz;
  private final String zzafS;
  
  public zzqd(Context paramContext, int paramInt, String paramString)
  {
    this(paramContext, paramInt, paramString, null, null);
  }
  
  public zzqd(Context paramContext, int paramInt, String paramString1, String paramString2, String paramString3)
  {
    zzx.zzh(paramString1, "Wake lock name can NOT be empty");
    zzaOw = paramInt;
    zzafS = paramString1;
    zzaOx = paramString2;
    mContext = paramContext.getApplicationContext();
    zzaOu = ((PowerManager)paramContext.getSystemService("power")).newWakeLock(paramInt, paramString1);
    if (zzma.zzaq(mContext))
    {
      paramString1 = paramString3;
      if (zzlz.zzcB(paramString3))
      {
        if ((!zzd.zzacF) || (!zzkq.isInitialized())) {
          break label146;
        }
        Log.e(TAG, "callingPackage is not supposed to be empty for wakelock " + zzafS + "!");
      }
    }
    label146:
    for (paramString1 = "com.google.android.gms";; paramString1 = paramContext.getPackageName())
    {
      zzaOv = zzma.zzj(paramContext, paramString1);
      zzc(zzaOv);
      return;
    }
  }
  
  private void zzen(String paramString)
  {
    boolean bool = zzep(paramString);
    String str = zzi(paramString, bool);
    if (DEBUG) {
      Log.d(TAG, "Acquire:\n mWakeLockName: " + zzafS + "\n mSecondaryName: " + zzaOx + "\nmReferenceCounted: " + zzaOy + "\nreason: " + paramString + "\nmOpenEventCount" + zzaOA + "\nuseWithReason: " + bool + "\ntrackingName: " + str);
    }
    try
    {
      if (zzaOy)
      {
        int i = zzaOz;
        zzaOz = (i + 1);
        if ((i == 0) || (bool)) {}
      }
      else
      {
        if ((zzaOy) || (zzaOA != 0)) {
          break label204;
        }
      }
      zzh.zzpL().zza(mContext, zzf.zza(zzaOu, str), 7, zzafS, str, zzaOw, zzma.zzb(zzaOv));
      zzaOA += 1;
      label204:
      return;
    }
    finally {}
  }
  
  private void zzeo(String paramString)
  {
    boolean bool = zzep(paramString);
    String str = zzi(paramString, bool);
    if (DEBUG) {
      Log.d(TAG, "Release:\n mWakeLockName: " + zzafS + "\n mSecondaryName: " + zzaOx + "\nmReferenceCounted: " + zzaOy + "\nreason: " + paramString + "\n mOpenEventCount" + zzaOA + "\nuseWithReason: " + bool + "\ntrackingName: " + str);
    }
    try
    {
      if (zzaOy)
      {
        int i = zzaOz - 1;
        zzaOz = i;
        if ((i == 0) || (bool)) {}
      }
      else
      {
        if ((zzaOy) || (zzaOA != 1)) {
          break label205;
        }
      }
      zzh.zzpL().zza(mContext, zzf.zza(zzaOu, str), 8, zzafS, str, zzaOw, zzma.zzb(zzaOv));
      zzaOA -= 1;
      label205:
      return;
    }
    finally {}
  }
  
  private boolean zzep(String paramString)
  {
    return (!TextUtils.isEmpty(paramString)) && (!paramString.equals(zzaOx));
  }
  
  private String zzi(String paramString, boolean paramBoolean)
  {
    if (zzaOy)
    {
      if (paramBoolean) {
        return paramString;
      }
      return zzaOx;
    }
    return zzaOx;
  }
  
  public void acquire(long paramLong)
  {
    if ((!zzlv.zzpR()) && (zzaOy)) {
      Log.wtf(TAG, "Do not acquire with timeout on reference counted WakeLocks before ICS. wakelock: " + zzafS);
    }
    zzen(null);
    zzaOu.acquire(paramLong);
  }
  
  public boolean isHeld()
  {
    return zzaOu.isHeld();
  }
  
  public void release()
  {
    zzeo(null);
    zzaOu.release();
  }
  
  public void setReferenceCounted(boolean paramBoolean)
  {
    zzaOu.setReferenceCounted(paramBoolean);
    zzaOy = paramBoolean;
  }
  
  public void zzc(WorkSource paramWorkSource)
  {
    if ((zzma.zzaq(mContext)) && (paramWorkSource != null))
    {
      if (zzaOv == null) {
        break label42;
      }
      zzaOv.add(paramWorkSource);
    }
    for (;;)
    {
      zzaOu.setWorkSource(zzaOv);
      return;
      label42:
      zzaOv = paramWorkSource;
    }
  }
}
