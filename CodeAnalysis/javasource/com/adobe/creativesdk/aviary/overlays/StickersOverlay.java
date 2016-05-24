package com.adobe.creativesdk.aviary.overlays;

import android.content.Context;
import android.content.res.Resources;
import android.graphics.Canvas;
import android.graphics.Rect;
import android.graphics.drawable.Drawable;
import android.text.DynamicLayout;
import android.text.Layout.Alignment;
import android.text.TextPaint;
import android.util.DisplayMetrics;
import android.view.MotionEvent;
import android.view.View;
import android.widget.Button;
import com.adobe.creativesdk.aviary.internal.filters.ToolLoaderFactory;
import com.adobe.creativesdk.aviary.internal.filters.ToolLoaderFactory.Tools;
import com.adobe.creativesdk.aviary.internal.tracking.AdobeImageAnalyticsTracker;
import com.adobe.creativesdk.aviary.log.LoggerFactory.Logger;
import com.aviary.android.feather.sdk.R.fraction;
import com.aviary.android.feather.sdk.R.string;

public class StickersOverlay
  extends AbstractBaseOverlay
{
  private Drawable arrow;
  private final float mDensity;
  private CharSequence mDetailText;
  private DynamicLayout mDetailsLayout;
  private Rect mDetailsPosition;
  private Layout.Alignment mTextAlign;
  private CharSequence mTextRelativePosition;
  private float mTextWidthFraction;
  private DynamicLayout mTitleLayout;
  private Rect mTitlePosition;
  private CharSequence mTitleText;
  private View packView;
  private final Rect viewRect;
  
  public StickersOverlay(Context paramContext, int paramInt1, View paramView, ToolLoaderFactory.Tools paramTools, int paramInt2)
  {
    super(paramContext, ToolLoaderFactory.getToolName(paramTools), paramInt1, paramInt2);
    paramContext = paramContext.getResources();
    mDensity = getDisplayMetricsdensity;
    viewRect = new Rect();
    arrow = generateArrow();
    packView = paramView;
    mTitleText = getTitleText(paramContext);
    mDetailText = getDetailText(paramContext);
    mTextWidthFraction = getTextWidthFraction(paramContext);
    mTextRelativePosition = getTextRelativePosition(paramContext);
    paramContext = paramContext.getString(R.string.com_adobe_image_editor_overlay_default_text_align);
    if (Layout.Alignment.ALIGN_CENTER.name().equals(paramContext)) {
      mTextAlign = Layout.Alignment.ALIGN_CENTER;
    }
    for (;;)
    {
      addCloseButton(new int[] { 10, 9 });
      return;
      if (Layout.Alignment.ALIGN_OPPOSITE.equals(paramContext)) {
        mTextAlign = Layout.Alignment.ALIGN_OPPOSITE;
      } else {
        mTextAlign = Layout.Alignment.ALIGN_NORMAL;
      }
    }
  }
  
  private void calculateTextLayouts()
  {
    if (!isAttachedToParent()) {}
    do
    {
      return;
      packView.getGlobalVisibleRect(viewRect);
    } while ((mDetailsLayout != null) && (mTitleLayout != null) && (!mOrientationChanged));
    int i = viewRect.centerX();
    viewRect.centerY();
    int j = viewRect.top;
    int k = viewRect.left;
    DisplayMetrics localDisplayMetrics = getDisplayMetrics();
    int m = (int)(widthPixels * (mTextWidthFraction / 100.0F));
    mDetailsLayout = generateTextLayout(mDetailText, m, mTextAlign);
    mDetailsPosition = new Rect();
    if (POSITION_LEFT.equals(mTextRelativePosition))
    {
      mDetailsPosition.left = (k - m / 2);
      mDetailsPosition.right = (mDetailsPosition.left + mDetailsLayout.getWidth());
      mDetailsPosition.top = ((int)(j - arrow.getIntrinsicHeight() - mDetailsLayout.getHeight() - getTextMargins() - 10.0F * mDensity));
      mDetailsPosition.bottom = (mDetailsPosition.top + mDetailsLayout.getHeight());
      if (mDetailsPosition.right <= widthPixels) {
        break label428;
      }
      mDetailsPosition.offset(widthPixels - mDetailsPosition.right - getTextMargins(), 0);
    }
    for (;;)
    {
      mTitleLayout = generateTitleLayout(mTitleText, m, mTextAlign);
      mTitlePosition = new Rect();
      mTitlePosition.left = mDetailsPosition.left;
      mTitlePosition.right = mDetailsPosition.right;
      mTitlePosition.top = (mDetailsPosition.top - mTitleLayout.getHeight() - getTitleMargins());
      mTitlePosition.bottom = (mTitlePosition.top + mTitleLayout.getHeight());
      return;
      if (POSITION_CENTER.equals(mTextRelativePosition))
      {
        mDetailsPosition.left = (i - m / 2);
        break;
      }
      mDetailsPosition.left = viewRect.right;
      break;
      label428:
      if (mDetailsPosition.left < 0) {
        mDetailsPosition.left = getTextMargins();
      }
    }
  }
  
  private void trackPackClicked()
  {
    if (getContext() != null) {
      AdobeImageAnalyticsTracker.getInstance(getContext()).tagEvent(getToolName() + ": tutorial_pack_selected");
    }
  }
  
  protected void calculatePositions()
  {
    logger.info("calculatePositions");
    calculateTextLayouts();
  }
  
  protected void dispatchDraw(Canvas paramCanvas)
  {
    if ((getVisibility() != 0) || (!isAttachedToParent()) || (packView == null)) {
      return;
    }
    paramCanvas.drawColor(getBackgroundColor());
    arrow.setBounds(viewRect.centerX(), (int)(viewRect.top - arrow.getIntrinsicHeight() - mDensity * 10.0F), viewRect.centerX() + arrow.getIntrinsicWidth(), (int)(viewRect.top - mDensity * 10.0F));
    arrow.draw(paramCanvas);
    calculateTextLayouts();
    if (mDetailsLayout != null)
    {
      paramCanvas.save();
      paramCanvas.translate(mDetailsPosition.left, mDetailsPosition.top);
      mDetailsLayout.draw(paramCanvas);
      paramCanvas.restore();
    }
    if (mTitleLayout != null)
    {
      paramCanvas.save();
      paramCanvas.translate(mTitlePosition.left, mTitlePosition.top);
      mTitleLayout.draw(paramCanvas);
      paramCanvas.restore();
    }
    paramCanvas.save();
    paramCanvas.translate(viewRect.left, viewRect.top);
    packView.draw(paramCanvas);
    paramCanvas.restore();
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
  
  protected CharSequence getDetailText(Resources paramResources)
  {
    return paramResources.getString(R.string.feather_overlay_stickers_text);
  }
  
  public int getTextMargins()
  {
    return (int)(5.0F * mDensity);
  }
  
  protected CharSequence getTextRelativePosition(Resources paramResources)
  {
    return paramResources.getString(R.string.com_adobe_image_editor_overlay_stickers_text_position);
  }
  
  protected float getTextWidthFraction(Resources paramResources)
  {
    return paramResources.getFraction(R.fraction.com_adobe_image_editor_overlay_stickers_text_width, 100, 100);
  }
  
  protected CharSequence getTitleText(Resources paramResources)
  {
    return paramResources.getString(R.string.feather_stickers);
  }
  
  protected void inAnimationCompleted()
  {
    logger.info("inAnimationCompleted");
    if (getCloseButton() != null) {
      getCloseButton().setVisibility(0);
    }
  }
  
  public boolean onTouchEvent(MotionEvent paramMotionEvent)
  {
    boolean bool = true;
    float f1 = Math.abs(paramMotionEvent.getRawX() - viewRect.centerX());
    float f2 = Math.abs(paramMotionEvent.getRawY() - viewRect.centerY());
    Math.sqrt(Math.pow(f1, 2.0D) + Math.pow(f2, 2.0D));
    int i = (int)(viewRect.width() / 1.5F);
    if (viewRect.contains((int)paramMotionEvent.getRawX(), (int)paramMotionEvent.getRawY()))
    {
      trackPackClicked();
      bool = false;
    }
    while (paramMotionEvent.getAction() != 0) {
      return bool;
    }
    hide("background");
    return true;
  }
  
  public void setAlpha(float paramFloat)
  {
    if (mTitleLayout != null) {
      mTitleLayout.getPaint().setAlpha((int)(paramFloat * 255.0F));
    }
    if (mDetailsLayout != null) {
      mDetailsLayout.getPaint().setAlpha((int)(paramFloat * 255.0F));
    }
    arrow.setAlpha((int)(paramFloat * 255.0F));
    super.setAlpha(paramFloat);
  }
  
  public void setText(int paramInt)
  {
    setText(getContext().getString(paramInt));
  }
  
  public void setText(CharSequence paramCharSequence)
  {
    mDetailText = paramCharSequence;
    mDetailsLayout = null;
    postInvalidate();
  }
  
  public void setTitle(int paramInt)
  {
    setTitle(getContext().getString(paramInt));
  }
  
  public void setTitle(CharSequence paramCharSequence)
  {
    mTitleText = paramCharSequence;
    mTitleLayout = null;
    postInvalidate();
  }
  
  public void update(View paramView)
  {
    logger.info("update");
    packView = paramView;
    mDetailsLayout = null;
    calculatePositions();
    postInvalidate();
  }
}
