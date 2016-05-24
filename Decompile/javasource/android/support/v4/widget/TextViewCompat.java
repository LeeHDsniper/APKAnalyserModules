package android.support.v4.widget;

import android.graphics.drawable.Drawable;
import android.os.Build.VERSION;
import android.widget.TextView;

public class TextViewCompat
{
  static final TextViewCompatImpl IMPL = new BaseTextViewCompatImpl();
  
  static
  {
    int i = Build.VERSION.SDK_INT;
    if (i >= 18)
    {
      IMPL = new JbMr2TextViewCompatImpl();
      return;
    }
    if (i >= 17)
    {
      IMPL = new JbMr1TextViewCompatImpl();
      return;
    }
  }
  
  public static void setCompoundDrawablesRelative(TextView paramTextView, Drawable paramDrawable1, Drawable paramDrawable2, Drawable paramDrawable3, Drawable paramDrawable4)
  {
    IMPL.setCompoundDrawablesRelative(paramTextView, paramDrawable1, paramDrawable2, paramDrawable3, paramDrawable4);
  }
  
  static class BaseTextViewCompatImpl
    implements TextViewCompat.TextViewCompatImpl
  {
    BaseTextViewCompatImpl() {}
    
    public void setCompoundDrawablesRelative(TextView paramTextView, Drawable paramDrawable1, Drawable paramDrawable2, Drawable paramDrawable3, Drawable paramDrawable4)
    {
      paramTextView.setCompoundDrawables(paramDrawable1, paramDrawable2, paramDrawable3, paramDrawable4);
    }
  }
  
  static class JbMr1TextViewCompatImpl
    extends TextViewCompat.BaseTextViewCompatImpl
  {
    JbMr1TextViewCompatImpl() {}
    
    public void setCompoundDrawablesRelative(TextView paramTextView, Drawable paramDrawable1, Drawable paramDrawable2, Drawable paramDrawable3, Drawable paramDrawable4)
    {
      TextViewCompatJbMr1.setCompoundDrawablesRelative(paramTextView, paramDrawable1, paramDrawable2, paramDrawable3, paramDrawable4);
    }
  }
  
  static class JbMr2TextViewCompatImpl
    extends TextViewCompat.JbMr1TextViewCompatImpl
  {
    JbMr2TextViewCompatImpl() {}
    
    public void setCompoundDrawablesRelative(TextView paramTextView, Drawable paramDrawable1, Drawable paramDrawable2, Drawable paramDrawable3, Drawable paramDrawable4)
    {
      TextViewCompatJbMr2.setCompoundDrawablesRelative(paramTextView, paramDrawable1, paramDrawable2, paramDrawable3, paramDrawable4);
    }
  }
  
  static abstract interface TextViewCompatImpl
  {
    public abstract void setCompoundDrawablesRelative(TextView paramTextView, Drawable paramDrawable1, Drawable paramDrawable2, Drawable paramDrawable3, Drawable paramDrawable4);
  }
}
