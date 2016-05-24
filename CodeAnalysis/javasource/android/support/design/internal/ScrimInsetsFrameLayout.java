package android.support.design.internal;

import android.graphics.Canvas;
import android.graphics.Rect;
import android.graphics.drawable.Drawable;
import android.widget.FrameLayout;

public class ScrimInsetsFrameLayout
  extends FrameLayout
{
  private Drawable mInsetForeground;
  private Rect mInsets;
  private Rect mTempRect;
  
  public void draw(Canvas paramCanvas)
  {
    super.draw(paramCanvas);
    int i = getWidth();
    int j = getHeight();
    if ((mInsets != null) && (mInsetForeground != null))
    {
      int k = paramCanvas.save();
      paramCanvas.translate(getScrollX(), getScrollY());
      mTempRect.set(0, 0, i, mInsets.top);
      mInsetForeground.setBounds(mTempRect);
      mInsetForeground.draw(paramCanvas);
      mTempRect.set(0, j - mInsets.bottom, i, j);
      mInsetForeground.setBounds(mTempRect);
      mInsetForeground.draw(paramCanvas);
      mTempRect.set(0, mInsets.top, mInsets.left, j - mInsets.bottom);
      mInsetForeground.setBounds(mTempRect);
      mInsetForeground.draw(paramCanvas);
      mTempRect.set(i - mInsets.right, mInsets.top, i, j - mInsets.bottom);
      mInsetForeground.setBounds(mTempRect);
      mInsetForeground.draw(paramCanvas);
      paramCanvas.restoreToCount(k);
    }
  }
  
  protected void onAttachedToWindow()
  {
    super.onAttachedToWindow();
    if (mInsetForeground != null) {
      mInsetForeground.setCallback(this);
    }
  }
  
  protected void onDetachedFromWindow()
  {
    super.onDetachedFromWindow();
    if (mInsetForeground != null) {
      mInsetForeground.setCallback(null);
    }
  }
}
