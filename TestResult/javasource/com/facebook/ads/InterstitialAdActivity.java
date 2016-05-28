package com.facebook.ads;

import android.app.Activity;
import android.content.Intent;
import android.os.Bundle;
import android.support.v4.content.LocalBroadcastManager;
import android.view.Display;
import android.view.View;
import android.view.View.OnClickListener;
import android.view.Window;
import android.view.WindowManager;
import android.widget.RelativeLayout;
import android.widget.RelativeLayout.LayoutParams;
import com.facebook.ads.internal.g;
import com.facebook.ads.internal.view.f;
import com.facebook.ads.internal.view.h;
import com.facebook.ads.internal.view.h.a;
import com.facebook.ads.internal.view.m;

public class InterstitialAdActivity
  extends Activity
{
  private RelativeLayout a;
  private g b;
  private int c;
  private int d;
  private int e;
  private boolean f = false;
  private String g;
  private h h;
  private int i = -1;
  
  public InterstitialAdActivity() {}
  
  private void a(int paramInt1, int paramInt2)
  {
    if (paramInt2 >= paramInt1) {}
    for (paramInt1 = 1;; paramInt1 = 0)
    {
      paramInt2 = ((WindowManager)getSystemService("window")).getDefaultDisplay().getRotation();
      if (paramInt1 == 0) {
        break;
      }
      switch (paramInt2)
      {
      default: 
        setRequestedOrientation(1);
        return;
      }
    }
    setRequestedOrientation(9);
    return;
    switch (paramInt2)
    {
    default: 
      setRequestedOrientation(0);
      return;
    }
    setRequestedOrientation(8);
  }
  
  private void a(Intent paramIntent, Bundle paramBundle)
  {
    if (paramBundle != null)
    {
      c = paramBundle.getInt("lastRequestedOrientation", -1);
      g = paramBundle.getString("adInterstitialUniqueId");
      h.a(paramIntent, paramBundle);
      f = true;
      return;
    }
    d = paramIntent.getIntExtra("displayWidth", 0);
    e = paramIntent.getIntExtra("displayHeight", 0);
    g = paramIntent.getStringExtra("adInterstitialUniqueId");
    h.a(paramIntent, paramBundle);
  }
  
  private void a(String paramString)
  {
    paramString = new Intent(paramString + ":" + g);
    LocalBroadcastManager.getInstance(this).sendBroadcast(paramString);
  }
  
  public void finish()
  {
    a.removeAllViews();
    h.c();
    a("com.facebook.ads.interstitial.dismissed");
    super.finish();
  }
  
  public void onCreate(Bundle paramBundle)
  {
    super.onCreate(paramBundle);
    requestWindowFeature(1);
    getWindow().setFlags(1024, 1024);
    a = new RelativeLayout(this);
    a.setBackgroundColor(-16777216);
    setContentView(a, new RelativeLayout.LayoutParams(-1, -1));
    Intent localIntent = getIntent();
    if (localIntent.getBooleanExtra("useNativeCloseButton", false))
    {
      b = new g(this);
      b.setId(100002);
      b.setOnClickListener(new View.OnClickListener()
      {
        public void onClick(View paramAnonymousView)
        {
          finish();
        }
      });
    }
    Type localType = (Type)localIntent.getSerializableExtra("viewType");
    switch (4.a[localType.ordinal()])
    {
    }
    for (h = new f(this, new h.a()
        {
          public void a(View paramAnonymousView)
          {
            InterstitialAdActivity.a(InterstitialAdActivity.this).addView(paramAnonymousView);
            if (InterstitialAdActivity.b(InterstitialAdActivity.this) != null) {
              InterstitialAdActivity.a(InterstitialAdActivity.this).addView(InterstitialAdActivity.b(InterstitialAdActivity.this));
            }
          }
          
          public void a(String paramAnonymousString)
          {
            InterstitialAdActivity.a(InterstitialAdActivity.this, paramAnonymousString);
          }
        });; h = new m(this, new h.a()
        {
          public void a(View paramAnonymousView)
          {
            InterstitialAdActivity.a(InterstitialAdActivity.this).addView(paramAnonymousView);
            if (InterstitialAdActivity.b(InterstitialAdActivity.this) != null) {
              InterstitialAdActivity.a(InterstitialAdActivity.this).addView(InterstitialAdActivity.b(InterstitialAdActivity.this));
            }
          }
          
          public void a(String paramAnonymousString)
          {
            InterstitialAdActivity.a(InterstitialAdActivity.this, paramAnonymousString);
          }
        }))
    {
      i = localIntent.getIntExtra("predefinedOrientationKey", -1);
      a(localIntent, paramBundle);
      a("com.facebook.ads.interstitial.displayed");
      return;
    }
  }
  
  public void onPause()
  {
    super.onPause();
    h.a();
  }
  
  public void onRestart()
  {
    super.onRestart();
    f = true;
  }
  
  public void onResume()
  {
    super.onResume();
    h.b();
  }
  
  public void onSaveInstanceState(Bundle paramBundle)
  {
    super.onSaveInstanceState(paramBundle);
    h.a(paramBundle);
    paramBundle.putInt("lastRequestedOrientation", c);
    paramBundle.putString("adInterstitialUniqueId", g);
  }
  
  public void onStart()
  {
    super.onStart();
    if (i != -1) {
      setRequestedOrientation(i);
    }
    for (;;)
    {
      f = false;
      return;
      if ((d != 0) && (e != 0)) {
        if (!f)
        {
          a(d, e);
        }
        else if (c >= 0)
        {
          setRequestedOrientation(c);
          c = -1;
        }
      }
    }
  }
  
  public void setRequestedOrientation(int paramInt)
  {
    c = paramInt;
    super.setRequestedOrientation(paramInt);
  }
  
  public static enum Type
  {
    private Type() {}
  }
}
