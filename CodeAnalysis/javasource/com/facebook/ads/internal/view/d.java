package com.facebook.ads.internal.view;

import android.content.Context;
import android.webkit.WebView;

public class d
  extends WebView
{
  private boolean a;
  
  public d(Context paramContext)
  {
    super(paramContext);
  }
  
  public boolean b()
  {
    return a;
  }
  
  public void destroy()
  {
    a = true;
    super.destroy();
  }
}
