package uk.co.senab.photoview.gestures;

import android.view.MotionEvent;

public abstract interface GestureDetector
{
  public abstract boolean isScaling();
  
  public abstract boolean onTouchEvent(MotionEvent paramMotionEvent);
  
  public abstract void setOnGestureListener(OnGestureListener paramOnGestureListener);
}
