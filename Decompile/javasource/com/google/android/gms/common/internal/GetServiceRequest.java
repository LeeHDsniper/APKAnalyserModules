package com.google.android.gms.common.internal;

import android.accounts.Account;
import android.os.Bundle;
import android.os.IBinder;
import android.os.Parcel;
import android.os.Parcelable.Creator;
import com.google.android.gms.common.GoogleApiAvailability;
import com.google.android.gms.common.api.Scope;
import com.google.android.gms.common.internal.safeparcel.SafeParcelable;
import java.util.Collection;

public class GetServiceRequest
  implements SafeParcelable
{
  public static final Parcelable.Creator<GetServiceRequest> CREATOR = new zzi();
  final int version;
  final int zzadn;
  int zzado;
  String zzadp;
  IBinder zzadq;
  Scope[] zzadr;
  Bundle zzads;
  Account zzadt;
  
  public GetServiceRequest(int paramInt)
  {
    version = 2;
    zzado = GoogleApiAvailability.GOOGLE_PLAY_SERVICES_VERSION_CODE;
    zzadn = paramInt;
  }
  
  GetServiceRequest(int paramInt1, int paramInt2, int paramInt3, String paramString, IBinder paramIBinder, Scope[] paramArrayOfScope, Bundle paramBundle, Account paramAccount)
  {
    version = paramInt1;
    zzadn = paramInt2;
    zzado = paramInt3;
    zzadp = paramString;
    if (paramInt1 < 2) {}
    for (zzadt = zzaG(paramIBinder);; zzadt = paramAccount)
    {
      zzadr = paramArrayOfScope;
      zzads = paramBundle;
      return;
      zzadq = paramIBinder;
    }
  }
  
  private Account zzaG(IBinder paramIBinder)
  {
    Account localAccount = null;
    if (paramIBinder != null) {
      localAccount = zza.zzb(zzp.zza.zzaH(paramIBinder));
    }
    return localAccount;
  }
  
  public int describeContents()
  {
    return 0;
  }
  
  public void writeToParcel(Parcel paramParcel, int paramInt)
  {
    zzi.zza(this, paramParcel, paramInt);
  }
  
  public GetServiceRequest zzb(Account paramAccount)
  {
    zzadt = paramAccount;
    return this;
  }
  
  public GetServiceRequest zzc(zzp paramZzp)
  {
    if (paramZzp != null) {
      zzadq = paramZzp.asBinder();
    }
    return this;
  }
  
  public GetServiceRequest zzck(String paramString)
  {
    zzadp = paramString;
    return this;
  }
  
  public GetServiceRequest zzd(Collection<Scope> paramCollection)
  {
    zzadr = ((Scope[])paramCollection.toArray(new Scope[paramCollection.size()]));
    return this;
  }
  
  public GetServiceRequest zzg(Bundle paramBundle)
  {
    zzads = paramBundle;
    return this;
  }
}
