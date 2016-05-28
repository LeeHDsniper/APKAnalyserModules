package com.google.android.gms.internal;

import android.content.Context;
import android.text.TextUtils;
import com.google.android.gms.ads.internal.zzp;
import java.math.BigInteger;
import java.util.Locale;

@zzgk
public final class zzhp
{
  private static String zzHs;
  private static final Object zzpm = new Object();
  
  public static String zza(Context paramContext, String paramString1, String paramString2)
  {
    synchronized (zzpm)
    {
      if ((zzHs == null) && (!TextUtils.isEmpty(paramString1))) {
        zzb(paramContext, paramString1, paramString2);
      }
      paramContext = zzHs;
      return paramContext;
    }
  }
  
  private static void zzb(Context paramContext, String paramString1, String paramString2)
  {
    try
    {
      paramString2 = paramContext.createPackageContext(paramString2, 3).getClassLoader();
      Class localClass = Class.forName("com.google.ads.mediation.MediationAdapter", false, paramString2);
      paramContext = new BigInteger(new byte[1]);
      String[] arrayOfString = paramString1.split(",");
      int i = 0;
      while (i < arrayOfString.length)
      {
        paramString1 = paramContext;
        if (zzp.zzbx().zza(paramString2, localClass, arrayOfString[i])) {
          paramString1 = paramContext.setBit(i);
        }
        i += 1;
        paramContext = paramString1;
      }
    }
    catch (Throwable paramContext)
    {
      zzHs = "err";
      return;
    }
    tmp96_93[0] = paramContext;
    zzHs = String.format(Locale.US, "%X", tmp96_93);
  }
  
  public static String zzgm()
  {
    synchronized (zzpm)
    {
      String str = zzHs;
      return str;
    }
  }
}
