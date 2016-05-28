package com.google.android.gms.signin.internal;

import android.os.Binder;
import android.os.IBinder;
import android.os.IInterface;
import android.os.Parcel;
import android.os.RemoteException;
import com.google.android.gms.common.api.Scope;
import java.util.List;

public abstract interface zzd
  extends IInterface
{
  public abstract void zza(String paramString1, String paramString2, zzf paramZzf)
    throws RemoteException;
  
  public abstract void zza(String paramString, List<Scope> paramList, zzf paramZzf)
    throws RemoteException;
  
  public static abstract class zza
    extends Binder
    implements zzd
  {
    public zza()
    {
      attachInterface(this, "com.google.android.gms.signin.internal.IOfflineAccessCallbacks");
    }
    
    public IBinder asBinder()
    {
      return this;
    }
    
    public boolean onTransact(int paramInt1, Parcel paramParcel1, Parcel paramParcel2, int paramInt2)
      throws RemoteException
    {
      switch (paramInt1)
      {
      default: 
        return super.onTransact(paramInt1, paramParcel1, paramParcel2, paramInt2);
      case 1598968902: 
        paramParcel2.writeString("com.google.android.gms.signin.internal.IOfflineAccessCallbacks");
        return true;
      case 2: 
        paramParcel1.enforceInterface("com.google.android.gms.signin.internal.IOfflineAccessCallbacks");
        zza(paramParcel1.readString(), paramParcel1.createTypedArrayList(Scope.CREATOR), zzf.zza.zzdH(paramParcel1.readStrongBinder()));
        paramParcel2.writeNoException();
        return true;
      }
      paramParcel1.enforceInterface("com.google.android.gms.signin.internal.IOfflineAccessCallbacks");
      zza(paramParcel1.readString(), paramParcel1.readString(), zzf.zza.zzdH(paramParcel1.readStrongBinder()));
      paramParcel2.writeNoException();
      return true;
    }
  }
}
