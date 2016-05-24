package com.adobe.creativesdk.aviary.overlays;

import android.content.Context;
import android.content.res.Resources;
import android.graphics.Canvas;
import android.graphics.Rect;
import android.graphics.drawable.Drawable;
import android.text.Layout.Alignment;
import android.util.DisplayMetrics;
import android.view.MotionEvent;
import android.view.View;
import android.widget.Button;
import com.adobe.android.ui.view.AdobeTutorialOverlay.OnCloseListener;
import com.aviary.android.feather.sdk.R.attr;
import com.aviary.android.feather.sdk.R.drawable;
import com.aviary.android.feather.sdk.R.string;
import com.nineoldandroids.animation.Animator;
import com.nineoldandroids.animation.AnimatorSet;
import com.nineoldandroids.animation.ObjectAnimator;

public class UndoRedoOverlay
  extends AbstractBaseOverlay
{
  private Drawable mRedoDrawable;
  private CharSequence mRedoText;
  private Drawable mRedoTextDrawable;
  private final Layout.Alignment mTextAlign;
  private Drawable mTitleDrawable1;
  private CharSequence mTitleText;
  private final float mTitleWidthFraction;
  private Drawable mUndoDrawable;
  private CharSequence mUndoRext;
  private Drawable mUndoTextDrawable;
  
  public UndoRedoOverlay(Context paramContext)
  {
    super(paramContext, "undo_redo", R.attr.com_adobe_image_editor_undo_redo_overlay_style, 5);
    paramContext = paramContext.getResources();
    mRedoDrawable = paramContext.getDrawable(R.drawable.com_adobe_image_editor_overlay_undo_arrow_left);
    mUndoDrawable = paramContext.getDrawable(R.drawable.com_adobe_image_editor_overlay_undo_arrow_right);
    mTitleText = getTitleText(paramContext);
    mRedoText = paramContext.getString(R.string.feather_redo);
    mUndoRext = paramContext.getString(R.string.feather_undo);
    mTitleWidthFraction = getTitleWidthFraction(paramContext);
    mTextAlign = Layout.Alignment.ALIGN_CENTER;
  }
  
  private void calculateTextLayouts()
  {
    if (!isAttachedToParent()) {
      return;
    }
    int i = 0;
    if (mOrientationChanged) {
      i = 255;
    }
    Object localObject = getDisplayMetrics();
    int j = mRedoDrawable.getIntrinsicWidth();
    int k = mRedoDrawable.getIntrinsicHeight();
    int m = getWidth() / 2;
    int n = getHeight() / 2;
    Rect localRect1 = new Rect(m - j / 2, n - k / 2, j / 2 + m, k / 2 + n);
    mUndoDrawable.setBounds(localRect1);
    mUndoDrawable.setAlpha(i);
    mUndoTextDrawable = generateTextDrawable(getContext(), mUndoRext, localRect1.width(), mTextAlign);
    Rect localRect2 = relativeBounds(mUndoTextDrawable, localRect1, 0, 80);
    mUndoTextDrawable.setBounds(localRect2);
    mUndoTextDrawable.setAlpha(i);
    n = (int)(bottom + dp2px((DisplayMetrics)localObject, 60.0F));
    localRect2 = new Rect(m - j / 2, n - k / 2, j / 2 + m, k / 2 + n);
    mRedoDrawable.setBounds(localRect2);
    mRedoDrawable.setAlpha(i);
    mRedoTextDrawable = generateTextDrawable(getContext(), mRedoText, localRect2.width(), mTextAlign);
    localRect2 = relativeBounds(mRedoTextDrawable, localRect2, 0, 80);
    mRedoTextDrawable.setBounds(localRect2);
    mRedoTextDrawable.setAlpha(i);
    j = getWidth() / 2;
    localRect1 = new Rect(j, top, j, bottom);
    j = (int)(widthPixels * (mTitleWidthFraction / 100.0F));
    mTitleDrawable1 = generateTitleDrawable(getContext(), mTitleText, j, mTextAlign);
    localObject = generateBounds(mTitleDrawable1, localRect1, getTextMargins(), "top");
    mTitleDrawable1.setBounds((Rect)localObject);
    mTitleDrawable1.setAlpha(i);
  }
  
  static float dp2px(DisplayMetrics paramDisplayMetrics, float paramFloat)
  {
    return density * paramFloat;
  }
  
  private Rect generateBounds(Drawable paramDrawable, Rect paramRect, int paramInt, CharSequence paramCharSequence)
  {
    DisplayMetrics localDisplayMetrics = getDisplayMetrics();
    int i = paramDrawable.getIntrinsicWidth();
    int j = paramDrawable.getIntrinsicHeight();
    paramDrawable = new Rect(0, 0, i, j);
    if ("top".equals(paramCharSequence))
    {
      paramDrawable.offsetTo((widthPixels - i) / 2, top - j - paramInt);
      return paramDrawable;
    }
    paramDrawable.offsetTo((widthPixels - i) / 2, bottom + paramInt);
    return paramDrawable;
  }
  
  private Rect relativeBounds(Drawable paramDrawable, Rect paramRect, int paramInt1, int paramInt2)
  {
    int i = paramDrawable.getIntrinsicWidth();
    int j = paramDrawable.getIntrinsicHeight();
    paramDrawable = new Rect(0, 0, i, j);
    paramDrawable.offsetTo(paramRect.centerX() - i / 2, 0);
    if (paramInt2 == 48)
    {
      paramDrawable.offset(0, top - j - paramInt1);
      return paramDrawable;
    }
    paramDrawable.offset(0, bottom + paramInt1);
    return paramDrawable;
  }
  
  protected void calculatePositions()
  {
    calculateTextLayouts();
  }
  
  protected void dispatchDraw(Canvas paramCanvas)
  {
    if ((getVisibility() != 0) || (!isAttachedToParent())) {
      return;
    }
    paramCanvas.drawColor(getBackgroundColor());
    mRedoDrawable.draw(paramCanvas);
    mUndoDrawable.draw(paramCanvas);
    mTitleDrawable1.draw(paramCanvas);
    mRedoTextDrawable.draw(paramCanvas);
    mUndoTextDrawable.draw(paramCanvas);
    super.dispatchDraw(paramCanvas);
  }
  
  protected void doShow()
  {
    if (!isAttachedToParent()) {
      return;
    }
    fadeIn();
  }
  
  protected Animator generateInAnimation()
  {
    AnimatorSet localAnimatorSet = new AnimatorSet();
    ObjectAnimator localObjectAnimator1 = ObjectAnimator.ofFloat(this, "alpha", new float[] { 0.0F, 1.0F });
    localObjectAnimator1.setDuration(getAnimationDuration());
    ObjectAnimator localObjectAnimator2 = ObjectAnimator.ofInt(this, "alpha1", new int[] { 0, 255 });
    localObjectAnimator2.setDuration(getAnimationDuration());
    localObjectAnimator2.setStartDelay(50L);
    ObjectAnimator localObjectAnimator3 = ObjectAnimator.ofInt(this, "alpha2", new int[] { 0, 255 });
    localObjectAnimator3.setDuration(getAnimationDuration());
    localObjectAnimator3.setStartDelay(100L);
    ObjectAnimator localObjectAnimator4 = ObjectAnimator.ofInt(this, "alpha3", new int[] { 0, 255 });
    localObjectAnimator4.setDuration(getAnimationDuration());
    localObjectAnimator4.setStartDelay(300L);
    localAnimatorSet.playSequentially(new Animator[] { localObjectAnimator1, localObjectAnimator2, localObjectAnimator3, localObjectAnimator4 });
    return localAnimatorSet;
  }
  
  public int getAlpha1()
  {
    return mTitleDrawable1.getAlpha();
  }
  
  public int getAlpha2()
  {
    return mUndoDrawable.getAlpha();
  }
  
  public int getAlpha3()
  {
    return mRedoDrawable.getAlpha();
  }
  
  protected CharSequence getTitleText(Resources paramResources)
  {
    return paramResources.getString(R.string.feather_overlay_undo_title);
  }
  
  protected float getTitleWidthFraction(Resources paramResources)
  {
    return 90.0F;
  }
  
  protected void inAnimationCompleted()
  {
    if (getCloseButton() != null) {
      getCloseButton().setVisibility(0);
    }
  }
  
  public void onClick(View paramView)
  {
    if ((paramView == getCloseButton()) && (mCloseListener != null))
    {
      trackTutorialClosed("button");
      mCloseListener.onClose(this);
      return;
    }
    super.onClick(paramView);
  }
  
  public boolean onTouchEvent(MotionEvent paramMotionEvent)
  {
    if ((!isVisible()) || (!isActive())) {}
    do
    {
      return true;
      if (mCloseListener != null)
      {
        trackTutorialClosed("background");
        mCloseListener.onClose(this);
        return true;
      }
    } while (paramMotionEvent.getAction() != 0);
    hide("background");
    return true;
  }
  
  public void setAlpha(float paramFloat)
  {
    super.setAlpha(paramFloat);
  }
  
  public void setAlpha1(int paramInt)
  {
    mTitleDrawable1.setAlpha(paramInt);
    postInvalidate();
  }
  
  public void setAlpha2(int paramInt)
  {
    mUndoDrawable.setAlpha(paramInt);
    mUndoTextDrawable.setAlpha(paramInt);
    postInvalidate();
  }
  
  public void setAlpha3(int paramInt)
  {
    mRedoDrawable.setAlpha(paramInt);
    mRedoTextDrawable.setAlpha(paramInt);
    postInvalidate();
  }
}
