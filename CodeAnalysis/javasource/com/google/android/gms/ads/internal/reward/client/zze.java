package com.google.android.gms.ads.internal.reward.client;

import android.os.RemoteException;
import com.google.android.gms.ads.internal.util.client.zzb;
import com.google.android.gms.ads.reward.RewardItem;

public class zze
  implements RewardItem
{
  private final zza zzGl;
  
  public zze(zza paramZza)
  {
    zzGl = paramZza;
  }
  
  public int getAmount()
  {
    if (zzGl == null) {
      return 0;
    }
    try
    {
      int i = zzGl.getAmount();
      return i;
    }
    catch (RemoteException localRemoteException)
    {
      zzb.zzd("Could not forward getAmount to RewardItem", localRemoteException);
    }
    return 0;
  }
  
  public String getType()
  {
    if (zzGl == null) {
      return null;
    }
    try
    {
      String str = zzGl.getType();
      return str;
    }
    catch (RemoteException localRemoteException)
    {
      zzb.zzd("Could not forward getType to RewardItem", localRemoteException);
    }
    return null;
  }
}
