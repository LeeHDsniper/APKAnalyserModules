package com.google.android.gms.internal;

import android.net.Uri;
import android.os.Handler;
import android.os.Looper;
import android.os.SystemClock;
import android.text.TextUtils;
import java.io.UnsupportedEncodingException;
import java.net.URLEncoder;
import java.util.Collections;
import java.util.Iterator;
import java.util.Map;
import java.util.Map.Entry;
import java.util.Set;

public abstract class zzk<T>
  implements Comparable<zzk<T>>
{
  private final zzs.zza zzD;
  private final int zzE;
  private final String zzF;
  private final int zzG;
  private final zzm.zza zzH;
  private Integer zzI;
  private zzl zzJ;
  private boolean zzK;
  private boolean zzL;
  private boolean zzM;
  private long zzN;
  private zzo zzO;
  private zzb.zza zzP;
  
  public zzk(int paramInt, String paramString, zzm.zza paramZza)
  {
    if (zzs.zza.zzak) {}
    for (zzs.zza localZza = new zzs.zza();; localZza = null)
    {
      zzD = localZza;
      zzK = true;
      zzL = false;
      zzM = false;
      zzN = 0L;
      zzP = null;
      zzE = paramInt;
      zzF = paramString;
      zzH = paramZza;
      zza(new zzd());
      zzG = zzb(paramString);
      return;
    }
  }
  
  private byte[] zza(Map<String, String> paramMap, String paramString)
  {
    StringBuilder localStringBuilder = new StringBuilder();
    try
    {
      paramMap = paramMap.entrySet().iterator();
      while (paramMap.hasNext())
      {
        Map.Entry localEntry = (Map.Entry)paramMap.next();
        localStringBuilder.append(URLEncoder.encode((String)localEntry.getKey(), paramString));
        localStringBuilder.append('=');
        localStringBuilder.append(URLEncoder.encode((String)localEntry.getValue(), paramString));
        localStringBuilder.append('&');
      }
      paramMap = localStringBuilder.toString().getBytes(paramString);
    }
    catch (UnsupportedEncodingException paramMap)
    {
      throw new RuntimeException("Encoding not supported: " + paramString, paramMap);
    }
    return paramMap;
  }
  
  private static int zzb(String paramString)
  {
    if (!TextUtils.isEmpty(paramString))
    {
      paramString = Uri.parse(paramString);
      if (paramString != null)
      {
        paramString = paramString.getHost();
        if (paramString != null) {
          return paramString.hashCode();
        }
      }
    }
    return 0;
  }
  
  public Map<String, String> getHeaders()
    throws zza
  {
    return Collections.emptyMap();
  }
  
  public int getMethod()
  {
    return zzE;
  }
  
  public String getUrl()
  {
    return zzF;
  }
  
  public boolean isCanceled()
  {
    return zzL;
  }
  
  public String toString()
  {
    String str2 = "0x" + Integer.toHexString(zzg());
    StringBuilder localStringBuilder = new StringBuilder();
    if (zzL) {}
    for (String str1 = "[X] ";; str1 = "[ ] ") {
      return str1 + getUrl() + " " + str2 + " " + zzs() + " " + zzI;
    }
  }
  
  public final zzk<?> zza(int paramInt)
  {
    zzI = Integer.valueOf(paramInt);
    return this;
  }
  
  public zzk<?> zza(zzb.zza paramZza)
  {
    zzP = paramZza;
    return this;
  }
  
  public zzk<?> zza(zzl paramZzl)
  {
    zzJ = paramZzl;
    return this;
  }
  
  public zzk<?> zza(zzo paramZzo)
  {
    zzO = paramZzo;
    return this;
  }
  
  protected abstract zzm<T> zza(zzi paramZzi);
  
  protected abstract void zza(T paramT);
  
  protected zzr zzb(zzr paramZzr)
  {
    return paramZzr;
  }
  
  public int zzc(zzk<T> paramZzk)
  {
    zza localZza1 = zzs();
    zza localZza2 = paramZzk.zzs();
    if (localZza1 == localZza2) {
      return zzI.intValue() - zzI.intValue();
    }
    return localZza2.ordinal() - localZza1.ordinal();
  }
  
  public void zzc(zzr paramZzr)
  {
    if (zzH != null) {
      zzH.zze(paramZzr);
    }
  }
  
  public void zzc(String paramString)
  {
    if (zzs.zza.zzak) {
      zzD.zza(paramString, Thread.currentThread().getId());
    }
    while (zzN != 0L) {
      return;
    }
    zzN = SystemClock.elapsedRealtime();
  }
  
  void zzd(final String paramString)
  {
    if (zzJ != null) {
      zzJ.zzf(this);
    }
    final long l;
    if (zzs.zza.zzak)
    {
      l = Thread.currentThread().getId();
      if (Looper.myLooper() != Looper.getMainLooper()) {
        new Handler(Looper.getMainLooper()).post(new Runnable()
        {
          public void run()
          {
            zzk.zzd(zzk.this).zza(paramString, l);
            zzk.zzd(zzk.this).zzd(toString());
          }
        });
      }
    }
    do
    {
      return;
      zzD.zza(paramString, l);
      zzD.zzd(toString());
      return;
      l = SystemClock.elapsedRealtime() - zzN;
    } while (l < 3000L);
    zzs.zzb("%d ms: %s", new Object[] { Long.valueOf(l), toString() });
  }
  
  public int zzg()
  {
    return zzG;
  }
  
  public String zzh()
  {
    return getUrl();
  }
  
  public zzb.zza zzi()
  {
    return zzP;
  }
  
  @Deprecated
  protected Map<String, String> zzj()
    throws zza
  {
    return zzn();
  }
  
  @Deprecated
  protected String zzk()
  {
    return zzo();
  }
  
  @Deprecated
  public String zzl()
  {
    return zzp();
  }
  
  @Deprecated
  public byte[] zzm()
    throws zza
  {
    Map localMap = zzj();
    if ((localMap != null) && (localMap.size() > 0)) {
      return zza(localMap, zzk());
    }
    return null;
  }
  
  protected Map<String, String> zzn()
    throws zza
  {
    return null;
  }
  
  protected String zzo()
  {
    return "UTF-8";
  }
  
  public String zzp()
  {
    return "application/x-www-form-urlencoded; charset=" + zzo();
  }
  
  public byte[] zzq()
    throws zza
  {
    Map localMap = zzn();
    if ((localMap != null) && (localMap.size() > 0)) {
      return zza(localMap, zzo());
    }
    return null;
  }
  
  public final boolean zzr()
  {
    return zzK;
  }
  
  public zza zzs()
  {
    return zza.zzU;
  }
  
  public final int zzt()
  {
    return zzO.zzd();
  }
  
  public zzo zzu()
  {
    return zzO;
  }
  
  public void zzv()
  {
    zzM = true;
  }
  
  public boolean zzw()
  {
    return zzM;
  }
  
  public static enum zza
  {
    private zza() {}
  }
}
