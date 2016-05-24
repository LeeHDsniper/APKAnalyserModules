package com.facebook.ads.internal.view.video;

import android.net.Uri;
import android.view.View.OnClickListener;
import android.view.View.OnTouchListener;
import android.widget.FrameLayout;
import com.facebook.ads.internal.adapters.e;
import com.facebook.ads.internal.util.o;
import java.util.HashMap;

public class a
  extends FrameLayout
{
  private com.facebook.ads.internal.view.video.support.a a;
  private e b;
  private String d;
  private String e;
  private String f;
  private boolean g;
  private boolean h;
  private int i;
  private float n;
  
  private void f()
  {
    if ((!h) && (getVideoTimeReportURI() != null))
    {
      HashMap localHashMap = new HashMap();
      localHashMap.put("time", Integer.toString(i / 1000));
      localHashMap.put("inline", "1");
      new o(localHashMap).execute(new String[] { getVideoTimeReportURI() });
      h = true;
      i = 0;
    }
  }
  
  private void setOnClickListenerInternal(View.OnClickListener paramOnClickListener)
  {
    super.setOnClickListener(paramOnClickListener);
  }
  
  private void setOnTouchListenerInternal(View.OnTouchListener paramOnTouchListener)
  {
    super.setOnTouchListener(paramOnTouchListener);
  }
  
  public void a()
  {
    if (i > 0)
    {
      f();
      i = 0;
    }
  }
  
  public void b()
  {
    d = null;
  }
  
  public boolean getAutoplay()
  {
    return g;
  }
  
  public String getVideoPlayReportURI()
  {
    return e;
  }
  
  public String getVideoTimeReportURI()
  {
    return f;
  }
  
  public String getVideoURI()
  {
    return d;
  }
  
  float getVolume()
  {
    return n;
  }
  
  protected void onAttachedToWindow()
  {
    super.onAttachedToWindow();
    b.a();
  }
  
  protected void onDetachedFromWindow()
  {
    super.onDetachedFromWindow();
    f();
    b.b();
  }
  
  public void setAutoplay(boolean paramBoolean)
  {
    g = paramBoolean;
  }
  
  public void setOnClickListener(View.OnClickListener paramOnClickListener) {}
  
  public void setOnTouchListener(View.OnTouchListener paramOnTouchListener) {}
  
  public void setVideoPlayReportURI(String paramString)
  {
    e = paramString;
  }
  
  public void setVideoTimeReportURI(String paramString)
  {
    a();
    f = paramString;
  }
  
  public void setVideoURI(String paramString)
  {
    d = paramString;
    if (paramString != null)
    {
      a.setup(Uri.parse(paramString));
      if (g) {
        a.a();
      }
    }
  }
  
  void setVolume(float paramFloat)
  {
    n = paramFloat;
  }
}
