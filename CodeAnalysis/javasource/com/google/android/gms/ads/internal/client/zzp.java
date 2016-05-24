package com.google.android.gms.ads.internal.client;

import android.os.Binder;
import android.os.IBinder;
import android.os.IInterface;
import android.os.Parcel;
import android.os.RemoteException;
import com.google.android.gms.ads.internal.formats.NativeAdOptionsParcel;
import com.google.android.gms.ads.internal.formats.zzi;
import com.google.android.gms.internal.zzct;
import com.google.android.gms.internal.zzct.zza;
import com.google.android.gms.internal.zzcu;
import com.google.android.gms.internal.zzcu.zza;
import com.google.android.gms.internal.zzcv;
import com.google.android.gms.internal.zzcv.zza;
import com.google.android.gms.internal.zzcw;
import com.google.android.gms.internal.zzcw.zza;

public abstract interface zzp
  extends IInterface
{
  public abstract void zza(NativeAdOptionsParcel paramNativeAdOptionsParcel)
    throws RemoteException;
  
  public abstract void zza(zzct paramZzct)
    throws RemoteException;
  
  public abstract void zza(zzcu paramZzcu)
    throws RemoteException;
  
  public abstract void zza(String paramString, zzcw paramZzcw, zzcv paramZzcv)
    throws RemoteException;
  
  public abstract void zzb(zzn paramZzn)
    throws RemoteException;
  
  public abstract zzo zzbk()
    throws RemoteException;
  
  public static abstract class zza
    extends Binder
    implements zzp
  {
    public zza()
    {
      attachInterface(this, "com.google.android.gms.ads.internal.client.IAdLoaderBuilder");
    }
    
    public static zzp zzi(IBinder paramIBinder)
    {
      if (paramIBinder == null) {
        return null;
      }
      IInterface localIInterface = paramIBinder.queryLocalInterface("com.google.android.gms.ads.internal.client.IAdLoaderBuilder");
      if ((localIInterface != null) && ((localIInterface instanceof zzp))) {
        return (zzp)localIInterface;
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
      zzo localZzo = null;
      Object localObject = null;
      switch (paramInt1)
      {
      default: 
        return super.onTransact(paramInt1, paramParcel1, paramParcel2, paramInt2);
      case 1598968902: 
        paramParcel2.writeString("com.google.android.gms.ads.internal.client.IAdLoaderBuilder");
        return true;
      case 1: 
        paramParcel1.enforceInterface("com.google.android.gms.ads.internal.client.IAdLoaderBuilder");
        localZzo = zzbk();
        paramParcel2.writeNoException();
        paramParcel1 = (Parcel)localObject;
        if (localZzo != null) {
          paramParcel1 = localZzo.asBinder();
        }
        paramParcel2.writeStrongBinder(paramParcel1);
        return true;
      case 2: 
        paramParcel1.enforceInterface("com.google.android.gms.ads.internal.client.IAdLoaderBuilder");
        zzb(zzn.zza.zzg(paramParcel1.readStrongBinder()));
        paramParcel2.writeNoException();
        return true;
      case 3: 
        paramParcel1.enforceInterface("com.google.android.gms.ads.internal.client.IAdLoaderBuilder");
        zza(zzct.zza.zzz(paramParcel1.readStrongBinder()));
        paramParcel2.writeNoException();
        return true;
      case 4: 
        paramParcel1.enforceInterface("com.google.android.gms.ads.internal.client.IAdLoaderBuilder");
        zza(zzcu.zza.zzA(paramParcel1.readStrongBinder()));
        paramParcel2.writeNoException();
        return true;
      case 5: 
        paramParcel1.enforceInterface("com.google.android.gms.ads.internal.client.IAdLoaderBuilder");
        zza(paramParcel1.readString(), zzcw.zza.zzC(paramParcel1.readStrongBinder()), zzcv.zza.zzB(paramParcel1.readStrongBinder()));
        paramParcel2.writeNoException();
        return true;
      }
      paramParcel1.enforceInterface("com.google.android.gms.ads.internal.client.IAdLoaderBuilder");
      localObject = localZzo;
      if (paramParcel1.readInt() != 0) {
        localObject = NativeAdOptionsParcel.CREATOR.zzf(paramParcel1);
      }
      zza((NativeAdOptionsParcel)localObject);
      paramParcel2.writeNoException();
      return true;
    }
    
    private static class zza
      implements zzp
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
      public void zza(NativeAdOptionsParcel paramNativeAdOptionsParcel)
        throws RemoteException
      {
        // Byte code:
        //   0: invokestatic 30	android/os/Parcel:obtain	()Landroid/os/Parcel;
        //   3: astore_2
        //   4: invokestatic 30	android/os/Parcel:obtain	()Landroid/os/Parcel;
        //   7: astore_3
        //   8: aload_2
        //   9: ldc 32
        //   11: invokevirtual 36	android/os/Parcel:writeInterfaceToken	(Ljava/lang/String;)V
        //   14: aload_1
        //   15: ifnull +42 -> 57
        //   18: aload_2
        //   19: iconst_1
        //   20: invokevirtual 40	android/os/Parcel:writeInt	(I)V
        //   23: aload_1
        //   24: aload_2
        //   25: iconst_0
        //   26: invokevirtual 46	com/google/android/gms/ads/internal/formats/NativeAdOptionsParcel:writeToParcel	(Landroid/os/Parcel;I)V
        //   29: aload_0
        //   30: getfield 18	com/google/android/gms/ads/internal/client/zzp$zza$zza:zznI	Landroid/os/IBinder;
        //   33: bipush 6
        //   35: aload_2
        //   36: aload_3
        //   37: iconst_0
        //   38: invokeinterface 52 5 0
        //   43: pop
        //   44: aload_3
        //   45: invokevirtual 55	android/os/Parcel:readException	()V
        //   48: aload_3
        //   49: invokevirtual 58	android/os/Parcel:recycle	()V
        //   52: aload_2
        //   53: invokevirtual 58	android/os/Parcel:recycle	()V
        //   56: return
        //   57: aload_2
        //   58: iconst_0
        //   59: invokevirtual 40	android/os/Parcel:writeInt	(I)V
        //   62: goto -33 -> 29
        //   65: astore_1
        //   66: aload_3
        //   67: invokevirtual 58	android/os/Parcel:recycle	()V
        //   70: aload_2
        //   71: invokevirtual 58	android/os/Parcel:recycle	()V
        //   74: aload_1
        //   75: athrow
        // Local variable table:
        //   start	length	slot	name	signature
        //   0	76	0	this	zza
        //   0	76	1	paramNativeAdOptionsParcel	NativeAdOptionsParcel
        //   3	68	2	localParcel1	Parcel
        //   7	60	3	localParcel2	Parcel
        // Exception table:
        //   from	to	target	type
        //   8	14	65	finally
        //   18	29	65	finally
        //   29	48	65	finally
        //   57	62	65	finally
      }
      
      /* Error */
      public void zza(zzct paramZzct)
        throws RemoteException
      {
        // Byte code:
        //   0: invokestatic 30	android/os/Parcel:obtain	()Landroid/os/Parcel;
        //   3: astore_2
        //   4: invokestatic 30	android/os/Parcel:obtain	()Landroid/os/Parcel;
        //   7: astore_3
        //   8: aload_2
        //   9: ldc 32
        //   11: invokevirtual 36	android/os/Parcel:writeInterfaceToken	(Ljava/lang/String;)V
        //   14: aload_1
        //   15: ifnull +42 -> 57
        //   18: aload_1
        //   19: invokeinterface 64 1 0
        //   24: astore_1
        //   25: aload_2
        //   26: aload_1
        //   27: invokevirtual 67	android/os/Parcel:writeStrongBinder	(Landroid/os/IBinder;)V
        //   30: aload_0
        //   31: getfield 18	com/google/android/gms/ads/internal/client/zzp$zza$zza:zznI	Landroid/os/IBinder;
        //   34: iconst_3
        //   35: aload_2
        //   36: aload_3
        //   37: iconst_0
        //   38: invokeinterface 52 5 0
        //   43: pop
        //   44: aload_3
        //   45: invokevirtual 55	android/os/Parcel:readException	()V
        //   48: aload_3
        //   49: invokevirtual 58	android/os/Parcel:recycle	()V
        //   52: aload_2
        //   53: invokevirtual 58	android/os/Parcel:recycle	()V
        //   56: return
        //   57: aconst_null
        //   58: astore_1
        //   59: goto -34 -> 25
        //   62: astore_1
        //   63: aload_3
        //   64: invokevirtual 58	android/os/Parcel:recycle	()V
        //   67: aload_2
        //   68: invokevirtual 58	android/os/Parcel:recycle	()V
        //   71: aload_1
        //   72: athrow
        // Local variable table:
        //   start	length	slot	name	signature
        //   0	73	0	this	zza
        //   0	73	1	paramZzct	zzct
        //   3	65	2	localParcel1	Parcel
        //   7	57	3	localParcel2	Parcel
        // Exception table:
        //   from	to	target	type
        //   8	14	62	finally
        //   18	25	62	finally
        //   25	48	62	finally
      }
      
      /* Error */
      public void zza(zzcu paramZzcu)
        throws RemoteException
      {
        // Byte code:
        //   0: invokestatic 30	android/os/Parcel:obtain	()Landroid/os/Parcel;
        //   3: astore_2
        //   4: invokestatic 30	android/os/Parcel:obtain	()Landroid/os/Parcel;
        //   7: astore_3
        //   8: aload_2
        //   9: ldc 32
        //   11: invokevirtual 36	android/os/Parcel:writeInterfaceToken	(Ljava/lang/String;)V
        //   14: aload_1
        //   15: ifnull +42 -> 57
        //   18: aload_1
        //   19: invokeinterface 71 1 0
        //   24: astore_1
        //   25: aload_2
        //   26: aload_1
        //   27: invokevirtual 67	android/os/Parcel:writeStrongBinder	(Landroid/os/IBinder;)V
        //   30: aload_0
        //   31: getfield 18	com/google/android/gms/ads/internal/client/zzp$zza$zza:zznI	Landroid/os/IBinder;
        //   34: iconst_4
        //   35: aload_2
        //   36: aload_3
        //   37: iconst_0
        //   38: invokeinterface 52 5 0
        //   43: pop
        //   44: aload_3
        //   45: invokevirtual 55	android/os/Parcel:readException	()V
        //   48: aload_3
        //   49: invokevirtual 58	android/os/Parcel:recycle	()V
        //   52: aload_2
        //   53: invokevirtual 58	android/os/Parcel:recycle	()V
        //   56: return
        //   57: aconst_null
        //   58: astore_1
        //   59: goto -34 -> 25
        //   62: astore_1
        //   63: aload_3
        //   64: invokevirtual 58	android/os/Parcel:recycle	()V
        //   67: aload_2
        //   68: invokevirtual 58	android/os/Parcel:recycle	()V
        //   71: aload_1
        //   72: athrow
        // Local variable table:
        //   start	length	slot	name	signature
        //   0	73	0	this	zza
        //   0	73	1	paramZzcu	zzcu
        //   3	65	2	localParcel1	Parcel
        //   7	57	3	localParcel2	Parcel
        // Exception table:
        //   from	to	target	type
        //   8	14	62	finally
        //   18	25	62	finally
        //   25	48	62	finally
      }
      
      /* Error */
      public void zza(String paramString, zzcw paramZzcw, zzcv paramZzcv)
        throws RemoteException
      {
        // Byte code:
        //   0: aconst_null
        //   1: astore 4
        //   3: invokestatic 30	android/os/Parcel:obtain	()Landroid/os/Parcel;
        //   6: astore 5
        //   8: invokestatic 30	android/os/Parcel:obtain	()Landroid/os/Parcel;
        //   11: astore 6
        //   13: aload 5
        //   15: ldc 32
        //   17: invokevirtual 36	android/os/Parcel:writeInterfaceToken	(Ljava/lang/String;)V
        //   20: aload 5
        //   22: aload_1
        //   23: invokevirtual 75	android/os/Parcel:writeString	(Ljava/lang/String;)V
        //   26: aload_2
        //   27: ifnull +68 -> 95
        //   30: aload_2
        //   31: invokeinterface 78 1 0
        //   36: astore_1
        //   37: aload 5
        //   39: aload_1
        //   40: invokevirtual 67	android/os/Parcel:writeStrongBinder	(Landroid/os/IBinder;)V
        //   43: aload 4
        //   45: astore_1
        //   46: aload_3
        //   47: ifnull +10 -> 57
        //   50: aload_3
        //   51: invokeinterface 81 1 0
        //   56: astore_1
        //   57: aload 5
        //   59: aload_1
        //   60: invokevirtual 67	android/os/Parcel:writeStrongBinder	(Landroid/os/IBinder;)V
        //   63: aload_0
        //   64: getfield 18	com/google/android/gms/ads/internal/client/zzp$zza$zza:zznI	Landroid/os/IBinder;
        //   67: iconst_5
        //   68: aload 5
        //   70: aload 6
        //   72: iconst_0
        //   73: invokeinterface 52 5 0
        //   78: pop
        //   79: aload 6
        //   81: invokevirtual 55	android/os/Parcel:readException	()V
        //   84: aload 6
        //   86: invokevirtual 58	android/os/Parcel:recycle	()V
        //   89: aload 5
        //   91: invokevirtual 58	android/os/Parcel:recycle	()V
        //   94: return
        //   95: aconst_null
        //   96: astore_1
        //   97: goto -60 -> 37
        //   100: astore_1
        //   101: aload 6
        //   103: invokevirtual 58	android/os/Parcel:recycle	()V
        //   106: aload 5
        //   108: invokevirtual 58	android/os/Parcel:recycle	()V
        //   111: aload_1
        //   112: athrow
        // Local variable table:
        //   start	length	slot	name	signature
        //   0	113	0	this	zza
        //   0	113	1	paramString	String
        //   0	113	2	paramZzcw	zzcw
        //   0	113	3	paramZzcv	zzcv
        //   1	43	4	localObject	Object
        //   6	101	5	localParcel1	Parcel
        //   11	91	6	localParcel2	Parcel
        // Exception table:
        //   from	to	target	type
        //   13	26	100	finally
        //   30	37	100	finally
        //   37	43	100	finally
        //   50	57	100	finally
        //   57	84	100	finally
      }
      
      /* Error */
      public void zzb(zzn paramZzn)
        throws RemoteException
      {
        // Byte code:
        //   0: invokestatic 30	android/os/Parcel:obtain	()Landroid/os/Parcel;
        //   3: astore_2
        //   4: invokestatic 30	android/os/Parcel:obtain	()Landroid/os/Parcel;
        //   7: astore_3
        //   8: aload_2
        //   9: ldc 32
        //   11: invokevirtual 36	android/os/Parcel:writeInterfaceToken	(Ljava/lang/String;)V
        //   14: aload_1
        //   15: ifnull +42 -> 57
        //   18: aload_1
        //   19: invokeinterface 86 1 0
        //   24: astore_1
        //   25: aload_2
        //   26: aload_1
        //   27: invokevirtual 67	android/os/Parcel:writeStrongBinder	(Landroid/os/IBinder;)V
        //   30: aload_0
        //   31: getfield 18	com/google/android/gms/ads/internal/client/zzp$zza$zza:zznI	Landroid/os/IBinder;
        //   34: iconst_2
        //   35: aload_2
        //   36: aload_3
        //   37: iconst_0
        //   38: invokeinterface 52 5 0
        //   43: pop
        //   44: aload_3
        //   45: invokevirtual 55	android/os/Parcel:readException	()V
        //   48: aload_3
        //   49: invokevirtual 58	android/os/Parcel:recycle	()V
        //   52: aload_2
        //   53: invokevirtual 58	android/os/Parcel:recycle	()V
        //   56: return
        //   57: aconst_null
        //   58: astore_1
        //   59: goto -34 -> 25
        //   62: astore_1
        //   63: aload_3
        //   64: invokevirtual 58	android/os/Parcel:recycle	()V
        //   67: aload_2
        //   68: invokevirtual 58	android/os/Parcel:recycle	()V
        //   71: aload_1
        //   72: athrow
        // Local variable table:
        //   start	length	slot	name	signature
        //   0	73	0	this	zza
        //   0	73	1	paramZzn	zzn
        //   3	65	2	localParcel1	Parcel
        //   7	57	3	localParcel2	Parcel
        // Exception table:
        //   from	to	target	type
        //   8	14	62	finally
        //   18	25	62	finally
        //   25	48	62	finally
      }
      
      public zzo zzbk()
        throws RemoteException
      {
        Parcel localParcel1 = Parcel.obtain();
        Parcel localParcel2 = Parcel.obtain();
        try
        {
          localParcel1.writeInterfaceToken("com.google.android.gms.ads.internal.client.IAdLoaderBuilder");
          zznI.transact(1, localParcel1, localParcel2, 0);
          localParcel2.readException();
          zzo localZzo = zzo.zza.zzh(localParcel2.readStrongBinder());
          return localZzo;
        }
        finally
        {
          localParcel2.recycle();
          localParcel1.recycle();
        }
      }
    }
  }
}
