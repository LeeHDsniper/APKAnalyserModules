package com.facebook.ads;

import android.widget.RelativeLayout;
import com.facebook.ads.internal.util.k;
import com.facebook.ads.internal.util.s;
import com.facebook.ads.internal.view.e;
import com.facebook.ads.internal.view.video.a;

public class MediaView
  extends RelativeLayout
{
  private final e a;
  private final a b;
  private boolean c;
  private boolean d;
  
  private boolean a(NativeAd paramNativeAd)
  {
    return !s.a(paramNativeAd.a());
  }
  
  public void setAutoplay(boolean paramBoolean)
  {
    d = paramBoolean;
    b.setAutoplay(paramBoolean);
  }
  
  public void setNativeAd(NativeAd paramNativeAd)
  {
    paramNativeAd.b(true);
    paramNativeAd.setMediaViewAutoplay(d);
    if (c)
    {
      a.a(null, null);
      b.b();
      c = false;
    }
    if (a(paramNativeAd))
    {
      a.setVisibility(4);
      b.setVisibility(0);
      bringChildToFront(b);
      c = true;
    }
    while (paramNativeAd.getAdCoverImage() == null) {
      try
      {
        b.setVideoPlayReportURI(paramNativeAd.b());
        b.setVideoTimeReportURI(paramNativeAd.c());
        b.setVideoURI(paramNativeAd.a());
        return;
      }
      catch (Exception paramNativeAd)
      {
        paramNativeAd.printStackTrace();
        return;
      }
    }
    b.a();
    b.setVisibility(4);
    a.setVisibility(0);
    bringChildToFront(a);
    c = true;
    new k(a).execute(new String[] { paramNativeAd.getAdCoverImage().getUrl() });
  }
}
