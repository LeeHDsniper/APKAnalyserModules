package com.adobe.creativesdk.aviary.graphics;

import android.content.Context;
import android.content.res.ColorStateList;
import android.content.res.Resources.Theme;
import android.content.res.TypedArray;
import android.graphics.Canvas;
import android.graphics.ColorFilter;
import android.graphics.Paint;
import android.graphics.Paint.Style;
import android.graphics.Rect;
import android.graphics.drawable.Drawable;
import com.aviary.android.feather.sdk.R.style;
import com.aviary.android.feather.sdk.R.styleable;

public class PreviewSpotDrawable
  extends Drawable
{
  protected final int mBackgroundColor;
  protected final int mBackgroundColorSelected;
  private int mBackgroundRadius;
  protected boolean mChecked;
  private int mColor;
  protected float mDrawRadius;
  protected final Rect mDstRect = new Rect();
  private int mPadding;
  protected final Paint mPaint;
  protected boolean mPressed;
  protected float mRadius;
  private boolean mRadiusDirty;
  protected boolean mRadiusFixed;
  protected final int mStrokeColor;
  protected int mStrokeColorChecked;
  protected final int mStrokeWidth;
  private Paint.Style mStyle;
  
  public PreviewSpotDrawable(Context paramContext)
  {
    paramContext = paramContext.getTheme().obtainStyledAttributes(null, R.styleable.AdobeImagePreviewSpotDrawable, 0, R.style.AdobeImageWidget_StrokePreviewSpotStyle);
    mStrokeWidth = paramContext.getDimensionPixelSize(R.styleable.AdobeImagePreviewSpotDrawable_adobe_strokeSize, 20);
    mStrokeColorChecked = paramContext.getColor(R.styleable.AdobeImagePreviewSpotDrawable_adobe_strokeColorSelected, -1);
    mStrokeColor = paramContext.getColor(R.styleable.AdobeImagePreviewSpotDrawable_adobe_strokeColor, -16777216);
    mBackgroundColor = paramContext.getColor(R.styleable.AdobeImagePreviewSpotDrawable_adobe_backgroundColor, 0);
    mBackgroundColorSelected = paramContext.getColor(R.styleable.AdobeImagePreviewSpotDrawable_adobe_backgroundColorSelected, 0);
    mRadius = paramContext.getFloat(R.styleable.AdobeImagePreviewSpotDrawable_adobe_radius, 0.5F);
    mPadding = paramContext.getDimensionPixelSize(R.styleable.AdobeImagePreviewSpotDrawable_android_padding, 2);
    mStyle = Paint.Style.STROKE;
    paramContext.recycle();
    mPaint = new Paint(7);
    mPaint.setStyle(Paint.Style.STROKE);
    mPaint.setStrokeWidth(mStrokeWidth);
    mDrawRadius = mRadius;
    mRadiusDirty = true;
  }
  
  private void evaluateRadius(Rect paramRect)
  {
    int i = Math.min(paramRect.width(), paramRect.height());
    if (!mRadiusFixed) {}
    for (mDrawRadius = (i / 2 * mRadius);; mDrawRadius = mRadius)
    {
      mBackgroundRadius = ((int)(i / 2 - mPadding * 1.75D));
      mRadiusDirty = false;
      return;
    }
  }
  
  public void draw(Canvas paramCanvas)
  {
    copyBounds(mDstRect);
    if (mRadiusDirty) {
      evaluateRadius(mDstRect);
    }
    drawBackground(paramCanvas);
    drawForeground(paramCanvas);
  }
  
  protected void drawBackground(Canvas paramCanvas)
  {
    if (mChecked) {}
    for (int i = mBackgroundColorSelected;; i = mBackgroundColor)
    {
      if (i != 0)
      {
        mPaint.setStyle(Paint.Style.FILL);
        mPaint.setColor(i);
        paramCanvas.drawCircle(mDstRect.centerX(), mDstRect.centerY(), mBackgroundRadius, mPaint);
      }
      return;
    }
  }
  
  protected void drawForeground(Canvas paramCanvas)
  {
    mPaint.setStyle(mStyle);
    if (mStyle == Paint.Style.FILL)
    {
      mPaint.setColor(mColor);
      paramCanvas.drawCircle(mDstRect.centerX(), mDstRect.centerY(), mDrawRadius, mPaint);
      return;
    }
    Paint localPaint = mPaint;
    if (mChecked) {}
    for (int i = mStrokeColorChecked;; i = mStrokeColor)
    {
      localPaint.setColor(i);
      break;
    }
  }
  
  public int getOpacity()
  {
    return -3;
  }
  
  public boolean isStateful()
  {
    return true;
  }
  
  protected void onBoundsChange(Rect paramRect)
  {
    super.onBoundsChange(paramRect);
    evaluateRadius(paramRect);
  }
  
  protected boolean onStateChange(int[] paramArrayOfInt)
  {
    boolean bool1 = false;
    boolean bool3 = mChecked;
    boolean bool2 = mPressed;
    mChecked = false;
    mPressed = false;
    int i = 0;
    while (i < paramArrayOfInt.length)
    {
      if (paramArrayOfInt[i] == 16842919) {
        mPressed = true;
      }
      if ((paramArrayOfInt[i] == 16842913) || (paramArrayOfInt[i] == 16842912)) {
        mChecked = true;
      }
      i += 1;
    }
    if ((bool3 != mChecked) || (bool2 != mPressed)) {
      bool1 = true;
    }
    return bool1;
  }
  
  public void setAlpha(int paramInt) {}
  
  public void setColor(int paramInt)
  {
    if (mColor != paramInt)
    {
      mColor = paramInt;
      invalidateSelf();
    }
  }
  
  public void setColorFilter(ColorFilter paramColorFilter) {}
  
  public void setRadius(float paramFloat)
  {
    if (mRadius != paramFloat)
    {
      mRadius = paramFloat;
      mRadiusDirty = true;
      invalidateSelf();
    }
  }
  
  public void setSelectedTint(int paramInt)
  {
    mStrokeColorChecked = paramInt;
    invalidateSelf();
  }
  
  public void setStyle(Paint.Style paramStyle)
  {
    if (mStyle != paramStyle)
    {
      mStyle = paramStyle;
      invalidateSelf();
    }
  }
  
  public void setTintList(ColorStateList paramColorStateList)
  {
    super.setTintList(paramColorStateList);
    int i = mStrokeColorChecked;
    mStrokeColorChecked = paramColorStateList.getColorForState(new int[] { 0 }, i);
    invalidateSelf();
  }
}
