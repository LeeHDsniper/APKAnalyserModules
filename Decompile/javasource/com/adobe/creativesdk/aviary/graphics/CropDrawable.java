package com.adobe.creativesdk.aviary.graphics;

import android.content.Context;
import android.content.res.Resources;
import android.content.res.TypedArray;
import android.graphics.Canvas;
import android.graphics.ColorFilter;
import android.graphics.DashPathEffect;
import android.graphics.Paint;
import android.graphics.Paint.Cap;
import android.graphics.Paint.Join;
import android.graphics.Paint.Style;
import android.graphics.Rect;
import android.graphics.RectF;
import android.graphics.drawable.Drawable;
import android.util.StateSet;
import com.adobe.android.ui.utils.UIUtils;
import com.adobe.creativesdk.aviary.log.LoggerFactory;
import com.adobe.creativesdk.aviary.log.LoggerFactory.Logger;
import com.aviary.android.feather.sdk.R.bool;
import com.aviary.android.feather.sdk.R.style;
import com.aviary.android.feather.sdk.R.styleable;

public class CropDrawable
  extends Drawable
{
  static LoggerFactory.Logger logger = LoggerFactory.getLogger("CropDrawable");
  private final boolean canInvert;
  private Drawable innerDrawable;
  final Rect mBounds;
  private int mCurIndex = -1;
  private int mCurState;
  private final RectF mDrawBounds;
  private boolean mDrawBoundsDirty;
  final Paint mPaint;
  private int[] mRatio;
  private boolean mRatioIsCustom;
  StateListState mStateListState;
  private final int padding;
  private final int strokeColor;
  private int strokeColorSelected;
  private final float strokeRadius;
  private final int strokeSize;
  
  public CropDrawable(Context paramContext)
  {
    TypedArray localTypedArray = paramContext.obtainStyledAttributes(null, R.styleable.AdobeImagePreviewCropDrawable, 0, R.style.AdobeImageWidget_CropItemDrawableStyle);
    strokeColor = localTypedArray.getColor(R.styleable.AdobeImagePreviewCropDrawable_adobe_strokeColor, 0);
    strokeColorSelected = localTypedArray.getColor(R.styleable.AdobeImagePreviewCropDrawable_adobe_strokeColorSelected, 0);
    strokeSize = localTypedArray.getDimensionPixelSize(R.styleable.AdobeImagePreviewCropDrawable_adobe_strokeSize, 1);
    padding = localTypedArray.getDimensionPixelSize(R.styleable.AdobeImagePreviewCropDrawable_android_padding, 0);
    strokeRadius = localTypedArray.getFloat(R.styleable.AdobeImagePreviewCropDrawable_adobe_radius, 0.0F);
    canInvert = paramContext.getResources().getBoolean(R.bool.com_adobe_image_editor_crop_invert_policy);
    if (canInvert)
    {
      innerDrawable = localTypedArray.getDrawable(R.styleable.AdobeImagePreviewCropDrawable_android_src);
      updateInnerDrawableTint(strokeColorSelected);
    }
    localTypedArray.recycle();
    mPaint = new Paint(1);
    mPaint.setStyle(Paint.Style.STROKE);
    mPaint.setStrokeWidth(strokeSize);
    mPaint.setColor(strokeColor);
    mBounds = new Rect();
    mDrawBounds = new RectF();
    mDrawBoundsDirty = true;
    mStateListState = new StateListState();
    mStateListState.addStateSet(new int[] { 16842919, -16842913 }, Integer.valueOf(1));
    mStateListState.addStateSet(new int[] { 16842913, -16842912 }, Integer.valueOf(2));
    mStateListState.addStateSet(new int[] { 16842913, 16842919 }, Integer.valueOf(4));
    mStateListState.addStateSet(new int[] { 16842913, -16842912, 16842919 }, Integer.valueOf(4));
    mStateListState.addStateSet(new int[] { 16842913, 16842912 }, Integer.valueOf(3));
    mStateListState.addStateSet(new int[] { 16842913, 16842912, 16842919 }, Integer.valueOf(5));
    onStateChange(getState());
  }
  
  private void updateDrawableRect()
  {
    double d;
    int k;
    int m;
    int i;
    int j;
    if (mDrawBoundsDirty)
    {
      if (mRatioIsCustom) {
        break label240;
      }
      d = mRatio[0] / mRatio[1];
      if (d < 1.0D) {
        break label173;
      }
      k = mBounds.width();
      m = (int)(mBounds.width() / d);
      i = m;
      j = k;
      if (m > mBounds.height())
      {
        j = k - (m - mBounds.height());
        i = mBounds.height();
      }
    }
    for (;;)
    {
      k = mBounds.left + (mBounds.width() - j) / 2;
      m = mBounds.top + (mBounds.height() - i) / 2;
      mDrawBounds.set(k, m, k + j, m + i);
      mDrawBoundsDirty = false;
      return;
      label173:
      k = mBounds.height();
      m = (int)(mBounds.height() * d);
      i = k;
      j = m;
      if (m > mBounds.width())
      {
        i = k - (k - mBounds.width());
        j = mBounds.width();
        continue;
        label240:
        j = (int)(mBounds.width() / 1.2D);
        i = (int)(mBounds.height() / 1.2D);
      }
    }
  }
  
  private void updateInnerDrawableTint(int paramInt)
  {
    if (innerDrawable != null)
    {
      innerDrawable.setFilterBitmap(true);
      UIUtils.setDrawableTint(innerDrawable, paramInt);
    }
  }
  
  public void draw(Canvas paramCanvas)
  {
    if (mRatio == null) {
      return;
    }
    if ((mCurState == 2) || (mCurState == 4) || (mCurState == 3))
    {
      mPaint.setColor(strokeColorSelected);
      if ((innerDrawable != null) && (mRatio[0] != mRatio[1]) && (!mRatioIsCustom)) {
        innerDrawable.draw(paramCanvas);
      }
    }
    for (;;)
    {
      updateDrawableRect();
      if (strokeRadius <= 0.0F) {
        break;
      }
      paramCanvas.drawRoundRect(mDrawBounds, strokeRadius, strokeRadius, mPaint);
      return;
      mPaint.setColor(strokeColor);
    }
    paramCanvas.drawRect(mDrawBounds, mPaint);
  }
  
  public int getOpacity()
  {
    return -3;
  }
  
  public boolean isStateful()
  {
    return true;
  }
  
  public void jumpToCurrentState()
  {
    if (innerDrawable != null) {
      innerDrawable.jumpToCurrentState();
    }
    super.jumpToCurrentState();
  }
  
  protected void onBoundsChange(Rect paramRect)
  {
    super.onBoundsChange(paramRect);
    mBounds.set(paramRect);
    mBounds.inset(padding, padding);
    if (innerDrawable != null)
    {
      int j = innerDrawable.getIntrinsicWidth();
      int i = innerDrawable.getIntrinsicHeight();
      j = (mBounds.width() - j) / 2;
      i = (mBounds.height() - i) / 2;
      innerDrawable.setBounds(mBounds.left + j, mBounds.top + i, mBounds.right - j, mBounds.bottom - i);
    }
    mDrawBoundsDirty = true;
  }
  
  protected boolean onStateChange(int[] paramArrayOfInt)
  {
    if (innerDrawable != null) {
      innerDrawable.setState(paramArrayOfInt);
    }
    int j = mStateListState.indexOfStateSet(paramArrayOfInt);
    int i = j;
    if (j < 0) {
      i = mStateListState.indexOfStateSet(StateSet.WILD_CARD);
    }
    if (selectDrawable(i)) {
      return true;
    }
    return super.onStateChange(paramArrayOfInt);
  }
  
  public boolean selectDrawable(int paramInt)
  {
    if (paramInt == mCurIndex) {
      return false;
    }
    if ((paramInt >= 0) && (paramInt < mStateListState.mNumChildren)) {
      mCurState = mStateListState.mDrawables[paramInt].intValue();
    }
    for (mCurIndex = paramInt;; mCurIndex = -1)
    {
      logger.verbose("%s. mCurIndex: %d, mCurState: %d", new Object[] { this, Integer.valueOf(mCurIndex), Integer.valueOf(mCurState) });
      invalidateSelf();
      return true;
      mCurState = -1;
    }
  }
  
  public void setAlpha(int paramInt)
  {
    mPaint.setAlpha(paramInt);
  }
  
  public void setColorFilter(ColorFilter paramColorFilter)
  {
    mPaint.setColorFilter(paramColorFilter);
  }
  
  public void setRatio(int[] paramArrayOfInt)
  {
    boolean bool;
    if (mRatio != paramArrayOfInt)
    {
      if ((paramArrayOfInt[0] != 0) && (paramArrayOfInt[0] != -1)) {
        break label125;
      }
      bool = true;
      mRatioIsCustom = bool;
      mRatio = paramArrayOfInt;
      mDrawBoundsDirty = true;
      if (mRatio[0] != 0) {
        break label130;
      }
      mPaint.setPathEffect(new DashPathEffect(new float[] { mPaint.getStrokeWidth() / 4.0F, mPaint.getStrokeWidth() * 2.0F }, 0.0F));
    }
    for (;;)
    {
      mPaint.setStrokeJoin(Paint.Join.MITER);
      mPaint.setStrokeCap(Paint.Cap.SQUARE);
      mPaint.setStrokeMiter(2.0F);
      invalidateSelf();
      return;
      label125:
      bool = false;
      break;
      label130:
      mPaint.setPathEffect(null);
    }
  }
  
  public void setSelectedTint(int paramInt)
  {
    strokeColorSelected = paramInt;
    updateInnerDrawableTint(strokeColorSelected);
    invalidateSelf();
  }
  
  static class StateListState
  {
    Integer[] mDrawables = new Integer[10];
    int mNumChildren = 0;
    int[][] mStateSets = new int[10][];
    
    StateListState() {}
    
    public final int addChild(Integer paramInteger)
    {
      int i = mNumChildren;
      if (i >= mDrawables.length) {
        growArray(i, i + 10);
      }
      mDrawables[i] = paramInteger;
      mNumChildren += 1;
      return i;
    }
    
    int addStateSet(int[] paramArrayOfInt, Integer paramInteger)
    {
      int i = addChild(paramInteger);
      mStateSets[i] = paramArrayOfInt;
      return i;
    }
    
    public final int getChildCount()
    {
      return mNumChildren;
    }
    
    public void growArray(int paramInt1, int paramInt2)
    {
      Object localObject = new Integer[paramInt2];
      System.arraycopy(mDrawables, 0, localObject, 0, paramInt1);
      mDrawables = ((Integer[])localObject);
      localObject = new int[paramInt2][];
      System.arraycopy(mStateSets, 0, localObject, 0, paramInt1);
      mStateSets = ((int[][])localObject);
    }
    
    int indexOfStateSet(int[] paramArrayOfInt)
    {
      int[][] arrayOfInt = mStateSets;
      int j = getChildCount();
      int i = 0;
      while (i < j)
      {
        if (StateSet.stateSetMatches(arrayOfInt[i], paramArrayOfInt)) {
          return i;
        }
        i += 1;
      }
      return -1;
    }
  }
}
