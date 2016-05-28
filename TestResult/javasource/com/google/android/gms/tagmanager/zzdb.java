package com.google.android.gms.tagmanager;

import android.app.ActivityManager;
import android.app.ActivityManager.RunningAppProcessInfo;
import android.app.KeyguardManager;
import android.content.Context;
import android.os.Handler;
import android.os.HandlerThread;
import android.os.PowerManager;
import android.os.Process;
import android.text.TextUtils;
import com.google.android.gms.internal.zzad;
import com.google.android.gms.internal.zzae;
import com.google.android.gms.internal.zzag.zza;
import java.util.HashSet;
import java.util.Iterator;
import java.util.List;
import java.util.Map;
import java.util.Set;

class zzdb
  extends zzak
{
  private static final String ID = zzad.zzcQ.toString();
  private static final String NAME = zzae.zzfR.toString();
  private static final String zzaSA = zzae.zzhv.toString();
  private static final String zzaSy = zzae.zzfw.toString();
  private static final String zzaSz = zzae.zzfE.toString();
  private final Context mContext;
  private Handler mHandler;
  private DataLayer zzaOT;
  private boolean zzaSB;
  private boolean zzaSC;
  private final HandlerThread zzaSD;
  private final Set<String> zzaSE = new HashSet();
  
  public zzdb(Context paramContext, DataLayer paramDataLayer)
  {
    super(ID, new String[] { zzaSy, NAME });
    mContext = paramContext;
    zzaOT = paramDataLayer;
    zzaSD = new HandlerThread("Google GTM SDK Timer", 10);
    zzaSD.start();
    mHandler = new Handler(zzaSD.getLooper());
  }
  
  public zzag.zza zzG(Map<String, zzag.zza> paramMap)
  {
    String str2 = zzdf.zzg((zzag.zza)paramMap.get(NAME));
    String str1 = zzdf.zzg((zzag.zza)paramMap.get(zzaSA));
    String str3 = zzdf.zzg((zzag.zza)paramMap.get(zzaSy));
    paramMap = zzdf.zzg((zzag.zza)paramMap.get(zzaSz));
    try
    {
      l1 = Long.parseLong(str3);
    }
    catch (NumberFormatException localNumberFormatException)
    {
      try
      {
        for (;;)
        {
          l2 = Long.parseLong(paramMap);
          if ((l1 > 0L) && (!TextUtils.isEmpty(str2)))
          {
            if (str1 != null)
            {
              paramMap = str1;
              if (!str1.isEmpty()) {}
            }
            else
            {
              paramMap = "0";
            }
            if (!zzaSE.contains(paramMap))
            {
              if (!"0".equals(paramMap)) {
                zzaSE.add(paramMap);
              }
              mHandler.postDelayed(new zza(str2, paramMap, l1, l2), l1);
            }
          }
          return zzdf.zzBg();
          localNumberFormatException = localNumberFormatException;
          long l1 = 0L;
        }
      }
      catch (NumberFormatException paramMap)
      {
        for (;;)
        {
          long l2 = 0L;
        }
      }
    }
  }
  
  public boolean zzzx()
  {
    return false;
  }
  
  private final class zza
    implements Runnable
  {
    private final long zzOC;
    private final long zzaBW;
    private final String zzaSF;
    private final String zzaSG;
    private final long zzaSH;
    private long zzaSI;
    
    zza(String paramString1, String paramString2, long paramLong1, long paramLong2)
    {
      zzaSF = paramString1;
      zzaSG = paramString2;
      zzaBW = paramLong1;
      zzaSH = paramLong2;
      zzOC = System.currentTimeMillis();
    }
    
    public void run()
    {
      if ((zzaSH > 0L) && (zzaSI >= zzaSH))
      {
        if (!"0".equals(zzaSG)) {
          zzdb.zza(zzdb.this).remove(zzaSG);
        }
        return;
      }
      zzaSI += 1L;
      if (zzcu())
      {
        long l = System.currentTimeMillis();
        zzdb.zzb(zzdb.this).push(DataLayer.mapOf(new Object[] { "event", zzaSF, "gtm.timerInterval", String.valueOf(zzaBW), "gtm.timerLimit", String.valueOf(zzaSH), "gtm.timerStartTime", String.valueOf(zzOC), "gtm.timerCurrentTime", String.valueOf(l), "gtm.timerElapsedTime", String.valueOf(l - zzOC), "gtm.timerEventNumber", String.valueOf(zzaSI), "gtm.triggers", zzaSG }));
      }
      zzdb.zzc(zzdb.this).postDelayed(this, zzaBW);
    }
    
    protected boolean zzcu()
    {
      if (zzdb.zzd(zzdb.this)) {
        return zzdb.zze(zzdb.this);
      }
      Object localObject = (ActivityManager)zzdb.zzf(zzdb.this).getSystemService("activity");
      KeyguardManager localKeyguardManager = (KeyguardManager)zzdb.zzf(zzdb.this).getSystemService("keyguard");
      PowerManager localPowerManager = (PowerManager)zzdb.zzf(zzdb.this).getSystemService("power");
      localObject = ((ActivityManager)localObject).getRunningAppProcesses().iterator();
      while (((Iterator)localObject).hasNext())
      {
        ActivityManager.RunningAppProcessInfo localRunningAppProcessInfo = (ActivityManager.RunningAppProcessInfo)((Iterator)localObject).next();
        if ((Process.myPid() == pid) && (importance == 100) && (!localKeyguardManager.inKeyguardRestrictedInputMode()) && (localPowerManager.isScreenOn())) {
          return true;
        }
      }
      return false;
    }
  }
}
