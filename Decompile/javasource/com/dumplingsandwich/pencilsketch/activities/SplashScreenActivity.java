package com.dumplingsandwich.pencilsketch.activities;

import android.app.Activity;
import android.content.Intent;
import android.os.Bundle;
import com.dumplingsandwich.pencilsketch.ads.AdmobInterstitialUtils;
import com.dumplingsandwich.pencilsketch.ads.FacebookInterstitialUtils;
import java.util.Timer;
import java.util.TimerTask;

public class SplashScreenActivity
  extends Activity
{
  private boolean timerCanceled;
  private Timer waitTimer;
  
  public SplashScreenActivity() {}
  
  private void startMainActivity()
  {
    startActivity(new Intent(this, MainActivity.class));
    finish();
  }
  
  protected void onCreate(Bundle paramBundle)
  {
    super.onCreate(paramBundle);
    requestWindowFeature(1);
    setContentView(2130903078);
    AdmobInterstitialUtils.initializeAdmobInterstitial(this);
    FacebookInterstitialUtils.initializeFacebookInterstitialAd(this);
    timerCanceled = false;
    waitTimer = new Timer();
    waitTimer.schedule(new TimerTask()
    {
      public void run()
      {
        runOnUiThread(new Runnable()
        {
          public void run()
          {
            SplashScreenActivity.this.startMainActivity();
          }
        });
      }
    }, 4500L);
  }
  
  public void onPause()
  {
    waitTimer.cancel();
    timerCanceled = true;
    super.onPause();
  }
  
  public void onResume()
  {
    super.onResume();
    if (timerCanceled) {
      startMainActivity();
    }
  }
}
