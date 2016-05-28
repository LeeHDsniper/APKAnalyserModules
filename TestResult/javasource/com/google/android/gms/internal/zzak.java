package com.google.android.gms.internal;

import android.content.Context;
import android.content.res.Resources;
import android.util.DisplayMetrics;
import android.view.MotionEvent;
import java.io.IOException;
import java.io.UnsupportedEncodingException;
import java.nio.ByteBuffer;
import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;
import java.security.SecureRandom;
import java.util.UUID;

public abstract class zzak
  implements zzaj
{
  protected MotionEvent zzmU;
  protected DisplayMetrics zzmV;
  protected zzap zzmW;
  private zzaq zzmX;
  
  protected zzak(Context paramContext, zzap paramZzap, zzaq paramZzaq)
  {
    zzmW = paramZzap;
    zzmX = paramZzaq;
    try
    {
      zzmV = paramContext.getResources().getDisplayMetrics();
      return;
    }
    catch (UnsupportedOperationException paramContext)
    {
      zzmV = new DisplayMetrics();
      zzmV.density = 1.0F;
    }
  }
  
  private void zzS()
  {
    zzmX.reset();
  }
  
  private byte[] zzT()
    throws IOException
  {
    return zzmX.zzac();
  }
  
  /* Error */
  private String zza(Context paramContext, String paramString, boolean paramBoolean)
  {
    // Byte code:
    //   0: aload_0
    //   1: monitorenter
    //   2: aload_0
    //   3: invokespecial 69	com/google/android/gms/internal/zzak:zzS	()V
    //   6: iload_3
    //   7: ifeq +27 -> 34
    //   10: aload_0
    //   11: aload_1
    //   12: invokevirtual 73	com/google/android/gms/internal/zzak:zzd	(Landroid/content/Context;)V
    //   15: aload_0
    //   16: invokespecial 75	com/google/android/gms/internal/zzak:zzT	()[B
    //   19: astore_1
    //   20: aload_0
    //   21: monitorexit
    //   22: aload_1
    //   23: arraylength
    //   24: ifne +30 -> 54
    //   27: iconst_5
    //   28: invokestatic 81	java/lang/Integer:toString	(I)Ljava/lang/String;
    //   31: astore_1
    //   32: aload_1
    //   33: areturn
    //   34: aload_0
    //   35: aload_1
    //   36: invokevirtual 84	com/google/android/gms/internal/zzak:zzc	(Landroid/content/Context;)V
    //   39: goto -24 -> 15
    //   42: astore_1
    //   43: aload_0
    //   44: monitorexit
    //   45: aload_1
    //   46: athrow
    //   47: astore_1
    //   48: bipush 7
    //   50: invokestatic 81	java/lang/Integer:toString	(I)Ljava/lang/String;
    //   53: areturn
    //   54: aload_0
    //   55: aload_1
    //   56: aload_2
    //   57: invokevirtual 87	com/google/android/gms/internal/zzak:zza	([BLjava/lang/String;)Ljava/lang/String;
    //   60: astore_1
    //   61: aload_1
    //   62: areturn
    //   63: astore_1
    //   64: bipush 7
    //   66: invokestatic 81	java/lang/Integer:toString	(I)Ljava/lang/String;
    //   69: areturn
    //   70: astore_1
    //   71: iconst_3
    //   72: invokestatic 81	java/lang/Integer:toString	(I)Ljava/lang/String;
    //   75: areturn
    // Local variable table:
    //   start	length	slot	name	signature
    //   0	76	0	this	zzak
    //   0	76	1	paramContext	Context
    //   0	76	2	paramString	String
    //   0	76	3	paramBoolean	boolean
    // Exception table:
    //   from	to	target	type
    //   2	6	42	finally
    //   10	15	42	finally
    //   15	22	42	finally
    //   34	39	42	finally
    //   43	45	42	finally
    //   0	2	47	java/security/NoSuchAlgorithmException
    //   22	32	47	java/security/NoSuchAlgorithmException
    //   45	47	47	java/security/NoSuchAlgorithmException
    //   54	61	47	java/security/NoSuchAlgorithmException
    //   0	2	63	java/io/UnsupportedEncodingException
    //   22	32	63	java/io/UnsupportedEncodingException
    //   45	47	63	java/io/UnsupportedEncodingException
    //   54	61	63	java/io/UnsupportedEncodingException
    //   0	2	70	java/io/IOException
    //   22	32	70	java/io/IOException
    //   45	47	70	java/io/IOException
    //   54	61	70	java/io/IOException
  }
  
  String zza(byte[] paramArrayOfByte, String paramString)
    throws NoSuchAlgorithmException, UnsupportedEncodingException, IOException
  {
    Object localObject = paramArrayOfByte;
    if (paramArrayOfByte.length > 239)
    {
      zzS();
      zza(20, 1L);
      localObject = zzT();
    }
    if (localObject.length < 239)
    {
      paramArrayOfByte = new byte[239 - localObject.length];
      new SecureRandom().nextBytes(paramArrayOfByte);
    }
    for (paramArrayOfByte = ByteBuffer.allocate(240).put((byte)localObject.length).put((byte[])localObject).put(paramArrayOfByte).array();; paramArrayOfByte = ByteBuffer.allocate(240).put((byte)localObject.length).put((byte[])localObject).array())
    {
      localObject = MessageDigest.getInstance("MD5");
      ((MessageDigest)localObject).update(paramArrayOfByte);
      localObject = ((MessageDigest)localObject).digest();
      paramArrayOfByte = ByteBuffer.allocate(256).put((byte[])localObject).put(paramArrayOfByte).array();
      localObject = new byte['Ā'];
      new zzai().zzb(paramArrayOfByte, (byte[])localObject);
      if ((paramString != null) && (paramString.length() > 0)) {
        zza(paramString, (byte[])localObject);
      }
      return zzmW.zza((byte[])localObject, true);
    }
  }
  
  public void zza(int paramInt1, int paramInt2, int paramInt3)
  {
    if (zzmU != null) {
      zzmU.recycle();
    }
    zzmU = MotionEvent.obtain(0L, paramInt3, 1, paramInt1 * zzmV.density, paramInt2 * zzmV.density, 0.0F, 0.0F, 0, 0.0F, 0.0F, 0, 0);
  }
  
  protected void zza(int paramInt, long paramLong)
    throws IOException
  {
    zzmX.zzb(paramInt, paramLong);
  }
  
  protected void zza(int paramInt, String paramString)
    throws IOException
  {
    zzmX.zzb(paramInt, paramString);
  }
  
  public void zza(MotionEvent paramMotionEvent)
  {
    if (paramMotionEvent.getAction() == 1)
    {
      if (zzmU != null) {
        zzmU.recycle();
      }
      zzmU = MotionEvent.obtain(paramMotionEvent);
    }
  }
  
  void zza(String paramString, byte[] paramArrayOfByte)
    throws UnsupportedEncodingException
  {
    String str = paramString;
    if (paramString.length() > 32) {
      str = paramString.substring(0, 32);
    }
    new zzro(str.getBytes("UTF-8")).zzy(paramArrayOfByte);
  }
  
  public String zzb(Context paramContext)
  {
    return zza(paramContext, null, false);
  }
  
  public String zzb(Context paramContext, String paramString)
  {
    return zza(paramContext, paramString, true);
  }
  
  protected abstract void zzc(Context paramContext);
  
  protected abstract void zzd(Context paramContext);
  
  protected String zzk(String paramString)
  {
    Object localObject = paramString;
    if (paramString != null)
    {
      localObject = paramString;
      if (paramString.matches("^[a-fA-F0-9]{8}-([a-fA-F0-9]{4}-){3}[a-fA-F0-9]{12}$"))
      {
        paramString = UUID.fromString(paramString);
        localObject = new byte[16];
        ByteBuffer localByteBuffer = ByteBuffer.wrap((byte[])localObject);
        localByteBuffer.putLong(paramString.getMostSignificantBits());
        localByteBuffer.putLong(paramString.getLeastSignificantBits());
        localObject = zzmW.zza((byte[])localObject, true);
      }
    }
    return localObject;
  }
}
