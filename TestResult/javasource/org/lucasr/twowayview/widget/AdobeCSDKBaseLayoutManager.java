package org.lucasr.twowayview.widget;

import android.support.v7.widget.OrientationHelper;
import android.support.v7.widget.RecyclerView.State;
import android.view.View;
import org.lucasr.twowayview.TwoWayLayoutManager;
import org.lucasr.twowayview.TwoWayLayoutManager.Orientation;

public abstract class AdobeCSDKBaseLayoutManager
  extends TwoWayLayoutManager
{
  private OrientationHelper mOrientationHelper;
  private final boolean mSmoothScrollbarEnabled = true;
  
  public AdobeCSDKBaseLayoutManager(TwoWayLayoutManager.Orientation paramOrientation)
  {
    super(paramOrientation);
  }
  
  private View getChildClosestToEnd()
  {
    return getChildAt(getChildCount() - 1);
  }
  
  private View getChildClosestToStart()
  {
    return getChildAt(0);
  }
  
  public int computeVerticalScrollExtent(RecyclerView.State paramState)
  {
    if (getChildCount() == 0) {
      return 0;
    }
    return ScrollbarHelper.computeScrollExtent(paramState, mOrientationHelper, getChildClosestToStart(), getChildClosestToEnd(), this, true);
  }
  
  public int computeVerticalScrollOffset(RecyclerView.State paramState)
  {
    if (getChildCount() == 0) {
      return 0;
    }
    return ScrollbarHelper.computeScrollOffset(paramState, mOrientationHelper, getChildClosestToStart(), getChildClosestToEnd(), this, true, false);
  }
  
  public int computeVerticalScrollRange(RecyclerView.State paramState)
  {
    if (getChildCount() == 0) {
      return 0;
    }
    return ScrollbarHelper.computeScrollRange(paramState, mOrientationHelper, getChildClosestToStart(), getChildClosestToEnd(), this, true);
  }
  
  protected void ensureLayoutStateDueToChildContentChange(RecyclerView.State paramState)
  {
    if (mOrientationHelper == null) {
      mOrientationHelper = OrientationHelper.createOrientationHelper(this, 1);
    }
    int i = paramState.getItemCount();
    if (i == 0) {}
    int j;
    do
    {
      do
      {
        return;
      } while (getPendingScrollPosition() != -1);
      j = getFirstVisiblePosition();
    } while ((j < 0) || (j >= i));
    paramState = findViewByPosition(j);
    if (paramState != null)
    {
      setPendingScrollPositionWithOffset(j, getChildStart(paramState));
      return;
    }
    setPendingScrollPositionWithOffset(-1, 0);
  }
}
