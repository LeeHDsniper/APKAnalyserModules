package com.adobe.creativesdk.aviary.widget;

import android.content.Context;
import android.util.AttributeSet;
import android.view.MotionEvent;
import android.view.ViewConfiguration;
import com.adobe.creativesdk.aviary.internal.events.HistoryUndoRedoEvent;
import com.adobe.creativesdk.aviary.log.LoggerFactory;
import com.adobe.creativesdk.aviary.log.LoggerFactory.Logger;
import com.adobe.creativesdk.aviary.utils.EventBusUtils;
import de.greenrobot.event.EventBus;
import it.sephiroth.android.library.imagezoom.ImageViewTouch;

public class AdobeImageViewUndoRedo
  extends ImageViewTouch
{
  static LoggerFactory.Logger logger = LoggerFactory.getLogger("AdobeImageViewUndoRedo");
  private boolean mIsActive;
  private int mMaxFling;
  private int mMinFling;
  private int mUndoMinFling = 500;
  
  public AdobeImageViewUndoRedo(Context paramContext)
  {
    this(paramContext, null);
  }
  
  public AdobeImageViewUndoRedo(Context paramContext, AttributeSet paramAttributeSet)
  {
    this(paramContext, paramAttributeSet, 0);
  }
  
  public AdobeImageViewUndoRedo(Context paramContext, AttributeSet paramAttributeSet, int paramInt)
  {
    super(paramContext, paramAttributeSet, paramInt);
  }
  
  private boolean isValidScale()
  {
    return Math.abs(getScale() - getMinScale()) < 0.1D;
  }
  
  public boolean getIsActive()
  {
    return mIsActive;
  }
  
  protected void init(Context paramContext, AttributeSet paramAttributeSet, int paramInt)
  {
    super.init(paramContext, paramAttributeSet, paramInt);
    mMinFling = ViewConfiguration.get(paramContext).getScaledMinimumFlingVelocity();
    mMaxFling = ViewConfiguration.get(paramContext).getScaledMaximumFlingVelocity();
    mUndoMinFling = ((int)(mMinFling * 2.0D));
    logger.verbose("minFling: %d, maxFling: %d, undoFling: %d", new Object[] { Integer.valueOf(mMinFling), Integer.valueOf(mMaxFling), Integer.valueOf(mUndoMinFling) });
  }
  
  public boolean onFling(MotionEvent paramMotionEvent1, MotionEvent paramMotionEvent2, float paramFloat1, float paramFloat2)
  {
    if (getDrawable() == null) {}
    while (!isShown()) {
      return false;
    }
    logger.info("onFling: %f", new Object[] { Float.valueOf(paramFloat1) });
    if ((mIsActive) && (isValidScale()) && (Math.abs(paramFloat1) > mUndoMinFling) && (Math.abs(paramFloat1) > Math.abs(paramFloat2)))
    {
      if (paramFloat1 < 0.0F) {
        EventBusUtils.getInstance().post(new HistoryUndoRedoEvent(false));
      }
      for (;;)
      {
        return true;
        EventBusUtils.getInstance().post(new HistoryUndoRedoEvent(true));
      }
    }
    return super.onFling(paramMotionEvent1, paramMotionEvent2, paramFloat1, paramFloat2);
  }
  
  public void setIsActive(boolean paramBoolean)
  {
    mIsActive = paramBoolean;
  }
}
