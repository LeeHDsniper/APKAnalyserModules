package uk.co.senab.photoview.scrollerproxy;

import android.annotation.TargetApi;
import android.content.Context;
import android.widget.OverScroller;

@TargetApi(9)
public class GingerScroller
  extends ScrollerProxy
{
  private boolean mFirstScroll = false;
  protected final OverScroller mScroller;
  
  public GingerScroller(Context paramContext)
  {
    mScroller = new OverScroller(paramContext);
  }
  
  public boolean computeScrollOffset()
  {
    if (mFirstScroll)
    {
      mScroller.computeScrollOffset();
      mFirstScroll = false;
    }
    return mScroller.computeScrollOffset();
  }
  
  public void fling(int paramInt1, int paramInt2, int paramInt3, int paramInt4, int paramInt5, int paramInt6, int paramInt7, int paramInt8, int paramInt9, int paramInt10)
  {
    mScroller.fling(paramInt1, paramInt2, paramInt3, paramInt4, paramInt5, paramInt6, paramInt7, paramInt8, paramInt9, paramInt10);
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
