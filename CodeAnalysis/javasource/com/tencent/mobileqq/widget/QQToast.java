package com.tencent.mobileqq.widget;

import android.content.Context;
import android.content.res.Resources;
import android.graphics.drawable.Drawable;
import android.os.Build;
import android.util.DisplayMetrics;
import android.view.LayoutInflater;
import android.view.View;
import android.widget.ImageView;
import android.widget.TextView;
import android.widget.Toast;
import com.tencent.mobileqq.hotpatch.NotVerifyClass;
import svu;

public class QQToast
{
  public static final int a = -1;
  public static final int b = 0;
  public static final int c = 1;
  public static final int d = 2;
  private Context jdField_a_of_type_AndroidContentContext;
  private Resources jdField_a_of_type_AndroidContentResResources;
  private Drawable jdField_a_of_type_AndroidGraphicsDrawableDrawable;
  private LayoutInflater jdField_a_of_type_AndroidViewLayoutInflater;
  private CharSequence jdField_a_of_type_JavaLangCharSequence;
  private int e;
  
  public QQToast(Context paramContext)
  {
    boolean bool = NotVerifyClass.DO_VERIFY_CLASS;
    jdField_a_of_type_AndroidGraphicsDrawableDrawable = null;
    jdField_a_of_type_JavaLangCharSequence = null;
    e = 0;
    jdField_a_of_type_AndroidContentContext = paramContext.getApplicationContext();
    jdField_a_of_type_AndroidContentResResources = jdField_a_of_type_AndroidContentContext.getResources();
    jdField_a_of_type_AndroidViewLayoutInflater = LayoutInflater.from(jdField_a_of_type_AndroidContentContext);
  }
  
  public static int a(int paramInt)
  {
    switch (paramInt)
    {
    case 1: 
    default: 
      return 2130838113;
    }
    return 2130842417;
  }
  
  public static QQToast a(Context paramContext, int paramInt1, int paramInt2)
  {
    return a(paramContext, 0, paramInt1, paramInt2);
  }
  
  public static QQToast a(Context paramContext, int paramInt1, int paramInt2, int paramInt3)
  {
    paramContext = new QQToast(paramContext);
    paramContext.a(a(paramInt1));
    paramContext.b(paramInt2);
    paramContext.c(paramInt3);
    return paramContext;
  }
  
  public static QQToast a(Context paramContext, int paramInt1, CharSequence paramCharSequence, int paramInt2)
  {
    paramContext = new QQToast(paramContext);
    paramContext.a(a(paramInt1));
    paramContext.a(paramCharSequence);
    paramContext.c(paramInt2);
    return paramContext;
  }
  
  public static QQToast a(Context paramContext, CharSequence paramCharSequence, int paramInt)
  {
    return a(paramContext, 0, paramCharSequence, paramInt);
  }
  
  public static boolean b()
  {
    return Build.BOARD.contains("mx2");
  }
  
  public int a()
  {
    try
    {
      int i = Resources.getSystem().getDimensionPixelSize(Resources.getSystem().getIdentifier("status_bar_height", "dimen", "android"));
      return i;
    }
    catch (Exception localException) {}
    return (int)(jdField_a_of_type_AndroidContentResResources.getDisplayMetrics().density * 25.0F + 0.5D);
  }
  
  public Toast a()
  {
    if (b())
    {
      localToast = a(a());
      localToast.show();
      return localToast;
    }
    Toast localToast = a(0);
    localToast.show();
    return localToast;
  }
  
  public Toast a(int paramInt)
  {
    svu localSvu = new svu(jdField_a_of_type_AndroidContentContext);
    View localView = jdField_a_of_type_AndroidViewLayoutInflater.inflate(2130903419, null);
    if (jdField_a_of_type_AndroidGraphicsDrawableDrawable != null) {
      ((ImageView)localView.findViewById(2131297767)).setImageDrawable(jdField_a_of_type_AndroidGraphicsDrawableDrawable);
    }
    for (;;)
    {
      if (jdField_a_of_type_JavaLangCharSequence != null) {
        ((TextView)localView.findViewById(2131297768)).setText(jdField_a_of_type_JavaLangCharSequence);
      }
      localSvu.setGravity(55, 0, paramInt);
      localSvu.setView(localView);
      localSvu.setDuration(e);
      return localSvu;
      ((ImageView)localView.findViewById(2131297767)).setVisibility(8);
    }
  }
  
  public void a(int paramInt)
  {
    a(jdField_a_of_type_AndroidContentResResources.getDrawable(paramInt));
  }
  
  public void a(Drawable paramDrawable)
  {
    jdField_a_of_type_AndroidGraphicsDrawableDrawable = paramDrawable;
  }
  
  public void a(CharSequence paramCharSequence)
  {
    jdField_a_of_type_JavaLangCharSequence = paramCharSequence;
  }
  
  public Toast b(int paramInt)
  {
    Toast localToast = a(paramInt);
    localToast.show();
    return localToast;
  }
  
  public void b(int paramInt)
  {
    a(jdField_a_of_type_AndroidContentResResources.getString(paramInt));
  }
  
  public void c(int paramInt)
  {
    e = paramInt;
  }
}
