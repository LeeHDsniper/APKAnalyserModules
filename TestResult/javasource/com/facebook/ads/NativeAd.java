package com.facebook.ads;

import android.content.BroadcastReceiver;
import android.content.Context;
import android.content.Intent;
import android.view.View;
import com.facebook.ads.internal.adapters.o;
import com.facebook.ads.internal.adapters.p;
import com.facebook.ads.internal.c;
import java.lang.ref.WeakReference;
import java.util.HashMap;
import java.util.Map;
import java.util.WeakHashMap;
import org.json.JSONObject;

public class NativeAd
  implements Ad
{
  private static final c a = c.a;
  private static final String b = NativeAd.class.getSimpleName();
  private static WeakHashMap<View, WeakReference<NativeAd>> c = new WeakHashMap();
  private p j;
  private o p;
  private boolean v;
  private boolean w;
  
  String a()
  {
    if (!isAdLoaded()) {
      return null;
    }
    return j.t();
  }
  
  String b()
  {
    if (!isAdLoaded()) {
      return null;
    }
    return j.u();
  }
  
  void b(boolean paramBoolean)
  {
    v = paramBoolean;
  }
  
  String c()
  {
    if (!isAdLoaded()) {
      return null;
    }
    return j.v();
  }
  
  public Image getAdCoverImage()
  {
    if (!isAdLoaded()) {
      return null;
    }
    return j.i();
  }
  
  public boolean isAdLoaded()
  {
    return j != null;
  }
  
  public void setMediaViewAutoplay(boolean paramBoolean)
  {
    w = paramBoolean;
  }
  
  public static class Image
  {
    private final String a;
    private final int b;
    private final int c;
    
    private Image(String paramString, int paramInt1, int paramInt2)
    {
      a = paramString;
      b = paramInt1;
      c = paramInt2;
    }
    
    public static Image fromJSONObject(JSONObject paramJSONObject)
    {
      if (paramJSONObject == null) {}
      String str;
      do
      {
        return null;
        str = paramJSONObject.optString("url");
      } while (str == null);
      return new Image(str, paramJSONObject.optInt("width", 0), paramJSONObject.optInt("height", 0));
    }
    
    public String getUrl()
    {
      return a;
    }
  }
  
  public static class Rating
  {
    private final double a;
    private final double b;
    
    private Rating(double paramDouble1, double paramDouble2)
    {
      a = paramDouble1;
      b = paramDouble2;
    }
    
    public static Rating fromJSONObject(JSONObject paramJSONObject)
    {
      if (paramJSONObject == null) {}
      double d1;
      double d2;
      do
      {
        return null;
        d1 = paramJSONObject.optDouble("value", 0.0D);
        d2 = paramJSONObject.optDouble("scale", 0.0D);
      } while ((d1 == 0.0D) || (d2 == 0.0D));
      return new Rating(d1, d2);
    }
  }
  
  private class b
    extends BroadcastReceiver
  {
    public void onReceive(Context paramContext, Intent paramIntent)
    {
      paramContext = paramIntent.getAction().split(":")[0];
      if ("com.facebook.ads.native.impression".equals(paramContext)) {
        NativeAd.g(a).a();
      }
      while (!"com.facebook.ads.native.click".equals(paramContext)) {
        return;
      }
      paramContext = new HashMap();
      paramContext.put("mil", Boolean.valueOf(true));
      NativeAd.e(a).b(paramContext);
    }
  }
}
