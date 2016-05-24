package com.adobe.creativesdk.aviary.widget;

import android.content.Context;
import android.graphics.Point;
import android.support.v7.widget.RecyclerView;
import android.util.AttributeSet;
import android.view.ViewGroup;
import android.view.animation.Animation;
import android.view.animation.Animation.AnimationListener;
import android.view.animation.AnimationUtils;
import com.adobe.creativesdk.aviary.internal.utils.ApiHelper;
import com.aviary.android.feather.sdk.R.anim;
import it.sephiroth.android.library.viewrevealanimator.ViewRevealAnimator;

public class AdobeImageBottomBarAnimator
  extends ViewRevealAnimator
  implements Animation.AnimationListener
{
  private OnViewChangingStatusListener mListener;
  private Point openOriginPoint;
  
  public AdobeImageBottomBarAnimator(Context paramContext)
  {
    this(paramContext, null);
  }
  
  public AdobeImageBottomBarAnimator(Context paramContext, AttributeSet paramAttributeSet)
  {
    super(paramContext, paramAttributeSet);
  }
  
  public boolean close()
  {
    if (getDisplayedChild() == 1)
    {
      if (!ApiHelper.AT_LEAST_21)
      {
        Animation localAnimation = AnimationUtils.loadAnimation(getContext(), R.anim.com_adobe_image_bottombar_out);
        localAnimation.setAnimationListener(this);
        setInAnimation(getContext(), R.anim.com_adobe_image_bottombar_void);
        setOutAnimation(localAnimation);
      }
      setDisplayedChild(0, true, openOriginPoint);
      openOriginPoint = null;
      return true;
    }
    return false;
  }
  
  public ViewGroup getContentPanel()
  {
    return (ViewGroup)getChildAt(1);
  }
  
  public RecyclerView getToolsListView()
  {
    return (RecyclerView)getChildAt(0);
  }
  
  protected void onAnimationCompleted(int paramInt1, int paramInt2)
  {
    super.onAnimationCompleted(paramInt1, paramInt2);
    if (mListener != null)
    {
      if (getDisplayedChild() == 1) {
        mListener.onOpenEnd();
      }
    }
    else {
      return;
    }
    mListener.onCloseEnd();
  }
  
  public void onAnimationEnd(Animation paramAnimation)
  {
    if (mListener != null)
    {
      if (getDisplayedChild() != 1) {
        break label30;
      }
      mListener.onOpenEnd();
    }
    for (;;)
    {
      paramAnimation.setAnimationListener(null);
      return;
      label30:
      mListener.onCloseEnd();
    }
  }
  
  public void onAnimationRepeat(Animation paramAnimation) {}
  
  public void onAnimationStart(Animation paramAnimation)
  {
    if (mListener != null)
    {
      if (getDisplayedChild() == 1) {
        mListener.onOpenStart();
      }
    }
    else {
      return;
    }
    mListener.onCloseStart();
  }
  
  protected void onAnimationStarted(int paramInt1, int paramInt2)
  {
    super.onAnimationStarted(paramInt1, paramInt2);
    if (mListener != null)
    {
      if (paramInt2 == 1) {
        mListener.onOpenStart();
      }
    }
    else {
      return;
    }
    mListener.onOpenEnd();
  }
  
  protected void onFinishInflate()
  {
    super.onFinishInflate();
  }
  
  public boolean open(Point paramPoint)
  {
    if (getDisplayedChild() == 0)
    {
      if (!ApiHelper.AT_LEAST_21)
      {
        Animation localAnimation = AnimationUtils.loadAnimation(getContext(), R.anim.com_adobe_image_bottombar_in);
        localAnimation.setAnimationListener(this);
        setInAnimation(localAnimation);
        setOutAnimation(getContext(), R.anim.com_adobe_image_bottombar_void);
      }
      if (paramPoint != null) {
        openOriginPoint = new Point(paramPoint);
      }
      setDisplayedChild(1, true, paramPoint);
      return true;
    }
    return false;
  }
  
  public void setOnViewChangingStatusListener(OnViewChangingStatusListener paramOnViewChangingStatusListener)
  {
    mListener = paramOnViewChangingStatusListener;
  }
  
  public static abstract interface OnViewChangingStatusListener
  {
    public abstract void onCloseEnd();
    
    public abstract void onCloseStart();
    
    public abstract void onOpenEnd();
    
    public abstract void onOpenStart();
  }
}
