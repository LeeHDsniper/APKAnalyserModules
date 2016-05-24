package com.google.android.gms.internal;

import android.os.Bundle;
import android.view.View;
import com.google.android.gms.ads.formats.NativeAd.Image;
import com.google.android.gms.ads.internal.formats.zzc;
import com.google.android.gms.ads.mediation.NativeContentAdMapper;
import com.google.android.gms.dynamic.zzd;
import com.google.android.gms.dynamic.zze;
import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;

@zzgk
public class zzeq
  extends zzel.zza
{
  private final NativeContentAdMapper zzzb;
  
  public zzeq(NativeContentAdMapper paramNativeContentAdMapper)
  {
    zzzb = paramNativeContentAdMapper;
  }
  
  public String getAdvertiser()
  {
    return zzzb.getAdvertiser();
  }
  
  public String getBody()
  {
    return zzzb.getBody();
  }
  
  public String getCallToAction()
  {
    return zzzb.getCallToAction();
  }
  
  public Bundle getExtras()
  {
    return zzzb.getExtras();
  }
  
  public String getHeadline()
  {
    return zzzb.getHeadline();
  }
  
  public List getImages()
  {
    Object localObject = zzzb.getImages();
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
    return zzzb.getOverrideClickHandling();
  }
  
  public boolean getOverrideImpressionRecording()
  {
    return zzzb.getOverrideImpressionRecording();
  }
  
  public void recordImpression()
  {
    zzzb.recordImpression();
  }
  
  public void zzc(zzd paramZzd)
  {
    zzzb.handleClick((View)zze.zzp(paramZzd));
  }
  
  public void zzd(zzd paramZzd)
  {
    zzzb.trackView((View)zze.zzp(paramZzd));
  }
  
  public zzcj zzdw()
  {
    NativeAd.Image localImage = zzzb.getLogo();
    if (localImage != null) {
      return new zzc(localImage.getDrawable(), localImage.getUri());
    }
    return null;
  }
}
