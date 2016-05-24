package com.google.android.gms.internal;

import android.os.Binder;
import android.os.IBinder;
import android.os.IInterface;
import android.os.Parcel;
import android.os.RemoteException;
import com.google.android.gms.dynamic.zzd;
import com.google.android.gms.dynamic.zzd.zza;

public abstract interface zzcl
  extends IInterface
{
  public abstract zzd zzU(String paramString)
    throws RemoteException;
  
  public abstract void zza(String paramString, zzd paramZzd)
    throws RemoteException;
  
  public abstract void zzb(zzd paramZzd)
    throws RemoteException;
  
  public static abstract class zza
    extends Binder
    implements zzcl
  {
    public zza()
    {
      attachInterface(this, "com.google.android.gms.ads.internal.formats.client.INativeAdViewDelegate");
    }
    
    public static zzcl zzu(IBinder paramIBinder)
    {
      if (paramIBinder == null) {
        return null;
      }
      IInterface localIInterface = paramIBinder.queryLocalInterface("com.google.android.gms.ads.internal.formats.client.INativeAdViewDelegate");
      if ((localIInterface != null) && ((localIInterface instanceof zzcl))) {
        return (zzcl)localIInterface;
      }
      return new zza(paramIBinder);
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
        paramParcel2.writeString("com.google.android.gms.ads.internal.formats.client.INativeAdViewDelegate");
        return true;
      case 1: 
        paramParcel1.enforceInterface("com.google.android.gms.ads.internal.formats.client.INativeAdViewDelegate");
        zza(paramParcel1.readString(), zzd.zza.zzbk(paramParcel1.readStrongBinder()));
        paramParcel2.writeNoException();
        return true;
      case 2: 
        paramParcel1.enforceInterface("com.google.android.gms.ads.internal.formats.client.INativeAdViewDelegate");
        paramParcel1 = zzU(paramParcel1.readString());
        paramParcel2.writeNoException();
        if (paramParcel1 != null) {}
        for (paramParcel1 = paramParcel1.asBinder();; paramParcel1 = null)
        {
          paramParcel2.writeStrongBinder(paramParcel1);
          return true;
        }
      }
      paramParcel1.enforceInterface("com.google.android.gms.ads.internal.formats.client.INativeAdViewDelegate");
      zzb(zzd.zza.zzbk(paramParcel1.readStrongBinder()));
      paramParcel2.writeNoException();
      return true;
    }
    
    private static class zza
      implements zzcl
    {
      private IBinder zznI;
      
      zza(IBinder paramIBinder)
      {
        zznI = paramIBinder;
      }
      
      public IBinder asBinder()
      {
        return zznI;
      }
      
      public zzd zzU(String paramString)
        throws RemoteException
      {
        Parcel localParcel1 = Parcel.obtain();
        Parcel localParcel2 = Parcel.obtain();
        try
        {
          localParcel1.writeInterfaceToken("com.google.android.gms.ads.internal.formats.client.INativeAdViewDelegate");
          localParcel1.writeString(paramString);
          zznI.transact(2, localParcel1, localParcel2, 0);
          localParcel2.readException();
          paramString = zzd.zza.zzbk(localParcel2.readStrongBinder());
          return paramString;
        }
        finally
        {
          localParcel2.recycle();
          localParcel1.recycle();
        }
      }
      
      /* Error */
      public void zza(String paramString, zzd paramZzd)
        throws RemoteException
      {
        // Byte code:
        //   0: invokestatic 31	android/os/Parcel:obtain	()Landroid/os/Parcel;
        //   3: astore_3
        //   4: invokestatic 31	android/os/Parcel:obtain	()Landroid/os/Parcel;
        //   7: astore 4
        //   9: aload_3
        //   10: ldc 33
        //   12: invokevirtual 37	android/os/Parcel:writeInterfaceToken	(Ljava/lang/String;)V
        //   15: aload_3
        //   16: aload_1
        //   17: invokevirtual 40	android/os/Parcel:writeString	(Ljava/lang/String;)V
        //   20: aload_2
        //   21: ifnull +45 -> 66
        //   24: aload_2
        //   25: invokeinterface 67 1 0
        //   30: astore_1
        //   31: aload_3
        //   32: aload_1
        //   33: invokevirtual 70	android/os/Parcel:writeStrongBinder	(Landroid/os/IBinder;)V
        //   36: aload_0
        //   37: getfield 18	com/google/android/gms/internal/zzcl$zza$zza:zznI	Landroid/os/IBinder;
        //   40: iconst_1
        //   41: aload_3
        //   42: aload 4
        //   44: iconst_0
        //   45: invokeinterface 46 5 0
        //   50: pop
        //   51: aload 4
        //   53: invokevirtual 49	android/os/Parcel:readException	()V
        //   56: aload 4
        //   58: invokevirtual 61	android/os/Parcel:recycle	()V
        //   61: aload_3
        //   62: invokevirtual 61	android/os/Parcel:recycle	()V
        //   65: return
        //   66: aconst_null
        //   67: astore_1
        //   68: goto -37 -> 31
        //   71: astore_1
        //   72: aload 4
        //   74: invokevirtual 61	android/os/Parcel:recycle	()V
        //   77: aload_3
        //   78: invokevirtual 61	android/os/Parcel:recycle	()V
        //   81: aload_1
        //   82: athrow
        // Local variable table:
        //   start	length	slot	name	signature
        //   0	83	0	this	zza
        //   0	83	1	paramString	String
        //   0	83	2	paramZzd	zzd
        //   3	75	3	localParcel1	Parcel
        //   7	66	4	localParcel2	Parcel
        // Exception table:
        //   from	to	target	type
        //   9	20	71	finally
        //   24	31	71	finally
        //   31	56	71	finally
      }
      
      /* Error */
      public void zzb(zzd paramZzd)
        throws RemoteException
      {
        // Byte code:
        //   0: invokestatic 31	android/os/Parcel:obtain	()Landroid/os/Parcel;
        //   3: astore_2
        //   4: invokestatic 31	android/os/Parcel:obtain	()Landroid/os/Parcel;
        //   7: astore_3
        //   8: aload_2
        //   9: ldc 33
        //   11: invokevirtual 37	android/os/Parcel:writeInterfaceToken	(Ljava/lang/String;)V
        //   14: aload_1
        //   15: ifnull +42 -> 57
        //   18: aload_1
        //   19: invokeinterface 67 1 0
        //   24: astore_1
        //   25: aload_2
        //   26: aload_1
        //   27: invokevirtual 70	android/os/Parcel:writeStrongBinder	(Landroid/os/IBinder;)V
        //   30: aload_0
        //   31: getfield 18	com/google/android/gms/internal/zzcl$zza$zza:zznI	Landroid/os/IBinder;
        //   34: iconst_3
        //   35: aload_2
        //   36: aload_3
        //   37: iconst_0
        //   38: invokeinterface 46 5 0
        //   43: pop
        //   44: aload_3
        //   45: invokevirtual 49	android/os/Parcel:readException	()V
        //   48: aload_3
        //   49: invokevirtual 61	android/os/Parcel:recycle	()V
        //   52: aload_2
        //   53: invokevirtual 61	android/os/Parcel:recycle	()V
        //   56: return
        //   57: aconst_null
        //   58: astore_1
        //   59: goto -34 -> 25
        //   62: astore_1
        //   63: aload_3
        //   64: invokevirtual 61	android/os/Parcel:recycle	()V
        //   67: aload_2
        //   68: invokevirtual 61	android/os/Parcel:recycle	()V
        //   71: aload_1
        //   72: athrow
        // Local variable table:
        //   start	length	slot	name	signature
        //   0	73	0	this	zza
        //   0	73	1	paramZzd	zzd
        //   3	65	2	localParcel1	Parcel
        //   7	57	3	localParcel2	Parcel
        // Exception table:
        //   from	to	target	type
        //   8	14	62	finally
        //   18	25	62	finally
        //   25	48	62	finally
      }
    }
  }
}
