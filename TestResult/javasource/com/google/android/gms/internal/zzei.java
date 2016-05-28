package com.google.android.gms.internal;

import android.os.Binder;
import android.os.IBinder;
import android.os.IInterface;
import android.os.Parcel;
import android.os.RemoteException;
import com.google.android.gms.ads.internal.client.AdRequestParcel;
import com.google.android.gms.ads.internal.client.AdSizeParcel;
import com.google.android.gms.ads.internal.client.zzf;
import com.google.android.gms.ads.internal.client.zzh;
import com.google.android.gms.ads.internal.formats.NativeAdOptionsParcel;
import com.google.android.gms.ads.internal.formats.zzi;
import com.google.android.gms.ads.internal.reward.mediation.client.zza;
import com.google.android.gms.ads.internal.reward.mediation.client.zza.zza;
import com.google.android.gms.dynamic.zzd;
import com.google.android.gms.dynamic.zzd.zza;
import java.util.List;

public abstract interface zzei
  extends IInterface
{
  public abstract void destroy()
    throws RemoteException;
  
  public abstract zzd getView()
    throws RemoteException;
  
  public abstract boolean isInitialized()
    throws RemoteException;
  
  public abstract void pause()
    throws RemoteException;
  
  public abstract void resume()
    throws RemoteException;
  
  public abstract void showInterstitial()
    throws RemoteException;
  
  public abstract void showVideo()
    throws RemoteException;
  
  public abstract void zza(AdRequestParcel paramAdRequestParcel, String paramString)
    throws RemoteException;
  
  public abstract void zza(zzd paramZzd, AdRequestParcel paramAdRequestParcel, String paramString1, zza paramZza, String paramString2)
    throws RemoteException;
  
  public abstract void zza(zzd paramZzd, AdRequestParcel paramAdRequestParcel, String paramString, zzej paramZzej)
    throws RemoteException;
  
  public abstract void zza(zzd paramZzd, AdRequestParcel paramAdRequestParcel, String paramString1, String paramString2, zzej paramZzej)
    throws RemoteException;
  
  public abstract void zza(zzd paramZzd, AdRequestParcel paramAdRequestParcel, String paramString1, String paramString2, zzej paramZzej, NativeAdOptionsParcel paramNativeAdOptionsParcel, List<String> paramList)
    throws RemoteException;
  
  public abstract void zza(zzd paramZzd, AdSizeParcel paramAdSizeParcel, AdRequestParcel paramAdRequestParcel, String paramString, zzej paramZzej)
    throws RemoteException;
  
  public abstract void zza(zzd paramZzd, AdSizeParcel paramAdSizeParcel, AdRequestParcel paramAdRequestParcel, String paramString1, String paramString2, zzej paramZzej)
    throws RemoteException;
  
  public abstract zzek zzdS()
    throws RemoteException;
  
  public abstract zzel zzdT()
    throws RemoteException;
  
  public static abstract class zza
    extends Binder
    implements zzei
  {
    public zza()
    {
      attachInterface(this, "com.google.android.gms.ads.internal.mediation.client.IMediationAdapter");
    }
    
    public static zzei zzF(IBinder paramIBinder)
    {
      if (paramIBinder == null) {
        return null;
      }
      IInterface localIInterface = paramIBinder.queryLocalInterface("com.google.android.gms.ads.internal.mediation.client.IMediationAdapter");
      if ((localIInterface != null) && ((localIInterface instanceof zzei))) {
        return (zzei)localIInterface;
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
      Object localObject2 = null;
      String str2 = null;
      zzd localZzd = null;
      String str1 = null;
      Object localObject1 = null;
      switch (paramInt1)
      {
      default: 
        return super.onTransact(paramInt1, paramParcel1, paramParcel2, paramInt2);
      case 1598968902: 
        paramParcel2.writeString("com.google.android.gms.ads.internal.mediation.client.IMediationAdapter");
        return true;
      case 1: 
        paramParcel1.enforceInterface("com.google.android.gms.ads.internal.mediation.client.IMediationAdapter");
        localZzd = zzd.zza.zzbk(paramParcel1.readStrongBinder());
        if (paramParcel1.readInt() != 0)
        {
          localObject1 = AdSizeParcel.CREATOR.zzc(paramParcel1);
          if (paramParcel1.readInt() == 0) {
            break label262;
          }
        }
        for (localObject2 = AdRequestParcel.CREATOR.zzb(paramParcel1);; localObject2 = null)
        {
          zza(localZzd, (AdSizeParcel)localObject1, (AdRequestParcel)localObject2, paramParcel1.readString(), zzej.zza.zzG(paramParcel1.readStrongBinder()));
          paramParcel2.writeNoException();
          return true;
          localObject1 = null;
          break;
        }
      case 2: 
        paramParcel1.enforceInterface("com.google.android.gms.ads.internal.mediation.client.IMediationAdapter");
        localObject2 = getView();
        paramParcel2.writeNoException();
        paramParcel1 = (Parcel)localObject1;
        if (localObject2 != null) {
          paramParcel1 = ((zzd)localObject2).asBinder();
        }
        paramParcel2.writeStrongBinder(paramParcel1);
        return true;
      case 3: 
        paramParcel1.enforceInterface("com.google.android.gms.ads.internal.mediation.client.IMediationAdapter");
        localZzd = zzd.zza.zzbk(paramParcel1.readStrongBinder());
        localObject1 = localObject2;
        if (paramParcel1.readInt() != 0) {
          localObject1 = AdRequestParcel.CREATOR.zzb(paramParcel1);
        }
        zza(localZzd, (AdRequestParcel)localObject1, paramParcel1.readString(), zzej.zza.zzG(paramParcel1.readStrongBinder()));
        paramParcel2.writeNoException();
        return true;
      case 4: 
        paramParcel1.enforceInterface("com.google.android.gms.ads.internal.mediation.client.IMediationAdapter");
        showInterstitial();
        paramParcel2.writeNoException();
        return true;
      case 5: 
        paramParcel1.enforceInterface("com.google.android.gms.ads.internal.mediation.client.IMediationAdapter");
        destroy();
        paramParcel2.writeNoException();
        return true;
      case 6: 
        paramParcel1.enforceInterface("com.google.android.gms.ads.internal.mediation.client.IMediationAdapter");
        localZzd = zzd.zza.zzbk(paramParcel1.readStrongBinder());
        if (paramParcel1.readInt() != 0)
        {
          localObject1 = AdSizeParcel.CREATOR.zzc(paramParcel1);
          if (paramParcel1.readInt() == 0) {
            break label483;
          }
        }
        for (localObject2 = AdRequestParcel.CREATOR.zzb(paramParcel1);; localObject2 = null)
        {
          zza(localZzd, (AdSizeParcel)localObject1, (AdRequestParcel)localObject2, paramParcel1.readString(), paramParcel1.readString(), zzej.zza.zzG(paramParcel1.readStrongBinder()));
          paramParcel2.writeNoException();
          return true;
          localObject1 = null;
          break;
        }
      case 7: 
        paramParcel1.enforceInterface("com.google.android.gms.ads.internal.mediation.client.IMediationAdapter");
        localObject2 = zzd.zza.zzbk(paramParcel1.readStrongBinder());
        if (paramParcel1.readInt() != 0) {}
        for (localObject1 = AdRequestParcel.CREATOR.zzb(paramParcel1);; localObject1 = null)
        {
          zza((zzd)localObject2, (AdRequestParcel)localObject1, paramParcel1.readString(), paramParcel1.readString(), zzej.zza.zzG(paramParcel1.readStrongBinder()));
          paramParcel2.writeNoException();
          return true;
        }
      case 8: 
        paramParcel1.enforceInterface("com.google.android.gms.ads.internal.mediation.client.IMediationAdapter");
        pause();
        paramParcel2.writeNoException();
        return true;
      case 9: 
        paramParcel1.enforceInterface("com.google.android.gms.ads.internal.mediation.client.IMediationAdapter");
        resume();
        paramParcel2.writeNoException();
        return true;
      case 10: 
        paramParcel1.enforceInterface("com.google.android.gms.ads.internal.mediation.client.IMediationAdapter");
        localObject2 = zzd.zza.zzbk(paramParcel1.readStrongBinder());
        if (paramParcel1.readInt() != 0) {}
        for (localObject1 = AdRequestParcel.CREATOR.zzb(paramParcel1);; localObject1 = null)
        {
          zza((zzd)localObject2, (AdRequestParcel)localObject1, paramParcel1.readString(), zza.zza.zzad(paramParcel1.readStrongBinder()), paramParcel1.readString());
          paramParcel2.writeNoException();
          return true;
        }
      case 11: 
        paramParcel1.enforceInterface("com.google.android.gms.ads.internal.mediation.client.IMediationAdapter");
        localObject1 = str2;
        if (paramParcel1.readInt() != 0) {
          localObject1 = AdRequestParcel.CREATOR.zzb(paramParcel1);
        }
        zza((AdRequestParcel)localObject1, paramParcel1.readString());
        paramParcel2.writeNoException();
        return true;
      case 12: 
        paramParcel1.enforceInterface("com.google.android.gms.ads.internal.mediation.client.IMediationAdapter");
        showVideo();
        paramParcel2.writeNoException();
        return true;
      case 13: 
        paramParcel1.enforceInterface("com.google.android.gms.ads.internal.mediation.client.IMediationAdapter");
        boolean bool = isInitialized();
        paramParcel2.writeNoException();
        if (bool) {}
        for (paramInt1 = 1;; paramInt1 = 0)
        {
          paramParcel2.writeInt(paramInt1);
          return true;
        }
      case 14: 
        paramParcel1.enforceInterface("com.google.android.gms.ads.internal.mediation.client.IMediationAdapter");
        localZzd = zzd.zza.zzbk(paramParcel1.readStrongBinder());
        zzej localZzej;
        if (paramParcel1.readInt() != 0)
        {
          localObject1 = AdRequestParcel.CREATOR.zzb(paramParcel1);
          str1 = paramParcel1.readString();
          str2 = paramParcel1.readString();
          localZzej = zzej.zza.zzG(paramParcel1.readStrongBinder());
          if (paramParcel1.readInt() == 0) {
            break label846;
          }
        }
        for (localObject2 = NativeAdOptionsParcel.CREATOR.zzf(paramParcel1);; localObject2 = null)
        {
          zza(localZzd, (AdRequestParcel)localObject1, str1, str2, localZzej, (NativeAdOptionsParcel)localObject2, paramParcel1.createStringArrayList());
          paramParcel2.writeNoException();
          return true;
          localObject1 = null;
          break;
        }
      case 15: 
        label262:
        label483:
        label846:
        paramParcel1.enforceInterface("com.google.android.gms.ads.internal.mediation.client.IMediationAdapter");
        localObject1 = zzdS();
        paramParcel2.writeNoException();
        paramParcel1 = localZzd;
        if (localObject1 != null) {
          paramParcel1 = ((zzek)localObject1).asBinder();
        }
        paramParcel2.writeStrongBinder(paramParcel1);
        return true;
      }
      paramParcel1.enforceInterface("com.google.android.gms.ads.internal.mediation.client.IMediationAdapter");
      localObject1 = zzdT();
      paramParcel2.writeNoException();
      paramParcel1 = str1;
      if (localObject1 != null) {
        paramParcel1 = ((zzel)localObject1).asBinder();
      }
      paramParcel2.writeStrongBinder(paramParcel1);
      return true;
    }
    
    private static class zza
      implements zzei
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
      
      public void destroy()
        throws RemoteException
      {
        Parcel localParcel1 = Parcel.obtain();
        Parcel localParcel2 = Parcel.obtain();
        try
        {
          localParcel1.writeInterfaceToken("com.google.android.gms.ads.internal.mediation.client.IMediationAdapter");
          zznI.transact(5, localParcel1, localParcel2, 0);
          localParcel2.readException();
          return;
        }
        finally
        {
          localParcel2.recycle();
          localParcel1.recycle();
        }
      }
      
      public zzd getView()
        throws RemoteException
      {
        Parcel localParcel1 = Parcel.obtain();
        Parcel localParcel2 = Parcel.obtain();
        try
        {
          localParcel1.writeInterfaceToken("com.google.android.gms.ads.internal.mediation.client.IMediationAdapter");
          zznI.transact(2, localParcel1, localParcel2, 0);
          localParcel2.readException();
          zzd localZzd = zzd.zza.zzbk(localParcel2.readStrongBinder());
          return localZzd;
        }
        finally
        {
          localParcel2.recycle();
          localParcel1.recycle();
        }
      }
      
      public boolean isInitialized()
        throws RemoteException
      {
        boolean bool = false;
        Parcel localParcel1 = Parcel.obtain();
        Parcel localParcel2 = Parcel.obtain();
        try
        {
          localParcel1.writeInterfaceToken("com.google.android.gms.ads.internal.mediation.client.IMediationAdapter");
          zznI.transact(13, localParcel1, localParcel2, 0);
          localParcel2.readException();
          int i = localParcel2.readInt();
          if (i != 0) {
            bool = true;
          }
          return bool;
        }
        finally
        {
          localParcel2.recycle();
          localParcel1.recycle();
        }
      }
      
      public void pause()
        throws RemoteException
      {
        Parcel localParcel1 = Parcel.obtain();
        Parcel localParcel2 = Parcel.obtain();
        try
        {
          localParcel1.writeInterfaceToken("com.google.android.gms.ads.internal.mediation.client.IMediationAdapter");
          zznI.transact(8, localParcel1, localParcel2, 0);
          localParcel2.readException();
          return;
        }
        finally
        {
          localParcel2.recycle();
          localParcel1.recycle();
        }
      }
      
      public void resume()
        throws RemoteException
      {
        Parcel localParcel1 = Parcel.obtain();
        Parcel localParcel2 = Parcel.obtain();
        try
        {
          localParcel1.writeInterfaceToken("com.google.android.gms.ads.internal.mediation.client.IMediationAdapter");
          zznI.transact(9, localParcel1, localParcel2, 0);
          localParcel2.readException();
          return;
        }
        finally
        {
          localParcel2.recycle();
          localParcel1.recycle();
        }
      }
      
      public void showInterstitial()
        throws RemoteException
      {
        Parcel localParcel1 = Parcel.obtain();
        Parcel localParcel2 = Parcel.obtain();
        try
        {
          localParcel1.writeInterfaceToken("com.google.android.gms.ads.internal.mediation.client.IMediationAdapter");
          zznI.transact(4, localParcel1, localParcel2, 0);
          localParcel2.readException();
          return;
        }
        finally
        {
          localParcel2.recycle();
          localParcel1.recycle();
        }
      }
      
      public void showVideo()
        throws RemoteException
      {
        Parcel localParcel1 = Parcel.obtain();
        Parcel localParcel2 = Parcel.obtain();
        try
        {
          localParcel1.writeInterfaceToken("com.google.android.gms.ads.internal.mediation.client.IMediationAdapter");
          zznI.transact(12, localParcel1, localParcel2, 0);
          localParcel2.readException();
          return;
        }
        finally
        {
          localParcel2.recycle();
          localParcel1.recycle();
        }
      }
      
      /* Error */
      public void zza(AdRequestParcel paramAdRequestParcel, String paramString)
        throws RemoteException
      {
        // Byte code:
        //   0: invokestatic 30	android/os/Parcel:obtain	()Landroid/os/Parcel;
        //   3: astore_3
        //   4: invokestatic 30	android/os/Parcel:obtain	()Landroid/os/Parcel;
        //   7: astore 4
        //   9: aload_3
        //   10: ldc 32
        //   12: invokevirtual 36	android/os/Parcel:writeInterfaceToken	(Ljava/lang/String;)V
        //   15: aload_1
        //   16: ifnull +50 -> 66
        //   19: aload_3
        //   20: iconst_1
        //   21: invokevirtual 75	android/os/Parcel:writeInt	(I)V
        //   24: aload_1
        //   25: aload_3
        //   26: iconst_0
        //   27: invokevirtual 81	com/google/android/gms/ads/internal/client/AdRequestParcel:writeToParcel	(Landroid/os/Parcel;I)V
        //   30: aload_3
        //   31: aload_2
        //   32: invokevirtual 84	android/os/Parcel:writeString	(Ljava/lang/String;)V
        //   35: aload_0
        //   36: getfield 18	com/google/android/gms/internal/zzei$zza$zza:zznI	Landroid/os/IBinder;
        //   39: bipush 11
        //   41: aload_3
        //   42: aload 4
        //   44: iconst_0
        //   45: invokeinterface 42 5 0
        //   50: pop
        //   51: aload 4
        //   53: invokevirtual 45	android/os/Parcel:readException	()V
        //   56: aload 4
        //   58: invokevirtual 48	android/os/Parcel:recycle	()V
        //   61: aload_3
        //   62: invokevirtual 48	android/os/Parcel:recycle	()V
        //   65: return
        //   66: aload_3
        //   67: iconst_0
        //   68: invokevirtual 75	android/os/Parcel:writeInt	(I)V
        //   71: goto -41 -> 30
        //   74: astore_1
        //   75: aload 4
        //   77: invokevirtual 48	android/os/Parcel:recycle	()V
        //   80: aload_3
        //   81: invokevirtual 48	android/os/Parcel:recycle	()V
        //   84: aload_1
        //   85: athrow
        // Local variable table:
        //   start	length	slot	name	signature
        //   0	86	0	this	zza
        //   0	86	1	paramAdRequestParcel	AdRequestParcel
        //   0	86	2	paramString	String
        //   3	78	3	localParcel1	Parcel
        //   7	69	4	localParcel2	Parcel
        // Exception table:
        //   from	to	target	type
        //   9	15	74	finally
        //   19	30	74	finally
        //   30	56	74	finally
        //   66	71	74	finally
      }
      
      /* Error */
      public void zza(zzd paramZzd, AdRequestParcel paramAdRequestParcel, String paramString1, zza paramZza, String paramString2)
        throws RemoteException
      {
        // Byte code:
        //   0: aconst_null
        //   1: astore 6
        //   3: invokestatic 30	android/os/Parcel:obtain	()Landroid/os/Parcel;
        //   6: astore 7
        //   8: invokestatic 30	android/os/Parcel:obtain	()Landroid/os/Parcel;
        //   11: astore 8
        //   13: aload 7
        //   15: ldc 32
        //   17: invokevirtual 36	android/os/Parcel:writeInterfaceToken	(Ljava/lang/String;)V
        //   20: aload_1
        //   21: ifnull +101 -> 122
        //   24: aload_1
        //   25: invokeinterface 89 1 0
        //   30: astore_1
        //   31: aload 7
        //   33: aload_1
        //   34: invokevirtual 92	android/os/Parcel:writeStrongBinder	(Landroid/os/IBinder;)V
        //   37: aload_2
        //   38: ifnull +89 -> 127
        //   41: aload 7
        //   43: iconst_1
        //   44: invokevirtual 75	android/os/Parcel:writeInt	(I)V
        //   47: aload_2
        //   48: aload 7
        //   50: iconst_0
        //   51: invokevirtual 81	com/google/android/gms/ads/internal/client/AdRequestParcel:writeToParcel	(Landroid/os/Parcel;I)V
        //   54: aload 7
        //   56: aload_3
        //   57: invokevirtual 84	android/os/Parcel:writeString	(Ljava/lang/String;)V
        //   60: aload 6
        //   62: astore_1
        //   63: aload 4
        //   65: ifnull +11 -> 76
        //   68: aload 4
        //   70: invokeinterface 95 1 0
        //   75: astore_1
        //   76: aload 7
        //   78: aload_1
        //   79: invokevirtual 92	android/os/Parcel:writeStrongBinder	(Landroid/os/IBinder;)V
        //   82: aload 7
        //   84: aload 5
        //   86: invokevirtual 84	android/os/Parcel:writeString	(Ljava/lang/String;)V
        //   89: aload_0
        //   90: getfield 18	com/google/android/gms/internal/zzei$zza$zza:zznI	Landroid/os/IBinder;
        //   93: bipush 10
        //   95: aload 7
        //   97: aload 8
        //   99: iconst_0
        //   100: invokeinterface 42 5 0
        //   105: pop
        //   106: aload 8
        //   108: invokevirtual 45	android/os/Parcel:readException	()V
        //   111: aload 8
        //   113: invokevirtual 48	android/os/Parcel:recycle	()V
        //   116: aload 7
        //   118: invokevirtual 48	android/os/Parcel:recycle	()V
        //   121: return
        //   122: aconst_null
        //   123: astore_1
        //   124: goto -93 -> 31
        //   127: aload 7
        //   129: iconst_0
        //   130: invokevirtual 75	android/os/Parcel:writeInt	(I)V
        //   133: goto -79 -> 54
        //   136: astore_1
        //   137: aload 8
        //   139: invokevirtual 48	android/os/Parcel:recycle	()V
        //   142: aload 7
        //   144: invokevirtual 48	android/os/Parcel:recycle	()V
        //   147: aload_1
        //   148: athrow
        // Local variable table:
        //   start	length	slot	name	signature
        //   0	149	0	this	zza
        //   0	149	1	paramZzd	zzd
        //   0	149	2	paramAdRequestParcel	AdRequestParcel
        //   0	149	3	paramString1	String
        //   0	149	4	paramZza	zza
        //   0	149	5	paramString2	String
        //   1	60	6	localObject	Object
        //   6	137	7	localParcel1	Parcel
        //   11	127	8	localParcel2	Parcel
        // Exception table:
        //   from	to	target	type
        //   13	20	136	finally
        //   24	31	136	finally
        //   31	37	136	finally
        //   41	54	136	finally
        //   54	60	136	finally
        //   68	76	136	finally
        //   76	111	136	finally
        //   127	133	136	finally
      }
      
      /* Error */
      public void zza(zzd paramZzd, AdRequestParcel paramAdRequestParcel, String paramString, zzej paramZzej)
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
        //   21: ifnull +93 -> 114
        //   24: aload_1
        //   25: invokeinterface 89 1 0
        //   30: astore_1
        //   31: aload 6
        //   33: aload_1
        //   34: invokevirtual 92	android/os/Parcel:writeStrongBinder	(Landroid/os/IBinder;)V
        //   37: aload_2
        //   38: ifnull +81 -> 119
        //   41: aload 6
        //   43: iconst_1
        //   44: invokevirtual 75	android/os/Parcel:writeInt	(I)V
        //   47: aload_2
        //   48: aload 6
        //   50: iconst_0
        //   51: invokevirtual 81	com/google/android/gms/ads/internal/client/AdRequestParcel:writeToParcel	(Landroid/os/Parcel;I)V
        //   54: aload 6
        //   56: aload_3
        //   57: invokevirtual 84	android/os/Parcel:writeString	(Ljava/lang/String;)V
        //   60: aload 5
        //   62: astore_1
        //   63: aload 4
        //   65: ifnull +11 -> 76
        //   68: aload 4
        //   70: invokeinterface 99 1 0
        //   75: astore_1
        //   76: aload 6
        //   78: aload_1
        //   79: invokevirtual 92	android/os/Parcel:writeStrongBinder	(Landroid/os/IBinder;)V
        //   82: aload_0
        //   83: getfield 18	com/google/android/gms/internal/zzei$zza$zza:zznI	Landroid/os/IBinder;
        //   86: iconst_3
        //   87: aload 6
        //   89: aload 7
        //   91: iconst_0
        //   92: invokeinterface 42 5 0
        //   97: pop
        //   98: aload 7
        //   100: invokevirtual 45	android/os/Parcel:readException	()V
        //   103: aload 7
        //   105: invokevirtual 48	android/os/Parcel:recycle	()V
        //   108: aload 6
        //   110: invokevirtual 48	android/os/Parcel:recycle	()V
        //   113: return
        //   114: aconst_null
        //   115: astore_1
        //   116: goto -85 -> 31
        //   119: aload 6
        //   121: iconst_0
        //   122: invokevirtual 75	android/os/Parcel:writeInt	(I)V
        //   125: goto -71 -> 54
        //   128: astore_1
        //   129: aload 7
        //   131: invokevirtual 48	android/os/Parcel:recycle	()V
        //   134: aload 6
        //   136: invokevirtual 48	android/os/Parcel:recycle	()V
        //   139: aload_1
        //   140: athrow
        // Local variable table:
        //   start	length	slot	name	signature
        //   0	141	0	this	zza
        //   0	141	1	paramZzd	zzd
        //   0	141	2	paramAdRequestParcel	AdRequestParcel
        //   0	141	3	paramString	String
        //   0	141	4	paramZzej	zzej
        //   1	60	5	localObject	Object
        //   6	129	6	localParcel1	Parcel
        //   11	119	7	localParcel2	Parcel
        // Exception table:
        //   from	to	target	type
        //   13	20	128	finally
        //   24	31	128	finally
        //   31	37	128	finally
        //   41	54	128	finally
        //   54	60	128	finally
        //   68	76	128	finally
        //   76	103	128	finally
        //   119	125	128	finally
      }
      
      /* Error */
      public void zza(zzd paramZzd, AdRequestParcel paramAdRequestParcel, String paramString1, String paramString2, zzej paramZzej)
        throws RemoteException
      {
        // Byte code:
        //   0: aconst_null
        //   1: astore 6
        //   3: invokestatic 30	android/os/Parcel:obtain	()Landroid/os/Parcel;
        //   6: astore 7
        //   8: invokestatic 30	android/os/Parcel:obtain	()Landroid/os/Parcel;
        //   11: astore 8
        //   13: aload 7
        //   15: ldc 32
        //   17: invokevirtual 36	android/os/Parcel:writeInterfaceToken	(Ljava/lang/String;)V
        //   20: aload_1
        //   21: ifnull +101 -> 122
        //   24: aload_1
        //   25: invokeinterface 89 1 0
        //   30: astore_1
        //   31: aload 7
        //   33: aload_1
        //   34: invokevirtual 92	android/os/Parcel:writeStrongBinder	(Landroid/os/IBinder;)V
        //   37: aload_2
        //   38: ifnull +89 -> 127
        //   41: aload 7
        //   43: iconst_1
        //   44: invokevirtual 75	android/os/Parcel:writeInt	(I)V
        //   47: aload_2
        //   48: aload 7
        //   50: iconst_0
        //   51: invokevirtual 81	com/google/android/gms/ads/internal/client/AdRequestParcel:writeToParcel	(Landroid/os/Parcel;I)V
        //   54: aload 7
        //   56: aload_3
        //   57: invokevirtual 84	android/os/Parcel:writeString	(Ljava/lang/String;)V
        //   60: aload 7
        //   62: aload 4
        //   64: invokevirtual 84	android/os/Parcel:writeString	(Ljava/lang/String;)V
        //   67: aload 6
        //   69: astore_1
        //   70: aload 5
        //   72: ifnull +11 -> 83
        //   75: aload 5
        //   77: invokeinterface 99 1 0
        //   82: astore_1
        //   83: aload 7
        //   85: aload_1
        //   86: invokevirtual 92	android/os/Parcel:writeStrongBinder	(Landroid/os/IBinder;)V
        //   89: aload_0
        //   90: getfield 18	com/google/android/gms/internal/zzei$zza$zza:zznI	Landroid/os/IBinder;
        //   93: bipush 7
        //   95: aload 7
        //   97: aload 8
        //   99: iconst_0
        //   100: invokeinterface 42 5 0
        //   105: pop
        //   106: aload 8
        //   108: invokevirtual 45	android/os/Parcel:readException	()V
        //   111: aload 8
        //   113: invokevirtual 48	android/os/Parcel:recycle	()V
        //   116: aload 7
        //   118: invokevirtual 48	android/os/Parcel:recycle	()V
        //   121: return
        //   122: aconst_null
        //   123: astore_1
        //   124: goto -93 -> 31
        //   127: aload 7
        //   129: iconst_0
        //   130: invokevirtual 75	android/os/Parcel:writeInt	(I)V
        //   133: goto -79 -> 54
        //   136: astore_1
        //   137: aload 8
        //   139: invokevirtual 48	android/os/Parcel:recycle	()V
        //   142: aload 7
        //   144: invokevirtual 48	android/os/Parcel:recycle	()V
        //   147: aload_1
        //   148: athrow
        // Local variable table:
        //   start	length	slot	name	signature
        //   0	149	0	this	zza
        //   0	149	1	paramZzd	zzd
        //   0	149	2	paramAdRequestParcel	AdRequestParcel
        //   0	149	3	paramString1	String
        //   0	149	4	paramString2	String
        //   0	149	5	paramZzej	zzej
        //   1	67	6	localObject	Object
        //   6	137	7	localParcel1	Parcel
        //   11	127	8	localParcel2	Parcel
        // Exception table:
        //   from	to	target	type
        //   13	20	136	finally
        //   24	31	136	finally
        //   31	37	136	finally
        //   41	54	136	finally
        //   54	67	136	finally
        //   75	83	136	finally
        //   83	111	136	finally
        //   127	133	136	finally
      }
      
      public void zza(zzd paramZzd, AdRequestParcel paramAdRequestParcel, String paramString1, String paramString2, zzej paramZzej, NativeAdOptionsParcel paramNativeAdOptionsParcel, List<String> paramList)
        throws RemoteException
      {
        Object localObject = null;
        Parcel localParcel1 = Parcel.obtain();
        Parcel localParcel2 = Parcel.obtain();
        label175:
        for (;;)
        {
          try
          {
            localParcel1.writeInterfaceToken("com.google.android.gms.ads.internal.mediation.client.IMediationAdapter");
            if (paramZzd != null)
            {
              paramZzd = paramZzd.asBinder();
              localParcel1.writeStrongBinder(paramZzd);
              if (paramAdRequestParcel != null)
              {
                localParcel1.writeInt(1);
                paramAdRequestParcel.writeToParcel(localParcel1, 0);
                localParcel1.writeString(paramString1);
                localParcel1.writeString(paramString2);
                paramZzd = localObject;
                if (paramZzej != null) {
                  paramZzd = paramZzej.asBinder();
                }
                localParcel1.writeStrongBinder(paramZzd);
                if (paramNativeAdOptionsParcel == null) {
                  break label175;
                }
                localParcel1.writeInt(1);
                paramNativeAdOptionsParcel.writeToParcel(localParcel1, 0);
                localParcel1.writeStringList(paramList);
                zznI.transact(14, localParcel1, localParcel2, 0);
                localParcel2.readException();
              }
            }
            else
            {
              paramZzd = null;
              continue;
            }
            localParcel1.writeInt(0);
            continue;
            localParcel1.writeInt(0);
          }
          finally
          {
            localParcel2.recycle();
            localParcel1.recycle();
          }
        }
      }
      
      public void zza(zzd paramZzd, AdSizeParcel paramAdSizeParcel, AdRequestParcel paramAdRequestParcel, String paramString, zzej paramZzej)
        throws RemoteException
      {
        Object localObject = null;
        Parcel localParcel1 = Parcel.obtain();
        Parcel localParcel2 = Parcel.obtain();
        label159:
        for (;;)
        {
          try
          {
            localParcel1.writeInterfaceToken("com.google.android.gms.ads.internal.mediation.client.IMediationAdapter");
            if (paramZzd != null)
            {
              paramZzd = paramZzd.asBinder();
              localParcel1.writeStrongBinder(paramZzd);
              if (paramAdSizeParcel != null)
              {
                localParcel1.writeInt(1);
                paramAdSizeParcel.writeToParcel(localParcel1, 0);
                if (paramAdRequestParcel == null) {
                  break label159;
                }
                localParcel1.writeInt(1);
                paramAdRequestParcel.writeToParcel(localParcel1, 0);
                localParcel1.writeString(paramString);
                paramZzd = localObject;
                if (paramZzej != null) {
                  paramZzd = paramZzej.asBinder();
                }
                localParcel1.writeStrongBinder(paramZzd);
                zznI.transact(1, localParcel1, localParcel2, 0);
                localParcel2.readException();
              }
            }
            else
            {
              paramZzd = null;
              continue;
            }
            localParcel1.writeInt(0);
            continue;
            localParcel1.writeInt(0);
          }
          finally
          {
            localParcel2.recycle();
            localParcel1.recycle();
          }
        }
      }
      
      public void zza(zzd paramZzd, AdSizeParcel paramAdSizeParcel, AdRequestParcel paramAdRequestParcel, String paramString1, String paramString2, zzej paramZzej)
        throws RemoteException
      {
        Object localObject = null;
        Parcel localParcel1 = Parcel.obtain();
        Parcel localParcel2 = Parcel.obtain();
        label167:
        for (;;)
        {
          try
          {
            localParcel1.writeInterfaceToken("com.google.android.gms.ads.internal.mediation.client.IMediationAdapter");
            if (paramZzd != null)
            {
              paramZzd = paramZzd.asBinder();
              localParcel1.writeStrongBinder(paramZzd);
              if (paramAdSizeParcel != null)
              {
                localParcel1.writeInt(1);
                paramAdSizeParcel.writeToParcel(localParcel1, 0);
                if (paramAdRequestParcel == null) {
                  break label167;
                }
                localParcel1.writeInt(1);
                paramAdRequestParcel.writeToParcel(localParcel1, 0);
                localParcel1.writeString(paramString1);
                localParcel1.writeString(paramString2);
                paramZzd = localObject;
                if (paramZzej != null) {
                  paramZzd = paramZzej.asBinder();
                }
                localParcel1.writeStrongBinder(paramZzd);
                zznI.transact(6, localParcel1, localParcel2, 0);
                localParcel2.readException();
              }
            }
            else
            {
              paramZzd = null;
              continue;
            }
            localParcel1.writeInt(0);
            continue;
            localParcel1.writeInt(0);
          }
          finally
          {
            localParcel2.recycle();
            localParcel1.recycle();
          }
        }
      }
      
      public zzek zzdS()
        throws RemoteException
      {
        Parcel localParcel1 = Parcel.obtain();
        Parcel localParcel2 = Parcel.obtain();
        try
        {
          localParcel1.writeInterfaceToken("com.google.android.gms.ads.internal.mediation.client.IMediationAdapter");
          zznI.transact(15, localParcel1, localParcel2, 0);
          localParcel2.readException();
          zzek localZzek = zzek.zza.zzH(localParcel2.readStrongBinder());
          return localZzek;
        }
        finally
        {
          localParcel2.recycle();
          localParcel1.recycle();
        }
      }
      
      public zzel zzdT()
        throws RemoteException
      {
        Parcel localParcel1 = Parcel.obtain();
        Parcel localParcel2 = Parcel.obtain();
        try
        {
          localParcel1.writeInterfaceToken("com.google.android.gms.ads.internal.mediation.client.IMediationAdapter");
          zznI.transact(16, localParcel1, localParcel2, 0);
          localParcel2.readException();
          zzel localZzel = zzel.zza.zzI(localParcel2.readStrongBinder());
          return localZzel;
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
