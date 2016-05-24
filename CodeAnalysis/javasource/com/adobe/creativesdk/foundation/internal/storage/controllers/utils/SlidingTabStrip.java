package com.adobe.creativesdk.foundation.internal.storage.controllers.utils;

import android.content.Context;
import android.content.res.Resources;
import android.content.res.Resources.Theme;
import android.graphics.Canvas;
import android.graphics.Color;
import android.graphics.Paint;
import android.util.AttributeSet;
import android.util.DisplayMetrics;
import android.util.TypedValue;
import android.view.View;
import android.widget.LinearLayout;
import android.widget.TextView;

class SlidingTabStrip
  extends LinearLayout
{
  private final Paint mBottomBorderPaint;
  private final int mBottomBorderThickness;
  private SlidingTabLayout.TabColorizer mCustomTabColorizer;
  private final int mDefaultBottomBorderColor;
  private final SimpleTabColorizer mDefaultTabColorizer;
  private final Paint mSelectedIndicatorPaint;
  private final int mSelectedIndicatorThickness;
  private int mSelectedPosition;
  private float mSelectionOffset;
  private int mTextViewId;
  private int mViewId;
  
  SlidingTabStrip(Context paramContext)
  {
    this(paramContext, null);
  }
  
  SlidingTabStrip(Context paramContext, AttributeSet paramAttributeSet)
  {
    super(paramContext, paramAttributeSet);
    setWillNotDraw(false);
    float f = getResourcesgetDisplayMetricsdensity;
    paramAttributeSet = new TypedValue();
    paramContext.getTheme().resolveAttribute(16842800, paramAttributeSet, true);
    mDefaultBottomBorderColor = setColorAlpha(data, (byte)38);
    mDefaultTabColorizer = new SimpleTabColorizer(null);
    mDefaultTabColorizer.setIndicatorColors(new int[] { -13388315 });
    mBottomBorderThickness = ((int)(0.0F * f));
    mBottomBorderPaint = new Paint();
    mBottomBorderPaint.setColor(mDefaultBottomBorderColor);
    mSelectedIndicatorThickness = ((int)(3.0F * f));
    mSelectedIndicatorPaint = new Paint();
  }
  
  private static int blendColors(int paramInt1, int paramInt2, float paramFloat)
  {
    float f1 = 1.0F - paramFloat;
    float f2 = Color.red(paramInt1);
    float f3 = Color.red(paramInt2);
    float f4 = Color.green(paramInt1);
    float f5 = Color.green(paramInt2);
    float f6 = Color.blue(paramInt1);
    float f7 = Color.blue(paramInt2);
    return Color.rgb((int)(f2 * paramFloat + f3 * f1), (int)(f4 * paramFloat + f5 * f1), (int)(f6 * paramFloat + f7 * f1));
  }
  
  private static int setColorAlpha(int paramInt, byte paramByte)
  {
    return Color.argb(paramByte, Color.red(paramInt), Color.green(paramInt), Color.blue(paramInt));
  }
  
  protected void onDraw(Canvas paramCanvas)
  {
    int i2 = getHeight();
    int i = getChildCount();
    if (mCustomTabColorizer != null) {}
    for (Object localObject = mCustomTabColorizer;; localObject = mDefaultTabColorizer)
    {
      if (i > 0)
      {
        View localView = getChildAt(mSelectedPosition);
        int i1 = localView.getLeft();
        int n = localView.getRight();
        int j = ((SlidingTabLayout.TabColorizer)localObject).getIndicatorColor(mSelectedPosition);
        i = j;
        int m = i1;
        int k = n;
        if (mSelectionOffset > 0.0F)
        {
          i = j;
          m = i1;
          k = n;
          if (mSelectedPosition < getChildCount() - 1)
          {
            k = ((SlidingTabLayout.TabColorizer)localObject).getIndicatorColor(mSelectedPosition + 1);
            i = j;
            if (j != k) {
              i = blendColors(k, j, mSelectionOffset);
            }
            localObject = getChildAt(mSelectedPosition + 1);
            m = (int)(mSelectionOffset * ((View)localObject).getLeft() + (1.0F - mSelectionOffset) * i1);
            k = (int)(mSelectionOffset * ((View)localObject).getRight() + (1.0F - mSelectionOffset) * n);
          }
        }
        mSelectedIndicatorPaint.setColor(i);
        paramCanvas.drawRect(m, i2 - mSelectedIndicatorThickness, k, i2, mSelectedIndicatorPaint);
      }
      paramCanvas.drawRect(0.0F, i2 - mBottomBorderThickness, getWidth(), i2, mBottomBorderPaint);
      return;
    }
  }
  
  void onViewPagerPageChanged(int paramInt, float paramFloat)
  {
    if (mSelectedPosition != paramInt)
    {
      ((TextView)getChildAt(mSelectedPosition).findViewById(mTextViewId)).setTextColor(Color.parseColor("#a3aeb7"));
      ((TextView)getChildAt(paramInt).findViewById(mTextViewId)).setTextColor(Color.parseColor("#2098f5"));
    }
    mSelectedPosition = paramInt;
    mSelectionOffset = paramFloat;
    invalidate();
  }
  
  void setCustomLayoutIds(int paramInt1, int paramInt2)
  {
    mViewId = paramInt1;
    mTextViewId = paramInt2;
  }
  
  void setCustomTabColorizer(SlidingTabLayout.TabColorizer paramTabColorizer)
  {
    mCustomTabColorizer = paramTabColorizer;
    invalidate();
  }
  
  void setSelectedIndicatorColors(int... paramVarArgs)
  {
    mCustomTabColorizer = null;
    mDefaultTabColorizer.setIndicatorColors(paramVarArgs);
    invalidate();
  }
  
  private static class SimpleTabColorizer
    implements SlidingTabLayout.TabColorizer
  {
    private int[] mIndicatorColors;
    
    private SimpleTabColorizer() {}
    
    public final int getIndicatorColor(int paramInt)
    {
      return mIndicatorColors[(paramInt % mIndicatorColors.length)];
    }
    
    void setIndicatorColors(int... paramVarArgs)
    {
      mIndicatorColors = paramVarArgs;
    }
  }
}
