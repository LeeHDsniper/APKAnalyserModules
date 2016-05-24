package com.google.android.gms.internal;

import android.content.Context;
import android.os.Build.VERSION;
import com.google.android.gms.ads.internal.zzp;
import java.util.LinkedHashMap;
import java.util.Map;

public class zzbz
{
  private Context mContext = null;
  private String zzqK = null;
  private boolean zzvf;
  private String zzvg;
  private Map<String, String> zzvh;
  
  public zzbz(Context paramContext, String paramString)
  {
    mContext = paramContext;
    zzqK = paramString;
    zzvf = ((Boolean)zzby.zzuB.get()).booleanValue();
    zzvg = ((String)zzby.zzuC.get());
    zzvh = new LinkedHashMap();
    zzvh.put("s", "gmob_sdk");
    zzvh.put("v", "3");
    zzvh.put("os", Build.VERSION.RELEASE);
    zzvh.put("sdk", Build.VERSION.SDK);
    zzvh.put("device", zzp.zzbx().zzgt());
    zzvh.put("ua", zzp.zzbx().zzf(paramContext, paramString));
    Map localMap = zzvh;
    if (paramContext.getApplicationContext() != null) {}
    for (paramString = paramContext.getApplicationContext().getPackageName();; paramString = paramContext.getPackageName())
    {
      localMap.put("app", paramString);
      if (zzp.zzbx().zza(paramContext.getPackageManager(), paramContext.getPackageName(), "android.permission.ACCESS_NETWORK_STATE"))
      {
        paramContext = zzp.zzbD().zzD(mContext);
        zzvh.put("network_coarse", Integer.toString(zzFN));
        zzvh.put("network_fine", Integer.toString(zzFO));
      }
      return;
    }
  }
  
  Context getContext()
  {
    return mContext;
  }
  
  String zzbV()
  {
    return zzqK;
  }
  
  boolean zzdf()
  {
    return zzvf;
  }
  
  String zzdg()
  {
    return zzvg;
  }
  
  Map<String, String> zzdh()
  {
    return zzvh;
  }
}
