package com.google.android.gms.internal;

import android.os.Binder;
import android.os.IBinder;
import android.os.IInterface;
import android.os.Parcel;
import android.os.RemoteException;
import com.google.android.gms.appdatasearch.GetRecentContextCall.Request;
import com.google.android.gms.appdatasearch.UsageInfo;
import com.google.android.gms.appdatasearch.zzf;

public abstract interface zzjc
  extends IInterface
{
  public abstract void zza(GetRecentContextCall.Request paramRequest, zzjd paramZzjd)
    throws RemoteException;
  
  public abstract void zza(zzjd paramZzjd)
    throws RemoteException;
  
  public abstract void zza(zzjd paramZzjd, String paramString1, String paramString2)
    throws RemoteException;
  
  public abstract void zza(zzjd paramZzjd, String paramString, UsageInfo[] paramArrayOfUsageInfo)
    throws RemoteException;
  
  public abstract void zza(zzjd paramZzjd, boolean paramBoolean)
    throws RemoteException;
  
  public abstract void zzb(zzjd paramZzjd)
    throws RemoteException;
  
  public static abstract class zza
    extends Binder
    implements zzjc
  {
    public static zzjc zzaf(IBinder paramIBinder)
    {
      if (paramIBinder == null) {
        return null;
      }
      IInterface localIInterface = paramIBinder.queryLocalInterface("com.google.android.gms.appdatasearch.internal.ILightweightAppDataSearch");
      if ((localIInterface != null) && ((localIInterface instanceof zzjc))) {
        return (zzjc)localIInterface;
      }
      return new zza(paramIBinder);
    }
    
    public boolean onTransact(int paramInt1, Parcel paramParcel1, Parcel paramParcel2, int paramInt2)
      throws RemoteException
    {
      Object localObject;
      switch (paramInt1)
      {
      default: 
        return super.onTransact(paramInt1, paramParcel1, paramParcel2, paramInt2);
      case 1598968902: 
        paramParcel2.writeString("com.google.android.gms.appdatasearch.internal.ILightweightAppDataSearch");
        return true;
      case 1: 
        paramParcel1.enforceInterface("com.google.android.gms.appdatasearch.internal.ILightweightAppDataSearch");
        zza(zzjd.zza.zzag(paramParcel1.readStrongBinder()), paramParcel1.readString(), (UsageInfo[])paramParcel1.createTypedArray(UsageInfo.CREATOR));
        paramParcel2.writeNoException();
        return true;
      case 2: 
        paramParcel1.enforceInterface("com.google.android.gms.appdatasearch.internal.ILightweightAppDataSearch");
        zza(zzjd.zza.zzag(paramParcel1.readStrongBinder()));
        paramParcel2.writeNoException();
        return true;
      case 3: 
        paramParcel1.enforceInterface("com.google.android.gms.appdatasearch.internal.ILightweightAppDataSearch");
        zzb(zzjd.zza.zzag(paramParcel1.readStrongBinder()));
        paramParcel2.writeNoException();
        return true;
      case 4: 
        paramParcel1.enforceInterface("com.google.android.gms.appdatasearch.internal.ILightweightAppDataSearch");
        localObject = zzjd.zza.zzag(paramParcel1.readStrongBinder());
        if (paramParcel1.readInt() != 0) {}
        for (boolean bool = true;; bool = false)
        {
          zza((zzjd)localObject, bool);
          paramParcel2.writeNoException();
          return true;
        }
      case 5: 
        paramParcel1.enforceInterface("com.google.android.gms.appdatasearch.internal.ILightweightAppDataSearch");
        if (paramParcel1.readInt() != 0) {}
        for (localObject = GetRecentContextCall.Request.CREATOR.zzw(paramParcel1);; localObject = null)
        {
          zza((GetRecentContextCall.Request)localObject, zzjd.zza.zzag(paramParcel1.readStrongBinder()));
          paramParcel2.writeNoException();
          return true;
        }
      }
      paramParcel1.enforceInterface("com.google.android.gms.appdatasearch.internal.ILightweightAppDataSearch");
      zza(zzjd.zza.zzag(paramParcel1.readStrongBinder()), paramParcel1.readString(), paramParcel1.readString());
      paramParcel2.writeNoException();
      return true;
    }
    
    private static class zza
      implements zzjc
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
      
      public void zza(GetRecentContextCall.Request paramRequest, zzjd paramZzjd)
        throws RemoteException
      {
        Parcel localParcel1 = Parcel.obtain();
        Parcel localParcel2 = Parcel.obtain();
        for (;;)
        {
          try
          {
            localParcel1.writeInterfaceToken("com.google.android.gms.appdatasearch.internal.ILightweightAppDataSearch");
            if (paramRequest != null)
            {
              localParcel1.writeInt(1);
              paramRequest.writeToParcel(localParcel1, 0);
              if (paramZzjd != null)
              {
                paramRequest = paramZzjd.asBinder();
                localParcel1.writeStrongBinder(paramRequest);
                zznI.transact(5, localParcel1, localParcel2, 0);
                localParcel2.readException();
              }
            }
            else
            {
              localParcel1.writeInt(0);
              continue;
            }
            paramRequest = null;
          }
          finally
          {
            localParcel2.recycle();
            localParcel1.recycle();
          }
        }
      }
      
      /* Error */
      public void zza(zzjd paramZzjd)
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
        //   19: invokeinterface 50 1 0
        //   24: astore_1
        //   25: aload_2
        //   26: aload_1
        //   27: invokevirtual 53	android/os/Parcel:writeStrongBinder	(Landroid/os/IBinder;)V
        //   30: aload_0
        //   31: getfield 18	com/google/android/gms/internal/zzjc$zza$zza:zznI	Landroid/os/IBinder;
        //   34: iconst_2
        //   35: aload_2
        //   36: aload_3
        //   37: iconst_0
        //   38: invokeinterface 59 5 0
        //   43: pop
        //   44: aload_3
        //   45: invokevirtual 62	android/os/Parcel:readException	()V
        //   48: aload_3
        //   49: invokevirtual 65	android/os/Parcel:recycle	()V
        //   52: aload_2
        //   53: invokevirtual 65	android/os/Parcel:recycle	()V
        //   56: return
        //   57: aconst_null
        //   58: astore_1
        //   59: goto -34 -> 25
        //   62: astore_1
        //   63: aload_3
        //   64: invokevirtual 65	android/os/Parcel:recycle	()V
        //   67: aload_2
        //   68: invokevirtual 65	android/os/Parcel:recycle	()V
        //   71: aload_1
        //   72: athrow
        // Local variable table:
        //   start	length	slot	name	signature
        //   0	73	0	this	zza
        //   0	73	1	paramZzjd	zzjd
        //   3	65	2	localParcel1	Parcel
        //   7	57	3	localParcel2	Parcel
        // Exception table:
        //   from	to	target	type
        //   8	14	62	finally
        //   18	25	62	finally
        //   25	48	62	finally
      }
      
      /* Error */
      public void zza(zzjd paramZzjd, String paramString1, String paramString2)
        throws RemoteException
      {
        // Byte code:
        //   0: invokestatic 30	android/os/Parcel:obtain	()Landroid/os/Parcel;
        //   3: astore 4
        //   5: invokestatic 30	android/os/Parcel:obtain	()Landroid/os/Parcel;
        //   8: astore 5
        //   10: aload 4
        //   12: ldc 32
        //   14: invokevirtual 36	android/os/Parcel:writeInterfaceToken	(Ljava/lang/String;)V
        //   17: aload_1
        //   18: ifnull +61 -> 79
        //   21: aload_1
        //   22: invokeinterface 50 1 0
        //   27: astore_1
        //   28: aload 4
        //   30: aload_1
        //   31: invokevirtual 53	android/os/Parcel:writeStrongBinder	(Landroid/os/IBinder;)V
        //   34: aload 4
        //   36: aload_2
        //   37: invokevirtual 71	android/os/Parcel:writeString	(Ljava/lang/String;)V
        //   40: aload 4
        //   42: aload_3
        //   43: invokevirtual 71	android/os/Parcel:writeString	(Ljava/lang/String;)V
        //   46: aload_0
        //   47: getfield 18	com/google/android/gms/internal/zzjc$zza$zza:zznI	Landroid/os/IBinder;
        //   50: bipush 6
        //   52: aload 4
        //   54: aload 5
        //   56: iconst_0
        //   57: invokeinterface 59 5 0
        //   62: pop
        //   63: aload 5
        //   65: invokevirtual 62	android/os/Parcel:readException	()V
        //   68: aload 5
        //   70: invokevirtual 65	android/os/Parcel:recycle	()V
        //   73: aload 4
        //   75: invokevirtual 65	android/os/Parcel:recycle	()V
        //   78: return
        //   79: aconst_null
        //   80: astore_1
        //   81: goto -53 -> 28
        //   84: astore_1
        //   85: aload 5
        //   87: invokevirtual 65	android/os/Parcel:recycle	()V
        //   90: aload 4
        //   92: invokevirtual 65	android/os/Parcel:recycle	()V
        //   95: aload_1
        //   96: athrow
        // Local variable table:
        //   start	length	slot	name	signature
        //   0	97	0	this	zza
        //   0	97	1	paramZzjd	zzjd
        //   0	97	2	paramString1	String
        //   0	97	3	paramString2	String
        //   3	88	4	localParcel1	Parcel
        //   8	78	5	localParcel2	Parcel
        // Exception table:
        //   from	to	target	type
        //   10	17	84	finally
        //   21	28	84	finally
        //   28	68	84	finally
      }
      
      /* Error */
      public void zza(zzjd paramZzjd, String paramString, UsageInfo[] paramArrayOfUsageInfo)
        throws RemoteException
      {
        // Byte code:
        //   0: invokestatic 30	android/os/Parcel:obtain	()Landroid/os/Parcel;
        //   3: astore 4
        //   5: invokestatic 30	android/os/Parcel:obtain	()Landroid/os/Parcel;
        //   8: astore 5
        //   10: aload 4
        //   12: ldc 32
        //   14: invokevirtual 36	android/os/Parcel:writeInterfaceToken	(Ljava/lang/String;)V
        //   17: aload_1
        //   18: ifnull +61 -> 79
        //   21: aload_1
        //   22: invokeinterface 50 1 0
        //   27: astore_1
        //   28: aload 4
        //   30: aload_1
        //   31: invokevirtual 53	android/os/Parcel:writeStrongBinder	(Landroid/os/IBinder;)V
        //   34: aload 4
        //   36: aload_2
        //   37: invokevirtual 71	android/os/Parcel:writeString	(Ljava/lang/String;)V
        //   40: aload 4
        //   42: aload_3
        //   43: iconst_0
        //   44: invokevirtual 76	android/os/Parcel:writeTypedArray	([Landroid/os/Parcelable;I)V
        //   47: aload_0
        //   48: getfield 18	com/google/android/gms/internal/zzjc$zza$zza:zznI	Landroid/os/IBinder;
        //   51: iconst_1
        //   52: aload 4
        //   54: aload 5
        //   56: iconst_0
        //   57: invokeinterface 59 5 0
        //   62: pop
        //   63: aload 5
        //   65: invokevirtual 62	android/os/Parcel:readException	()V
        //   68: aload 5
        //   70: invokevirtual 65	android/os/Parcel:recycle	()V
        //   73: aload 4
        //   75: invokevirtual 65	android/os/Parcel:recycle	()V
        //   78: return
        //   79: aconst_null
        //   80: astore_1
        //   81: goto -53 -> 28
        //   84: astore_1
        //   85: aload 5
        //   87: invokevirtual 65	android/os/Parcel:recycle	()V
        //   90: aload 4
        //   92: invokevirtual 65	android/os/Parcel:recycle	()V
        //   95: aload_1
        //   96: athrow
        // Local variable table:
        //   start	length	slot	name	signature
        //   0	97	0	this	zza
        //   0	97	1	paramZzjd	zzjd
        //   0	97	2	paramString	String
        //   0	97	3	paramArrayOfUsageInfo	UsageInfo[]
        //   3	88	4	localParcel1	Parcel
        //   8	78	5	localParcel2	Parcel
        // Exception table:
        //   from	to	target	type
        //   10	17	84	finally
        //   21	28	84	finally
        //   28	68	84	finally
      }
      
      /* Error */
      public void zza(zzjd paramZzjd, boolean paramBoolean)
        throws RemoteException
      {
        // Byte code:
        //   0: iconst_0
        //   1: istore_3
        //   2: invokestatic 30	android/os/Parcel:obtain	()Landroid/os/Parcel;
        //   5: astore 4
        //   7: invokestatic 30	android/os/Parcel:obtain	()Landroid/os/Parcel;
        //   10: astore 5
        //   12: aload 4
        //   14: ldc 32
        //   16: invokevirtual 36	android/os/Parcel:writeInterfaceToken	(Ljava/lang/String;)V
        //   19: aload_1
        //   20: ifnull +60 -> 80
        //   23: aload_1
        //   24: invokeinterface 50 1 0
        //   29: astore_1
        //   30: aload 4
        //   32: aload_1
        //   33: invokevirtual 53	android/os/Parcel:writeStrongBinder	(Landroid/os/IBinder;)V
        //   36: iload_2
        //   37: ifeq +5 -> 42
        //   40: iconst_1
        //   41: istore_3
        //   42: aload 4
        //   44: iload_3
        //   45: invokevirtual 40	android/os/Parcel:writeInt	(I)V
        //   48: aload_0
        //   49: getfield 18	com/google/android/gms/internal/zzjc$zza$zza:zznI	Landroid/os/IBinder;
        //   52: iconst_4
        //   53: aload 4
        //   55: aload 5
        //   57: iconst_0
        //   58: invokeinterface 59 5 0
        //   63: pop
        //   64: aload 5
        //   66: invokevirtual 62	android/os/Parcel:readException	()V
        //   69: aload 5
        //   71: invokevirtual 65	android/os/Parcel:recycle	()V
        //   74: aload 4
        //   76: invokevirtual 65	android/os/Parcel:recycle	()V
        //   79: return
        //   80: aconst_null
        //   81: astore_1
        //   82: goto -52 -> 30
        //   85: astore_1
        //   86: aload 5
        //   88: invokevirtual 65	android/os/Parcel:recycle	()V
        //   91: aload 4
        //   93: invokevirtual 65	android/os/Parcel:recycle	()V
        //   96: aload_1
        //   97: athrow
        // Local variable table:
        //   start	length	slot	name	signature
        //   0	98	0	this	zza
        //   0	98	1	paramZzjd	zzjd
        //   0	98	2	paramBoolean	boolean
        //   1	44	3	i	int
        //   5	87	4	localParcel1	Parcel
        //   10	77	5	localParcel2	Parcel
        // Exception table:
        //   from	to	target	type
        //   12	19	85	finally
        //   23	30	85	finally
        //   30	36	85	finally
        //   42	69	85	finally
      }
      
      /* Error */
      public void zzb(zzjd paramZzjd)
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
        //   19: invokeinterface 50 1 0
        //   24: astore_1
        //   25: aload_2
        //   26: aload_1
        //   27: invokevirtual 53	android/os/Parcel:writeStrongBinder	(Landroid/os/IBinder;)V
        //   30: aload_0
        //   31: getfield 18	com/google/android/gms/internal/zzjc$zza$zza:zznI	Landroid/os/IBinder;
        //   34: iconst_3
        //   35: aload_2
        //   36: aload_3
        //   37: iconst_0
        //   38: invokeinterface 59 5 0
        //   43: pop
        //   44: aload_3
        //   45: invokevirtual 62	android/os/Parcel:readException	()V
        //   48: aload_3
        //   49: invokevirtual 65	android/os/Parcel:recycle	()V
        //   52: aload_2
        //   53: invokevirtual 65	android/os/Parcel:recycle	()V
        //   56: return
        //   57: aconst_null
        //   58: astore_1
        //   59: goto -34 -> 25
        //   62: astore_1
        //   63: aload_3
        //   64: invokevirtual 65	android/os/Parcel:recycle	()V
        //   67: aload_2
        //   68: invokevirtual 65	android/os/Parcel:recycle	()V
        //   71: aload_1
        //   72: athrow
        // Local variable table:
        //   start	length	slot	name	signature
        //   0	73	0	this	zza
        //   0	73	1	paramZzjd	zzjd
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
