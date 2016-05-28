package com.adobe.creativesdk.aviary.graphics;

import android.graphics.Bitmap;
import android.graphics.Bitmap.Config;
import android.graphics.BlurMaskFilter;
import android.graphics.BlurMaskFilter.Blur;
import android.graphics.Canvas;
import android.graphics.Paint;
import android.graphics.PorterDuff.Mode;
import android.graphics.PorterDuffXfermode;
import android.graphics.Rect;
import com.adobe.android.ui.utils.UIUtils;
import it.sephiroth.android.library.imagezoom.graphics.FastBitmapDrawable;

public class GlowBitmapDrawable
  extends FastBitmapDrawable
{
  private int mBlurValue;
  private boolean mChecked;
  private Bitmap mCheckedBitmap;
  private Bitmap mCurrent;
  private Rect mDstRect = new Rect();
  private int mGlowMode;
  private int mHighlightColorChecked;
  private int mHighlightColorPressed;
  private int mHighlightColorSelected;
  private int mHighlightMode;
  private boolean mPressed;
  private Bitmap mPressedBitmap;
  private boolean mSelected;
  private Bitmap mSelectedBitmap;
  
  public GlowBitmapDrawable(Bitmap paramBitmap, int paramInt1, int paramInt2, int paramInt3, int paramInt4, int paramInt5, int paramInt6)
  {
    super(paramBitmap);
    init(paramInt1, paramInt2, paramInt3, paramInt4, paramInt5, paramInt6);
  }
  
  public static Bitmap generateBlurBitmap(Bitmap paramBitmap, int paramInt1, int paramInt2, PorterDuff.Mode paramMode, boolean paramBoolean, Paint paramPaint)
  {
    int i = paramBitmap.getWidth();
    int j = paramBitmap.getHeight();
    Object localObject2 = paramBitmap.getConfig();
    Object localObject1 = localObject2;
    if (localObject2 == null) {
      localObject1 = Bitmap.Config.ARGB_8888;
    }
    localObject1 = Bitmap.createBitmap(i, j, (Bitmap.Config)localObject1);
    localObject2 = new Canvas((Bitmap)localObject1);
    Bitmap localBitmap = paramBitmap.extractAlpha();
    ((Canvas)localObject2).drawBitmap(paramBitmap, 0.0F, 0.0F, paramPaint);
    paramBitmap = new Paint();
    paramBitmap.setXfermode(new PorterDuffXfermode(paramMode));
    paramBitmap.setColor(paramInt2);
    ((Canvas)localObject2).drawBitmap(localBitmap, 0.0F, 0.0F, paramBitmap);
    if (paramBoolean)
    {
      paramBitmap.setMaskFilter(new BlurMaskFilter(paramInt1, BlurMaskFilter.Blur.NORMAL));
      paramBitmap.setAlpha(100);
      ((Canvas)localObject2).drawBitmap(localBitmap, 0.0F, 0.0F, paramBitmap);
    }
    return localObject1;
  }
  
  private void init(int paramInt1, int paramInt2, int paramInt3, int paramInt4, int paramInt5, int paramInt6)
  {
    mHighlightColorChecked = paramInt2;
    mHighlightColorPressed = paramInt1;
    mHighlightColorSelected = paramInt3;
    mBlurValue = paramInt4;
    mGlowMode = paramInt6;
    mHighlightMode = paramInt5;
    mCurrent = getBitmap();
    recycleBitmaps();
  }
  
  private void recycleBitmaps()
  {
    if (mCheckedBitmap != null)
    {
      mCheckedBitmap.recycle();
      mCheckedBitmap = null;
    }
    if (mPressedBitmap != null)
    {
      mPressedBitmap.recycle();
      mPressedBitmap = null;
    }
    if (mSelectedBitmap != null)
    {
      mSelectedBitmap.recycle();
      mSelectedBitmap = null;
    }
  }
  
  public void draw(Canvas paramCanvas)
  {
    copyBounds(mDstRect);
    paramCanvas.drawBitmap(mCurrent, null, mDstRect, getPaint());
  }
  
  public boolean isStateful()
  {
    return true;
  }
  
  protected boolean onStateChange(int[] paramArrayOfInt)
  {
    boolean bool1 = mChecked;
    boolean bool2 = mPressed;
    boolean bool3 = mSelected;
    mChecked = false;
    mPressed = false;
    mSelected = false;
    int i = 0;
    if (i < paramArrayOfInt.length)
    {
      switch (paramArrayOfInt[i])
      {
      }
      for (;;)
      {
        i += 1;
        break;
        mPressed = true;
        continue;
        mChecked = true;
        continue;
        mSelected = true;
      }
    }
    if ((mPressed) && (UIUtils.checkBits(mHighlightMode, 2)))
    {
      if (mPressedBitmap == null) {
        mPressedBitmap = generateBlurBitmap(getBitmap(), mBlurValue, mHighlightColorPressed, PorterDuff.Mode.DARKEN, UIUtils.checkBits(mGlowMode, 2), getPaint());
      }
      mCurrent = mPressedBitmap;
    }
    while ((bool1 != mChecked) || (bool2 != mPressed) || (bool3 != mSelected))
    {
      return true;
      if ((mChecked) && (UIUtils.checkBits(mHighlightMode, 4)))
      {
        if (mCheckedBitmap == null) {
          mCheckedBitmap = generateBlurBitmap(getBitmap(), mBlurValue, mHighlightColorChecked, PorterDuff.Mode.DARKEN, UIUtils.checkBits(mGlowMode, 4), getPaint());
        }
        mCurrent = mCheckedBitmap;
      }
      else if ((mSelected) && (UIUtils.checkBits(mHighlightMode, 8)))
      {
        if (mSelectedBitmap == null) {
          mSelectedBitmap = generateBlurBitmap(getBitmap(), mBlurValue, mHighlightColorSelected, PorterDuff.Mode.DARKEN, UIUtils.checkBits(mGlowMode, 8), getPaint());
        }
        mCurrent = mSelectedBitmap;
      }
      else
      {
        mCurrent = getBitmap();
      }
    }
    return false;
  }
  
  public void setBitmap(Bitmap paramBitmap)
  {
    super.setBitmap(paramBitmap);
    mCurrent = paramBitmap;
    recycleBitmaps();
  }
  
  public void updateConfig(int paramInt1, int paramInt2, int paramInt3, int paramInt4, int paramInt5, int paramInt6)
  {
    init(paramInt1, paramInt2, paramInt3, paramInt4, paramInt5, paramInt6);
    setState(getState());
  }
}
