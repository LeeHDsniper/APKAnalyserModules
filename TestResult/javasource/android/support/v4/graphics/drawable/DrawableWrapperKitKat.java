package android.support.v4.graphics.drawable;

import android.graphics.drawable.Drawable;

class DrawableWrapperKitKat
  extends DrawableWrapperHoneycomb
{
  DrawableWrapperKitKat(Drawable paramDrawable)
  {
    super(paramDrawable);
  }
  
  public boolean isAutoMirrored()
  {
    return mDrawable.isAutoMirrored();
  }
  
  public void setAutoMirrored(boolean paramBoolean)
  {
    mDrawable.setAutoMirrored(paramBoolean);
  }
}
