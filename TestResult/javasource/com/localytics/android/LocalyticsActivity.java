package com.localytics.android;

import android.app.Activity;
import android.os.Bundle;

public class LocalyticsActivity
  extends Activity
{
  protected LocalyticsSession mLocalyticsSession;
  
  public LocalyticsActivity() {}
  
  protected void onCreate(Bundle paramBundle)
  {
    super.onCreate(paramBundle);
    mLocalyticsSession = new LocalyticsSession(this);
    mLocalyticsSession.open();
    mLocalyticsSession.upload();
  }
  
  public void onPause()
  {
    mLocalyticsSession.close();
    mLocalyticsSession.upload();
    super.onPause();
  }
  
  public void onResume()
  {
    super.onResume();
    mLocalyticsSession.open();
    mLocalyticsSession.upload();
  }
}
