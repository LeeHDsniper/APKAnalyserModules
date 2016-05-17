package com.tencent.mobileqq.activity.aio;

import android.content.Context;
import android.content.Intent;
import android.content.pm.PackageManager;
import android.content.res.Configuration;
import android.content.res.Resources;
import android.os.Build;
import android.util.DisplayMetrics;
import android.util.TypedValue;
import android.view.View;
import android.widget.ListAdapter;
import com.tencent.common.app.BaseApplicationImpl;
import com.tencent.mobileqq.data.ChatMessage;
import com.tencent.mobileqq.hotpatch.NotVerifyClass;
import com.tencent.widget.ListView;
import java.lang.reflect.Field;
import kpl;

public final class AIOUtils
{
  public static final int a = 100;
  private static Boolean jdField_a_of_type_JavaLangBoolean = Boolean.valueOf(true);
  private static ThreadLocal jdField_a_of_type_JavaLangThreadLocal = new kpl();
  private static Field jdField_a_of_type_JavaLangReflectField;
  public static volatile boolean a;
  public static volatile boolean b;
  public static volatile boolean c;
  public static volatile boolean d;
  public static volatile boolean e;
  public static volatile boolean f;
  public static volatile boolean g;
  public static volatile boolean h;
  public static volatile boolean i;
  public static volatile boolean j;
  public static volatile boolean k;
  public static boolean l;
  
  static
  {
    boolean bool = NotVerifyClass.DO_VERIFY_CLASS;
    jdField_a_of_type_Boolean = false;
    b = false;
    c = false;
    d = false;
    e = false;
    f = false;
    g = false;
    h = false;
    i = false;
    j = false;
    k = false;
    l = false;
  }
  
  public AIOUtils() {}
  
  public static final float a(int paramInt1, int paramInt2, Resources paramResources)
  {
    return TypedValue.applyDimension(paramInt1, paramInt2, paramResources.getDisplayMetrics());
  }
  
  public static final int a(float paramFloat, Resources paramResources)
  {
    return (int)(getDisplayMetricsdensity * paramFloat + 0.5F);
  }
  
  public static int a(long paramLong, ListAdapter paramListAdapter)
  {
    int n;
    if (paramListAdapter == null)
    {
      n = -1;
      return n;
    }
    int m = 0;
    for (;;)
    {
      if (m >= paramListAdapter.getCount()) {
        break label62;
      }
      Object localObject = paramListAdapter.getItem(m);
      if ((localObject instanceof ChatMessage))
      {
        n = m;
        if (uniseq == paramLong) {
          break;
        }
      }
      m += 1;
    }
    label62:
    return -1;
  }
  
  public static Intent a(Intent paramIntent, int[] paramArrayOfInt)
  {
    paramIntent.putExtra("open_chatfragment", true);
    paramIntent.addFlags(67108864);
    if (paramArrayOfInt != null)
    {
      int n = paramArrayOfInt.length;
      int m = 0;
      if (m < n)
      {
        switch (paramArrayOfInt[m])
        {
        }
        for (;;)
        {
          m += 1;
          break;
          paramIntent.putExtra("open_chatfragment_withanim", true);
          continue;
          paramIntent.addFlags(268435456);
        }
      }
    }
    return paramIntent;
  }
  
  public static final View a(ListView paramListView, int paramInt)
  {
    if ((paramInt >= paramListView.s()) && (paramInt <= paramListView.t())) {
      return paramListView.getChildAt(paramInt - paramListView.s());
    }
    return null;
  }
  
  @Deprecated
  public static final ChatMessage a(View paramView)
  {
    paramView = (ChatItemBuilder.BaseHolder)a(paramView);
    if (paramView != null) {
      return a;
    }
    return null;
  }
  
  public static final Object a(View paramView)
  {
    if (paramView == null) {
      return null;
    }
    if ((paramView.getParent() == null) || ((paramView.getParent() instanceof ListView))) {
      return paramView.getTag();
    }
    return a((View)paramView.getParent());
  }
  
  public static StringBuilder a()
  {
    StringBuilder localStringBuilder = new StringBuilder();
    try
    {
      if (jdField_a_of_type_JavaLangBoolean.booleanValue())
      {
        jdField_a_of_type_JavaLangReflectField = StringBuilder.class.getSuperclass().getDeclaredField("value");
        jdField_a_of_type_JavaLangReflectField.setAccessible(true);
        jdField_a_of_type_JavaLangBoolean = Boolean.valueOf(false);
      }
      if (jdField_a_of_type_JavaLangReflectField != null) {
        jdField_a_of_type_JavaLangReflectField.set(localStringBuilder, jdField_a_of_type_JavaLangThreadLocal.get());
      }
      return localStringBuilder;
    }
    catch (Exception localException) {}
    return localStringBuilder;
  }
  
  public static void a(boolean paramBoolean)
  {
    i = paramBoolean;
    j = paramBoolean;
    k = paramBoolean;
  }
  
  public static boolean a()
  {
    return Build.MANUFACTURER.equalsIgnoreCase("Samsung");
  }
  
  public static boolean a(Context paramContext)
  {
    return getResourcesgetConfigurationhardKeyboardHidden == 1;
  }
  
  public static boolean b()
  {
    return (a()) && (b(BaseApplicationImpl.getContext())) && (!a(BaseApplicationImpl.getContext()));
  }
  
  public static boolean b(Context paramContext)
  {
    paramContext = paramContext.getPackageManager();
    return (paramContext.hasSystemFeature("com.sec.feature.folder_type")) && (paramContext.hasSystemFeature("com.sec.feature.dual_lcd"));
  }
}
