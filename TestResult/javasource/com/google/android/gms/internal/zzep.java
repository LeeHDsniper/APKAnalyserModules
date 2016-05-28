package com.google.android.gms.internal;

import android.os.Bundle;
import android.view.View;
import com.google.android.gms.ads.formats.NativeAd.Image;
import com.google.android.gms.ads.internal.formats.zzc;
import com.google.android.gms.ads.mediation.NativeAppInstallAdMapper;
import com.google.android.gms.dynamic.zzd;
import com.google.android.gms.dynamic.zze;
import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;

@zzgk
public class zzep
  extends zzek.zza
{
  private final NativeAppInstallAdMapper zzza;
  
  public zzep(NativeAppInstallAdMapper paramNativeAppInstallAdMapper)
  {
    zzza = paramNativeAppInstallAdMapper;
  }
  
  public String getBody()
  {
    return zzza.getBody();
  }
  
  public String getCallToAction()
  {
    return zzza.getCallToAction();
  }
  
  public Bundle getExtras()
  {
    return zzza.getExtras();
  }
  
  public String getHeadline()
  {
    return zzza.getHeadline();
  }
  
  public List getImages()
  {
    Object localObject = zzza.getImages();
    if (localObject != null)
    {
      ArrayList localArrayList = new ArrayList();
      localObject = ((List)localObject).iterator();
      while (((Iterator)localObject).hasNext())
      {
        NativeAd.Image localImage = (NativeAd.Image)((Iterator)localObject).next();
        localArrayList.add(new zzc(localImage.getDrawable(), localImage.getUri()));
      }
      return localArrayList;
    }
    return null;
  }
  
  public boolean getOverrideClickHandling()
  {
    return zzza.getOverrideClickHandling();
  }
  
  public boolean getOverrideImpressionRecording()
  {
    return zzza.getOverrideImpressionRecording();
  }
  
  public String getPrice()
  {
    return zzza.getPrice();
  }
  
  public double getStarRating()
  {
    return zzza.getStarRating();
  }
  
  public String getStore()
  {
    return zzza.getStore();
  }
  
  public void recordImpression()
  {
    zzza.recordImpression();
  }
  
  public void zzc(zzd paramZzd)
  {
    zzza.handleClick((View)zze.zzp(paramZzd));
  }
  
  public void zzd(zzd paramZzd)
  {
    zzza.trackView((View)zze.zzp(paramZzd));
  }
  
  public zzcj zzds()
  {
    NativeAd.Image localImage = zzza.getIcon();
    if (localImage != null) {
      return new zzc(localImage.getDrawable(), localImage.getUri());
    }
    return null;
  }
}
