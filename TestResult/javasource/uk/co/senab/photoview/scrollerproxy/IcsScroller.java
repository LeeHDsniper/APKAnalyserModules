package uk.co.senab.photoview.scrollerproxy;

import android.annotation.TargetApi;
import android.content.Context;
import android.widget.OverScroller;

@TargetApi(14)
public class IcsScroller
  extends GingerScroller
{
  public IcsScroller(Context paramContext)
  {
    super(paramContext);
  }
  
  public boolean computeScrollOffset()
  {
    return mScroller.computeScrollOffset();
  }
}
