package com.google.android.gms.ads;

import android.content.Context;
import android.location.Location;
import android.os.Bundle;
import com.google.ads.mediation.admob.AdMobAdapter;
import com.google.android.gms.ads.internal.client.zzx.zza;
import com.google.android.gms.ads.mediation.MediationAdapter;
import com.google.android.gms.ads.mediation.NetworkExtras;
import com.google.android.gms.ads.mediation.customevent.CustomEvent;
import java.util.Date;
import java.util.Set;

public final class AdRequest
{
  public static final String DEVICE_ID_EMULATOR = com.google.android.gms.ads.internal.client.zzx.DEVICE_ID_EMULATOR;
  public static final int ERROR_CODE_INTERNAL_ERROR = 0;
  public static final int ERROR_CODE_INVALID_REQUEST = 1;
  public static final int ERROR_CODE_NETWORK_ERROR = 2;
  public static final int ERROR_CODE_NO_FILL = 3;
  public static final int GENDER_FEMALE = 2;
  public static final int GENDER_MALE = 1;
  public static final int GENDER_UNKNOWN = 0;
  public static final int MAX_CONTENT_URL_LENGTH = 512;
  private final com.google.android.gms.ads.internal.client.zzx zznN;
  
  private AdRequest(Builder paramBuilder)
  {
    zznN = new com.google.android.gms.ads.internal.client.zzx(Builder.zza(paramBuilder));
  }
  
  public Date getBirthday()
  {
    return zznN.getBirthday();
  }
  
  public String getContentUrl()
  {
    return zznN.getContentUrl();
  }
  
  public <T extends CustomEvent> Bundle getCustomEventExtrasBundle(Class<T> paramClass)
  {
    return zznN.getCustomEventExtrasBundle(paramClass);
  }
  
  public int getGender()
  {
    return zznN.getGender();
  }
  
  public Set<String> getKeywords()
  {
    return zznN.getKeywords();
  }
  
  public Location getLocation()
  {
    return zznN.getLocation();
  }
  
  @Deprecated
  public <T extends NetworkExtras> T getNetworkExtras(Class<T> paramClass)
  {
    return zznN.getNetworkExtras(paramClass);
  }
  
  public <T extends MediationAdapter> Bundle getNetworkExtrasBundle(Class<T> paramClass)
  {
    return zznN.getNetworkExtrasBundle(paramClass);
  }
  
  public boolean isTestDevice(Context paramContext)
  {
    return zznN.isTestDevice(paramContext);
  }
  
  public com.google.android.gms.ads.internal.client.zzx zzaF()
  {
    return zznN;
  }
  
  public static final class Builder
  {
    private final zzx.zza zznO = new zzx.zza();
    
    public Builder()
    {
      zznO.zzG(AdRequest.DEVICE_ID_EMULATOR);
    }
    
    public Builder addCustomEventExtrasBundle(Class<? extends CustomEvent> paramClass, Bundle paramBundle)
    {
      zznO.zzb(paramClass, paramBundle);
      return this;
    }
    
    public Builder addKeyword(String paramString)
    {
      zznO.zzF(paramString);
      return this;
    }
    
    public Builder addNetworkExtras(NetworkExtras paramNetworkExtras)
    {
      zznO.zza(paramNetworkExtras);
      return this;
    }
    
    public Builder addNetworkExtrasBundle(Class<? extends MediationAdapter> paramClass, Bundle paramBundle)
    {
      zznO.zza(paramClass, paramBundle);
      if ((paramClass.equals(AdMobAdapter.class)) && (paramBundle.getBoolean("_emulatorLiveAds"))) {
        zznO.zzH(AdRequest.DEVICE_ID_EMULATOR);
      }
      return this;
    }
    
    public Builder addTestDevice(String paramString)
    {
      zznO.zzG(paramString);
      return this;
    }
    
    public AdRequest build()
    {
      return new AdRequest(this, null);
    }
    
    public Builder setBirthday(Date paramDate)
    {
      zznO.zza(paramDate);
      return this;
    }
    
    public Builder setContentUrl(String paramString)
    {
      com.google.android.gms.common.internal.zzx.zzb(paramString, "Content URL must be non-null.");
      com.google.android.gms.common.internal.zzx.zzh(paramString, "Content URL must be non-empty.");
      if (paramString.length() <= 512) {}
      for (boolean bool = true;; bool = false)
      {
        com.google.android.gms.common.internal.zzx.zzb(bool, "Content URL must not exceed %d in length.  Provided length was %d.", new Object[] { Integer.valueOf(512), Integer.valueOf(paramString.length()) });
        zznO.zzI(paramString);
        return this;
      }
    }
    
    public Builder setGender(int paramInt)
    {
      zznO.zzm(paramInt);
      return this;
    }
    
    public Builder setLocation(Location paramLocation)
    {
      zznO.zza(paramLocation);
      return this;
    }
    
    public Builder setRequestAgent(String paramString)
    {
      zznO.zzK(paramString);
      return this;
    }
    
    public Builder tagForChildDirectedTreatment(boolean paramBoolean)
    {
      zznO.zzj(paramBoolean);
      return this;
    }
  }
}
