package it.sephiroth.android.library.viewrevealanimator;

import android.graphics.Point;

abstract interface RevealAnimator
{
  public abstract boolean shouldAnimate();
  
  public abstract void showOnly(int paramInt1, int paramInt2, Point paramPoint);
  
  public abstract void showOnlyNoAnimation(int paramInt1, int paramInt2);
}
