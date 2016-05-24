package com.behance.sdk.edmodo.cropper;

import android.content.Context;
import android.content.res.TypedArray;
import android.graphics.Bitmap;
import android.graphics.BitmapFactory;
import android.graphics.Matrix;
import android.graphics.Rect;
import android.graphics.RectF;
import android.os.Bundle;
import android.os.Parcelable;
import android.util.AttributeSet;
import android.view.LayoutInflater;
import android.view.View;
import android.view.View.MeasureSpec;
import android.view.ViewGroup.LayoutParams;
import android.widget.FrameLayout;
import android.widget.ImageView;
import com.behance.sdk.R.id;
import com.behance.sdk.R.layout;
import com.behance.sdk.R.styleable;
import com.behance.sdk.edmodo.cropper.cropwindow.CropOverlayView;
import com.behance.sdk.edmodo.cropper.cropwindow.edge.Edge;
import com.behance.sdk.edmodo.cropper.util.ImageViewUtil;

public class CropImageView
  extends FrameLayout
{
  private static final Rect EMPTY_RECT = new Rect();
  private int mAspectRatioX = 1;
  private int mAspectRatioY = 1;
  private Bitmap mBitmap;
  private CropOverlayView mCropOverlayView;
  private int mDegreesRotated = 0;
  private boolean mFixAspectRatio = false;
  private int mGuidelines = 1;
  private int mImageResource = 0;
  private ImageView mImageView;
  private int mLayoutHeight;
  private int mLayoutWidth;
  
  public CropImageView(Context paramContext)
  {
    super(paramContext);
    init(paramContext);
  }
  
  public CropImageView(Context paramContext, AttributeSet paramAttributeSet)
  {
    super(paramContext, paramAttributeSet);
    paramAttributeSet = paramContext.obtainStyledAttributes(paramAttributeSet, R.styleable.CropImageView, 0, 0);
    try
    {
      mGuidelines = paramAttributeSet.getInteger(R.styleable.CropImageView_guidelines, 1);
      mFixAspectRatio = paramAttributeSet.getBoolean(R.styleable.CropImageView_fixAspectRatio, false);
      mAspectRatioX = paramAttributeSet.getInteger(R.styleable.CropImageView_aspectRatioX, 1);
      mAspectRatioY = paramAttributeSet.getInteger(R.styleable.CropImageView_aspectRatioY, 1);
      mImageResource = paramAttributeSet.getResourceId(R.styleable.CropImageView_imageResource, 0);
      paramAttributeSet.recycle();
      init(paramContext);
      return;
    }
    finally
    {
      paramAttributeSet.recycle();
    }
  }
  
  private static int getOnMeasureSpec(int paramInt1, int paramInt2, int paramInt3)
  {
    if (paramInt1 == 1073741824) {
      return paramInt2;
    }
    if (paramInt1 == Integer.MIN_VALUE) {
      return Math.min(paramInt3, paramInt2);
    }
    return paramInt3;
  }
  
  private void init(Context paramContext)
  {
    paramContext = LayoutInflater.from(paramContext).inflate(R.layout.crop_image_view, this, true);
    mImageView = ((ImageView)paramContext.findViewById(R.id.ImageView_image));
    setImageResource(mImageResource);
    mCropOverlayView = ((CropOverlayView)paramContext.findViewById(R.id.CropOverlayView));
    mCropOverlayView.setInitialAttributeValues(mGuidelines, mFixAspectRatio, mAspectRatioX, mAspectRatioY);
  }
  
  public RectF getActualCropRect()
  {
    Rect localRect = ImageViewUtil.getBitmapRectCenterInside(mBitmap, mImageView);
    float f1 = mBitmap.getWidth() / localRect.width();
    float f2 = mBitmap.getHeight() / localRect.height();
    float f7 = Edge.LEFT.getCoordinate();
    float f8 = left;
    float f5 = Edge.TOP.getCoordinate();
    float f6 = top;
    float f3 = Edge.getWidth();
    float f4 = Edge.getHeight();
    f7 = (f7 - f8) * f1;
    f5 = (f5 - f6) * f2;
    return new RectF(Math.max(0.0F, f7), Math.max(0.0F, f5), Math.min(mBitmap.getWidth(), f7 + f3 * f1), Math.min(mBitmap.getHeight(), f5 + f4 * f2));
  }
  
  public Bitmap getCroppedImage()
  {
    Rect localRect = ImageViewUtil.getBitmapRectCenterInside(mBitmap, mImageView);
    float f1 = mBitmap.getWidth() / localRect.width();
    float f2 = mBitmap.getHeight() / localRect.height();
    float f3 = Edge.LEFT.getCoordinate();
    float f4 = left;
    float f5 = Edge.TOP.getCoordinate();
    float f6 = top;
    float f7 = Edge.getWidth();
    float f8 = Edge.getHeight();
    return Bitmap.createBitmap(mBitmap, (int)((f3 - f4) * f1), (int)((f5 - f6) * f2), (int)(f7 * f1), (int)(f8 * f2));
  }
  
  public int getImageResource()
  {
    return mImageResource;
  }
  
  public ImageView getImageView()
  {
    return mImageView;
  }
  
  protected void onLayout(boolean paramBoolean, int paramInt1, int paramInt2, int paramInt3, int paramInt4)
  {
    super.onLayout(paramBoolean, paramInt1, paramInt2, paramInt3, paramInt4);
    if ((mLayoutWidth > 0) && (mLayoutHeight > 0))
    {
      ViewGroup.LayoutParams localLayoutParams = getLayoutParams();
      width = mLayoutWidth;
      height = mLayoutHeight;
      setLayoutParams(localLayoutParams);
    }
  }
  
  protected void onMeasure(int paramInt1, int paramInt2)
  {
    int m = View.MeasureSpec.getMode(paramInt1);
    int j = View.MeasureSpec.getSize(paramInt1);
    int k = View.MeasureSpec.getMode(paramInt2);
    int i = View.MeasureSpec.getSize(paramInt2);
    if (mBitmap != null)
    {
      super.onMeasure(paramInt1, paramInt2);
      paramInt1 = i;
      if (i == 0) {
        paramInt1 = mBitmap.getHeight();
      }
      double d1 = j / mBitmap.getWidth();
      double d2 = paramInt1 / mBitmap.getHeight();
      if ((d1 != Double.POSITIVE_INFINITY) || (d2 != Double.POSITIVE_INFINITY)) {
        if (d1 <= d2)
        {
          i = j;
          paramInt2 = (int)(mBitmap.getHeight() * d1);
        }
      }
      for (;;)
      {
        i = getOnMeasureSpec(m, j, i);
        paramInt1 = getOnMeasureSpec(k, paramInt1, paramInt2);
        mLayoutWidth = i;
        mLayoutHeight = paramInt1;
        Rect localRect = ImageViewUtil.getBitmapRectCenterInside(mBitmap.getWidth(), mBitmap.getHeight(), mLayoutWidth, mLayoutHeight);
        mCropOverlayView.setBitmapRect(localRect);
        setMeasuredDimension(mLayoutWidth, mLayoutHeight);
        return;
        paramInt2 = paramInt1;
        i = (int)(mBitmap.getWidth() * d2);
        continue;
        i = mBitmap.getWidth();
        paramInt2 = mBitmap.getHeight();
      }
    }
    mCropOverlayView.setBitmapRect(EMPTY_RECT);
    setMeasuredDimension(j, i);
  }
  
  public void onRestoreInstanceState(Parcelable paramParcelable)
  {
    if ((paramParcelable instanceof Bundle))
    {
      paramParcelable = (Bundle)paramParcelable;
      if (mBitmap != null)
      {
        mDegreesRotated = paramParcelable.getInt("DEGREES_ROTATED");
        int i = mDegreesRotated;
        rotateImage(mDegreesRotated);
        mDegreesRotated = i;
      }
      super.onRestoreInstanceState(paramParcelable.getParcelable("instanceState"));
      return;
    }
    super.onRestoreInstanceState(paramParcelable);
  }
  
  public Parcelable onSaveInstanceState()
  {
    Bundle localBundle = new Bundle();
    localBundle.putParcelable("instanceState", super.onSaveInstanceState());
    localBundle.putInt("DEGREES_ROTATED", mDegreesRotated);
    return localBundle;
  }
  
  protected void onSizeChanged(int paramInt1, int paramInt2, int paramInt3, int paramInt4)
  {
    if (mBitmap != null)
    {
      Rect localRect = ImageViewUtil.getBitmapRectCenterInside(mBitmap, this);
      mCropOverlayView.setBitmapRect(localRect);
      return;
    }
    mCropOverlayView.setBitmapRect(EMPTY_RECT);
  }
  
  public void rotateImage(int paramInt)
  {
    Matrix localMatrix = new Matrix();
    localMatrix.postRotate(paramInt);
    mBitmap = Bitmap.createBitmap(mBitmap, 0, 0, mBitmap.getWidth(), mBitmap.getHeight(), localMatrix, true);
    setImageBitmap(mBitmap);
    mDegreesRotated += paramInt;
    mDegreesRotated %= 360;
  }
  
  public void setAspectRatio(int paramInt1, int paramInt2)
  {
    mAspectRatioX = paramInt1;
    mCropOverlayView.setAspectRatioX(mAspectRatioX);
    mAspectRatioY = paramInt2;
    mCropOverlayView.setAspectRatioY(mAspectRatioY);
  }
  
  public void setFixedAspectRatio(boolean paramBoolean)
  {
    mCropOverlayView.setFixedAspectRatio(paramBoolean);
  }
  
  public void setGuidelines(int paramInt)
  {
    mCropOverlayView.setGuidelines(paramInt);
  }
  
  public void setImageBitmap(Bitmap paramBitmap)
  {
    mBitmap = paramBitmap;
    mImageView.setImageBitmap(mBitmap);
    if (mCropOverlayView != null) {
      mCropOverlayView.resetCropOverlayView();
    }
  }
  
  public void setImageResource(int paramInt)
  {
    if (paramInt != 0) {
      setImageBitmap(BitmapFactory.decodeResource(getResources(), paramInt));
    }
  }
  
  public void setMinSize(int paramInt)
  {
    Edge.MIN_CROP_LENGTH_PX = paramInt;
  }
}
