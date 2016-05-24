package uk.co.senab.photoview.scrollerproxy;

import android.content.Context;
import android.widget.Scroller;

public class PreGingerScroller
  extends ScrollerProxy
{
  private final Scroller mScroller;
  
  public PreGingerScroller(Context paramContext)
  {
    mScroller = new Scroller(paramContext);
  }
  
  public boolean computeScrollOffset()
  {
    return mScroller.computeScrollOffset();
  }
  
  public void fling(int paramInt1, int paramInt2, int paramInt3, int paramInt4, int paramInt5, int paramInt6, int paramInt7, int paramInt8, int paramInt9, int paramInt10)
  {
    mScroller.fling(paramInt1, paramInt2, paramInt3, paramInt4, paramInt5, paramInt6, paramInt7, paramInt8);
  }
  
  public void forceFinished(boolean paramBoolean)
  {
    mScroller.forceFinished(paramBoolean);
  }
  
  public int getCurrX()
  {
    return mScroller.getCurrX();
  }
  
  public int getCurrY()
  {
    return mScroller.getCurrY();
  }
  
  public boolean isFinished()
  {
    return mScroller.isFinished();
  }
}
