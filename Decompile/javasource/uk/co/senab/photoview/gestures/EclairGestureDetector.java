package uk.co.senab.photoview.gestures;

import android.annotation.TargetApi;
import android.content.Context;
import android.view.MotionEvent;
import uk.co.senab.photoview.Compat;

@TargetApi(5)
public class EclairGestureDetector
  extends CupcakeGestureDetector
{
  private int mActivePointerId = -1;
  private int mActivePointerIndex = 0;
  
  public EclairGestureDetector(Context paramContext)
  {
    super(paramContext);
  }
  
  float getActiveX(MotionEvent paramMotionEvent)
  {
    try
    {
      float f = paramMotionEvent.getX(mActivePointerIndex);
      return f;
    }
    catch (Exception localException) {}
    return paramMotionEvent.getX();
  }
  
  float getActiveY(MotionEvent paramMotionEvent)
  {
    try
    {
      float f = paramMotionEvent.getY(mActivePointerIndex);
      return f;
    }
    catch (Exception localException) {}
    return paramMotionEvent.getY();
  }
  
  public boolean onTouchEvent(MotionEvent paramMotionEvent)
  {
    int j = 0;
    switch (paramMotionEvent.getAction() & 0xFF)
    {
    }
    do
    {
      for (;;)
      {
        i = j;
        if (mActivePointerId != -1) {
          i = mActivePointerId;
        }
        mActivePointerIndex = paramMotionEvent.findPointerIndex(i);
        return super.onTouchEvent(paramMotionEvent);
        mActivePointerId = paramMotionEvent.getPointerId(0);
        continue;
        mActivePointerId = -1;
      }
      i = Compat.getPointerIndex(paramMotionEvent.getAction());
    } while (paramMotionEvent.getPointerId(i) != mActivePointerId);
    if (i == 0) {}
    for (int i = 1;; i = 0)
    {
      mActivePointerId = paramMotionEvent.getPointerId(i);
      mLastTouchX = paramMotionEvent.getX(i);
      mLastTouchY = paramMotionEvent.getY(i);
      break;
    }
  }
}
