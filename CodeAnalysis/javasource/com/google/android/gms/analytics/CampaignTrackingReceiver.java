package com.google.android.gms.analytics;

import android.content.BroadcastReceiver;
import android.content.Context;
import android.content.Intent;
import android.text.TextUtils;
import com.google.android.gms.analytics.internal.zzaf;
import com.google.android.gms.analytics.internal.zzam;
import com.google.android.gms.analytics.internal.zzf;
import com.google.android.gms.analytics.internal.zzr;
import com.google.android.gms.common.internal.zzx;
import com.google.android.gms.internal.zzqd;

public class CampaignTrackingReceiver
  extends BroadcastReceiver
{
  static zzqd zzKc;
  static Boolean zzKd;
  static Object zzpm = new Object();
  
  public CampaignTrackingReceiver() {}
  
  public static boolean zzV(Context paramContext)
  {
    zzx.zzv(paramContext);
    if (zzKd != null) {
      return zzKd.booleanValue();
    }
    boolean bool = zzam.zza(paramContext, CampaignTrackingReceiver.class, true);
    zzKd = Boolean.valueOf(bool);
    return bool;
  }
  
  public void onReceive(Context paramContext, Intent arg2)
  {
    Object localObject = zzf.zzX(paramContext);
    localZzaf = ((zzf)localObject).zzie();
    String str = ???.getStringExtra("referrer");
    ??? = ???.getAction();
    localZzaf.zza("CampaignTrackingReceiver received", ???);
    if ((!"com.android.vending.INSTALL_REFERRER".equals(???)) || (TextUtils.isEmpty(str)))
    {
      localZzaf.zzbb("CampaignTrackingReceiver received unexpected intent without referrer extra");
      return;
    }
    boolean bool = CampaignTrackingService.zzW(paramContext);
    if (!bool) {
      localZzaf.zzbb("CampaignTrackingService not registered or disabled. Installation tracking not possible. See http://goo.gl/8Rd3yj for instructions.");
    }
    zzaQ(str);
    if (((zzf)localObject).zzif().zzjk())
    {
      localZzaf.zzbc("Received unexpected installation campaign on package side");
      return;
    }
    ??? = zzht();
    zzx.zzv(???);
    localObject = new Intent(paramContext, ???);
    ((Intent)localObject).putExtra("referrer", str);
    synchronized (zzpm)
    {
      paramContext.startService((Intent)localObject);
      if (!bool) {
        return;
      }
    }
    try
    {
      if (zzKc == null)
      {
        zzKc = new zzqd(paramContext, 1, "Analytics campaign WakeLock");
        zzKc.setReferenceCounted(false);
      }
      zzKc.acquire(1000L);
    }
    catch (SecurityException paramContext)
    {
      for (;;)
      {
        localZzaf.zzbb("CampaignTrackingService service at risk of not starting. For more reliable installation campaign reports, add the WAKE_LOCK permission to your manifest. See http://goo.gl/8Rd3yj for instructions.");
      }
    }
  }
  
  protected void zzaQ(String paramString) {}
  
  protected Class<? extends CampaignTrackingService> zzht()
  {
    return CampaignTrackingService.class;
  }
}
