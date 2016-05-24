package android.support.design.widget;

import android.view.View;

class ViewOffsetBehavior<V extends View>
  extends CoordinatorLayout.Behavior<V>
{
  private int mTempLeftRightOffset;
  private int mTempTopBottomOffset;
  private ViewOffsetHelper mViewOffsetHelper;
  
  public int getTopAndBottomOffset()
  {
    if (mViewOffsetHelper != null) {
      return mViewOffsetHelper.getTopAndBottomOffset();
    }
    return 0;
  }
  
  public boolean onLayoutChild(CoordinatorLayout paramCoordinatorLayout, V paramV, int paramInt)
  {
    paramCoordinatorLayout.onLayoutChild(paramV, paramInt);
    if (mViewOffsetHelper == null) {
      mViewOffsetHelper = new ViewOffsetHelper(paramV);
    }
    mViewOffsetHelper.onViewLayout();
    if (mTempTopBottomOffset != 0)
    {
      mViewOffsetHelper.setTopAndBottomOffset(mTempTopBottomOffset);
      mTempTopBottomOffset = 0;
    }
    if (mTempLeftRightOffset != 0)
    {
      mViewOffsetHelper.setLeftAndRightOffset(mTempLeftRightOffset);
      mTempLeftRightOffset = 0;
    }
    return true;
  }
  
  public boolean setTopAndBottomOffset(int paramInt)
  {
    if (mViewOffsetHelper != null) {
      return mViewOffsetHelper.setTopAndBottomOffset(paramInt);
    }
    mTempTopBottomOffset = paramInt;
    return false;
  }
}
