package com.facebook.ads.internal.view;

import android.content.Intent;
import android.os.Bundle;
import android.widget.RelativeLayout.LayoutParams;
import com.facebook.ads.InterstitialAdActivity;

public class m
  implements h
{
  private g a;
  
  public m(InterstitialAdActivity paramInterstitialAdActivity, h.a paramA)
  {
    a = new g(paramInterstitialAdActivity);
    paramInterstitialAdActivity = new RelativeLayout.LayoutParams(-1, -2);
    paramInterstitialAdActivity.addRule(15);
    a.setLayoutParams(paramInterstitialAdActivity);
    paramA.a(a);
  }
  
  public void a() {}
  
  public void a(Intent paramIntent, Bundle paramBundle)
  {
    paramBundle = paramIntent.getStringExtra("videoURL");
    String str = paramIntent.getStringExtra("videoPlayReportURL");
    paramIntent = paramIntent.getStringExtra("videoTimeReportURL");
    a.setVideoPlayReportURI(str);
    a.setVideoTimeReportURI(paramIntent);
    a.setVideoURI(paramBundle);
    a.a();
  }
  
  public void a(Bundle paramBundle) {}
  
  public void b() {}
  
  public void c()
  {
    a.b();
  }
}
