package com.google.android.gms.internal;

import android.os.Binder;
import android.os.IBinder;
import android.os.IInterface;
import android.os.Parcel;
import android.os.RemoteException;
import com.google.android.gms.dynamic.zzd;
import com.google.android.gms.dynamic.zzd.zza;

public abstract interface zzcm
  extends IInterface
{
  public abstract IBinder zza(zzd paramZzd1, zzd paramZzd2, zzd paramZzd3, int paramInt)
    throws RemoteException;
  
  public static abstract class zza
    extends Binder
    implements zzcm
  {
    public static zzcm zzv(IBinder paramIBinder)
    {
      if (paramIBinder == null) {
        return null;
      }
      IInterface localIInterface = paramIBinder.queryLocalInterface("com.google.android.gms.ads.internal.formats.client.INativeAdViewDelegateCreator");
      if ((localIInterface != null) && ((localIInterface instanceof zzcm))) {
        return (zzcm)localIInterface;
      }
      return new zza(paramIBinder);
    }
    
    public boolean onTransact(int paramInt1, Parcel paramParcel1, Parcel paramParcel2, int paramInt2)
      throws RemoteException
    {
      switch (paramInt1)
      {
      default: 
        return super.onTransact(paramInt1, paramParcel1, paramParcel2, paramInt2);
      case 1598968902: 
        paramParcel2.writeString("com.google.android.gms.ads.internal.formats.client.INativeAdViewDelegateCreator");
        return true;
      }
      paramParcel1.enforceInterface("com.google.android.gms.ads.internal.formats.client.INativeAdViewDelegateCreator");
      paramParcel1 = zza(zzd.zza.zzbk(paramParcel1.readStrongBinder()), zzd.zza.zzbk(paramParcel1.readStrongBinder()), zzd.zza.zzbk(paramParcel1.readStrongBinder()), paramParcel1.readInt());
      paramParcel2.writeNoException();
      paramParcel2.writeStrongBinder(paramParcel1);
      return true;
    }
    
    private static class zza
      implements zzcm
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
      
      /* Error */
      public IBinder zza(zzd paramZzd1, zzd paramZzd2, zzd paramZzd3, int paramInt)
        throws RemoteException
      {
        // Byte code:
        //   0: aconst_null
        //   1: astore 5
        //   3: invokestatic 30	android/os/Parcel:obtain	()Landroid/os/Parcel;
        //   6: astore 6
        //   8: invokestatic 30	android/os/Parcel:obtain	()Landroid/os/Parcel;
        //   11: astore 7
        //   13: aload 6
        //   15: ldc 32
        //   17: invokevirtual 36	android/os/Parcel:writeInterfaceToken	(Ljava/lang/String;)V
        //   20: aload_1
        //   21: ifnull +99 -> 120
        //   24: aload_1
        //   25: invokeinterface 40 1 0
        //   30: astore_1
        //   31: aload 6
        //   33: aload_1
        //   34: invokevirtual 43	android/os/Parcel:writeStrongBinder	(Landroid/os/IBinder;)V
        //   37: aload_2
        //   38: ifnull +87 -> 125
        //   41: aload_2
        //   42: invokeinterface 40 1 0
        //   47: astore_1
        //   48: aload 6
        //   50: aload_1
        //   51: invokevirtual 43	android/os/Parcel:writeStrongBinder	(Landroid/os/IBinder;)V
        //   54: aload 5
        //   56: astore_1
        //   57: aload_3
        //   58: ifnull +10 -> 68
        //   61: aload_3
        //   62: invokeinterface 40 1 0
        //   67: astore_1
        //   68: aload 6
        //   70: aload_1
        //   71: invokevirtual 43	android/os/Parcel:writeStrongBinder	(Landroid/os/IBinder;)V
        //   74: aload 6
        //   76: iload 4
        //   78: invokevirtual 47	android/os/Parcel:writeInt	(I)V
        //   81: aload_0
        //   82: getfield 18	com/google/android/gms/internal/zzcm$zza$zza:zznI	Landroid/os/IBinder;
        //   85: iconst_1
        //   86: aload 6
        //   88: aload 7
        //   90: iconst_0
        //   91: invokeinterface 53 5 0
        //   96: pop
        //   97: aload 7
        //   99: invokevirtual 56	android/os/Parcel:readException	()V
        //   102: aload 7
        //   104: invokevirtual 59	android/os/Parcel:readStrongBinder	()Landroid/os/IBinder;
        //   107: astore_1
        //   108: aload 7
        //   110: invokevirtual 62	android/os/Parcel:recycle	()V
        //   113: aload 6
        //   115: invokevirtual 62	android/os/Parcel:recycle	()V
        //   118: aload_1
        //   119: areturn
        //   120: aconst_null
        //   121: astore_1
        //   122: goto -91 -> 31
        //   125: aconst_null
        //   126: astore_1
        //   127: goto -79 -> 48
        //   130: astore_1
        //   131: aload 7
        //   133: invokevirtual 62	android/os/Parcel:recycle	()V
        //   136: aload 6
        //   138: invokevirtual 62	android/os/Parcel:recycle	()V
        //   141: aload_1
        //   142: athrow
        // Local variable table:
        //   start	length	slot	name	signature
        //   0	143	0	this	zza
        //   0	143	1	paramZzd1	zzd
        //   0	143	2	paramZzd2	zzd
        //   0	143	3	paramZzd3	zzd
        //   0	143	4	paramInt	int
        //   1	54	5	localObject	Object
        //   6	131	6	localParcel1	Parcel
        //   11	121	7	localParcel2	Parcel
        // Exception table:
        //   from	to	target	type
        //   13	20	130	finally
        //   24	31	130	finally
        //   31	37	130	finally
        //   41	48	130	finally
        //   48	54	130	finally
        //   61	68	130	finally
        //   68	108	130	finally
      }
    }
  }
}
