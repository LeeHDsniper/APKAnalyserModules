package com.google.android.gms.internal;

import android.location.Location;
import com.google.android.gms.ads.mediation.MediationAdRequest;
import java.util.Date;
import java.util.Set;

@zzgk
public final class zzem
  implements MediationAdRequest
{
  private final Date zzaT;
  private final Set<String> zzaV;
  private final boolean zzaW;
  private final Location zzaX;
  private final int zzsW;
  private final int zzyV;
  
  public zzem(Date paramDate, int paramInt1, Set<String> paramSet, Location paramLocation, boolean paramBoolean, int paramInt2)
  {
    zzaT = paramDate;
    zzsW = paramInt1;
    zzaV = paramSet;
    zzaX = paramLocation;
    zzaW = paramBoolean;
    zzyV = paramInt2;
  }
  
  public Date getBirthday()
  {
    return zzaT;
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
  
  public boolean isTesting()
  {
    return zzaW;
  }
  
  public int taggedForChildDirectedTreatment()
  {
    return zzyV;
  }
}
