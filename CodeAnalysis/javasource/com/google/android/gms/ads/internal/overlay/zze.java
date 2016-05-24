package com.google.android.gms.ads.internal.overlay;

import android.app.Activity;
import android.content.Context;
import android.content.Intent;
import com.google.android.gms.ads.internal.util.client.VersionInfoParcel;
import com.google.android.gms.ads.internal.zzp;
import com.google.android.gms.internal.zzlv;

public class zze
{
  public zze() {}
  
  public void zza(Context paramContext, AdOverlayInfoParcel paramAdOverlayInfoParcel)
  {
    zza(paramContext, paramAdOverlayInfoParcel, true);
  }
  
  public void zza(Context paramContext, AdOverlayInfoParcel paramAdOverlayInfoParcel, boolean paramBoolean)
  {
    if ((zzAX == 4) && (zzAQ == null))
    {
      if (zzAP != null) {
        zzAP.onAdClicked();
      }
      zzp.zzbu().zza(paramContext, zzAO, zzAW);
      return;
    }
    Intent localIntent = new Intent();
    localIntent.setClassName(paramContext, "com.google.android.gms.ads.AdActivity");
    localIntent.putExtra("com.google.android.gms.ads.internal.overlay.useClientJar", zzqb.zzIC);
    localIntent.putExtra("shouldCallOnOverlayOpened", paramBoolean);
    AdOverlayInfoParcel.zza(localIntent, paramAdOverlayInfoParcel);
    if (!zzlv.isAtLeastL()) {
      localIntent.addFlags(524288);
    }
    if (!(paramContext instanceof Activity)) {
      localIntent.addFlags(268435456);
    }
    paramContext.startActivity(localIntent);
  }
}
