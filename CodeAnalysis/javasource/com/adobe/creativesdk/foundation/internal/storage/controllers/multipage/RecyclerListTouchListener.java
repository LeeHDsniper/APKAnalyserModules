package com.adobe.creativesdk.foundation.internal.storage.controllers.multipage;

import android.content.Context;
import android.view.GestureDetector;
import android.view.GestureDetector.SimpleOnGestureListener;
import android.view.MotionEvent;
import android.view.ScaleGestureDetector;
import android.view.ScaleGestureDetector.OnScaleGestureListener;
import android.view.View;
import android.view.View.OnTouchListener;

public class RecyclerListTouchListener
  implements View.OnTouchListener
{
  GestureDetector mGestureDetector;
  private OnTouchListener mListener;
  ScaleGestureDetector mScaleGestureDetector;
  
  public RecyclerListTouchListener(Context paramContext, OnTouchListener paramOnTouchListener)
  {
    mListener = paramOnTouchListener;
    mGestureDetector = new GestureDetector(paramContext, new GestureDetector.SimpleOnGestureListener()
    {
      public boolean onSingleTapUp(MotionEvent paramAnonymousMotionEvent)
      {
        return true;
      }
    });
    mScaleGestureDetector = new ScaleGestureDetector(paramContext, new ScaleGestureDetector.OnScaleGestureListener()
    {
      public boolean onScale(ScaleGestureDetector paramAnonymousScaleGestureDetector)
      {
        mListener.performAction();
        return true;
      }
      
      public boolean onScaleBegin(ScaleGestureDetector paramAnonymousScaleGestureDetector)
      {
        return true;
      }
      
      public void onScaleEnd(ScaleGestureDetector paramAnonymousScaleGestureDetector) {}
    });
  }
  
  public boolean onTouch(View paramView, MotionEvent paramMotionEvent)
  {
    if ((paramView != null) && (mListener != null) && (mGestureDetector.onTouchEvent(paramMotionEvent))) {
      mListener.performAction();
    }
    for (;;)
    {
      return true;
      if ((paramView != null) && (mListener != null)) {
        mScaleGestureDetector.onTouchEvent(paramMotionEvent);
      }
    }
  }
  
  public static abstract interface OnTouchListener
  {
    public abstract void performAction();
  }
}
