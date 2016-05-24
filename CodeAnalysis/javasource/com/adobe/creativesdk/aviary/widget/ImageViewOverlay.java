package com.adobe.creativesdk.aviary.widget;

import android.annotation.SuppressLint;
import android.content.Context;
import android.graphics.Bitmap;
import android.graphics.Bitmap.Config;
import android.graphics.Canvas;
import android.graphics.Matrix;
import android.graphics.RectF;
import android.graphics.drawable.Drawable;
import android.util.AttributeSet;
import android.util.Log;
import com.adobe.creativesdk.aviary.internal.filters.OverlayFilter;
import com.adobe.creativesdk.aviary.internal.headless.moa.MoaAction;
import com.adobe.creativesdk.aviary.internal.headless.moa.MoaActionList;
import com.adobe.creativesdk.aviary.internal.headless.moa.MoaPointParameter;
import com.adobe.creativesdk.aviary.internal.headless.moa.MoaRectParameter;
import it.sephiroth.android.library.imagezoom.ImageViewTouch;
import it.sephiroth.android.library.imagezoom.ImageViewTouchBase.DisplayType;
import it.sephiroth.android.library.imagezoom.graphics.FastBitmapDrawable;

public class ImageViewOverlay
  extends ImageViewTouch
{
  protected Matrix mBaseMatrix2 = new Matrix();
  RectF mCanvasClipRect = new RectF();
  protected Matrix mDisplayMatrix2 = new Matrix();
  protected Matrix mDrawMatrix2;
  private final Matrix mLayoutMatrixTemp = new Matrix();
  protected Matrix mMatrix2 = new Matrix();
  protected RectF mOverlayBitmapRect = new RectF();
  private boolean mOverlayChanged;
  protected Drawable mOverlayDrawable;
  private int mOverlayDrawableHeight;
  private int mOverlayDrawableWidth;
  protected Drawable mOverlayTempDrawable;
  protected Matrix mSuppMatrix2 = new Matrix();
  private RectF mTempViewPort = new RectF();
  
  public ImageViewOverlay(Context paramContext, AttributeSet paramAttributeSet)
  {
    super(paramContext, paramAttributeSet);
  }
  
  public ImageViewOverlay(Context paramContext, AttributeSet paramAttributeSet, int paramInt)
  {
    super(paramContext, paramAttributeSet, paramInt);
  }
  
  private void configureBounds2()
  {
    if (mOverlayDrawable == null) {
      return;
    }
    int i = mOverlayDrawableWidth;
    int j = mOverlayDrawableHeight;
    int k = getWidth();
    int m = getHeight();
    if ((i <= 0) || (j <= 0))
    {
      mOverlayDrawable.setBounds(0, 0, k, m);
      mDrawMatrix2 = null;
      return;
    }
    mOverlayDrawable.setBounds(0, 0, i, j);
    if (mMatrix2.isIdentity())
    {
      mDrawMatrix2 = null;
      return;
    }
    mDrawMatrix2 = mMatrix2;
  }
  
  protected float computeMinZoom()
  {
    if (mOverlayDrawable == null) {
      return super.computeMinZoom();
    }
    return 1.0F;
  }
  
  @SuppressLint({"WrongCall"})
  public Bitmap generateResultBitmap(OverlayFilter paramOverlayFilter)
  {
    if (mOverlayDrawable == null) {}
    Drawable localDrawable;
    do
    {
      return null;
      localDrawable = getDrawable();
    } while (localDrawable == null);
    RectF localRectF = getOverlayBitmapRect();
    Bitmap localBitmap = Bitmap.createBitmap((int)localRectF.width(), (int)localRectF.height(), Bitmap.Config.ARGB_8888);
    paramOverlayFilter.getActions().get(0).setValue("previewsize", new MoaPointParameter(localDrawable.getIntrinsicWidth(), localDrawable.getIntrinsicHeight()));
    paramOverlayFilter.getActions().get(0).setValue("bitmaprect", new MoaRectParameter(getBitmapRect()));
    paramOverlayFilter.getActions().get(0).setValue("overlayrect", new MoaRectParameter(getOverlayBitmapRect()));
    paramOverlayFilter.getActions().get(0).setValue("overlaysize", new MoaPointParameter(mOverlayDrawableWidth, mOverlayDrawableHeight));
    paramOverlayFilter = new Canvas(localBitmap);
    paramOverlayFilter.translate(-left, -top);
    onDraw(paramOverlayFilter);
    return localBitmap;
  }
  
  public ImageViewTouchBase.DisplayType getDisplayType()
  {
    return ImageViewTouchBase.DisplayType.FIT_TO_SCREEN;
  }
  
  public Matrix getImageViewMatrix2()
  {
    return getImageViewMatrix2(mSuppMatrix2);
  }
  
  public Matrix getImageViewMatrix2(Matrix paramMatrix)
  {
    mDisplayMatrix2.set(mBaseMatrix2);
    mDisplayMatrix2.postConcat(paramMatrix);
    return mDisplayMatrix2;
  }
  
  public RectF getOverlayBitmapRect()
  {
    return getOverlayBitmapRect(mSuppMatrix2);
  }
  
  protected RectF getOverlayBitmapRect(Matrix paramMatrix)
  {
    Drawable localDrawable = mOverlayDrawable;
    if (localDrawable == null) {
      return null;
    }
    paramMatrix = getImageViewMatrix2(paramMatrix);
    mOverlayBitmapRect.set(0.0F, 0.0F, localDrawable.getIntrinsicWidth(), localDrawable.getIntrinsicHeight());
    paramMatrix.mapRect(mOverlayBitmapRect);
    return mOverlayBitmapRect;
  }
  
  public Drawable getOverlayDrawable()
  {
    return mOverlayDrawable;
  }
  
  protected void getProperBaseMatrix(Drawable paramDrawable, Matrix paramMatrix, RectF paramRectF)
  {
    if (mOverlayDrawable == null)
    {
      super.getProperBaseMatrix(paramDrawable, paramMatrix, paramRectF);
      return;
    }
    float f1 = paramDrawable.getIntrinsicWidth();
    float f2 = paramDrawable.getIntrinsicHeight();
    paramMatrix.reset();
    float f3 = Math.max(paramRectF.width() / f1, paramRectF.height() / f2);
    paramMatrix.postScale(f3, f3);
    paramMatrix.postTranslate(left, top);
    paramMatrix.postTranslate((paramRectF.width() - f1 * f3) / 2.0F, (paramRectF.height() - f2 * f3) / 2.0F);
    printMatrix(paramMatrix);
  }
  
  protected void getProperBaseMatrix2(Drawable paramDrawable, Matrix paramMatrix, RectF paramRectF)
  {
    float f1 = paramDrawable.getIntrinsicWidth();
    float f2 = paramDrawable.getIntrinsicHeight();
    paramMatrix.reset();
    float f3 = Math.min(paramRectF.width() / f1, paramRectF.height() / f2);
    paramMatrix.postScale(f3, f3);
    paramMatrix.postTranslate(left, top);
    paramMatrix.postTranslate((paramRectF.width() - f1 * f3) / 2.0F, (paramRectF.height() - f2 * f3) / 2.0F);
    printMatrix(paramMatrix);
  }
  
  protected void init(Context paramContext, AttributeSet paramAttributeSet, int paramInt)
  {
    super.init(paramContext, paramAttributeSet, paramInt);
  }
  
  protected void onDraw(Canvas paramCanvas)
  {
    Matrix localMatrix = getImageMatrix();
    Drawable localDrawable = getDrawable();
    if (localDrawable == null) {}
    do
    {
      return;
      i = paramCanvas.getSaveCount();
      paramCanvas.save();
      paramCanvas.clipRect(mCanvasClipRect);
      if (localMatrix != null) {
        paramCanvas.concat(localMatrix);
      }
      localDrawable.draw(paramCanvas);
      paramCanvas.restoreToCount(i);
    } while ((mOverlayDrawable == null) || (mOverlayDrawableWidth == 0) || (mOverlayDrawableHeight == 0) || (mDrawMatrix2 == null));
    int i = paramCanvas.getSaveCount();
    paramCanvas.save();
    paramCanvas.concat(mDrawMatrix2);
    mOverlayDrawable.draw(paramCanvas);
    paramCanvas.restoreToCount(i);
  }
  
  protected void onLayout(boolean paramBoolean, int paramInt1, int paramInt2, int paramInt3, int paramInt4)
  {
    Log.i("ImageViewTouchBase", "onLayout(" + paramInt1 + ", " + paramInt2 + ", " + paramInt3 + ", " + paramInt4 + ")");
    mTempViewPort.set(paramInt1, paramInt2, paramInt3, paramInt4);
    if (mOverlayChanged)
    {
      mOverlayDrawable = mOverlayTempDrawable;
      mOverlayTempDrawable = null;
      if (mOverlayDrawable == null) {
        break label431;
      }
      mOverlayDrawableWidth = mOverlayDrawable.getIntrinsicWidth();
    }
    for (mOverlayDrawableHeight = mOverlayDrawable.getIntrinsicHeight();; mOverlayDrawableHeight = 0)
    {
      mOverlayChanged = false;
      if ((paramBoolean) || (mBitmapChanged))
      {
        Drawable localDrawable = getDrawable();
        if ((localDrawable != null) && (mOverlayDrawable != null))
        {
          Log.v("ImageViewTouchBase", "bitmap size: " + localDrawable.getIntrinsicWidth() + "x" + localDrawable.getIntrinsicHeight());
          int i = Math.min(paramInt3 - paramInt1, Math.min(localDrawable.getIntrinsicWidth(), 2048));
          int j = Math.min(paramInt4 - paramInt2, Math.min(localDrawable.getIntrinsicHeight(), 2048));
          if ((mTempViewPort.width() > i) || (mTempViewPort.height() > j))
          {
            float f = Math.max(i / mTempViewPort.width(), j / mTempViewPort.height());
            mLayoutMatrixTemp.reset();
            mLayoutMatrixTemp.postScale(f, f, mTempViewPort.centerX(), mTempViewPort.centerY());
            mLayoutMatrixTemp.mapRect(mTempViewPort);
          }
        }
        paramBoolean = true;
      }
      if ((mOverlayDrawable != null) && ((paramBoolean) || (mBitmapChanged)))
      {
        mBaseMatrix2.reset();
        mSuppMatrix2.reset();
        getProperBaseMatrix2(mOverlayDrawable, mBaseMatrix2, mTempViewPort);
        setImageMatrix2(getImageViewMatrix2());
        mTempViewPort.set(getOverlayBitmapRect());
      }
      super.onLayout(paramBoolean, paramInt1, paramInt2, paramInt3, paramInt4);
      return;
      label431:
      mOverlayDrawableWidth = 0;
    }
  }
  
  protected void onViewPortChanged(float paramFloat1, float paramFloat2, float paramFloat3, float paramFloat4)
  {
    if (mOverlayDrawable == null) {
      super.onViewPortChanged(paramFloat1, paramFloat2, paramFloat3, paramFloat4);
    }
    for (;;)
    {
      mCanvasClipRect.set(mViewPort);
      return;
      super.onViewPortChanged((int)Math.ceil(mTempViewPort.left), (int)Math.ceil(mTempViewPort.top), (int)Math.floor(mTempViewPort.right), (int)Math.floor(mTempViewPort.bottom));
    }
  }
  
  public void setImageBitmap(Bitmap paramBitmap1, Bitmap paramBitmap2)
  {
    if (paramBitmap2 != null) {}
    for (mOverlayTempDrawable = new FastBitmapDrawable(paramBitmap2);; mOverlayTempDrawable = null)
    {
      mOverlayChanged = true;
      super.setImageBitmap(paramBitmap1, null, -1.0F, -1.0F);
      return;
    }
  }
  
  public void setImageDrawable(Drawable paramDrawable, Bitmap paramBitmap)
  {
    if (paramBitmap != null) {}
    for (mOverlayTempDrawable = new FastBitmapDrawable(paramBitmap);; mOverlayTempDrawable = null)
    {
      mOverlayChanged = true;
      super.setImageDrawable(paramDrawable, null, -1.0F, -1.0F);
      return;
    }
  }
  
  public void setImageMatrix2(Matrix paramMatrix)
  {
    Matrix localMatrix = paramMatrix;
    if (paramMatrix != null)
    {
      localMatrix = paramMatrix;
      if (paramMatrix.isIdentity()) {
        localMatrix = null;
      }
    }
    if (((localMatrix == null) && (!mMatrix2.isIdentity())) || ((localMatrix != null) && (!mMatrix2.equals(localMatrix))))
    {
      mMatrix2.set(localMatrix);
      configureBounds2();
      invalidate();
    }
  }
  
  public void updateImageOverlay(Bitmap paramBitmap)
  {
    if ((mOverlayDrawable == null) || (paramBitmap == null)) {
      return;
    }
    if ((mOverlayDrawable.getIntrinsicWidth() == paramBitmap.getWidth()) && (mOverlayDrawable.getIntrinsicHeight() == paramBitmap.getHeight()))
    {
      mOverlayDrawable = new FastBitmapDrawable(paramBitmap);
      invalidate();
      return;
    }
    setImageDrawable(getDrawable(), paramBitmap);
  }
}
