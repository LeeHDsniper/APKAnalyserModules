package android.support.v7.internal.widget;

import android.graphics.Outline;
import android.graphics.drawable.Drawable;

class ActionBarBackgroundDrawableV21
  extends ActionBarBackgroundDrawable
{
  public ActionBarBackgroundDrawableV21(ActionBarContainer paramActionBarContainer)
  {
    super(paramActionBarContainer);
  }
  
  public void getOutline(Outline paramOutline)
  {
    if (mContainer.mIsSplit) {
      if (mContainer.mSplitBackground != null) {
        mContainer.mSplitBackground.getOutline(paramOutline);
      }
    }
    while (mContainer.mBackground == null) {
      return;
    }
    mContainer.mBackground.getOutline(paramOutline);
  }
}
