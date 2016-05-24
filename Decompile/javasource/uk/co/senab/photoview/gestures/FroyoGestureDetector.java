package uk.co.senab.photoview.gestures;

import android.annotation.TargetApi;
import android.content.Context;
import android.view.MotionEvent;
import android.view.ScaleGestureDetector;
import android.view.ScaleGestureDetector.OnScaleGestureListener;

@TargetApi(8)
public class FroyoGestureDetector
  extends EclairGestureDetector
{
  protected final ScaleGestureDetector mDetector = new ScaleGestureDetector(paramContext, new ScaleGestureDetector.OnScaleGestureListener()
  {
    public boolean onScale(ScaleGestureDetector paramAnonymousScaleGestureDetector)
    {
      float f = paramAnonymousScaleGestureDetector.getScaleFactor();
      if ((Float.isNaN(f)) || (Float.isInfinite(f))) {
        return false;
      }
      mListener.onScale(f, paramAnonymousScaleGestureDetector.getFocusX(), paramAnonymousScaleGestureDetector.getFocusY());
      return true;
    }
    
    public boolean onScaleBegin(ScaleGestureDetector paramAnonymousScaleGestureDetector)
    {
      return true;
    }
    
    public void onScaleEnd(ScaleGestureDetector paramAnonymousScaleGestureDetector) {}
  });
  
  public FroyoGestureDetector(Context paramContext)
  {
    super(paramContext);
  }
  
  public boolean isScaling()
  {
    return mDetector.isInProgress();
  }
  
  public boolean onTouchEvent(MotionEvent paramMotionEvent)
  {
    mDetector.onTouchEvent(paramMotionEvent);
    return super.onTouchEvent(paramMotionEvent);
  }
}
