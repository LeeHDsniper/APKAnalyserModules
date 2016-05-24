package android.support.v4.graphics.drawable;

import android.graphics.drawable.Drawable;

class DrawableCompatKitKat
{
  public static boolean isAutoMirrored(Drawable paramDrawable)
  {
    return paramDrawable.isAutoMirrored();
  }
  
  public static void setAutoMirrored(Drawable paramDrawable, boolean paramBoolean)
  {
    paramDrawable.setAutoMirrored(paramBoolean);
  }
  
  public static Drawable wrapForTinting(Drawable paramDrawable)
  {
    Object localObject = paramDrawable;
    if (!(paramDrawable instanceof DrawableWrapperKitKat)) {
      localObject = new DrawableWrapperKitKat(paramDrawable);
    }
    return localObject;
  }
}
