package com.google.android.gms.analytics.internal;

import android.content.BroadcastReceiver;
import android.content.Context;
import android.content.Intent;
import android.content.IntentFilter;
import android.net.ConnectivityManager;
import android.net.NetworkInfo;
import android.os.Build.VERSION;
import com.google.android.gms.common.internal.zzx;

class zzag
  extends BroadcastReceiver
{
  static final String zzOo = zzag.class.getName();
  private final zzf zzLy;
  private boolean zzOp;
  private boolean zzOq;
  
  zzag(zzf paramZzf)
  {
    zzx.zzv(paramZzf);
    zzLy = paramZzf;
  }
  
  private Context getContext()
  {
    return zzLy.getContext();
  }
  
  private zzb zzhz()
  {
    return zzLy.zzhz();
  }
  
  private zzaf zzie()
  {
    return zzLy.zzie();
  }
  
  private void zzks()
  {
    zzie();
    zzhz();
  }
  
  public boolean isConnected()
  {
    if (!zzOp) {
      zzLy.zzie().zzbb("Connectivity unknown. Receiver not registered");
    }
    return zzOq;
  }
  
  public boolean isRegistered()
  {
    return zzOp;
  }
  
  public void onReceive(Context paramContext, Intent paramIntent)
  {
    zzks();
    paramContext = paramIntent.getAction();
    zzLy.zzie().zza("NetworkBroadcastReceiver received action", paramContext);
    if ("android.net.conn.CONNECTIVITY_CHANGE".equals(paramContext))
    {
      boolean bool = zzku();
      if (zzOq != bool)
      {
        zzOq = bool;
        zzhz().zzI(bool);
      }
    }
    do
    {
      return;
      if (!"com.google.analytics.RADIO_POWERED".equals(paramContext)) {
        break;
      }
    } while (paramIntent.hasExtra(zzOo));
    zzhz().zzhY();
    return;
    zzLy.zzie().zzd("NetworkBroadcastReceiver received unknown action", paramContext);
  }
  
  public void unregister()
  {
    if (!isRegistered()) {
      return;
    }
    zzLy.zzie().zzaY("Unregistering connectivity change receiver");
    zzOp = false;
    zzOq = false;
    Context localContext = getContext();
    try
    {
      localContext.unregisterReceiver(this);
      return;
    }
    catch (IllegalArgumentException localIllegalArgumentException)
    {
      zzie().zze("Failed to unregister the network broadcast receiver", localIllegalArgumentException);
    }
  }
  
  public void zzkr()
  {
    zzks();
    if (zzOp) {
      return;
    }
    Context localContext = getContext();
    localContext.registerReceiver(this, new IntentFilter("android.net.conn.CONNECTIVITY_CHANGE"));
    IntentFilter localIntentFilter = new IntentFilter("com.google.analytics.RADIO_POWERED");
    localIntentFilter.addCategory(localContext.getPackageName());
    localContext.registerReceiver(this, localIntentFilter);
    zzOq = zzku();
    zzLy.zzie().zza("Registering connectivity change receiver. Network connected", Boolean.valueOf(zzOq));
    zzOp = true;
  }
  
  public void zzkt()
  {
    if (Build.VERSION.SDK_INT <= 10) {
      return;
    }
    Context localContext = getContext();
    Intent localIntent = new Intent("com.google.analytics.RADIO_POWERED");
    localIntent.addCategory(localContext.getPackageName());
    localIntent.putExtra(zzOo, true);
    localContext.sendOrderedBroadcast(localIntent, null);
  }
  
  protected boolean zzku()
  {
    Object localObject = (ConnectivityManager)getContext().getSystemService("connectivity");
    try
    {
      localObject = ((ConnectivityManager)localObject).getActiveNetworkInfo();
      if (localObject != null)
      {
        boolean bool = ((NetworkInfo)localObject).isConnected();
        if (bool) {
          return true;
        }
      }
      return false;
    }
    catch (SecurityException localSecurityException) {}
    return false;
  }
}
