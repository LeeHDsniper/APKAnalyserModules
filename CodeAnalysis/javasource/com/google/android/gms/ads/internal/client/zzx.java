package com.google.android.gms.ads.internal.client;

import android.content.Context;
import android.location.Location;
import android.os.Bundle;
import com.google.ads.mediation.admob.AdMobAdapter;
import com.google.android.gms.ads.internal.util.client.zza;
import com.google.android.gms.ads.mediation.MediationAdapter;
import com.google.android.gms.ads.mediation.NetworkExtras;
import com.google.android.gms.ads.mediation.admob.AdMobExtras;
import com.google.android.gms.ads.mediation.customevent.CustomEvent;
import com.google.android.gms.ads.search.SearchAdRequest;
import com.google.android.gms.internal.zzgk;
import java.util.Collections;
import java.util.Date;
import java.util.HashMap;
import java.util.HashSet;
import java.util.Map;
import java.util.Set;

@zzgk
public final class zzx
{
  public static final String DEVICE_ID_EMULATOR = zzk.zzcE().zzaB("emulator");
  private final Date zzaT;
  private final Set<String> zzaV;
  private final Location zzaX;
  private final boolean zzoM;
  private final String zzsV;
  private final int zzsW;
  private final Bundle zzsX;
  private final Map<Class<? extends NetworkExtras>, NetworkExtras> zzsY;
  private final String zzsZ;
  private final String zzta;
  private final SearchAdRequest zztb;
  private final int zztc;
  private final Set<String> zztd;
  private final Bundle zzte;
  private final Set<String> zztf;
  
  public zzx(zza paramZza)
  {
    this(paramZza, null);
  }
  
  public zzx(zza paramZza, SearchAdRequest paramSearchAdRequest)
  {
    zzaT = zza.zza(paramZza);
    zzsV = zza.zzb(paramZza);
    zzsW = zza.zzc(paramZza);
    zzaV = Collections.unmodifiableSet(zza.zzd(paramZza));
    zzaX = zza.zze(paramZza);
    zzoM = zza.zzf(paramZza);
    zzsX = zza.zzg(paramZza);
    zzsY = Collections.unmodifiableMap(zza.zzh(paramZza));
    zzsZ = zza.zzi(paramZza);
    zzta = zza.zzj(paramZza);
    zztb = paramSearchAdRequest;
    zztc = zza.zzk(paramZza);
    zztd = Collections.unmodifiableSet(zza.zzl(paramZza));
    zzte = zza.zzm(paramZza);
    zztf = Collections.unmodifiableSet(zza.zzn(paramZza));
  }
  
  public static void updateCorrelator()
  {
    zzk.zzcG().zzcK();
  }
  
  public Date getBirthday()
  {
    return zzaT;
  }
  
  public String getContentUrl()
  {
    return zzsV;
  }
  
  public Bundle getCustomEventExtrasBundle(Class<? extends CustomEvent> paramClass)
  {
    Bundle localBundle = zzsX.getBundle("com.google.android.gms.ads.mediation.customevent.CustomEventAdapter");
    if (localBundle != null) {
      return localBundle.getBundle(paramClass.getClass().getName());
    }
    return null;
  }
  
  public Bundle getCustomTargeting()
  {
    return zzte;
  }
  
  public int getGender()
  {
    return zzsW;
  }
  
  public Set<String> getKeywords()
  {
    return zzaV;
  }
  
  public Location getLocation()
  {
    return zzaX;
  }
  
  public boolean getManualImpressionsEnabled()
  {
    return zzoM;
  }
  
  @Deprecated
  public <T extends NetworkExtras> T getNetworkExtras(Class<T> paramClass)
  {
    return (NetworkExtras)zzsY.get(paramClass);
  }
  
  public Bundle getNetworkExtrasBundle(Class<? extends MediationAdapter> paramClass)
  {
    return zzsX.getBundle(paramClass.getName());
  }
  
  public String getPublisherProvidedId()
  {
    return zzsZ;
  }
  
  public boolean isTestDevice(Context paramContext)
  {
    return zztd.contains(zzk.zzcE().zzQ(paramContext));
  }
  
  public String zzcL()
  {
    return zzta;
  }
  
  public SearchAdRequest zzcM()
  {
    return zztb;
  }
  
  public Map<Class<? extends NetworkExtras>, NetworkExtras> zzcN()
  {
    return zzsY;
  }
  
  public Bundle zzcO()
  {
    return zzsX;
  }
  
  public int zzcP()
  {
    return zztc;
  }
  
  public Set<String> zzcQ()
  {
    return zztf;
  }
  
  public static final class zza
  {
    private Date zzaT;
    private Location zzaX;
    private boolean zzoM = false;
    private String zzsV;
    private int zzsW = -1;
    private final Bundle zzsX = new Bundle();
    private String zzsZ;
    private String zzta;
    private int zztc = -1;
    private final Bundle zzte = new Bundle();
    private final HashSet<String> zztg = new HashSet();
    private final HashMap<Class<? extends NetworkExtras>, NetworkExtras> zzth = new HashMap();
    private final HashSet<String> zzti = new HashSet();
    private final HashSet<String> zztj = new HashSet();
    
    public zza() {}
    
    public void setManualImpressionsEnabled(boolean paramBoolean)
    {
      zzoM = paramBoolean;
    }
    
    public void zzF(String paramString)
    {
      zztg.add(paramString);
    }
    
    public void zzG(String paramString)
    {
      zzti.add(paramString);
    }
    
    public void zzH(String paramString)
    {
      zzti.remove(paramString);
    }
    
    public void zzI(String paramString)
    {
      zzsV = paramString;
    }
    
    public void zzJ(String paramString)
    {
      zzsZ = paramString;
    }
    
    public void zzK(String paramString)
    {
      zzta = paramString;
    }
    
    public void zzL(String paramString)
    {
      zztj.add(paramString);
    }
    
    public void zza(Location paramLocation)
    {
      zzaX = paramLocation;
    }
    
    @Deprecated
    public void zza(NetworkExtras paramNetworkExtras)
    {
      if ((paramNetworkExtras instanceof AdMobExtras))
      {
        zza(AdMobAdapter.class, ((AdMobExtras)paramNetworkExtras).getExtras());
        return;
      }
      zzth.put(paramNetworkExtras.getClass(), paramNetworkExtras);
    }
    
    public void zza(Class<? extends MediationAdapter> paramClass, Bundle paramBundle)
    {
      zzsX.putBundle(paramClass.getName(), paramBundle);
    }
    
    public void zza(Date paramDate)
    {
      zzaT = paramDate;
    }
    
    public void zzb(Class<? extends CustomEvent> paramClass, Bundle paramBundle)
    {
      if (zzsX.getBundle("com.google.android.gms.ads.mediation.customevent.CustomEventAdapter") == null) {
        zzsX.putBundle("com.google.android.gms.ads.mediation.customevent.CustomEventAdapter", new Bundle());
      }
      zzsX.getBundle("com.google.android.gms.ads.mediation.customevent.CustomEventAdapter").putBundle(paramClass.getName(), paramBundle);
    }
    
    public void zzb(String paramString1, String paramString2)
    {
      zzte.putString(paramString1, paramString2);
    }
    
    public void zzj(boolean paramBoolean)
    {
      if (paramBoolean) {}
      for (int i = 1;; i = 0)
      {
        zztc = i;
        return;
      }
    }
    
    public void zzm(int paramInt)
    {
      zzsW = paramInt;
    }
  }
}
