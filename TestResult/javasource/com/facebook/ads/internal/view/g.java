package com.facebook.ads.internal.view;

import android.content.Context;
import android.net.Uri;
import android.os.Handler;
import android.view.ViewGroup.LayoutParams;
import android.widget.LinearLayout;
import android.widget.MediaController;
import android.widget.RelativeLayout.LayoutParams;
import android.widget.VideoView;
import com.facebook.ads.internal.util.o;
import com.facebook.ads.internal.util.u;
import java.util.HashMap;

public class g
  extends LinearLayout
{
  private VideoView a;
  private String b;
  private String c;
  private boolean d;
  private int e;
  private Handler f;
  private Handler g;
  
  public g(Context paramContext)
  {
    super(paramContext);
    c();
  }
  
  private void c()
  {
    Object localObject = new MediaController(getContext());
    a = new VideoView(getContext());
    ((MediaController)localObject).setAnchorView(this);
    a.setMediaController((MediaController)localObject);
    localObject = new RelativeLayout.LayoutParams(-1, -1);
    ((RelativeLayout.LayoutParams)localObject).addRule(11, -1);
    ((RelativeLayout.LayoutParams)localObject).addRule(9, -1);
    ((RelativeLayout.LayoutParams)localObject).addRule(10, -1);
    ((RelativeLayout.LayoutParams)localObject).addRule(12, -1);
    ((RelativeLayout.LayoutParams)localObject).addRule(13);
    a.setLayoutParams((ViewGroup.LayoutParams)localObject);
    addView(a);
    g = new Handler();
    localObject = new b(this);
    g.postDelayed((Runnable)localObject, 250L);
    f = new Handler();
    localObject = new a(this);
    f.postDelayed((Runnable)localObject, 250L);
  }
  
  private void d()
  {
    if ((!d) && (getVideoTimeReportURI() != null))
    {
      HashMap localHashMap = new HashMap();
      localHashMap.put("time", Integer.toString(e / 1000));
      localHashMap.put("inline", "0");
      new o(localHashMap).execute(new String[] { getVideoTimeReportURI() });
      d = true;
      e = 0;
    }
  }
  
  public void a()
  {
    a.start();
  }
  
  public void b()
  {
    if (a != null) {
      a.stopPlayback();
    }
  }
  
  public String getVideoPlayReportURI()
  {
    return b;
  }
  
  public String getVideoTimeReportURI()
  {
    return c;
  }
  
  protected void onDetachedFromWindow()
  {
    super.onDetachedFromWindow();
    d();
  }
  
  public void setVideoPlayReportURI(String paramString)
  {
    b = paramString;
  }
  
  public void setVideoTimeReportURI(String paramString)
  {
    c = paramString;
  }
  
  public void setVideoURI(Uri paramUri)
  {
    if (paramUri != null) {
      a.setVideoURI(paramUri);
    }
  }
  
  public void setVideoURI(String paramString)
  {
    if (paramString != null) {
      setVideoURI(Uri.parse(paramString));
    }
  }
  
  private static final class a
    extends u<g>
  {
    public a(g paramG)
    {
      super();
    }
    
    public void run()
    {
      g localG = (g)a();
      if (localG != null)
      {
        if (g.a(localG).getCurrentPosition() > 3000) {
          new o().execute(new String[] { localG.getVideoPlayReportURI() });
        }
      }
      else {
        return;
      }
      g.d(localG).postDelayed(this, 250L);
    }
  }
  
  private static final class b
    extends u<g>
  {
    public b(g paramG)
    {
      super();
    }
    
    public void run()
    {
      g localG = (g)a();
      if (localG != null)
      {
        int i = g.a(localG).getCurrentPosition();
        if (i > g.b(localG)) {
          g.a(localG, i);
        }
        g.c(localG).postDelayed(this, 250L);
      }
    }
  }
}
