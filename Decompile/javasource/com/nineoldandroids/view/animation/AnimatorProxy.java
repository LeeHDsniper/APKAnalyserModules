package com.nineoldandroids.view.animation;

import android.graphics.Camera;
import android.graphics.Matrix;
import android.graphics.RectF;
import android.os.Build.VERSION;
import android.view.View;
import android.view.animation.Animation;
import android.view.animation.Transformation;
import java.lang.ref.WeakReference;
import java.util.WeakHashMap;

public final class AnimatorProxy
  extends Animation
{
  public static final boolean NEEDS_PROXY;
  private static final WeakHashMap<View, AnimatorProxy> PROXIES;
  private final RectF mAfter = new RectF();
  private float mAlpha = 1.0F;
  private final RectF mBefore = new RectF();
  private final Camera mCamera = new Camera();
  private boolean mHasPivot;
  private float mPivotX;
  private float mPivotY;
  private float mRotationX;
  private float mRotationY;
  private float mRotationZ;
  private float mScaleX = 1.0F;
  private float mScaleY = 1.0F;
  private final Matrix mTempMatrix = new Matrix();
  private float mTranslationX;
  private float mTranslationY;
  private final WeakReference<View> mView;
  
  static
  {
    if (Integer.valueOf(Build.VERSION.SDK).intValue() < 11) {}
    for (boolean bool = true;; bool = false)
    {
      NEEDS_PROXY = bool;
      PROXIES = new WeakHashMap();
      return;
    }
  }
  
  private AnimatorProxy(View paramView)
  {
    setDuration(0L);
    setFillAfter(true);
    paramView.setAnimation(this);
    mView = new WeakReference(paramView);
  }
  
  private void computeRect(RectF paramRectF, View paramView)
  {
    paramRectF.set(0.0F, 0.0F, paramView.getWidth(), paramView.getHeight());
    Matrix localMatrix = mTempMatrix;
    localMatrix.reset();
    transformMatrix(localMatrix, paramView);
    mTempMatrix.mapRect(paramRectF);
    paramRectF.offset(paramView.getLeft(), paramView.getTop());
    float f;
    if (right < left)
    {
      f = right;
      right = left;
      left = f;
    }
    if (bottom < top)
    {
      f = top;
      top = bottom;
      bottom = f;
    }
  }
  
  private void invalidateAfterUpdate()
  {
    View localView = (View)mView.get();
    if ((localView == null) || (localView.getParent() == null)) {
      return;
    }
    RectF localRectF = mAfter;
    computeRect(localRectF, localView);
    localRectF.union(mBefore);
    ((View)localView.getParent()).invalidate((int)Math.floor(left), (int)Math.floor(top), (int)Math.ceil(right), (int)Math.ceil(bottom));
  }
  
  private void prepareForUpdate()
  {
    View localView = (View)mView.get();
    if (localView != null) {
      computeRect(mBefore, localView);
    }
  }
  
  private void transformMatrix(Matrix paramMatrix, View paramView)
  {
    float f3 = paramView.getWidth();
    float f4 = paramView.getHeight();
    boolean bool = mHasPivot;
    float f1;
    if (bool)
    {
      f1 = mPivotX;
      if (!bool) {
        break label226;
      }
    }
    label226:
    for (float f2 = mPivotY;; f2 = f4 / 2.0F)
    {
      float f5 = mRotationX;
      float f6 = mRotationY;
      float f7 = mRotationZ;
      if ((f5 != 0.0F) || (f6 != 0.0F) || (f7 != 0.0F))
      {
        paramView = mCamera;
        paramView.save();
        paramView.rotateX(f5);
        paramView.rotateY(f6);
        paramView.rotateZ(-f7);
        paramView.getMatrix(paramMatrix);
        paramView.restore();
        paramMatrix.preTranslate(-f1, -f2);
        paramMatrix.postTranslate(f1, f2);
      }
      f5 = mScaleX;
      f6 = mScaleY;
      if ((f5 != 1.0F) || (f6 != 1.0F))
      {
        paramMatrix.postScale(f5, f6);
        paramMatrix.postTranslate(-(f1 / f3) * (f5 * f3 - f3), -(f2 / f4) * (f6 * f4 - f4));
      }
      paramMatrix.postTranslate(mTranslationX, mTranslationY);
      return;
      f1 = f3 / 2.0F;
      break;
    }
  }
  
  public static AnimatorProxy wrap(View paramView)
  {
    AnimatorProxy localAnimatorProxy2 = (AnimatorProxy)PROXIES.get(paramView);
    AnimatorProxy localAnimatorProxy1;
    if (localAnimatorProxy2 != null)
    {
      localAnimatorProxy1 = localAnimatorProxy2;
      if (localAnimatorProxy2 == paramView.getAnimation()) {}
    }
    else
    {
      localAnimatorProxy1 = new AnimatorProxy(paramView);
      PROXIES.put(paramView, localAnimatorProxy1);
    }
    return localAnimatorProxy1;
  }
  
  protected void applyTransformation(float paramFloat, Transformation paramTransformation)
  {
    View localView = (View)mView.get();
    if (localView != null)
    {
      paramTransformation.setAlpha(mAlpha);
      transformMatrix(paramTransformation.getMatrix(), localView);
    }
  }
  
  public float getAlpha()
  {
    return mAlpha;
  }
  
  public float getPivotX()
  {
    return mPivotX;
  }
  
  public float getPivotY()
  {
    return mPivotY;
  }
  
  public float getRotation()
  {
    return mRotationZ;
  }
  
  public float getRotationX()
  {
    return mRotationX;
  }
  
  public float getRotationY()
  {
    return mRotationY;
  }
  
  public float getScaleX()
  {
    return mScaleX;
  }
  
  public float getScaleY()
  {
    return mScaleY;
  }
  
  public int getScrollX()
  {
    View localView = (View)mView.get();
    if (localView == null) {
      return 0;
    }
    return localView.getScrollX();
  }
  
  public int getScrollY()
  {
    View localView = (View)mView.get();
    if (localView == null) {
      return 0;
    }
    return localView.getScrollY();
  }
  
  public float getTranslationX()
  {
    return mTranslationX;
  }
  
  public float getTranslationY()
  {
    return mTranslationY;
  }
  
  public float getX()
  {
    View localView = (View)mView.get();
    if (localView == null) {
      return 0.0F;
    }
    return localView.getLeft() + mTranslationX;
  }
  
  public float getY()
  {
    View localView = (View)mView.get();
    if (localView == null) {
      return 0.0F;
    }
    return localView.getTop() + mTranslationY;
  }
  
  public void setAlpha(float paramFloat)
  {
    if (mAlpha != paramFloat)
    {
      mAlpha = paramFloat;
      View localView = (View)mView.get();
      if (localView != null) {
        localView.invalidate();
      }
    }
  }
  
  public void setPivotX(float paramFloat)
  {
    if ((!mHasPivot) || (mPivotX != paramFloat))
    {
      prepareForUpdate();
      mHasPivot = true;
      mPivotX = paramFloat;
      invalidateAfterUpdate();
    }
  }
  
  public void setPivotY(float paramFloat)
  {
    if ((!mHasPivot) || (mPivotY != paramFloat))
    {
      prepareForUpdate();
      mHasPivot = true;
      mPivotY = paramFloat;
      invalidateAfterUpdate();
    }
  }
  
  public void setRotation(float paramFloat)
  {
    if (mRotationZ != paramFloat)
    {
      prepareForUpdate();
      mRotationZ = paramFloat;
      invalidateAfterUpdate();
    }
  }
  
  public void setRotationX(float paramFloat)
  {
    if (mRotationX != paramFloat)
    {
      prepareForUpdate();
      mRotationX = paramFloat;
      invalidateAfterUpdate();
    }
  }
  
  public void setRotationY(float paramFloat)
  {
    if (mRotationY != paramFloat)
    {
      prepareForUpdate();
      mRotationY = paramFloat;
      invalidateAfterUpdate();
    }
  }
  
  public void setScaleX(float paramFloat)
  {
    if (mScaleX != paramFloat)
    {
      prepareForUpdate();
      mScaleX = paramFloat;
      invalidateAfterUpdate();
    }
  }
  
  public void setScaleY(float paramFloat)
  {
    if (mScaleY != paramFloat)
    {
      prepareForUpdate();
      mScaleY = paramFloat;
      invalidateAfterUpdate();
    }
  }
  
  public void setScrollX(int paramInt)
  {
    View localView = (View)mView.get();
    if (localView != null) {
      localView.scrollTo(paramInt, localView.getScrollY());
    }
  }
  
  public void setScrollY(int paramInt)
  {
    View localView = (View)mView.get();
    if (localView != null) {
      localView.scrollTo(localView.getScrollX(), paramInt);
    }
  }
  
  public void setTranslationX(float paramFloat)
  {
    if (mTranslationX != paramFloat)
    {
      prepareForUpdate();
      mTranslationX = paramFloat;
      invalidateAfterUpdate();
    }
  }
  
  public void setTranslationY(float paramFloat)
  {
    if (mTranslationY != paramFloat)
    {
      prepareForUpdate();
      mTranslationY = paramFloat;
      invalidateAfterUpdate();
    }
  }
  
  public void setX(float paramFloat)
  {
    View localView = (View)mView.get();
    if (localView != null) {
      setTranslationX(paramFloat - localView.getLeft());
    }
  }
  
  public void setY(float paramFloat)
  {
    View localView = (View)mView.get();
    if (localView != null) {
      setTranslationY(paramFloat - localView.getTop());
    }
  }
}
