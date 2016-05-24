package com.facebook.ads.internal.adapters;

import android.content.Context;
import com.facebook.ads.AdError;
import com.facebook.ads.NativeAd.Image;
import com.facebook.ads.internal.util.f;
import java.util.Map;
import org.json.JSONObject;

public class k
  extends p
{
  private Context a;
  private n b;
  
  public k() {}
  
  public void a(Context paramContext, q paramQ, Map<String, Object> paramMap)
  {
    b = n.a((JSONObject)paramMap.get("data"));
    a = paramContext;
    if ((b == null) || (f.a(paramContext, b)))
    {
      paramQ.a(this, AdError.NO_FILL);
      return;
    }
    if (paramQ != null) {
      paramQ.a(this);
    }
    com.facebook.ads.internal.util.b.a = b.v();
  }
  
  public void a(Map<String, Object> paramMap)
  {
    if (b == null) {
      return;
    }
    b.a(paramMap);
  }
  
  public void b(Map<String, Object> paramMap)
  {
    if (b == null) {
      return;
    }
    b.a(a, paramMap);
  }
  
  public boolean b()
  {
    return b.p();
  }
  
  public boolean d()
  {
    return b.q();
  }
  
  public int e()
  {
    return b.r();
  }
  
  public NativeAd.Image i()
  {
    if (!w()) {
      return null;
    }
    return b.e();
  }
  
  public void onDestroy() {}
  
  public String t()
  {
    if (!w()) {
      return null;
    }
    return b.l();
  }
  
  public String u()
  {
    if (!w()) {
      return null;
    }
    return b.m();
  }
  
  public String v()
  {
    if (!w()) {
      return null;
    }
    return b.n();
  }
  
  public boolean w()
  {
    return b != null;
  }
}
