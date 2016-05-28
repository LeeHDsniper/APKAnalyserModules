package com.google.android.gms.common.internal;

import android.accounts.Account;
import android.content.Context;
import android.os.Binder;
import android.os.RemoteException;
import android.util.Log;
import com.google.android.gms.common.GooglePlayServicesUtil;

public class zza
  extends zzp.zza
{
  private Context mContext;
  private Account zzOY;
  int zzacB;
  
  public static Account zzb(zzp paramZzp)
  {
    Account localAccount = null;
    long l;
    if (paramZzp != null) {
      l = Binder.clearCallingIdentity();
    }
    try
    {
      localAccount = paramZzp.getAccount();
      return localAccount;
    }
    catch (RemoteException paramZzp)
    {
      Log.w("AccountAccessor", "Remote account accessor probably died");
      return null;
    }
    finally
    {
      Binder.restoreCallingIdentity(l);
    }
  }
  
  public boolean equals(Object paramObject)
  {
    if (this == paramObject) {
      return true;
    }
    if (!(paramObject instanceof zza)) {
      return false;
    }
    return zzOY.equals(zzOY);
  }
  
  public Account getAccount()
  {
    int i = Binder.getCallingUid();
    if (i == zzacB) {
      return zzOY;
    }
    if (GooglePlayServicesUtil.zze(mContext, i))
    {
      zzacB = i;
      return zzOY;
    }
    throw new SecurityException("Caller is not GooglePlayServices");
  }
}
