package com.tencent.mobileqq.utils;

import android.app.Dialog;
import android.content.Context;
import android.content.DialogInterface.OnClickListener;
import android.widget.ImageView;
import android.widget.TextView;
import com.tencent.mobileqq.hotpatch.NotVerifyClass;
import smt;
import smu;

public class QQCustomDialogDevLock
  extends Dialog
{
  public static final int a = 0;
  public static final int b = 1;
  ImageView jdField_a_of_type_AndroidWidgetImageView;
  TextView jdField_a_of_type_AndroidWidgetTextView;
  ImageView jdField_b_of_type_AndroidWidgetImageView;
  TextView jdField_b_of_type_AndroidWidgetTextView;
  TextView c;
  TextView d;
  TextView e;
  
  public QQCustomDialogDevLock(Context paramContext)
  {
    super(paramContext);
    boolean bool = NotVerifyClass.DO_VERIFY_CLASS;
  }
  
  public QQCustomDialogDevLock(Context paramContext, int paramInt)
  {
    super(paramContext, paramInt);
  }
  
  public static QQCustomDialogDevLock a(Context paramContext, String paramString1, String paramString2, String paramString3, String paramString4, String paramString5, DialogInterface.OnClickListener paramOnClickListener1, DialogInterface.OnClickListener paramOnClickListener2)
  {
    paramContext = new QQCustomDialogDevLock(paramContext, 2131558942);
    paramContext.setContentView(2130904370);
    paramContext.c(paramString1);
    paramContext.a(paramString2);
    paramContext.b(paramString3);
    paramContext.b(paramString5, paramOnClickListener1);
    paramContext.a(paramString4, paramOnClickListener2);
    paramContext.setCanceledOnTouchOutside(true);
    return paramContext;
  }
  
  public QQCustomDialogDevLock a(String paramString, DialogInterface.OnClickListener paramOnClickListener)
  {
    if (paramOnClickListener == null)
    {
      d.setVisibility(8);
      return this;
    }
    d.setText(paramString);
    d.setContentDescription(paramString);
    d.setVisibility(0);
    d.setOnClickListener(new smt(this, paramOnClickListener));
    a();
    return this;
  }
  
  public String a()
  {
    return null;
  }
  
  protected void a() {}
  
  public void a(String paramString)
  {
    if (paramString == null) {}
    while (jdField_b_of_type_AndroidWidgetTextView == null) {
      return;
    }
    jdField_b_of_type_AndroidWidgetTextView.setText(paramString);
  }
  
  public QQCustomDialogDevLock b(String paramString, DialogInterface.OnClickListener paramOnClickListener)
  {
    if (paramOnClickListener == null)
    {
      e.setVisibility(8);
      return this;
    }
    e.setText(paramString);
    e.setContentDescription(paramString);
    e.setVisibility(0);
    e.setOnClickListener(new smu(this, paramOnClickListener));
    a();
    return this;
  }
  
  public void b(String paramString)
  {
    if (paramString == null) {}
    while (jdField_b_of_type_AndroidWidgetTextView == null) {
      return;
    }
    c.setText(paramString);
  }
  
  public void c(String paramString)
  {
    if (paramString == null) {}
    while (jdField_a_of_type_AndroidWidgetTextView == null) {
      return;
    }
    jdField_a_of_type_AndroidWidgetTextView.setText(paramString);
    jdField_a_of_type_AndroidWidgetTextView.setVisibility(0);
  }
  
  public void d(String paramString)
  {
    e.setContentDescription(paramString);
  }
  
  public void dismiss()
  {
    try
    {
      super.dismiss();
      return;
    }
    catch (Exception localException) {}
  }
  
  public void e(String paramString)
  {
    d.setContentDescription(paramString);
  }
  
  public void setContentView(int paramInt)
  {
    super.setContentView(paramInt);
    jdField_a_of_type_AndroidWidgetTextView = ((TextView)findViewById(2131298453));
    jdField_a_of_type_AndroidWidgetImageView = ((ImageView)findViewById(2131302370));
    jdField_b_of_type_AndroidWidgetTextView = ((TextView)findViewById(2131297636));
    jdField_b_of_type_AndroidWidgetImageView = ((ImageView)findViewById(2131302372));
    c = ((TextView)findViewById(2131297640));
    d = ((TextView)findViewById(2131297739));
    e = ((TextView)findViewById(2131297740));
  }
}
