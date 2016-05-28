package com.adobe.creativesdk.aviary.internal.graphics.drawable;

import android.graphics.Canvas;
import android.graphics.ColorFilter;
import android.graphics.PorterDuff.Mode;
import android.graphics.Rect;
import android.graphics.RectF;
import android.graphics.Region;
import android.graphics.drawable.Drawable;
import android.graphics.drawable.Drawable.Callback;

public abstract interface FeatherDrawable
{
  public abstract void clearColorFilter();
  
  public abstract Rect copyBounds();
  
  public abstract void copyBounds(Rect paramRect);
  
  public abstract void draw(Canvas paramCanvas);
  
  public abstract int getAlpha();
  
  public abstract Rect getBounds();
  
  public abstract int getChangingConfigurations();
  
  public abstract Drawable getCurrent();
  
  public abstract float getCurrentHeight();
  
  public abstract float getCurrentWidth();
  
  public abstract boolean getHorizontalFlip();
  
  public abstract boolean getHorizontalFlipEnabled();
  
  public abstract int getLevel();
  
  public abstract float getMinHeight();
  
  public abstract float getMinWidth();
  
  public abstract int getMinimumHeight();
  
  public abstract int getMinimumWidth();
  
  public abstract int getOpacity();
  
  public abstract boolean getPadding(Rect paramRect);
  
  public abstract float getScaleX();
  
  public abstract int[] getState();
  
  public abstract Region getTransparentRegion();
  
  public abstract void invalidateSelf();
  
  public abstract boolean isStateful();
  
  public abstract boolean isVisible();
  
  public abstract Drawable mutate();
  
  public abstract void scheduleSelf(Runnable paramRunnable, long paramLong);
  
  public abstract void setAlpha(int paramInt);
  
  public abstract void setBounds(int paramInt1, int paramInt2, int paramInt3, int paramInt4);
  
  public abstract void setBounds(Rect paramRect);
  
  public abstract void setCallback(Drawable.Callback paramCallback);
  
  public abstract void setChangingConfigurations(int paramInt);
  
  public abstract void setColorFilter(int paramInt, PorterDuff.Mode paramMode);
  
  public abstract void setColorFilter(ColorFilter paramColorFilter);
  
  public abstract void setDither(boolean paramBoolean);
  
  public abstract void setFilterBitmap(boolean paramBoolean);
  
  public abstract void setHorizontalFlip(boolean paramBoolean);
  
  public abstract boolean setLevel(int paramInt);
  
  public abstract void setMinSize(float paramFloat1, float paramFloat2);
  
  public abstract void setScaleX(float paramFloat);
  
  public abstract boolean setState(int[] paramArrayOfInt);
  
  public abstract boolean setVisible(boolean paramBoolean1, boolean paramBoolean2);
  
  public abstract void unscheduleSelf(Runnable paramRunnable);
  
  public abstract boolean validateSize(RectF paramRectF);
}
