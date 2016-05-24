package com.google.android.gms.ads.internal.request;

import android.os.Parcel;
import android.os.ParcelFileDescriptor;
import android.os.ParcelFileDescriptor.AutoCloseOutputStream;
import android.os.Parcelable;
import android.os.Parcelable.Creator;
import com.google.android.gms.ads.internal.util.client.zzb;
import com.google.android.gms.ads.internal.zzp;
import com.google.android.gms.common.internal.safeparcel.SafeParcelable;
import com.google.android.gms.internal.zzhl;
import com.google.android.gms.internal.zzlr;
import java.io.DataOutputStream;
import java.io.IOException;
import java.io.OutputStream;

public final class LargeParcelTeleporter
  implements SafeParcelable
{
  public static final Parcelable.Creator<LargeParcelTeleporter> CREATOR = new zzl();
  final int mVersionCode;
  ParcelFileDescriptor zzEo;
  private Parcelable zzEp;
  private boolean zzEq;
  
  LargeParcelTeleporter(int paramInt, ParcelFileDescriptor paramParcelFileDescriptor)
  {
    mVersionCode = paramInt;
    zzEo = paramParcelFileDescriptor;
    zzEp = null;
    zzEq = true;
  }
  
  public LargeParcelTeleporter(SafeParcelable paramSafeParcelable)
  {
    mVersionCode = 1;
    zzEo = null;
    zzEp = paramSafeParcelable;
    zzEq = false;
  }
  
  public int describeContents()
  {
    return 0;
  }
  
  public void writeToParcel(Parcel paramParcel, int paramInt)
  {
    Parcel localParcel;
    if (zzEo == null) {
      localParcel = Parcel.obtain();
    }
    try
    {
      zzEp.writeToParcel(localParcel, 0);
      byte[] arrayOfByte = localParcel.marshall();
      localParcel.recycle();
      zzEo = zzf(arrayOfByte);
      zzl.zza(this, paramParcel, paramInt);
      return;
    }
    finally
    {
      localParcel.recycle();
    }
  }
  
  /* Error */
  public <T extends SafeParcelable> T zza(Parcelable.Creator<T> paramCreator)
  {
    // Byte code:
    //   0: aload_0
    //   1: getfield 39	com/google/android/gms/ads/internal/request/LargeParcelTeleporter:zzEq	Z
    //   4: ifeq +95 -> 99
    //   7: aload_0
    //   8: getfield 35	com/google/android/gms/ads/internal/request/LargeParcelTeleporter:zzEo	Landroid/os/ParcelFileDescriptor;
    //   11: ifnonnull +10 -> 21
    //   14: ldc 74
    //   16: invokestatic 80	com/google/android/gms/ads/internal/util/client/zzb:e	(Ljava/lang/String;)V
    //   19: aconst_null
    //   20: areturn
    //   21: new 82	java/io/DataInputStream
    //   24: dup
    //   25: new 84	android/os/ParcelFileDescriptor$AutoCloseInputStream
    //   28: dup
    //   29: aload_0
    //   30: getfield 35	com/google/android/gms/ads/internal/request/LargeParcelTeleporter:zzEo	Landroid/os/ParcelFileDescriptor;
    //   33: invokespecial 87	android/os/ParcelFileDescriptor$AutoCloseInputStream:<init>	(Landroid/os/ParcelFileDescriptor;)V
    //   36: invokespecial 90	java/io/DataInputStream:<init>	(Ljava/io/InputStream;)V
    //   39: astore_2
    //   40: aload_2
    //   41: invokevirtual 93	java/io/DataInputStream:readInt	()I
    //   44: newarray byte
    //   46: astore_3
    //   47: aload_2
    //   48: aload_3
    //   49: iconst_0
    //   50: aload_3
    //   51: arraylength
    //   52: invokevirtual 97	java/io/DataInputStream:readFully	([BII)V
    //   55: aload_2
    //   56: invokestatic 103	com/google/android/gms/internal/zzlr:zzb	(Ljava/io/Closeable;)V
    //   59: invokestatic 50	android/os/Parcel:obtain	()Landroid/os/Parcel;
    //   62: astore_2
    //   63: aload_2
    //   64: aload_3
    //   65: iconst_0
    //   66: aload_3
    //   67: arraylength
    //   68: invokevirtual 106	android/os/Parcel:unmarshall	([BII)V
    //   71: aload_2
    //   72: iconst_0
    //   73: invokevirtual 110	android/os/Parcel:setDataPosition	(I)V
    //   76: aload_0
    //   77: aload_1
    //   78: aload_2
    //   79: invokeinterface 116 2 0
    //   84: checkcast 6	com/google/android/gms/common/internal/safeparcel/SafeParcelable
    //   87: putfield 37	com/google/android/gms/ads/internal/request/LargeParcelTeleporter:zzEp	Landroid/os/Parcelable;
    //   90: aload_2
    //   91: invokevirtual 61	android/os/Parcel:recycle	()V
    //   94: aload_0
    //   95: iconst_0
    //   96: putfield 39	com/google/android/gms/ads/internal/request/LargeParcelTeleporter:zzEq	Z
    //   99: aload_0
    //   100: getfield 37	com/google/android/gms/ads/internal/request/LargeParcelTeleporter:zzEp	Landroid/os/Parcelable;
    //   103: checkcast 6	com/google/android/gms/common/internal/safeparcel/SafeParcelable
    //   106: areturn
    //   107: astore_1
    //   108: new 118	java/lang/IllegalStateException
    //   111: dup
    //   112: ldc 120
    //   114: aload_1
    //   115: invokespecial 123	java/lang/IllegalStateException:<init>	(Ljava/lang/String;Ljava/lang/Throwable;)V
    //   118: athrow
    //   119: astore_1
    //   120: aload_2
    //   121: invokestatic 103	com/google/android/gms/internal/zzlr:zzb	(Ljava/io/Closeable;)V
    //   124: aload_1
    //   125: athrow
    //   126: astore_1
    //   127: aload_2
    //   128: invokevirtual 61	android/os/Parcel:recycle	()V
    //   131: aload_1
    //   132: athrow
    // Local variable table:
    //   start	length	slot	name	signature
    //   0	133	0	this	LargeParcelTeleporter
    //   0	133	1	paramCreator	Parcelable.Creator<T>
    //   39	89	2	localObject	Object
    //   46	21	3	arrayOfByte	byte[]
    // Exception table:
    //   from	to	target	type
    //   40	55	107	java/io/IOException
    //   40	55	119	finally
    //   108	119	119	finally
    //   63	90	126	finally
  }
  
  protected <T> ParcelFileDescriptor zzf(final byte[] paramArrayOfByte)
  {
    try
    {
      ParcelFileDescriptor[] arrayOfParcelFileDescriptor = ParcelFileDescriptor.createPipe();
      new Thread(new Runnable()
      {
        public void run()
        {
          DataOutputStream localDataOutputStream = new DataOutputStream(zzEr);
          try
          {
            localDataOutputStream.writeInt(paramArrayOfByte.length);
            localDataOutputStream.write(paramArrayOfByte);
            return;
          }
          catch (IOException localIOException)
          {
            zzb.zzb("Error transporting the ad response", localIOException);
            zzp.zzbA().zzc(localIOException, true);
            return;
          }
          finally
          {
            zzlr.zzb(localDataOutputStream);
          }
        }
      }).start();
      paramArrayOfByte = arrayOfParcelFileDescriptor[0];
      return paramArrayOfByte;
    }
    catch (IOException paramArrayOfByte)
    {
      zzb.zzb("Error transporting the ad response", paramArrayOfByte);
      zzp.zzbA().zzc(paramArrayOfByte, true);
    }
    return null;
  }
}
