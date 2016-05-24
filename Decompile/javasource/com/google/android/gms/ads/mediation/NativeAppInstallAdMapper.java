package com.google.android.gms.ads.mediation;

import com.google.android.gms.ads.formats.NativeAd.Image;
import java.util.List;

public abstract class NativeAppInstallAdMapper
  extends NativeAdMapper
{
  private NativeAd.Image zzJE;
  private String zzvK;
  private List<NativeAd.Image> zzvL;
  private String zzvM;
  private String zzvO;
  private double zzvP;
  private String zzvQ;
  private String zzvR;
  
  public NativeAppInstallAdMapper() {}
  
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
  
  public final NativeAd.Image getIcon()
  {
    return zzJE;
  }
  
  public final List<NativeAd.Image> getImages()
  {
    return zzvL;
  }
  
  public final String getPrice()
  {
    return zzvR;
  }
  
  public final double getStarRating()
  {
    return zzvP;
  }
  
  public final String getStore()
  {
    return zzvQ;
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
  
  public final void setIcon(NativeAd.Image paramImage)
  {
    zzJE = paramImage;
  }
  
  public final void setImages(List<NativeAd.Image> paramList)
  {
    zzvL = paramList;
  }
  
  public final void setPrice(String paramString)
  {
    zzvR = paramString;
  }
  
  public final void setStarRating(double paramDouble)
  {
    zzvP = paramDouble;
  }
  
  public final void setStore(String paramString)
  {
    zzvQ = paramString;
  }
}
