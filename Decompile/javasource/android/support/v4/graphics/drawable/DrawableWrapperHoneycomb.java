package android.support.v4.graphics.drawable;

import android.graphics.drawable.Drawable;

class DrawableWrapperHoneycomb
  extends DrawableWrapperDonut
{
  DrawableWrapperHoneycomb(Drawable paramDrawable)
  {
    super(paramDrawable);
  }
  
  public void jumpToCurrentState()
  {
    mDrawable.jumpToCurrentState();
  }
}
