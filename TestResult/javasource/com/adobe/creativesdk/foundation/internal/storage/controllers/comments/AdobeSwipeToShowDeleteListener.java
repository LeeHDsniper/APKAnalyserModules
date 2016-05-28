package com.adobe.creativesdk.foundation.internal.storage.controllers.comments;

import android.animation.ObjectAnimator;
import android.content.Context;
import android.content.res.Resources;
import android.view.MotionEvent;
import android.view.VelocityTracker;
import android.view.View;
import android.view.View.OnTouchListener;
import android.view.ViewConfiguration;
import android.view.ViewParent;

public class AdobeSwipeToShowDeleteListener
  implements View.OnTouchListener
{
  private boolean isButtonVisible = false;
  private long mAnimationTime;
  private float mDownX;
  private float mDownY;
  private int mMaxFlingVelocity;
  private int mMinFlingVelocity;
  private int mSlop;
  private IAdobeSwipeCommandHandler mSwipeCommandHandler;
  private boolean mSwiping;
  private int mSwipingSlop;
  private float mTranslationX;
  private VelocityTracker mVelocityTracker;
  private View mView;
  private int mViewWidth = 1;
  private int maxSwipeLimit;
  
  public AdobeSwipeToShowDeleteListener(View paramView, IAdobeSwipeCommandHandler paramIAdobeSwipeCommandHandler, int paramInt)
  {
    ViewConfiguration localViewConfiguration = ViewConfiguration.get(paramView.getContext());
    mSlop = localViewConfiguration.getScaledTouchSlop();
    mMinFlingVelocity = (localViewConfiguration.getScaledMinimumFlingVelocity() * 16);
    mMaxFlingVelocity = localViewConfiguration.getScaledMaximumFlingVelocity();
    mAnimationTime = paramView.getContext().getResources().getInteger(17694720);
    mView = paramView;
    mSwipeCommandHandler = paramIAdobeSwipeCommandHandler;
    maxSwipeLimit = paramInt;
  }
  
  private void animateDeleteButton(float paramFloat)
  {
    ObjectAnimator localObjectAnimator = ObjectAnimator.ofFloat(mView, "x", new float[] { paramFloat });
    localObjectAnimator.setDuration(0L);
    localObjectAnimator.start();
  }
  
  public boolean onTouch(View paramView, MotionEvent paramMotionEvent)
  {
    paramMotionEvent.offsetLocation(mTranslationX, 0.0F);
    if (mViewWidth < 2) {
      mViewWidth = mView.getWidth();
    }
    switch (paramMotionEvent.getActionMasked())
    {
    }
    float f1;
    float f2;
    float f3;
    int i;
    label282:
    label319:
    label428:
    label431:
    label474:
    do
    {
      do
      {
        do
        {
          return false;
          mDownX = paramMotionEvent.getRawX();
          mDownY = paramMotionEvent.getRawY();
          if (mSwipeCommandHandler.canSwipe())
          {
            mVelocityTracker = VelocityTracker.obtain();
            mVelocityTracker.addMovement(paramMotionEvent);
          }
          if (mView != null) {
            mView.getParent().requestDisallowInterceptTouchEvent(true);
          }
          return true;
          mSwipeCommandHandler.stoppedSwiping();
        } while (mVelocityTracker == null);
        if (!mSwipeCommandHandler.canSwipe())
        {
          animateDeleteButton(0.0F);
          return false;
        }
        f1 = paramMotionEvent.getRawX() - mDownX;
        paramMotionEvent.getRawX();
        mVelocityTracker.addMovement(paramMotionEvent);
        mVelocityTracker.computeCurrentVelocity(1000);
        f2 = mVelocityTracker.getXVelocity();
        f3 = Math.abs(f2);
        Math.abs(mVelocityTracker.getYVelocity());
        int j = 0;
        i = j;
        if (mMinFlingVelocity <= f3)
        {
          i = j;
          if (f3 <= mMaxFlingVelocity)
          {
            i = j;
            if (mSwiping)
            {
              if (mVelocityTracker.getXVelocity() <= 0.0F) {
                break label428;
              }
              if ((f2 >= 0.0F) || (f1 >= 0.0F)) {
                break label431;
              }
              i = 1;
              mSwipeCommandHandler.handleDeleteVisibility(true, true);
              animateDeleteButton(-maxSwipeLimit);
            }
          }
        }
        if ((i == 0) && (mSwiping))
        {
          if ((f1 >= 0.0F) || (Math.abs(f1) < maxSwipeLimit / 2)) {
            break label474;
          }
          mSwipeCommandHandler.handleDeleteVisibility(true, true);
          animateDeleteButton(-maxSwipeLimit);
        }
        for (;;)
        {
          mVelocityTracker.recycle();
          mVelocityTracker = null;
          mTranslationX = 0.0F;
          mDownX = 0.0F;
          mDownY = 0.0F;
          mSwiping = false;
          if (mView == null) {
            break;
          }
          mView.getParent().requestDisallowInterceptTouchEvent(false);
          break;
          break label282;
          i = j;
          if (f2 <= 0.0F) {
            break label319;
          }
          i = j;
          if (f1 <= 0.0F) {
            break label319;
          }
          i = 1;
          mSwipeCommandHandler.handleDeleteVisibility(false, true);
          animateDeleteButton(0.0F);
          break label319;
          if ((f1 < 0.0F) && (Math.abs(f1) < maxSwipeLimit / 2))
          {
            mSwipeCommandHandler.handleDeleteVisibility(false, true);
            animateDeleteButton(0.0F);
          }
          else if ((f1 > 0.0F) && (Math.abs(f1) >= maxSwipeLimit / 2))
          {
            if (mSwipeCommandHandler.isVisible())
            {
              mSwipeCommandHandler.handleDeleteVisibility(false, true);
              animateDeleteButton(0.0F);
            }
          }
          else if ((f1 > 0.0F) && (Math.abs(f1) < maxSwipeLimit / 2) && (mSwipeCommandHandler.isVisible()))
          {
            mSwipeCommandHandler.handleDeleteVisibility(true, true);
            animateDeleteButton(-maxSwipeLimit);
          }
        }
      } while (mVelocityTracker == null);
      if ((mView != null) && (mSwipeCommandHandler.isSwiping()))
      {
        animateDeleteButton(-maxSwipeLimit);
        mSwipeCommandHandler.handleDeleteVisibility(true, true);
      }
      for (;;)
      {
        mSwipeCommandHandler.stoppedSwiping();
        mVelocityTracker.recycle();
        mVelocityTracker = null;
        mTranslationX = 0.0F;
        mDownX = 0.0F;
        mDownY = 0.0F;
        mSwiping = false;
        if (mView == null) {
          break;
        }
        mView.getParent().requestDisallowInterceptTouchEvent(false);
        break;
        animateDeleteButton(0.0F);
        mSwipeCommandHandler.handleDeleteVisibility(false, false);
      }
    } while (mVelocityTracker == null);
    if (mSwipeCommandHandler.canSwipe() == true)
    {
      if (mView != null) {
        mView.getParent().requestDisallowInterceptTouchEvent(true);
      }
      mVelocityTracker.addMovement(paramMotionEvent);
      f1 = paramMotionEvent.getRawX() - mDownX;
      f2 = paramMotionEvent.getRawY();
      f3 = mDownY;
      if ((Math.abs(f1) > mSlop) && (Math.abs(f2 - f3) < Math.abs(f1) / 2.0F))
      {
        mSwipeCommandHandler.startedSwiping();
        mSwiping = true;
        if (f1 > 0.0F)
        {
          i = mSlop;
          label880:
          mSwipingSlop = i;
          label886:
          if (!mSwiping) {
            break label977;
          }
          if ((f1 <= 0.0F) || (!mSwipeCommandHandler.isVisible())) {
            break label979;
          }
          f2 = f1;
          if (f1 > maxSwipeLimit) {
            f2 = maxSwipeLimit;
          }
          animateDeleteButton(-(maxSwipeLimit - f2));
        }
      }
      for (;;)
      {
        return true;
        i = -mSlop;
        break label880;
        if (mView == null) {
          break label886;
        }
        mView.getParent().requestDisallowInterceptTouchEvent(false);
        break label886;
        label977:
        break;
        label979:
        if ((f1 < 0.0F) && (!mSwipeCommandHandler.isVisible()))
        {
          f2 = -f1;
          f1 = f2;
          if (f2 > maxSwipeLimit) {
            f1 = maxSwipeLimit;
          }
          animateDeleteButton(-f1);
        }
      }
    }
    if (mView != null) {
      mView.getParent().requestDisallowInterceptTouchEvent(false);
    }
    animateDeleteButton(0.0F);
    return false;
  }
}
