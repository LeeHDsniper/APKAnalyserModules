package android.support.v7.widget;

import android.graphics.drawable.Drawable;

abstract interface CardViewDelegate
{
  public abstract Drawable getBackground();
  
  public abstract boolean getPreventCornerOverlap();
  
  public abstract boolean getUseCompatPadding();
  
  public abstract void setBackgroundDrawable(Drawable paramDrawable);
  
  public abstract void setShadowPadding(int paramInt1, int paramInt2, int paramInt3, int paramInt4);
}
