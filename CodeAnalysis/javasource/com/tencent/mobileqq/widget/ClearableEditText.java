package com.tencent.mobileqq.widget;

import android.content.Context;
import android.content.res.Resources;
import android.content.res.TypedArray;
import android.graphics.Rect;
import android.graphics.drawable.Drawable;
import android.support.v4.view.ViewCompat;
import android.util.AttributeSet;
import android.util.DisplayMetrics;
import android.view.MotionEvent;
import android.widget.EditText;
import android.widget.TextView;
import com.tencent.common.config.AppSetting;
import com.tencent.mobileqq.R.styleable;
import com.tencent.mobileqq.hotpatch.NotVerifyClass;
import com.tencent.mobileqq.util.AccessibilityUtil;
import com.tencent.qphone.base.util.QLog;
import java.lang.reflect.Field;
import stn;
import sto;
import stp;

public class ClearableEditText
  extends EditText
{
  public static final int a = 0;
  public static final int b = 1;
  public static final int c = 2;
  private float jdField_a_of_type_Float;
  public Drawable a;
  public ClearableEditText.OnTextClearedListener a;
  stp jdField_a_of_type_Stp;
  public boolean a;
  private boolean b = false;
  private int d;
  private int e;
  private int f = 0;
  
  public ClearableEditText(Context paramContext)
  {
    this(paramContext, null, 16842862);
    boolean bool = NotVerifyClass.DO_VERIFY_CLASS;
  }
  
  public ClearableEditText(Context paramContext, AttributeSet paramAttributeSet)
  {
    this(paramContext, paramAttributeSet, 16842862);
  }
  
  public ClearableEditText(Context paramContext, AttributeSet paramAttributeSet, int paramInt)
  {
    super(paramContext, paramAttributeSet, paramInt);
    jdField_a_of_type_Boolean = false;
    try
    {
      a(paramContext, paramAttributeSet);
      jdField_a_of_type_Stp = new stp(this, this);
      ViewCompat.setAccessibilityDelegate(this, jdField_a_of_type_Stp);
      ViewCompat.setImportantForAccessibility(this, 1);
      return;
    }
    catch (Throwable paramContext)
    {
      for (;;)
      {
        paramContext.printStackTrace();
      }
    }
  }
  
  private void a(Context paramContext, AttributeSet paramAttributeSet)
  {
    jdField_a_of_type_Float = getResourcesgetDisplayMetricsdensity;
    paramContext = paramContext.obtainStyledAttributes(paramAttributeSet, R.styleable.aD);
    jdField_a_of_type_AndroidGraphicsDrawableDrawable = paramContext.getDrawable(0);
    d = paramContext.getDimensionPixelSize(1, -1);
    e = paramContext.getDimensionPixelSize(2, -1);
    if (jdField_a_of_type_AndroidGraphicsDrawableDrawable == null) {
      jdField_a_of_type_AndroidGraphicsDrawableDrawable = getResources().getDrawable(2130838286);
    }
    if (jdField_a_of_type_AndroidGraphicsDrawableDrawable != null)
    {
      if ((d == -1) || (e == -1))
      {
        d = ((int)(jdField_a_of_type_Float * 19.0F));
        e = ((int)(jdField_a_of_type_Float * 19.0F));
      }
      jdField_a_of_type_AndroidGraphicsDrawableDrawable.setBounds(0, 0, d, e);
      setClearButtonVisible(false);
    }
    setOnTouchListener(new stn(this));
    addTextChangedListener(new sto(this));
    paramContext.recycle();
  }
  
  private boolean a()
  {
    for (;;)
    {
      try
      {
        Object localObject = TextView.class.getDeclaredField("mSingleLine");
        ((Field)localObject).setAccessible(true);
        localObject = ((Field)localObject).get(this);
        if ((localObject instanceof Boolean))
        {
          bool = ((Boolean)localObject).booleanValue();
          return bool;
        }
      }
      catch (NoSuchFieldException localNoSuchFieldException)
      {
        localNoSuchFieldException.printStackTrace();
        return false;
      }
      catch (IllegalArgumentException localIllegalArgumentException)
      {
        localIllegalArgumentException.printStackTrace();
        return false;
      }
      catch (IllegalAccessException localIllegalAccessException)
      {
        localIllegalAccessException.printStackTrace();
        return false;
      }
      boolean bool = false;
    }
  }
  
  protected boolean dispatchHoverEvent(MotionEvent paramMotionEvent)
  {
    if ((b) && (paramMotionEvent.getX() > getWidth() - getPaddingRight() - jdField_a_of_type_AndroidGraphicsDrawableDrawable.getIntrinsicWidth())) {
      return jdField_a_of_type_Stp.dispatchHoverEvent(paramMotionEvent);
    }
    return super.dispatchHoverEvent(paramMotionEvent);
  }
  
  public void onDetachedFromWindow()
  {
    if ((QLog.isColorLevel()) && (AppSetting.j))
    {
      StringBuilder localStringBuilder = new StringBuilder(100);
      localStringBuilder.append("onDetachedFromWindow ");
      localStringBuilder.append(getContext().getClass().getSimpleName());
      localStringBuilder.append("@0x");
      localStringBuilder.append(Integer.toHexString(getContext().hashCode()));
      localStringBuilder.append(" ClearableEditText@0x");
      localStringBuilder.append(Integer.toHexString(hashCode()));
      QLog.d("ClearableEditText", 2, localStringBuilder.toString());
    }
    jdField_a_of_type_Boolean = true;
    super.onDetachedFromWindow();
  }
  
  protected void onFocusChanged(boolean paramBoolean, int paramInt, Rect paramRect)
  {
    super.onFocusChanged(paramBoolean, paramInt, paramRect);
    if (!paramBoolean)
    {
      setCursorVisible(false);
      setClearButtonVisible(false);
    }
    do
    {
      return;
      setCursorVisible(true);
    } while (getText().toString().length() == 0);
    setClearButtonVisible(true);
  }
  
  public void setClearButtonStyle(int paramInt)
  {
    f = paramInt;
    if (f == 1) {
      setClearButtonVisible(false);
    }
    while (f != 2) {
      return;
    }
    setClearButtonVisible(true);
  }
  
  public void setClearButtonVisible(boolean paramBoolean)
  {
    if (((paramBoolean) && (f == 1)) || ((!paramBoolean) && (f == 2))) {
      return;
    }
    if (paramBoolean) {}
    for (Drawable localDrawable = jdField_a_of_type_AndroidGraphicsDrawableDrawable;; localDrawable = null)
    {
      setCompoundDrawables(getCompoundDrawables()[0], getCompoundDrawables()[1], localDrawable, getCompoundDrawables()[3]);
      if (b != paramBoolean) {
        AccessibilityUtil.b(this);
      }
      b = paramBoolean;
      return;
    }
  }
  
  public void setCursorVisible(boolean paramBoolean)
  {
    if ((QLog.isColorLevel()) && (AppSetting.j) && (jdField_a_of_type_Boolean))
    {
      StringBuilder localStringBuilder = new StringBuilder(100);
      localStringBuilder.append("setCursorVisible=");
      localStringBuilder.append(paramBoolean);
      localStringBuilder.append(" ");
      localStringBuilder.append(getContext().getClass().getSimpleName());
      localStringBuilder.append("@0x");
      localStringBuilder.append(Integer.toHexString(getContext().hashCode()));
      localStringBuilder.append(" ClearableEditText@0x");
      localStringBuilder.append(Integer.toHexString(hashCode()));
      QLog.d("ClearableEditText", 2, localStringBuilder.toString(), new Exception());
    }
    super.setCursorVisible(paramBoolean);
  }
  
  public void setTextClearedListener(ClearableEditText.OnTextClearedListener paramOnTextClearedListener)
  {
    jdField_a_of_type_ComTencentMobileqqWidgetClearableEditText$OnTextClearedListener = paramOnTextClearedListener;
  }
}
