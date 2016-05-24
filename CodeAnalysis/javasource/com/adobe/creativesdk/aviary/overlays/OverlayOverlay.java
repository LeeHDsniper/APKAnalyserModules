package com.adobe.creativesdk.aviary.overlays;

import android.content.Context;
import android.content.res.Resources;
import android.graphics.Canvas;
import android.graphics.Matrix;
import android.graphics.Rect;
import android.graphics.drawable.Drawable;
import android.text.Layout.Alignment;
import android.util.DisplayMetrics;
import android.view.MotionEvent;
import android.view.View;
import android.widget.Button;
import com.adobe.android.ui.view.AdobeTutorialOverlay.OnCloseListener;
import com.adobe.creativesdk.aviary.internal.filters.ToolLoaderFactory;
import com.adobe.creativesdk.aviary.internal.filters.ToolLoaderFactory.Tools;
import com.adobe.creativesdk.aviary.log.LoggerFactory.Logger;
import com.aviary.android.feather.sdk.R.drawable;
import com.aviary.android.feather.sdk.R.fraction;
import com.aviary.android.feather.sdk.R.string;

public class OverlayOverlay
  extends AbstractBaseOverlay
{
  private Drawable mBottomArrow;
  private final Layout.Alignment mTextAlign;
  private Drawable mTitleDrawable1;
  private CharSequence mTitleText;
  private final float mTitleWidthFraction;
  private Drawable mTopArrow;
  
  public OverlayOverlay(Context paramContext, int paramInt)
  {
    super(paramContext, ToolLoaderFactory.getToolName(ToolLoaderFactory.Tools.OVERLAYS) + "_pinch", paramInt, 8);
    paramContext = paramContext.getResources();
    mTopArrow = paramContext.getDrawable(R.drawable.com_adobe_image_editor_overlay_arrow_top);
    mBottomArrow = paramContext.getDrawable(R.drawable.com_adobe_image_editor_overlay_arrow_top);
    mTitleText = getTitleText(paramContext);
    mTitleWidthFraction = getTitleWidthFraction(paramContext);
    mTextAlign = Layout.Alignment.ALIGN_CENTER;
    addCloseButton(new int[] { 10, 9 });
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
    int j = (int)(getDisplayMetricswidthPixels * (mTitleWidthFraction / 100.0F));
    mTitleDrawable1 = generateTitleDrawable(getContext(), mTitleText, j, mTextAlign);
    j = mTitleDrawable1.getIntrinsicWidth();
    int k = mTitleDrawable1.getIntrinsicHeight();
    Rect localRect1 = new Rect(getWidth() / 2 - j / 2, getHeight() / 2 - k / 2, getWidth() / 2 + j / 2, getHeight() / 2 + k / 2);
    Rect localRect2 = generateBounds(mTopArrow, localRect1, getTextMargins(), "top");
    Rect localRect3 = generateBounds(mTopArrow, localRect1, getTextMargins(), "bottom");
    mTopArrow.setBounds(localRect2);
    mBottomArrow.setBounds(localRect3);
    mTitleDrawable1.setBounds(localRect1);
    mTitleDrawable1.setAlpha(i);
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
  
  protected void calculatePositions()
  {
    logger.info("calculatePositions");
    calculateTextLayouts();
  }
  
  protected void dispatchDraw(Canvas paramCanvas)
  {
    if ((getVisibility() != 0) || (!isAttachedToParent())) {
      return;
    }
    paramCanvas.drawColor(getBackgroundColor());
    int i = paramCanvas.save();
    Matrix localMatrix = new Matrix();
    Rect localRect = mTitleDrawable1.getBounds();
    localMatrix.setRotate(45.0F, localRect.centerX(), localRect.centerY());
    paramCanvas.concat(localMatrix);
    mTopArrow.draw(paramCanvas);
    paramCanvas.restoreToCount(i);
    i = paramCanvas.save();
    localMatrix.reset();
    localMatrix.setScale(1.0F, -1.0F, 0.0F, mBottomArrow.getBounds().centerY());
    localMatrix.postRotate(45.0F, localRect.centerX(), localRect.centerY());
    paramCanvas.concat(localMatrix);
    mBottomArrow.draw(paramCanvas);
    paramCanvas.restoreToCount(i);
    mTitleDrawable1.draw(paramCanvas);
    super.dispatchDraw(paramCanvas);
  }
  
  protected void doShow()
  {
    logger.info("doShow");
    if (!isAttachedToParent()) {
      return;
    }
    fadeIn();
  }
  
  protected CharSequence getTitleText(Resources paramResources)
  {
    return paramResources.getString(R.string.feather_pinch_to_zoom);
  }
  
  protected float getTitleWidthFraction(Resources paramResources)
  {
    return paramResources.getFraction(R.fraction.com_adobe_image_editor_overlay_overlay_text_width, 100, 100);
  }
  
  protected void inAnimationCompleted()
  {
    if (getCloseButton() != null) {
      getCloseButton().setVisibility(0);
    }
  }
  
  public void onClick(View paramView)
  {
    logger.info("onClick: " + paramView);
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
    mTopArrow.setAlpha((int)(paramFloat * 255.0F));
    mBottomArrow.setAlpha((int)(paramFloat * 255.0F));
    mTitleDrawable1.setAlpha((int)(paramFloat * 255.0F));
    super.setAlpha(paramFloat);
  }
}
