package com.adobe.creativesdk.aviary.internal.utils;

import android.content.Context;
import android.content.res.Resources;
import com.aviary.android.feather.sdk.R.bool;

public final class ScreenUtils
{
  private static boolean mIsTablet;
  private static boolean mIsTabletChecked;
  
  public static boolean isTablet(Context paramContext)
  {
    if (!mIsTabletChecked)
    {
      mIsTablet = paramContext.getResources().getBoolean(R.bool.com_adobe_image_is_tablet);
      mIsTabletChecked = true;
    }
    return mIsTablet;
  }
}
