package com.adobe.creativesdk.aviary.widget;

import android.content.Context;
import android.content.res.Configuration;
import android.os.Bundle;
import android.support.v4.app.Fragment;
import android.util.AttributeSet;
import android.view.View;
import android.view.ViewTreeObserver;
import android.view.ViewTreeObserver.OnGlobalLayoutListener;
import com.adobe.creativesdk.aviary.fragments.StoreFragment;
import com.adobe.creativesdk.aviary.internal.cds.PacksColumns.PackCursorWrapper;
import com.adobe.creativesdk.aviary.internal.tracking.AdobeImageAnalyticsTracker;
import com.adobe.creativesdk.aviary.internal.utils.ApiHelper;
import com.adobe.creativesdk.aviary.log.LoggerFactory.Logger;
import java.util.HashMap;

public class StoreDetailLayout
  extends PackDetailLayout
{
  public StoreDetailLayout(Context paramContext, AttributeSet paramAttributeSet)
  {
    super(paramContext, paramAttributeSet);
  }
  
  public Bundle getArguments()
  {
    if (mParent != null) {
      return mParent.getArguments();
    }
    return new Bundle();
  }
  
  public String getUUID()
  {
    return mParent.getUUID();
  }
  
  public boolean isValidContext()
  {
    return (getContext() != null) && (getParentFragment() != null);
  }
  
  protected void onConfigurationChanged(Configuration paramConfiguration)
  {
    logger.info("onConfigurationChanged");
    super.onConfigurationChanged(paramConfiguration);
    resetPositions();
    if (mPack != null)
    {
      mPreviewView.clearAll();
      mTextViewGroup.getViewTreeObserver().addOnGlobalLayoutListener(new ViewTreeObserver.OnGlobalLayoutListener()
      {
        public void onGlobalLayout()
        {
          if (ApiHelper.AT_LEAST_16) {
            mTextViewGroup.getViewTreeObserver().removeOnGlobalLayoutListener(this);
          }
          for (;;)
          {
            mPreviewView.loadPreviews(mPack, false, mTextViewGroup);
            return;
            mTextViewGroup.getViewTreeObserver().removeGlobalOnLayoutListener(this);
          }
        }
      });
    }
  }
  
  protected void onDetachedFromWindow()
  {
    mParent = null;
    super.onDetachedFromWindow();
  }
  
  protected void onForceUpdate()
  {
    update(getPackId(), false, null);
  }
  
  protected void onPackLoaded(PacksColumns.PackCursorWrapper paramPackCursorWrapper)
  {
    HashMap localHashMap = new HashMap();
    localHashMap.put("pack", paramPackCursorWrapper.getIdentifier());
    if (mParent != null)
    {
      if (mParent.getArguments().containsKey("extras-details-from")) {
        localHashMap.put("from", mParent.getArguments().getString("extras-details-from"));
      }
      if (mParent.getActivity() != null) {
        AdobeImageAnalyticsTracker.getInstance(mParent.getActivity()).tagEventAttributes("shop_details: opened", localHashMap);
      }
    }
  }
  
  protected boolean updateStatusBarColor()
  {
    boolean bool = false;
    if (mParent != null) {
      bool = ((Fragment)mParent).getArguments().getBoolean("updateStatusColor", false);
    }
    return bool;
  }
  
  protected boolean updateToolbarColor()
  {
    boolean bool = false;
    if (mParent != null) {
      bool = ((Fragment)mParent).getArguments().getBoolean("updateToolbarColor", false);
    }
    return bool;
  }
}
