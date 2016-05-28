package com.adobe.creativesdk.foundation.internal.common;

import android.content.Context;

public class AdobeCommonApplicationContextHolder
{
  static AdobeCommonApplicationContextHolder _staticApplicationContextHolder = null;
  private Context _applicationContext = null;
  
  private AdobeCommonApplicationContextHolder() {}
  
  public static AdobeCommonApplicationContextHolder getSharedApplicationContextHolder()
  {
    if (_staticApplicationContextHolder == null) {
      _staticApplicationContextHolder = new AdobeCommonApplicationContextHolder();
    }
    return _staticApplicationContextHolder;
  }
  
  public Context getApplicationContext()
  {
    return _applicationContext;
  }
  
  public void setApplicationContext(Context paramContext)
  {
    _applicationContext = paramContext.getApplicationContext();
  }
}
