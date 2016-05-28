package android.support.v4.widget;

import android.graphics.drawable.Drawable;
import android.widget.TextView;

class TextViewCompatJbMr1
{
  public static void setCompoundDrawablesRelative(TextView paramTextView, Drawable paramDrawable1, Drawable paramDrawable2, Drawable paramDrawable3, Drawable paramDrawable4)
  {
    int i = 1;
    Drawable localDrawable;
    if (paramTextView.getLayoutDirection() == 1)
    {
      if (i == 0) {
        break label41;
      }
      localDrawable = paramDrawable3;
      label19:
      if (i == 0) {
        break label47;
      }
    }
    for (;;)
    {
      paramTextView.setCompoundDrawables(localDrawable, paramDrawable2, paramDrawable1, paramDrawable4);
      return;
      i = 0;
      break;
      label41:
      localDrawable = paramDrawable1;
      break label19;
      label47:
      paramDrawable1 = paramDrawable3;
    }
  }
}
