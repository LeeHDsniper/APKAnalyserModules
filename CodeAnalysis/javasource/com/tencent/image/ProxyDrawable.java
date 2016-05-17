package com.tencent.image;

import android.graphics.ColorFilter;
import android.graphics.Rect;
import android.graphics.drawable.Drawable;
import android.graphics.drawable.Drawable.Callback;

public abstract class ProxyDrawable
  extends Drawable
  implements Drawable.Callback
{
  protected Drawable mCurrDrawable;
  private boolean mMutated;
  
  public ProxyDrawable(Drawable paramDrawable)
  {
    if (paramDrawable == null) {
      throw new IllegalArgumentException("proxy drawable can't be null!");
    }
    mCurrDrawable = paramDrawable;
    mCurrDrawable.setCallback(this);
  }
  
  public int getChangingConfigurations()
  {
    return mCurrDrawable.getChangingConfigurations();
  }
  
  public int getIntrinsicHeight()
  {
    return mCurrDrawable.getIntrinsicHeight();
  }
  
  public int getIntrinsicWidth()
  {
    return mCurrDrawable.getIntrinsicWidth();
  }
  
  public int getMinimumHeight()
  {
    return mCurrDrawable.getMinimumHeight();
  }
  
  public int getMinimumWidth()
  {
    return mCurrDrawable.getMinimumWidth();
  }
  
  public int getOpacity()
  {
    return mCurrDrawable.getOpacity();
  }
  
  public boolean getPadding(Rect paramRect)
  {
    return mCurrDrawable.getPadding(paramRect);
  }
  
  public void invalidateDrawable(Drawable paramDrawable)
  {
    invalidateSelf();
  }
  
  public boolean isStateful()
  {
    return mCurrDrawable.isStateful();
  }
  
  public Drawable mutate()
  {
    if ((!mMutated) && (super.mutate() == this))
    {
      mCurrDrawable.mutate();
      mMutated = true;
    }
    return this;
  }
  
  protected void onBoundsChange(Rect paramRect)
  {
    if (mCurrDrawable != null) {
      mCurrDrawable.setBounds(paramRect);
    }
  }
  
  protected boolean onLevelChange(int paramInt)
  {
    return mCurrDrawable.setLevel(paramInt);
  }
  
  protected boolean onStateChange(int[] paramArrayOfInt)
  {
    return mCurrDrawable.setState(paramArrayOfInt);
  }
  
  public void scheduleDrawable(Drawable paramDrawable, Runnable paramRunnable, long paramLong)
  {
    scheduleSelf(paramRunnable, paramLong);
  }
  
  public void setAlpha(int paramInt)
  {
    mCurrDrawable.setAlpha(paramInt);
  }
  
  public void setColorFilter(ColorFilter paramColorFilter)
  {
    if (mCurrDrawable != null) {
      mCurrDrawable.setColorFilter(paramColorFilter);
    }
  }
  
  public void setDither(boolean paramBoolean)
  {
    mCurrDrawable.setDither(paramBoolean);
  }
  
  public void unscheduleDrawable(Drawable paramDrawable, Runnable paramRunnable)
  {
    unscheduleSelf(paramRunnable);
  }
}
