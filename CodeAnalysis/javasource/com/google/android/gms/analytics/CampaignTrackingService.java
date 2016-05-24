package com.google.android.gms.analytics;

import android.app.Service;
import android.content.Context;
import android.content.Intent;
import android.os.Handler;
import android.os.IBinder;
import android.text.TextUtils;
import com.google.android.gms.analytics.internal.zzaf;
import com.google.android.gms.analytics.internal.zzam;
import com.google.android.gms.analytics.internal.zzb;
import com.google.android.gms.analytics.internal.zzf;
import com.google.android.gms.analytics.internal.zzr;
import com.google.android.gms.common.internal.zzx;
import com.google.android.gms.internal.zzof;
import com.google.android.gms.internal.zzqd;

public class CampaignTrackingService
  extends Service
{
  private static Boolean zzKe;
  private Handler mHandler;
  
  public CampaignTrackingService() {}
  
  private Handler getHandler()
  {
    Handler localHandler2 = mHandler;
    Handler localHandler1 = localHandler2;
    if (localHandler2 == null)
    {
      localHandler1 = new Handler(getMainLooper());
      mHandler = localHandler1;
    }
    return localHandler1;
  }
  
  public static boolean zzW(Context paramContext)
  {
    zzx.zzv(paramContext);
    if (zzKe != null) {
      return zzKe.booleanValue();
    }
    boolean bool = zzam.zza(paramContext, CampaignTrackingService.class);
    zzKe = Boolean.valueOf(bool);
    return bool;
  }
  
  private void zzhr()
  {
    try
    {
      synchronized (CampaignTrackingReceiver.zzpm)
      {
        zzqd localZzqd = CampaignTrackingReceiver.zzKc;
        if ((localZzqd != null) && (localZzqd.isHeld())) {
          localZzqd.release();
        }
        return;
      }
      return;
    }
    catch (SecurityException localSecurityException) {}
  }
  
  public IBinder onBind(Intent paramIntent)
  {
    return null;
  }
  
  public void onCreate()
  {
    super.onCreate();
    zzf.zzX(this).zzie().zzaY("CampaignTrackingService is starting up");
  }
  
  public void onDestroy()
  {
    zzf.zzX(this).zzie().zzaY("CampaignTrackingService is shutting down");
    super.onDestroy();
  }
  
  public int onStartCommand(Intent paramIntent, int paramInt1, final int paramInt2)
  {
    zzhr();
    zzf localZzf = zzf.zzX(this);
    final zzaf localZzaf = localZzf.zzie();
    final Handler localHandler = null;
    if (localZzf.zzif().zzjk()) {
      localZzaf.zzbc("Unexpected installation campaign (package side)");
    }
    for (paramIntent = localHandler;; paramIntent = paramIntent.getStringExtra("referrer"))
    {
      localHandler = getHandler();
      if (!TextUtils.isEmpty(paramIntent)) {
        break;
      }
      if (!localZzf.zzif().zzjk()) {
        localZzaf.zzbb("No campaign found on com.android.vending.INSTALL_REFERRER \"referrer\" extra");
      }
      localZzf.zzig().zzf(new Runnable()
      {
        public void run()
        {
          zza(localZzaf, localHandler, paramInt2);
        }
      });
      return 2;
    }
    paramInt1 = localZzf.zzif().zzjo();
    if (paramIntent.length() <= paramInt1) {}
    for (;;)
    {
      localZzaf.zza("CampaignTrackingService called. startId, campaign", Integer.valueOf(paramInt2), paramIntent);
      localZzf.zzhz().zza(paramIntent, new Runnable()
      {
        public void run()
        {
          zza(localZzaf, localHandler, paramInt2);
        }
      });
      return 2;
      localZzaf.zzc("Campaign data exceed the maximum supported size and will be clipped. size, limit", Integer.valueOf(paramIntent.length()), Integer.valueOf(paramInt1));
      paramIntent = paramIntent.substring(0, paramInt1);
    }
  }
  
  protected void zza(final zzaf paramZzaf, Handler paramHandler, final int paramInt)
  {
    paramHandler.post(new Runnable()
    {
      public void run()
      {
        boolean bool = stopSelfResult(paramInt);
        if (bool) {
          paramZzaf.zza("Install campaign broadcast processed", Boolean.valueOf(bool));
        }
      }
    });
  }
}
