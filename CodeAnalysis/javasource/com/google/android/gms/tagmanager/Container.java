package com.google.android.gms.tagmanager;

import android.content.Context;
import com.google.android.gms.internal.zzag.zza;
import com.google.android.gms.internal.zzqp.zzc;
import java.util.HashMap;
import java.util.Map;

public class Container
{
  private final Context mContext;
  private final String zzaOS;
  private final DataLayer zzaOT;
  private zzcp zzaOU;
  private Map<String, FunctionCallMacroCallback> zzaOV = new HashMap();
  private Map<String, FunctionCallTagCallback> zzaOW = new HashMap();
  private volatile long zzaOX;
  private volatile String zzaOY = "";
  
  Container(Context paramContext, DataLayer paramDataLayer, String paramString, long paramLong, zzqp.zzc paramZzc)
  {
    mContext = paramContext;
    zzaOT = paramDataLayer;
    zzaOS = paramString;
    zzaOX = paramLong;
    zza(paramZzc);
  }
  
  private void zza(zzqp.zzc paramZzc)
  {
    zzaOY = paramZzc.getVersion();
    zzah localZzah = zzex(zzaOY);
    zza(new zzcp(mContext, paramZzc, zzaOT, new zza(null), new zzb(null), localZzah));
    if (getBoolean("_gtm.loadEventEnabled")) {
      zzaOT.pushEvent("gtm.load", DataLayer.mapOf(new Object[] { "gtm.id", zzaOS }));
    }
  }
  
  private void zza(zzcp paramZzcp)
  {
    try
    {
      zzaOU = paramZzcp;
      return;
    }
    finally
    {
      paramZzcp = finally;
      throw paramZzcp;
    }
  }
  
  private zzcp zzzD()
  {
    try
    {
      zzcp localZzcp = zzaOU;
      return localZzcp;
    }
    finally
    {
      localObject = finally;
      throw localObject;
    }
  }
  
  public boolean getBoolean(String paramString)
  {
    zzcp localZzcp = zzzD();
    if (localZzcp == null)
    {
      zzbg.e("getBoolean called for closed container.");
      return zzdf.zzBd().booleanValue();
    }
    try
    {
      boolean bool = zzdf.zzk((zzag.zza)localZzcp.zzeS(paramString).getObject()).booleanValue();
      return bool;
    }
    catch (Exception paramString)
    {
      zzbg.e("Calling getBoolean() threw an exception: " + paramString.getMessage() + " Returning default value.");
    }
    return zzdf.zzBd().booleanValue();
  }
  
  public String getContainerId()
  {
    return zzaOS;
  }
  
  public long getLastRefreshTime()
  {
    return zzaOX;
  }
  
  public String getString(String paramString)
  {
    zzcp localZzcp = zzzD();
    if (localZzcp == null)
    {
      zzbg.e("getString called for closed container.");
      return zzdf.zzBf();
    }
    try
    {
      paramString = zzdf.zzg((zzag.zza)localZzcp.zzeS(paramString).getObject());
      return paramString;
    }
    catch (Exception paramString)
    {
      zzbg.e("Calling getString() threw an exception: " + paramString.getMessage() + " Returning default value.");
    }
    return zzdf.zzBf();
  }
  
  public boolean isDefault()
  {
    return getLastRefreshTime() == 0L;
  }
  
  void release()
  {
    zzaOU = null;
  }
  
  FunctionCallMacroCallback zzeu(String paramString)
  {
    synchronized (zzaOV)
    {
      paramString = (FunctionCallMacroCallback)zzaOV.get(paramString);
      return paramString;
    }
  }
  
  FunctionCallTagCallback zzev(String paramString)
  {
    synchronized (zzaOW)
    {
      paramString = (FunctionCallTagCallback)zzaOW.get(paramString);
      return paramString;
    }
  }
  
  void zzew(String paramString)
  {
    zzzD().zzew(paramString);
  }
  
  zzah zzex(String paramString)
  {
    if (zzcb.zzAv().zzAw().equals(zzcb.zza.zzaRe)) {}
    return new zzbo();
  }
  
  public static abstract interface FunctionCallMacroCallback
  {
    public abstract Object getValue(String paramString, Map<String, Object> paramMap);
  }
  
  public static abstract interface FunctionCallTagCallback
  {
    public abstract void execute(String paramString, Map<String, Object> paramMap);
  }
  
  private class zza
    implements zzt.zza
  {
    private zza() {}
    
    public Object zzd(String paramString, Map<String, Object> paramMap)
    {
      Container.FunctionCallMacroCallback localFunctionCallMacroCallback = zzeu(paramString);
      if (localFunctionCallMacroCallback == null) {
        return null;
      }
      return localFunctionCallMacroCallback.getValue(paramString, paramMap);
    }
  }
  
  private class zzb
    implements zzt.zza
  {
    private zzb() {}
    
    public Object zzd(String paramString, Map<String, Object> paramMap)
    {
      Container.FunctionCallTagCallback localFunctionCallTagCallback = zzev(paramString);
      if (localFunctionCallTagCallback != null) {
        localFunctionCallTagCallback.execute(paramString, paramMap);
      }
      return zzdf.zzBf();
    }
  }
}
