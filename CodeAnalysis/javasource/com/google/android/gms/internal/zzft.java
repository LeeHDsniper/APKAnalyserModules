package com.google.android.gms.internal;

import android.content.Intent;
import android.os.RemoteException;
import com.google.android.gms.ads.internal.util.client.zzb;
import com.google.android.gms.ads.purchase.InAppPurchaseResult;

@zzgk
public class zzft
  implements InAppPurchaseResult
{
  private final zzfp zzCp;
  
  public zzft(zzfp paramZzfp)
  {
    zzCp = paramZzfp;
  }
  
  public void finishPurchase()
  {
    try
    {
      zzCp.finishPurchase();
      return;
    }
    catch (RemoteException localRemoteException)
    {
      zzb.zzd("Could not forward finishPurchase to InAppPurchaseResult", localRemoteException);
    }
  }
  
  public String getProductId()
  {
    try
    {
      String str = zzCp.getProductId();
      return str;
    }
    catch (RemoteException localRemoteException)
    {
      zzb.zzd("Could not forward getProductId to InAppPurchaseResult", localRemoteException);
    }
    return null;
  }
  
  public Intent getPurchaseData()
  {
    try
    {
      Intent localIntent = zzCp.getPurchaseData();
      return localIntent;
    }
    catch (RemoteException localRemoteException)
    {
      zzb.zzd("Could not forward getPurchaseData to InAppPurchaseResult", localRemoteException);
    }
    return null;
  }
  
  public int getResultCode()
  {
    try
    {
      int i = zzCp.getResultCode();
      return i;
    }
    catch (RemoteException localRemoteException)
    {
      zzb.zzd("Could not forward getPurchaseData to InAppPurchaseResult", localRemoteException);
    }
    return 0;
  }
  
  public boolean isVerified()
  {
    try
    {
      boolean bool = zzCp.isVerified();
      return bool;
    }
    catch (RemoteException localRemoteException)
    {
      zzb.zzd("Could not forward isVerified to InAppPurchaseResult", localRemoteException);
    }
    return false;
  }
}
