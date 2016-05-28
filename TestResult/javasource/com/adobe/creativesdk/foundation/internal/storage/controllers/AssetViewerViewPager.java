package com.adobe.creativesdk.foundation.internal.storage.controllers;

import android.content.Context;
import android.support.v4.view.ViewPager;
import android.util.AttributeSet;
import android.view.MotionEvent;

public class AssetViewerViewPager
  extends ViewPager
{
  private boolean isLocked = false;
  
  public AssetViewerViewPager(Context paramContext)
  {
    super(paramContext);
  }
  
  public AssetViewerViewPager(Context paramContext, AttributeSet paramAttributeSet)
  {
    super(paramContext, paramAttributeSet);
  }
  
  public boolean onInterceptTouchEvent(MotionEvent paramMotionEvent)
  {
    boolean bool = false;
    if (!isLocked) {}
    try
    {
      bool = super.onInterceptTouchEvent(paramMotionEvent);
      return bool;
    }
    catch (IllegalArgumentException paramMotionEvent)
    {
      paramMotionEvent.printStackTrace();
    }
    return false;
  }
  
  public boolean onTouchEvent(MotionEvent paramMotionEvent)
  {
    if (!isLocked) {
      return super.onTouchEvent(paramMotionEvent);
    }
    return false;
  }
  
  public void setLocked(boolean paramBoolean)
  {
    isLocked = paramBoolean;
  }
}
