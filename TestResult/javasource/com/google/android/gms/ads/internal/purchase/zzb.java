package com.google.android.gms.ads.internal.purchase;

import android.content.Context;
import android.os.Bundle;
import android.os.IBinder;
import com.google.android.gms.internal.zzgk;
import java.lang.reflect.Method;

@zzgk
public class zzb
{
  private final Context mContext;
  Object zzBM;
  private final boolean zzBN;
  
  public zzb(Context paramContext)
  {
    this(paramContext, true);
  }
  
  public zzb(Context paramContext, boolean paramBoolean)
  {
    mContext = paramContext;
    zzBN = paramBoolean;
  }
  
  public void destroy()
  {
    zzBM = null;
  }
  
  public void zzM(IBinder paramIBinder)
  {
    try
    {
      zzBM = mContext.getClassLoader().loadClass("com.android.vending.billing.IInAppBillingService$Stub").getDeclaredMethod("asInterface", new Class[] { IBinder.class }).invoke(null, new Object[] { paramIBinder });
      return;
    }
    catch (Exception paramIBinder)
    {
      while (!zzBN) {}
      com.google.android.gms.ads.internal.util.client.zzb.zzaE("IInAppBillingService is not available, please add com.android.vending.billing.IInAppBillingService to project.");
    }
  }
  
  public int zza(int paramInt, String paramString1, String paramString2)
  {
    try
    {
      Class localClass = mContext.getClassLoader().loadClass("com.android.vending.billing.IInAppBillingService");
      paramInt = ((Integer)localClass.getDeclaredMethod("isBillingSupported", new Class[] { Integer.TYPE, String.class, String.class }).invoke(localClass.cast(zzBM), new Object[] { Integer.valueOf(paramInt), paramString1, paramString2 })).intValue();
      return paramInt;
    }
    catch (Exception paramString1)
    {
      if (zzBN) {
        com.google.android.gms.ads.internal.util.client.zzb.zzd("IInAppBillingService is not available, please add com.android.vending.billing.IInAppBillingService to project.", paramString1);
      }
    }
    return 5;
  }
  
  public Bundle zzb(String paramString1, String paramString2, String paramString3)
  {
    try
    {
      Class localClass = mContext.getClassLoader().loadClass("com.android.vending.billing.IInAppBillingService");
      paramString1 = (Bundle)localClass.getDeclaredMethod("getBuyIntent", new Class[] { Integer.TYPE, String.class, String.class, String.class, String.class }).invoke(localClass.cast(zzBM), new Object[] { Integer.valueOf(3), paramString1, paramString2, "inapp", paramString3 });
      return paramString1;
    }
    catch (Exception paramString1)
    {
      if (zzBN) {
        com.google.android.gms.ads.internal.util.client.zzb.zzd("IInAppBillingService is not available, please add com.android.vending.billing.IInAppBillingService to project.", paramString1);
      }
    }
    return null;
  }
  
  public int zzi(String paramString1, String paramString2)
  {
    try
    {
      Class localClass = mContext.getClassLoader().loadClass("com.android.vending.billing.IInAppBillingService");
      int i = ((Integer)localClass.getDeclaredMethod("consumePurchase", new Class[] { Integer.TYPE, String.class, String.class }).invoke(localClass.cast(zzBM), new Object[] { Integer.valueOf(3), paramString1, paramString2 })).intValue();
      return i;
    }
    catch (Exception paramString1)
    {
      if (zzBN) {
        com.google.android.gms.ads.internal.util.client.zzb.zzd("IInAppBillingService is not available, please add com.android.vending.billing.IInAppBillingService to project.", paramString1);
      }
    }
    return 5;
  }
  
  public Bundle zzj(String paramString1, String paramString2)
  {
    try
    {
      Class localClass = mContext.getClassLoader().loadClass("com.android.vending.billing.IInAppBillingService");
      paramString1 = (Bundle)localClass.getDeclaredMethod("getPurchases", new Class[] { Integer.TYPE, String.class, String.class, String.class }).invoke(localClass.cast(zzBM), new Object[] { Integer.valueOf(3), paramString1, "inapp", paramString2 });
      return paramString1;
    }
    catch (Exception paramString1)
    {
      if (zzBN) {
        com.google.android.gms.ads.internal.util.client.zzb.zzd("IInAppBillingService is not available, please add com.android.vending.billing.IInAppBillingService to project.", paramString1);
      }
    }
    return null;
  }
}
