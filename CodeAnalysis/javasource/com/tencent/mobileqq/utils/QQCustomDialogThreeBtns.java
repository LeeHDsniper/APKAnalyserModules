package com.tencent.mobileqq.utils;

import android.app.Dialog;
import android.content.Context;
import android.content.DialogInterface.OnCancelListener;
import android.content.DialogInterface.OnClickListener;
import android.content.res.Resources;
import android.content.res.Resources.NotFoundException;
import android.graphics.Typeface;
import android.graphics.drawable.Drawable;
import android.text.TextUtils.TruncateAt;
import android.view.LayoutInflater;
import android.view.View;
import android.widget.BaseAdapter;
import android.widget.LinearLayout;
import android.widget.LinearLayout.LayoutParams;
import android.widget.ListView;
import android.widget.TextView;
import com.tencent.mobileqq.hotpatch.NotVerifyClass;
import smv;
import smw;
import smx;
import smy;
import smz;
import sna;
import snb;

public class QQCustomDialogThreeBtns
  extends Dialog
{
  public DialogInterface.OnClickListener a;
  public LayoutInflater a;
  private BaseAdapter jdField_a_of_type_AndroidWidgetBaseAdapter;
  LinearLayout jdField_a_of_type_AndroidWidgetLinearLayout;
  ListView jdField_a_of_type_AndroidWidgetListView;
  TextView jdField_a_of_type_AndroidWidgetTextView;
  public String[] a;
  TextView b;
  TextView c;
  TextView d;
  TextView e;
  TextView f;
  
  public QQCustomDialogThreeBtns(Context paramContext)
  {
    super(paramContext);
    boolean bool = NotVerifyClass.DO_VERIFY_CLASS;
    jdField_a_of_type_AndroidWidgetBaseAdapter = new smv(this);
  }
  
  public QQCustomDialogThreeBtns(Context paramContext, int paramInt)
  {
    super(paramContext, paramInt);
    jdField_a_of_type_AndroidWidgetBaseAdapter = new smv(this);
  }
  
  protected QQCustomDialogThreeBtns(Context paramContext, boolean paramBoolean, DialogInterface.OnCancelListener paramOnCancelListener)
  {
    super(paramContext, paramBoolean, paramOnCancelListener);
    jdField_a_of_type_AndroidWidgetBaseAdapter = new smv(this);
  }
  
  private void a()
  {
    b();
  }
  
  private void b()
  {
    TextView localTextView = null;
    if (d.getVisibility() == 0) {
      localTextView = d;
    }
    for (;;)
    {
      if (localTextView != null) {
        localTextView.setTypeface(Typeface.defaultFromStyle(1));
      }
      return;
      if (e.getVisibility() == 0) {
        localTextView = e;
      } else if (c.getVisibility() == 0) {
        localTextView = c;
      }
    }
  }
  
  public int a(int paramInt)
  {
    return paramInt;
  }
  
  public QQCustomDialogThreeBtns a(int paramInt)
  {
    b.setText(paramInt);
    b.setVisibility(0);
    return this;
  }
  
  public QQCustomDialogThreeBtns a(int paramInt, DialogInterface.OnClickListener paramOnClickListener)
  {
    Object localObject = null;
    try
    {
      String[] arrayOfString = getContext().getResources().getStringArray(paramInt);
      localObject = arrayOfString;
    }
    catch (Resources.NotFoundException localNotFoundException)
    {
      for (;;)
      {
        localNotFoundException.printStackTrace();
      }
    }
    return a(localObject, paramOnClickListener);
  }
  
  public QQCustomDialogThreeBtns a(Drawable paramDrawable)
  {
    f.setPadding(0, 0, 0, 0);
    f.setCompoundDrawablePadding(0);
    f.setCompoundDrawables(paramDrawable, null, null, null);
    if (paramDrawable != null)
    {
      f.setVisibility(0);
      return this;
    }
    f.setVisibility(8);
    return this;
  }
  
  public QQCustomDialogThreeBtns a(View paramView)
  {
    b.setVisibility(8);
    LinearLayout.LayoutParams localLayoutParams = new LinearLayout.LayoutParams(-1, -2);
    jdField_a_of_type_AndroidWidgetLinearLayout.addView(paramView, localLayoutParams);
    return this;
  }
  
  public QQCustomDialogThreeBtns a(String paramString)
  {
    if (paramString != null)
    {
      jdField_a_of_type_AndroidWidgetTextView.setText(paramString);
      jdField_a_of_type_AndroidWidgetTextView.setVisibility(0);
      if (jdField_a_of_type_ArrayOfJavaLangString == null) {}
      return this;
    }
    jdField_a_of_type_AndroidWidgetTextView.setVisibility(8);
    return this;
  }
  
  public QQCustomDialogThreeBtns a(String paramString, int paramInt)
  {
    if ((findViewById(paramInt) instanceof TextView))
    {
      TextView localTextView = (TextView)findViewById(paramInt);
      if (localTextView != null) {
        localTextView.setText(paramString);
      }
    }
    return this;
  }
  
  public QQCustomDialogThreeBtns a(String paramString, DialogInterface.OnClickListener paramOnClickListener)
  {
    if (paramOnClickListener == null)
    {
      c.setVisibility(8);
      return this;
    }
    c.setText(paramString);
    c.setVisibility(0);
    c.setOnClickListener(new smw(this, paramOnClickListener));
    a();
    return this;
  }
  
  public QQCustomDialogThreeBtns a(String[] paramArrayOfString, DialogInterface.OnClickListener paramOnClickListener)
  {
    jdField_a_of_type_ArrayOfJavaLangString = paramArrayOfString;
    b.setVisibility(8);
    c.setVisibility(8);
    e.setVisibility(8);
    d.setVisibility(8);
    jdField_a_of_type_AndroidWidgetLinearLayout.setVisibility(8);
    jdField_a_of_type_AndroidContentDialogInterface$OnClickListener = paramOnClickListener;
    jdField_a_of_type_AndroidWidgetListView.setVisibility(0);
    jdField_a_of_type_AndroidWidgetListView.setAdapter(jdField_a_of_type_AndroidWidgetBaseAdapter);
    jdField_a_of_type_AndroidWidgetListView.setDivider(null);
    jdField_a_of_type_AndroidWidgetListView.setDividerHeight(0);
    return this;
  }
  
  public QQCustomDialogThreeBtns b(int paramInt)
  {
    if (b != null)
    {
      b.setMaxLines(paramInt);
      b.setEllipsize(TextUtils.TruncateAt.END);
    }
    return this;
  }
  
  public QQCustomDialogThreeBtns b(int paramInt, DialogInterface.OnClickListener paramOnClickListener)
  {
    if (paramOnClickListener == null)
    {
      c.setVisibility(8);
      return this;
    }
    c.setText(paramInt);
    c.setVisibility(0);
    c.setOnClickListener(new smz(this, paramOnClickListener));
    a();
    return this;
  }
  
  public QQCustomDialogThreeBtns b(String paramString)
  {
    if (paramString != null)
    {
      b.setText(paramString);
      b.setVisibility(0);
      return this;
    }
    b.setVisibility(8);
    return this;
  }
  
  public QQCustomDialogThreeBtns b(String paramString, DialogInterface.OnClickListener paramOnClickListener)
  {
    if (paramOnClickListener == null)
    {
      e.setVisibility(8);
      return this;
    }
    e.setText(paramString);
    e.setVisibility(0);
    e.setOnClickListener(new smx(this, paramOnClickListener));
    a();
    return this;
  }
  
  public QQCustomDialogThreeBtns c(int paramInt, DialogInterface.OnClickListener paramOnClickListener)
  {
    if (paramOnClickListener == null)
    {
      e.setVisibility(8);
      return this;
    }
    e.setText(paramInt);
    e.setVisibility(0);
    e.setOnClickListener(new sna(this, paramOnClickListener));
    a();
    return this;
  }
  
  public QQCustomDialogThreeBtns c(String paramString, DialogInterface.OnClickListener paramOnClickListener)
  {
    if (paramOnClickListener == null)
    {
      d.setVisibility(8);
      return this;
    }
    d.setText(paramString);
    d.setVisibility(0);
    d.setOnClickListener(new smy(this, paramOnClickListener));
    a();
    return this;
  }
  
  public QQCustomDialogThreeBtns d(int paramInt, DialogInterface.OnClickListener paramOnClickListener)
  {
    if (paramOnClickListener == null)
    {
      d.setVisibility(8);
      return this;
    }
    d.setText(paramInt);
    d.setVisibility(0);
    d.setOnClickListener(new snb(this, paramOnClickListener));
    a();
    return this;
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
  
  public void setContentView(int paramInt)
  {
    super.setContentView(paramInt);
    jdField_a_of_type_AndroidWidgetTextView = ((TextView)findViewById(2131297736));
    b = ((TextView)findViewById(2131296741));
    f = ((TextView)findViewById(2131297744));
    c = ((TextView)findViewById(2131297739));
    e = ((TextView)findViewById(2131297757));
    d = ((TextView)findViewById(2131297740));
    c.setVisibility(8);
    e.setVisibility(8);
    d.setVisibility(8);
    jdField_a_of_type_AndroidWidgetLinearLayout = ((LinearLayout)findViewById(2131297573));
    jdField_a_of_type_AndroidWidgetListView = ((ListView)findViewById(2131297741));
  }
  
  public void setTitle(int paramInt)
  {
    jdField_a_of_type_AndroidWidgetTextView.setText(paramInt);
    jdField_a_of_type_AndroidWidgetTextView.setVisibility(0);
  }
}
