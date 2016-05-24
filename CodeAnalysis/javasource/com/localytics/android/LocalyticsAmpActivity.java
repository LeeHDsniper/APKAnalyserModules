package com.localytics.android;

import android.os.Bundle;
import android.support.v4.app.FragmentActivity;

public class LocalyticsAmpActivity
  extends FragmentActivity
{
  protected LocalyticsAmpSession mLocalyticsSession;
  
  public LocalyticsAmpActivity() {}
  
  protected void onCreate(Bundle paramBundle)
  {
    super.onCreate(paramBundle);
    mLocalyticsSession = new LocalyticsAmpSession(this);
    mLocalyticsSession.open();
    mLocalyticsSession.upload();
  }
  
  public void onPause()
  {
    mLocalyticsSession.detach();
    mLocalyticsSession.close();
    mLocalyticsSession.upload();
    super.onPause();
  }
  
  public void onResume()
  {
    super.onResume();
    mLocalyticsSession.open();
    mLocalyticsSession.upload();
    mLocalyticsSession.attach(this);
  }
}
