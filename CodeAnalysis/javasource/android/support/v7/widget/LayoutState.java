package android.support.v7.widget;

import android.view.View;

class LayoutState
{
  int mAvailable;
  int mCurrentPosition;
  int mEndLine = 0;
  int mItemDirection;
  int mLayoutDirection;
  int mStartLine = 0;
  
  LayoutState() {}
  
  boolean hasMore(RecyclerView.State paramState)
  {
    return (mCurrentPosition >= 0) && (mCurrentPosition < paramState.getItemCount());
  }
  
  View next(RecyclerView.Recycler paramRecycler)
  {
    paramRecycler = paramRecycler.getViewForPosition(mCurrentPosition);
    mCurrentPosition += mItemDirection;
    return paramRecycler;
  }
  
  public String toString()
  {
    return "LayoutState{mAvailable=" + mAvailable + ", mCurrentPosition=" + mCurrentPosition + ", mItemDirection=" + mItemDirection + ", mLayoutDirection=" + mLayoutDirection + ", mStartLine=" + mStartLine + ", mEndLine=" + mEndLine + '}';
  }
}
