package com.adobe.creativesdk.aviary.graphics;

import android.content.Context;
import android.content.res.TypedArray;
import android.graphics.Canvas;
import android.graphics.ColorFilter;
import android.graphics.Paint;
import android.graphics.Paint.FontMetrics;
import android.graphics.Paint.Style;
import android.graphics.Rect;
import android.graphics.Typeface;
import android.graphics.drawable.Drawable;
import android.util.Log;
import com.adobe.android.ui.utils.TypefaceUtils;
import com.aviary.android.feather.sdk.R.styleable;

public class PluginDividerDrawable
  extends Drawable
{
  private Rect mBounds;
  private int mFillColor;
  private int mHeight;
  private String mLabel;
  private int mMaxHeight;
  private Paint.FontMetrics mMetrics;
  private int mStrokeColor;
  private int mStrokeWidth;
  private float mTextDivider;
  private Paint mTextPaint;
  private float mTextSize = 10.0F;
  private Paint mTextStrokePaint;
  private int mTextY = 0;
  private int mWidth;
  
  public PluginDividerDrawable(Context paramContext, int paramInt1, int paramInt2)
  {
    this(paramContext, paramInt1, paramContext.getString(paramInt2));
  }
  
  public PluginDividerDrawable(Context paramContext, int paramInt, String paramString)
  {
    TypedArray localTypedArray = paramContext.obtainStyledAttributes(null, R.styleable.ContentSectionHeaderDrawable, 0, paramInt);
    mFillColor = localTypedArray.getColor(R.styleable.ContentSectionHeaderDrawable_android_textColor, 0);
    mStrokeWidth = localTypedArray.getDimensionPixelSize(R.styleable.ContentSectionHeaderDrawable_adobe_strokeSize, 0);
    mStrokeColor = localTypedArray.getColor(R.styleable.ContentSectionHeaderDrawable_adobe_strokeColor, 0);
    mTextDivider = localTypedArray.getFloat(R.styleable.ContentSectionHeaderDrawable_adobe_textPerc, 0.9F);
    String str = localTypedArray.getString(R.styleable.ContentSectionHeaderDrawable_fontFamily);
    Log.v("Drawable", "fontname: " + str);
    try
    {
      paramContext = TypefaceUtils.createFromAsset(paramContext.getAssets(), str);
      localTypedArray.recycle();
      mLabel = paramString;
      mTextPaint = new Paint(385);
      mTextPaint.setColor(mFillColor);
      mTextPaint.setStyle(Paint.Style.FILL);
      if (paramContext != null) {
        mTextPaint.setTypeface(paramContext);
      }
      mTextStrokePaint = new Paint(mTextPaint);
      mTextStrokePaint.setColor(mStrokeColor);
      mTextStrokePaint.setStyle(Paint.Style.STROKE);
      mTextStrokePaint.setStrokeWidth(mStrokeWidth);
      mBounds = new Rect();
      mMetrics = new Paint.FontMetrics();
      return;
    }
    catch (Throwable localThrowable)
    {
      for (;;)
      {
        paramContext = Typeface.DEFAULT;
        localThrowable.printStackTrace();
      }
    }
  }
  
  public void clearColorFilter() {}
  
  public void draw(Canvas paramCanvas)
  {
    int i = paramCanvas.save(1);
    paramCanvas.rotate(-90.0F);
    paramCanvas.translate(-mHeight + (mHeight - mBounds.width()) / 2, mTextY);
    if (mBounds.width() > mMaxHeight)
    {
      float f = mMaxHeight / mBounds.width();
      paramCanvas.scale(f, f, mBounds.centerX(), mBounds.centerY());
    }
    if (mStrokeWidth > 0) {
      paramCanvas.drawText(mLabel, 0.0F, 0.0F, mTextStrokePaint);
    }
    paramCanvas.drawText(mLabel, 0.0F, 0.0F, mTextPaint);
    paramCanvas.restoreToCount(i);
  }
  
  public int getIntrinsicHeight()
  {
    return super.getIntrinsicHeight();
  }
  
  public int getIntrinsicWidth()
  {
    return super.getIntrinsicWidth();
  }
  
  public int getMinimumHeight()
  {
    return super.getMinimumHeight();
  }
  
  public int getMinimumWidth()
  {
    return super.getMinimumWidth();
  }
  
  public int getOpacity()
  {
    return -3;
  }
  
  protected void onBoundsChange(Rect paramRect)
  {
    super.onBoundsChange(paramRect);
    mWidth = paramRect.width();
    mHeight = paramRect.height();
    onTextBoundsChanged();
  }
  
  protected final void onTextBoundsChanged()
  {
    mTextSize = (mWidth * mTextDivider);
    mTextPaint.setTextSize(mTextSize);
    mTextStrokePaint.setTextSize(mTextSize);
    mTextPaint.getTextBounds(mLabel, 0, mLabel.length(), mBounds);
    mTextPaint.getFontMetrics(mMetrics);
    mTextY = ((int)(mWidth / 2.0F + mTextSize / 2.0F - mMetrics.bottom / 2.0F));
    mMaxHeight = ((int)(mHeight * 0.9D));
  }
  
  public void setAlpha(int paramInt) {}
  
  public void setColorFilter(ColorFilter paramColorFilter) {}
}
