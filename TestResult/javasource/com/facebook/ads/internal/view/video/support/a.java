package com.facebook.ads.internal.view.video.support;

import android.content.Context;
import android.net.Uri;
import android.os.Build.VERSION;
import android.view.View;
import android.widget.FrameLayout;

public class a
  extends FrameLayout
{
  private e a;
  private f b;
  private View c;
  private Uri d;
  private Context e;
  
  public void a()
  {
    a.start();
  }
  
  public int getCurrentPosition()
  {
    return a.getCurrentPosition();
  }
  
  public View getPlaceholderView()
  {
    return c;
  }
  
  public f getVideoImplType()
  {
    return b;
  }
  
  public void setFrameVideoViewListener(b paramB)
  {
    a.setFrameVideoViewListener(paramB);
  }
  
  public void setVideoImpl(f paramF)
  {
    removeAllViews();
    f localF = paramF;
    if (paramF == f.a)
    {
      localF = paramF;
      if (Build.VERSION.SDK_INT < 14) {
        localF = f.b;
      }
    }
    b = localF;
    switch (1.a[localF.ordinal()])
    {
    }
    for (;;)
    {
      addView(c);
      a();
      return;
      paramF = new d(e);
      paramF.a(c, d);
      addView(paramF);
      a = paramF;
      continue;
      paramF = new g(e);
      paramF.a(c, d);
      addView(paramF);
      a = paramF;
    }
  }
  
  public void setup(Uri paramUri)
  {
    d = paramUri;
    a.a(c, paramUri);
  }
}
