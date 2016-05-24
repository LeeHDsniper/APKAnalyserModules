package com.google.android.gms.tagmanager;

import com.google.android.gms.internal.zzag.zza;
import java.io.UnsupportedEncodingException;
import java.net.URLEncoder;

class zzdj
{
  private static zzbw<zzag.zza> zza(zzbw<zzag.zza> paramZzbw)
  {
    try
    {
      zzbw localZzbw = new zzbw(zzdf.zzK(zzff(zzdf.zzg((zzag.zza)paramZzbw.getObject()))), paramZzbw.zzAq());
      return localZzbw;
    }
    catch (UnsupportedEncodingException localUnsupportedEncodingException)
    {
      zzbg.zzb("Escape URI: unsupported encoding", localUnsupportedEncodingException);
    }
    return paramZzbw;
  }
  
  private static zzbw<zzag.zza> zza(zzbw<zzag.zza> paramZzbw, int paramInt)
  {
    if (!zzn((zzag.zza)paramZzbw.getObject()))
    {
      zzbg.e("Escaping can only be applied to strings.");
      return paramZzbw;
    }
    switch (paramInt)
    {
    default: 
      zzbg.e("Unsupported Value Escaping: " + paramInt);
      return paramZzbw;
    }
    return zza(paramZzbw);
  }
  
  static zzbw<zzag.zza> zza(zzbw<zzag.zza> paramZzbw, int... paramVarArgs)
  {
    int j = paramVarArgs.length;
    int i = 0;
    while (i < j)
    {
      paramZzbw = zza(paramZzbw, paramVarArgs[i]);
      i += 1;
    }
    return paramZzbw;
  }
  
  static String zzff(String paramString)
    throws UnsupportedEncodingException
  {
    return URLEncoder.encode(paramString, "UTF-8").replaceAll("\\+", "%20");
  }
  
  private static boolean zzn(zzag.zza paramZza)
  {
    return zzdf.zzl(paramZza) instanceof String;
  }
}
