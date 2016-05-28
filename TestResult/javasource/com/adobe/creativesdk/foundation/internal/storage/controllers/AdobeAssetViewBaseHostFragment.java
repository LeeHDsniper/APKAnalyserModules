package com.adobe.creativesdk.foundation.internal.storage.controllers;

import android.os.Bundle;
import android.support.v4.app.Fragment;

public class AdobeAssetViewBaseHostFragment
  extends Fragment
{
  private boolean _shouldUseDropDownActionBar = true;
  
  public AdobeAssetViewBaseHostFragment() {}
  
  public void onCreate(Bundle paramBundle)
  {
    super.onCreate(paramBundle);
  }
  
  public void onDestroy()
  {
    super.onDestroy();
  }
  
  public void onDestroyView()
  {
    super.onDestroyView();
  }
  
  public void onResume()
  {
    super.onResume();
  }
  
  public void onStart()
  {
    super.onStart();
  }
  
  public void onStop()
  {
    super.onStop();
  }
  
  protected void setShouldUseDropDownActionBar(boolean paramBoolean)
  {
    _shouldUseDropDownActionBar = paramBoolean;
  }
  
  protected boolean useDropDownActionBar()
  {
    return _shouldUseDropDownActionBar;
  }
}
