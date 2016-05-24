package com.google.android.gms.analytics.internal;

import android.content.Context;
import android.text.TextUtils;
import com.google.android.gms.ads.identifier.AdvertisingIdClient;
import com.google.android.gms.ads.identifier.AdvertisingIdClient.Info;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.io.IOException;
import java.math.BigInteger;
import java.security.MessageDigest;
import java.util.Locale;

public class zza
  extends zzd
{
  public static boolean zzLk;
  private AdvertisingIdClient.Info zzLl;
  private final zzaj zzLm;
  private String zzLn;
  private boolean zzLo = false;
  private Object zzLp = new Object();
  
  zza(zzf paramZzf)
  {
    super(paramZzf);
    zzLm = new zzaj(paramZzf.zzid());
  }
  
  private boolean zza(AdvertisingIdClient.Info paramInfo1, AdvertisingIdClient.Info paramInfo2)
  {
    Object localObject1 = null;
    if (paramInfo2 == null) {}
    for (paramInfo2 = null; TextUtils.isEmpty(paramInfo2); paramInfo2 = paramInfo2.getId()) {
      return true;
    }
    String str = zzij().zzjd();
    boolean bool;
    for (;;)
    {
      synchronized (zzLp)
      {
        if (!zzLo)
        {
          zzLn = zzhT();
          zzLo = true;
          paramInfo1 = zzaW(paramInfo2 + str);
          if (!TextUtils.isEmpty(paramInfo1)) {
            break;
          }
          return false;
        }
      }
      if (TextUtils.isEmpty(zzLn))
      {
        if (paramInfo1 == null) {}
        for (paramInfo1 = localObject1; paramInfo1 == null; paramInfo1 = paramInfo1.getId())
        {
          bool = zzaX(paramInfo2 + str);
          return bool;
        }
        zzLn = zzaW(paramInfo1 + str);
      }
    }
    if (paramInfo1.equals(zzLn)) {
      return true;
    }
    if (!TextUtils.isEmpty(zzLn))
    {
      zzaY("Resetting the client id because Advertising Id changed.");
      paramInfo1 = zzij().zzje();
      zza("New client Id", paramInfo1);
    }
    for (;;)
    {
      bool = zzaX(paramInfo2 + paramInfo1);
      return bool;
      paramInfo1 = str;
    }
  }
  
  private static String zzaW(String paramString)
  {
    MessageDigest localMessageDigest = zzam.zzbq("MD5");
    if (localMessageDigest == null) {
      return null;
    }
    return String.format(Locale.US, "%032X", new Object[] { new BigInteger(1, localMessageDigest.digest(paramString.getBytes())) });
  }
  
  private boolean zzaX(String paramString)
  {
    try
    {
      paramString = zzaW(paramString);
      zzaY("Storing hashed adid.");
      FileOutputStream localFileOutputStream = getContext().openFileOutput("gaClientIdData", 0);
      localFileOutputStream.write(paramString.getBytes());
      localFileOutputStream.close();
      zzLn = paramString;
      return true;
    }
    catch (IOException paramString)
    {
      zze("Error creating hash file", paramString);
    }
    return false;
  }
  
  /* Error */
  private AdvertisingIdClient.Info zzhR()
  {
    // Byte code:
    //   0: aload_0
    //   1: monitorenter
    //   2: aload_0
    //   3: getfield 41	com/google/android/gms/analytics/internal/zza:zzLm	Lcom/google/android/gms/analytics/internal/zzaj;
    //   6: ldc2_w 176
    //   9: invokevirtual 181	com/google/android/gms/analytics/internal/zzaj:zzv	(J)Z
    //   12: ifeq +32 -> 44
    //   15: aload_0
    //   16: getfield 41	com/google/android/gms/analytics/internal/zza:zzLm	Lcom/google/android/gms/analytics/internal/zzaj;
    //   19: invokevirtual 184	com/google/android/gms/analytics/internal/zzaj:start	()V
    //   22: aload_0
    //   23: invokevirtual 187	com/google/android/gms/analytics/internal/zza:zzhS	()Lcom/google/android/gms/ads/identifier/AdvertisingIdClient$Info;
    //   26: astore_1
    //   27: aload_0
    //   28: aload_0
    //   29: getfield 189	com/google/android/gms/analytics/internal/zza:zzLl	Lcom/google/android/gms/ads/identifier/AdvertisingIdClient$Info;
    //   32: aload_1
    //   33: invokespecial 191	com/google/android/gms/analytics/internal/zza:zza	(Lcom/google/android/gms/ads/identifier/AdvertisingIdClient$Info;Lcom/google/android/gms/ads/identifier/AdvertisingIdClient$Info;)Z
    //   36: ifeq +17 -> 53
    //   39: aload_0
    //   40: aload_1
    //   41: putfield 189	com/google/android/gms/analytics/internal/zza:zzLl	Lcom/google/android/gms/ads/identifier/AdvertisingIdClient$Info;
    //   44: aload_0
    //   45: getfield 189	com/google/android/gms/analytics/internal/zza:zzLl	Lcom/google/android/gms/ads/identifier/AdvertisingIdClient$Info;
    //   48: astore_1
    //   49: aload_0
    //   50: monitorexit
    //   51: aload_1
    //   52: areturn
    //   53: aload_0
    //   54: ldc -63
    //   56: invokevirtual 196	com/google/android/gms/analytics/internal/zza:zzbc	(Ljava/lang/String;)V
    //   59: aload_0
    //   60: new 52	com/google/android/gms/ads/identifier/AdvertisingIdClient$Info
    //   63: dup
    //   64: ldc -58
    //   66: iconst_0
    //   67: invokespecial 201	com/google/android/gms/ads/identifier/AdvertisingIdClient$Info:<init>	(Ljava/lang/String;Z)V
    //   70: putfield 189	com/google/android/gms/analytics/internal/zza:zzLl	Lcom/google/android/gms/ads/identifier/AdvertisingIdClient$Info;
    //   73: goto -29 -> 44
    //   76: astore_1
    //   77: aload_0
    //   78: monitorexit
    //   79: aload_1
    //   80: athrow
    // Local variable table:
    //   start	length	slot	name	signature
    //   0	81	0	this	zza
    //   26	26	1	localInfo	AdvertisingIdClient.Info
    //   76	4	1	localObject	Object
    // Exception table:
    //   from	to	target	type
    //   2	44	76	finally
    //   44	49	76	finally
    //   53	73	76	finally
  }
  
  protected void zzhB() {}
  
  public boolean zzhM()
  {
    boolean bool2 = false;
    zzio();
    AdvertisingIdClient.Info localInfo = zzhR();
    boolean bool1 = bool2;
    if (localInfo != null)
    {
      bool1 = bool2;
      if (!localInfo.isLimitAdTrackingEnabled()) {
        bool1 = true;
      }
    }
    return bool1;
  }
  
  public String zzhQ()
  {
    zzio();
    Object localObject = zzhR();
    if (localObject != null) {}
    for (localObject = ((AdvertisingIdClient.Info)localObject).getId();; localObject = null)
    {
      if (TextUtils.isEmpty((CharSequence)localObject)) {
        return null;
      }
      return localObject;
    }
  }
  
  protected AdvertisingIdClient.Info zzhS()
  {
    Object localObject = null;
    try
    {
      AdvertisingIdClient.Info localInfo = AdvertisingIdClient.getAdvertisingIdInfo(getContext());
      localObject = localInfo;
    }
    catch (IllegalStateException localIllegalStateException)
    {
      zzbb("IllegalStateException getting Ad Id Info. If you would like to see Audience reports, please ensure that you have added '<meta-data android:name=\"com.google.android.gms.version\" android:value=\"@integer/google_play_services_version\" />' to your application manifest file. See http://goo.gl/naFqQk for details.");
      return null;
    }
    catch (Throwable localThrowable)
    {
      while (zzLk) {}
      zzLk = true;
      zzd("Error getting advertiser id", localThrowable);
    }
    return localObject;
    return null;
  }
  
  protected String zzhT()
  {
    Object localObject1 = null;
    try
    {
      FileInputStream localFileInputStream = getContext().openFileInput("gaClientIdData");
      Object localObject2 = new byte[''];
      int i = localFileInputStream.read((byte[])localObject2, 0, 128);
      if (localFileInputStream.available() > 0)
      {
        zzbb("Hash file seems corrupted, deleting it.");
        localFileInputStream.close();
        getContext().deleteFile("gaClientIdData");
        return null;
      }
      if (i <= 0)
      {
        zzaY("Hash file is empty.");
        localFileInputStream.close();
        return null;
      }
      localObject2 = new String((byte[])localObject2, 0, i);
      IOException localIOException2;
      return null;
    }
    catch (IOException localIOException1)
    {
      try
      {
        localFileInputStream.close();
        return localObject2;
      }
      catch (IOException localIOException3)
      {
        for (;;)
        {
          localObject1 = localIOException1;
          localIOException2 = localIOException3;
        }
      }
      catch (FileNotFoundException localFileNotFoundException1)
      {
        return localIOException2;
      }
      localIOException1 = localIOException1;
      zzd("Error reading Hash file, deleting it", localIOException1);
      getContext().deleteFile("gaClientIdData");
      return localObject1;
    }
    catch (FileNotFoundException localFileNotFoundException2) {}
  }
}
