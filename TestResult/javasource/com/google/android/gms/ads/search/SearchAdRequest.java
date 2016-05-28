package com.google.android.gms.ads.search;

import android.content.Context;
import android.graphics.Color;
import android.location.Location;
import android.os.Bundle;
import com.google.android.gms.ads.internal.client.zzx;
import com.google.android.gms.ads.internal.client.zzx.zza;
import com.google.android.gms.ads.mediation.MediationAdapter;
import com.google.android.gms.ads.mediation.NetworkExtras;
import com.google.android.gms.ads.mediation.customevent.CustomEvent;

public final class SearchAdRequest
{
  public static final int BORDER_TYPE_DASHED = 1;
  public static final int BORDER_TYPE_DOTTED = 2;
  public static final int BORDER_TYPE_NONE = 0;
  public static final int BORDER_TYPE_SOLID = 3;
  public static final int CALL_BUTTON_COLOR_DARK = 2;
  public static final int CALL_BUTTON_COLOR_LIGHT = 0;
  public static final int CALL_BUTTON_COLOR_MEDIUM = 1;
  public static final String DEVICE_ID_EMULATOR = zzx.DEVICE_ID_EMULATOR;
  public static final int ERROR_CODE_INTERNAL_ERROR = 0;
  public static final int ERROR_CODE_INVALID_REQUEST = 1;
  public static final int ERROR_CODE_NETWORK_ERROR = 2;
  public static final int ERROR_CODE_NO_FILL = 3;
  private final int zzJN;
  private final int zzJO;
  private final int zzJP;
  private final int zzJQ;
  private final int zzJR;
  private final int zzJS;
  private final int zzJT;
  private final String zzJU;
  private final int zzJV;
  private final String zzJW;
  private final int zzJX;
  private final int zzJY;
  private final String zzJZ;
  private final zzx zznN;
  private final int zzvF;
  
  private SearchAdRequest(Builder paramBuilder)
  {
    zzJN = Builder.zza(paramBuilder);
    zzvF = Builder.zzb(paramBuilder);
    zzJO = Builder.zzc(paramBuilder);
    zzJP = Builder.zzd(paramBuilder);
    zzJQ = Builder.zze(paramBuilder);
    zzJR = Builder.zzf(paramBuilder);
    zzJS = Builder.zzg(paramBuilder);
    zzJT = Builder.zzh(paramBuilder);
    zzJU = Builder.zzi(paramBuilder);
    zzJV = Builder.zzj(paramBuilder);
    zzJW = Builder.zzk(paramBuilder);
    zzJX = Builder.zzl(paramBuilder);
    zzJY = Builder.zzm(paramBuilder);
    zzJZ = Builder.zzn(paramBuilder);
    zznN = new zzx(Builder.zzo(paramBuilder), this);
  }
  
  public int getAnchorTextColor()
  {
    return zzJN;
  }
  
  public int getBackgroundColor()
  {
    return zzvF;
  }
  
  public int getBackgroundGradientBottom()
  {
    return zzJO;
  }
  
  public int getBackgroundGradientTop()
  {
    return zzJP;
  }
  
  public int getBorderColor()
  {
    return zzJQ;
  }
  
  public int getBorderThickness()
  {
    return zzJR;
  }
  
  public int getBorderType()
  {
    return zzJS;
  }
  
  public int getCallButtonColor()
  {
    return zzJT;
  }
  
  public String getCustomChannels()
  {
    return zzJU;
  }
  
  public <T extends CustomEvent> Bundle getCustomEventExtrasBundle(Class<T> paramClass)
  {
    return zznN.getCustomEventExtrasBundle(paramClass);
  }
  
  public int getDescriptionTextColor()
  {
    return zzJV;
  }
  
  public String getFontFace()
  {
    return zzJW;
  }
  
  public int getHeaderTextColor()
  {
    return zzJX;
  }
  
  public int getHeaderTextSize()
  {
    return zzJY;
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
  
  public String getQuery()
  {
    return zzJZ;
  }
  
  public boolean isTestDevice(Context paramContext)
  {
    return zznN.isTestDevice(paramContext);
  }
  
  zzx zzaF()
  {
    return zznN;
  }
  
  public static final class Builder
  {
    private int zzJN;
    private int zzJO;
    private int zzJP;
    private int zzJQ;
    private int zzJR;
    private int zzJS = 0;
    private int zzJT;
    private String zzJU;
    private int zzJV;
    private String zzJW;
    private int zzJX;
    private int zzJY;
    private String zzJZ;
    private final zzx.zza zznO = new zzx.zza();
    private int zzvF;
    
    public Builder() {}
    
    public Builder addCustomEventExtrasBundle(Class<? extends CustomEvent> paramClass, Bundle paramBundle)
    {
      zznO.zzb(paramClass, paramBundle);
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
      return this;
    }
    
    public Builder addTestDevice(String paramString)
    {
      zznO.zzG(paramString);
      return this;
    }
    
    public SearchAdRequest build()
    {
      return new SearchAdRequest(this, null);
    }
    
    public Builder setAnchorTextColor(int paramInt)
    {
      zzJN = paramInt;
      return this;
    }
    
    public Builder setBackgroundColor(int paramInt)
    {
      zzvF = paramInt;
      zzJO = Color.argb(0, 0, 0, 0);
      zzJP = Color.argb(0, 0, 0, 0);
      return this;
    }
    
    public Builder setBackgroundGradient(int paramInt1, int paramInt2)
    {
      zzvF = Color.argb(0, 0, 0, 0);
      zzJO = paramInt2;
      zzJP = paramInt1;
      return this;
    }
    
    public Builder setBorderColor(int paramInt)
    {
      zzJQ = paramInt;
      return this;
    }
    
    public Builder setBorderThickness(int paramInt)
    {
      zzJR = paramInt;
      return this;
    }
    
    public Builder setBorderType(int paramInt)
    {
      zzJS = paramInt;
      return this;
    }
    
    public Builder setCallButtonColor(int paramInt)
    {
      zzJT = paramInt;
      return this;
    }
    
    public Builder setCustomChannels(String paramString)
    {
      zzJU = paramString;
      return this;
    }
    
    public Builder setDescriptionTextColor(int paramInt)
    {
      zzJV = paramInt;
      return this;
    }
    
    public Builder setFontFace(String paramString)
    {
      zzJW = paramString;
      return this;
    }
    
    public Builder setHeaderTextColor(int paramInt)
    {
      zzJX = paramInt;
      return this;
    }
    
    public Builder setHeaderTextSize(int paramInt)
    {
      zzJY = paramInt;
      return this;
    }
    
    public Builder setLocation(Location paramLocation)
    {
      zznO.zza(paramLocation);
      return this;
    }
    
    public Builder setQuery(String paramString)
    {
      zzJZ = paramString;
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
