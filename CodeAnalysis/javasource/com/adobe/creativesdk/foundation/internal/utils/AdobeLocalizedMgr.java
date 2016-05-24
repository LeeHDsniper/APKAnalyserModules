package com.adobe.creativesdk.foundation.internal.utils;

import android.content.Context;
import android.content.res.Resources;
import com.adobe.creativesdk.foundation.internal.common.AdobeCommonApplicationContextHolder;

public class AdobeLocalizedMgr
{
  public static String getLocalizedString(int paramInt)
  {
    return AdobeCommonApplicationContextHolder.getSharedApplicationContextHolder().getApplicationContext().getResources().getString(paramInt);
  }
}
