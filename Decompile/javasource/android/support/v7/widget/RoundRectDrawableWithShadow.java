package android.support.v7.widget;

import android.content.res.Resources;
import android.graphics.Canvas;
import android.graphics.ColorFilter;
import android.graphics.LinearGradient;
import android.graphics.Paint;
import android.graphics.Paint.Style;
import android.graphics.Path;
import android.graphics.Path.FillType;
import android.graphics.RadialGradient;
import android.graphics.Rect;
import android.graphics.RectF;
import android.graphics.Shader.TileMode;
import android.graphics.drawable.Drawable;
import android.support.v7.cardview.R.color;
import android.support.v7.cardview.R.dimen;

class RoundRectDrawableWithShadow
  extends Drawable
{
  static final double COS_45 = Math.cos(Math.toRadians(45.0D));
  static RoundRectHelper sRoundRectHelper;
  private boolean mAddPaddingForCorners = true;
  final RectF mCardBounds;
  float mCornerRadius;
  Paint mCornerShadowPaint;
  Path mCornerShadowPath;
  private boolean mDirty = true;
  Paint mEdgeShadowPaint;
  final int mInsetShadow;
  float mMaxShadowSize;
  Paint mPaint;
  private boolean mPrintedShadowClipWarning = false;
  float mRawMaxShadowSize;
  float mRawShadowSize;
  private final int mShadowEndColor;
  float mShadowSize;
  private final int mShadowStartColor;
  
  RoundRectDrawableWithShadow(Resources paramResources, int paramInt, float paramFloat1, float paramFloat2, float paramFloat3)
  {
    mShadowStartColor = paramResources.getColor(R.color.cardview_shadow_start_color);
    mShadowEndColor = paramResources.getColor(R.color.cardview_shadow_end_color);
    mInsetShadow = paramResources.getDimensionPixelSize(R.dimen.cardview_compat_inset_shadow);
    mPaint = new Paint(5);
    mPaint.setColor(paramInt);
    mCornerShadowPaint = new Paint(5);
    mCornerShadowPaint.setStyle(Paint.Style.FILL);
    mCornerRadius = ((int)(0.5F + paramFloat1));
    mCardBounds = new RectF();
    mEdgeShadowPaint = new Paint(mCornerShadowPaint);
    mEdgeShadowPaint.setAntiAlias(false);
    setShadowSize(paramFloat2, paramFloat3);
  }
  
  private void buildComponents(Rect paramRect)
  {
    float f = mRawMaxShadowSize * 1.5F;
    mCardBounds.set(left + mRawMaxShadowSize, top + f, right - mRawMaxShadowSize, bottom - f);
    buildShadowCorners();
  }
  
  private void buildShadowCorners()
  {
    Object localObject1 = new RectF(-mCornerRadius, -mCornerRadius, mCornerRadius, mCornerRadius);
    Object localObject2 = new RectF((RectF)localObject1);
    ((RectF)localObject2).inset(-mShadowSize, -mShadowSize);
    if (mCornerShadowPath == null) {
      mCornerShadowPath = new Path();
    }
    for (;;)
    {
      mCornerShadowPath.setFillType(Path.FillType.EVEN_ODD);
      mCornerShadowPath.moveTo(-mCornerRadius, 0.0F);
      mCornerShadowPath.rLineTo(-mShadowSize, 0.0F);
      mCornerShadowPath.arcTo((RectF)localObject2, 180.0F, 90.0F, false);
      mCornerShadowPath.arcTo((RectF)localObject1, 270.0F, -90.0F, false);
      mCornerShadowPath.close();
      float f1 = mCornerRadius / (mCornerRadius + mShadowSize);
      localObject1 = mCornerShadowPaint;
      float f2 = mCornerRadius;
      float f3 = mShadowSize;
      int i = mShadowStartColor;
      int j = mShadowStartColor;
      int k = mShadowEndColor;
      localObject2 = Shader.TileMode.CLAMP;
      ((Paint)localObject1).setShader(new RadialGradient(0.0F, 0.0F, f2 + f3, new int[] { i, j, k }, new float[] { 0.0F, f1, 1.0F }, (Shader.TileMode)localObject2));
      localObject1 = mEdgeShadowPaint;
      f1 = -mCornerRadius;
      f2 = mShadowSize;
      f3 = -mCornerRadius;
      float f4 = mShadowSize;
      i = mShadowStartColor;
      j = mShadowStartColor;
      k = mShadowEndColor;
      localObject2 = Shader.TileMode.CLAMP;
      ((Paint)localObject1).setShader(new LinearGradient(0.0F, f1 + f2, 0.0F, f3 - f4, new int[] { i, j, k }, new float[] { 0.0F, 0.5F, 1.0F }, (Shader.TileMode)localObject2));
      mEdgeShadowPaint.setAntiAlias(false);
      return;
      mCornerShadowPath.reset();
    }
  }
  
  static float calculateHorizontalPadding(float paramFloat1, float paramFloat2, boolean paramBoolean)
  {
    float f = paramFloat1;
    if (paramBoolean) {
      f = (float)(paramFloat1 + (1.0D - COS_45) * paramFloat2);
    }
    return f;
  }
  
  static float calculateVerticalPadding(float paramFloat1, float paramFloat2, boolean paramBoolean)
  {
    if (paramBoolean) {
      return (float)(1.5F * paramFloat1 + (1.0D - COS_45) * paramFloat2);
    }
    return 1.5F * paramFloat1;
  }
  
  private void drawShadow(Canvas paramCanvas)
  {
    float f1 = -mCornerRadius - mShadowSize;
    float f2 = mCornerRadius + mInsetShadow + mRawShadowSize / 2.0F;
    int i;
    if (mCardBounds.width() - 2.0F * f2 > 0.0F)
    {
      i = 1;
      if (mCardBounds.height() - 2.0F * f2 <= 0.0F) {
        break label413;
      }
    }
    label413:
    for (int j = 1;; j = 0)
    {
      int k = paramCanvas.save();
      paramCanvas.translate(mCardBounds.left + f2, mCardBounds.top + f2);
      paramCanvas.drawPath(mCornerShadowPath, mCornerShadowPaint);
      if (i != 0) {
        paramCanvas.drawRect(0.0F, f1, mCardBounds.width() - 2.0F * f2, -mCornerRadius, mEdgeShadowPaint);
      }
      paramCanvas.restoreToCount(k);
      k = paramCanvas.save();
      paramCanvas.translate(mCardBounds.right - f2, mCardBounds.bottom - f2);
      paramCanvas.rotate(180.0F);
      paramCanvas.drawPath(mCornerShadowPath, mCornerShadowPaint);
      if (i != 0)
      {
        float f3 = mCardBounds.width();
        float f4 = -mCornerRadius;
        paramCanvas.drawRect(0.0F, f1, f3 - 2.0F * f2, mShadowSize + f4, mEdgeShadowPaint);
      }
      paramCanvas.restoreToCount(k);
      i = paramCanvas.save();
      paramCanvas.translate(mCardBounds.left + f2, mCardBounds.bottom - f2);
      paramCanvas.rotate(270.0F);
      paramCanvas.drawPath(mCornerShadowPath, mCornerShadowPaint);
      if (j != 0) {
        paramCanvas.drawRect(0.0F, f1, mCardBounds.height() - 2.0F * f2, -mCornerRadius, mEdgeShadowPaint);
      }
      paramCanvas.restoreToCount(i);
      i = paramCanvas.save();
      paramCanvas.translate(mCardBounds.right - f2, mCardBounds.top + f2);
      paramCanvas.rotate(90.0F);
      paramCanvas.drawPath(mCornerShadowPath, mCornerShadowPaint);
      if (j != 0) {
        paramCanvas.drawRect(0.0F, f1, mCardBounds.height() - 2.0F * f2, -mCornerRadius, mEdgeShadowPaint);
      }
      paramCanvas.restoreToCount(i);
      return;
      i = 0;
      break;
    }
  }
  
  private int toEven(float paramFloat)
  {
    int j = (int)(0.5F + paramFloat);
    int i = j;
    if (j % 2 == 1) {
      i = j - 1;
    }
    return i;
  }
  
  public void draw(Canvas paramCanvas)
  {
    if (mDirty)
    {
      buildComponents(getBounds());
      mDirty = false;
    }
    paramCanvas.translate(0.0F, mRawShadowSize / 2.0F);
    drawShadow(paramCanvas);
    paramCanvas.translate(0.0F, -mRawShadowSize / 2.0F);
    sRoundRectHelper.drawRoundRect(paramCanvas, mCardBounds, mCornerRadius, mPaint);
  }
  
  float getCornerRadius()
  {
    return mCornerRadius;
  }
  
  void getMaxShadowAndCornerPadding(Rect paramRect)
  {
    getPadding(paramRect);
  }
  
  float getMaxShadowSize()
  {
    return mRawMaxShadowSize;
  }
  
  float getMinHeight()
  {
    float f = Math.max(mRawMaxShadowSize, mCornerRadius + mInsetShadow + mRawMaxShadowSize * 1.5F / 2.0F);
    return (mRawMaxShadowSize * 1.5F + mInsetShadow) * 2.0F + 2.0F * f;
  }
  
  float getMinWidth()
  {
    float f = Math.max(mRawMaxShadowSize, mCornerRadius + mInsetShadow + mRawMaxShadowSize / 2.0F);
    return (mRawMaxShadowSize + mInsetShadow) * 2.0F + 2.0F * f;
  }
  
  public int getOpacity()
  {
    return -3;
  }
  
  public boolean getPadding(Rect paramRect)
  {
    int i = (int)Math.ceil(calculateVerticalPadding(mRawMaxShadowSize, mCornerRadius, mAddPaddingForCorners));
    int j = (int)Math.ceil(calculateHorizontalPadding(mRawMaxShadowSize, mCornerRadius, mAddPaddingForCorners));
    paramRect.set(j, i, j, i);
    return true;
  }
  
  float getShadowSize()
  {
    return mRawShadowSize;
  }
  
  protected void onBoundsChange(Rect paramRect)
  {
    super.onBoundsChange(paramRect);
    mDirty = true;
  }
  
  public void setAddPaddingForCorners(boolean paramBoolean)
  {
    mAddPaddingForCorners = paramBoolean;
    invalidateSelf();
  }
  
  public void setAlpha(int paramInt)
  {
    mPaint.setAlpha(paramInt);
    mCornerShadowPaint.setAlpha(paramInt);
    mEdgeShadowPaint.setAlpha(paramInt);
  }
  
  public void setColor(int paramInt)
  {
    mPaint.setColor(paramInt);
    invalidateSelf();
  }
  
  public void setColorFilter(ColorFilter paramColorFilter)
  {
    mPaint.setColorFilter(paramColorFilter);
    mCornerShadowPaint.setColorFilter(paramColorFilter);
    mEdgeShadowPaint.setColorFilter(paramColorFilter);
  }
  
  void setCornerRadius(float paramFloat)
  {
    paramFloat = (int)(0.5F + paramFloat);
    if (mCornerRadius == paramFloat) {
      return;
    }
    mCornerRadius = paramFloat;
    mDirty = true;
    invalidateSelf();
  }
  
  void setMaxShadowSize(float paramFloat)
  {
    setShadowSize(mRawShadowSize, paramFloat);
  }
  
  void setShadowSize(float paramFloat)
  {
    setShadowSize(paramFloat, mRawMaxShadowSize);
  }
  
  void setShadowSize(float paramFloat1, float paramFloat2)
  {
    if ((paramFloat1 < 0.0F) || (paramFloat2 < 0.0F)) {
      throw new IllegalArgumentException("invalid shadow size");
    }
    float f1 = toEven(paramFloat1);
    float f2 = toEven(paramFloat2);
    paramFloat1 = f1;
    if (f1 > f2)
    {
      paramFloat2 = f2;
      paramFloat1 = paramFloat2;
      if (!mPrintedShadowClipWarning)
      {
        mPrintedShadowClipWarning = true;
        paramFloat1 = paramFloat2;
      }
    }
    if ((mRawShadowSize == paramFloat1) && (mRawMaxShadowSize == f2)) {
      return;
    }
    mRawShadowSize = paramFloat1;
    mRawMaxShadowSize = f2;
    mShadowSize = ((int)(1.5F * paramFloat1 + mInsetShadow + 0.5F));
    mMaxShadowSize = (mInsetShadow + f2);
    mDirty = true;
    invalidateSelf();
  }
  
  static abstract interface RoundRectHelper
  {
    public abstract void drawRoundRect(Canvas paramCanvas, RectF paramRectF, float paramFloat, Paint paramPaint);
  }
}
