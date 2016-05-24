package com.google.android.gms.ads.mediation;

import com.google.android.gms.ads.formats.NativeAd.Image;
import java.util.List;

public abstract class NativeContentAdMapper
  extends NativeAdMapper
{
  private NativeAd.Image zzJF;
  private String zzvK;
  private List<NativeAd.Image> zzvL;
  private String zzvM;
  private String zzvO;
  private String zzvV;
  
  public NativeContentAdMapper() {}
  
  public final String getAdvertiser()
  {
    return zzvV;
  }
  
  public final String getBody()
  {
    return zzvM;
  }
  
  public final String getCallToAction()
  {
    return zzvO;
  }
  
  public final String getHeadline()
  {
    return zzvK;
  }
  
  public final List<NativeAd.Image> getImages()
  {
    return zzvL;
  }
  
  public final NativeAd.Image getLogo()
  {
    return zzJF;
  }
  
  public final void setAdvertiser(String paramString)
  {
    zzvV = paramString;
  }
  
  public final void setBody(String paramString)
  {
    zzvM = paramString;
  }
  
  public final void setCallToAction(String paramString)
  {
    zzvO = paramString;
  }
  
  public final void setHeadline(String paramString)
  {
    zzvK = paramString;
  }
  
  public final void setImages(List<NativeAd.Image> paramList)
  {
    zzvL = paramList;
  }
  
  public final void setLogo(NativeAd.Image paramImage)
  {
    zzJF = paramImage;
  }
}
