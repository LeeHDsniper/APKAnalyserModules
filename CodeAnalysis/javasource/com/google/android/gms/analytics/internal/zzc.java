package com.google.android.gms.analytics.internal;

import android.content.Context;
import android.text.TextUtils;
import android.util.Log;
import com.google.android.gms.analytics.GoogleAnalytics;
import com.google.android.gms.common.internal.zzx;
import com.google.android.gms.internal.zzlm;
import com.google.android.gms.internal.zzof;

public class zzc
{
  private final zzf zzLy;
  
  protected zzc(zzf paramZzf)
  {
    zzx.zzv(paramZzf);
    zzLy = paramZzf;
  }
  
  private void zza(int paramInt, String paramString, Object paramObject1, Object paramObject2, Object paramObject3)
  {
    Object localObject = null;
    if (zzLy != null) {
      localObject = zzLy.zzir();
    }
    if (localObject != null) {
      ((zzaf)localObject).zza(paramInt, paramString, paramObject1, paramObject2, paramObject3);
    }
    do
    {
      return;
      localObject = (String)zzy.zzNa.get();
    } while (!Log.isLoggable((String)localObject, paramInt));
    Log.println(paramInt, (String)localObject, zzc(paramString, paramObject1, paramObject2, paramObject3));
  }
  
  protected static String zzc(String paramString, Object paramObject1, Object paramObject2, Object paramObject3)
  {
    String str1 = paramString;
    if (paramString == null) {
      str1 = "";
    }
    String str2 = zzi(paramObject1);
    paramObject2 = zzi(paramObject2);
    paramObject3 = zzi(paramObject3);
    StringBuilder localStringBuilder = new StringBuilder();
    paramString = "";
    if (!TextUtils.isEmpty(str1))
    {
      localStringBuilder.append(str1);
      paramString = ": ";
    }
    paramObject1 = paramString;
    if (!TextUtils.isEmpty(str2))
    {
      localStringBuilder.append(paramString);
      localStringBuilder.append(str2);
      paramObject1 = ", ";
    }
    paramString = paramObject1;
    if (!TextUtils.isEmpty(paramObject2))
    {
      localStringBuilder.append(paramObject1);
      localStringBuilder.append(paramObject2);
      paramString = ", ";
    }
    if (!TextUtils.isEmpty(paramObject3))
    {
      localStringBuilder.append(paramString);
      localStringBuilder.append(paramObject3);
    }
    return localStringBuilder.toString();
  }
  
  private static String zzi(Object paramObject)
  {
    if (paramObject == null) {
      return "";
    }
    if ((paramObject instanceof String)) {
      return (String)paramObject;
    }
    if ((paramObject instanceof Boolean))
    {
      if (paramObject == Boolean.TRUE) {}
      for (paramObject = "true";; paramObject = "false") {
        return paramObject;
      }
    }
    if ((paramObject instanceof Throwable)) {
      return ((Throwable)paramObject).toString();
    }
    return paramObject.toString();
  }
  
  protected Context getContext()
  {
    return zzLy.getContext();
  }
  
  public void zza(String paramString, Object paramObject)
  {
    zza(2, paramString, paramObject, null, null);
  }
  
  public void zza(String paramString, Object paramObject1, Object paramObject2)
  {
    zza(2, paramString, paramObject1, paramObject2, null);
  }
  
  public void zza(String paramString, Object paramObject1, Object paramObject2, Object paramObject3)
  {
    zza(3, paramString, paramObject1, paramObject2, paramObject3);
  }
  
  public void zzaY(String paramString)
  {
    zza(2, paramString, null, null, null);
  }
  
  public void zzaZ(String paramString)
  {
    zza(3, paramString, null, null, null);
  }
  
  public void zzb(String paramString, Object paramObject)
  {
    zza(3, paramString, paramObject, null, null);
  }
  
  public void zzb(String paramString, Object paramObject1, Object paramObject2)
  {
    zza(3, paramString, paramObject1, paramObject2, null);
  }
  
  public void zzb(String paramString, Object paramObject1, Object paramObject2, Object paramObject3)
  {
    zza(5, paramString, paramObject1, paramObject2, paramObject3);
  }
  
  public void zzba(String paramString)
  {
    zza(4, paramString, null, null, null);
  }
  
  public void zzbb(String paramString)
  {
    zza(5, paramString, null, null, null);
  }
  
  public void zzbc(String paramString)
  {
    zza(6, paramString, null, null, null);
  }
  
  public void zzc(String paramString, Object paramObject)
  {
    zza(4, paramString, paramObject, null, null);
  }
  
  public void zzc(String paramString, Object paramObject1, Object paramObject2)
  {
    zza(5, paramString, paramObject1, paramObject2, null);
  }
  
  public void zzd(String paramString, Object paramObject)
  {
    zza(5, paramString, paramObject, null, null);
  }
  
  public void zzd(String paramString, Object paramObject1, Object paramObject2)
  {
    zza(6, paramString, paramObject1, paramObject2, null);
  }
  
  public void zze(String paramString, Object paramObject)
  {
    zza(6, paramString, paramObject, null, null);
  }
  
  protected zzan zzhA()
  {
    return zzLy.zzhA();
  }
  
  public GoogleAnalytics zzhu()
  {
    return zzLy.zzis();
  }
  
  protected zzb zzhz()
  {
    return zzLy.zzhz();
  }
  
  public zzf zzia()
  {
    return zzLy;
  }
  
  protected void zzib()
  {
    if (zzif().zzjk()) {
      throw new IllegalStateException("Call only supported on the client side");
    }
  }
  
  protected void zzic()
  {
    zzLy.zzic();
  }
  
  protected zzlm zzid()
  {
    return zzLy.zzid();
  }
  
  protected zzaf zzie()
  {
    return zzLy.zzie();
  }
  
  protected zzr zzif()
  {
    return zzLy.zzif();
  }
  
  protected zzof zzig()
  {
    return zzLy.zzig();
  }
  
  protected zzv zzih()
  {
    return zzLy.zzih();
  }
  
  protected zzai zzii()
  {
    return zzLy.zzii();
  }
  
  protected zzn zzij()
  {
    return zzLy.zziv();
  }
  
  protected zza zzik()
  {
    return zzLy.zziu();
  }
  
  protected zzk zzil()
  {
    return zzLy.zzil();
  }
  
  protected zzu zzim()
  {
    return zzLy.zzim();
  }
  
  public boolean zzin()
  {
    return Log.isLoggable((String)zzy.zzNa.get(), 2);
  }
}
