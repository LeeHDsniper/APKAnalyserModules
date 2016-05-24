package com.google.android.gms.ads.internal.purchase;

import android.content.ComponentName;
import android.content.Context;
import android.content.Intent;
import android.content.ServiceConnection;
import android.os.IBinder;
import com.google.android.gms.ads.internal.zzp;
import com.google.android.gms.internal.zzfp.zza;
import com.google.android.gms.internal.zzgk;

@zzgk
public final class zzg
  extends zzfp.zza
  implements ServiceConnection
{
  private Context mContext;
  zzb zzBQ;
  private String zzBW;
  private zzf zzCa;
  private boolean zzCg = false;
  private int zzCh;
  private Intent zzCi;
  
  public zzg(Context paramContext, String paramString, boolean paramBoolean, int paramInt, Intent paramIntent, zzf paramZzf)
  {
    zzBW = paramString;
    zzCh = paramInt;
    zzCi = paramIntent;
    zzCg = paramBoolean;
    mContext = paramContext;
    zzCa = paramZzf;
  }
  
  public void finishPurchase()
  {
    int i = zzp.zzbH().zzd(zzCi);
    if ((zzCh != -1) || (i != 0)) {
      return;
    }
    zzBQ = new zzb(mContext);
    Intent localIntent = new Intent("com.android.vending.billing.InAppBillingService.BIND");
    localIntent.setPackage("com.android.vending");
    com.google.android.gms.common.stats.zzb.zzpD().zza(mContext, localIntent, this, 1);
  }
  
  public String getProductId()
  {
    return zzBW;
  }
  
  public Intent getPurchaseData()
  {
    return zzCi;
  }
  
  public int getResultCode()
  {
    return zzCh;
  }
  
  public boolean isVerified()
  {
    return zzCg;
  }
  
  public void onServiceConnected(ComponentName paramComponentName, IBinder paramIBinder)
  {
    com.google.android.gms.ads.internal.util.client.zzb.zzaD("In-app billing service connected.");
    zzBQ.zzM(paramIBinder);
    paramComponentName = zzp.zzbH().zze(zzCi);
    paramComponentName = zzp.zzbH().zzam(paramComponentName);
    if (paramComponentName == null) {
      return;
    }
    if (zzBQ.zzi(mContext.getPackageName(), paramComponentName) == 0) {
      zzh.zzx(mContext).zza(zzCa);
    }
    com.google.android.gms.common.stats.zzb.zzpD().zza(mContext, this);
    zzBQ.destroy();
  }
  
  public void onServiceDisconnected(ComponentName paramComponentName)
  {
    com.google.android.gms.ads.internal.util.client.zzb.zzaD("In-app billing service disconnected.");
    zzBQ.destroy();
  }
}
