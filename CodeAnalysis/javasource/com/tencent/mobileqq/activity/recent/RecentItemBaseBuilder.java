package com.tencent.mobileqq.activity.recent;

import android.content.Context;
import android.content.res.Resources;
import android.graphics.drawable.Drawable;
import android.view.LayoutInflater;
import android.view.View;
import android.view.View.OnClickListener;
import android.view.View.OnLongClickListener;
import android.view.ViewGroup;
import com.tencent.mobileqq.activity.recent.cur.DragFrameLayout.OnDragModeChangedListener;
import com.tencent.mobileqq.hotpatch.NotVerifyClass;
import com.tencent.widget.SwipRightMenuBuilder;
import java.util.List;
import mgz;

public abstract class RecentItemBaseBuilder
{
  public static final String a = "tag_swip_icon_menu_item";
  public static final int[] a;
  public static final int[] b = { 2130838247, 2130838246, 2130838246, 2130838246, 2130838248, 2130838248, 2130838248 };
  public static final int c = -1;
  public static final int[] c = { 2131301115, 2131301116, 2131301118, 2131301117, 2131301119, 2131301120, 2131301121 };
  public static final int d = -2;
  public static final int e = 0;
  public static final int f = 1;
  public static final int g = 1;
  public static final int h = 0;
  public static final int i = 1;
  public static final int j = 2;
  public static final int k = 3;
  public static final int l = 4;
  public static final int m = 5;
  public static final int n = 6;
  public static final int o = 0;
  public static final int p = 1;
  protected RecentAdapter a;
  protected SwipRightMenuBuilder a;
  
  static
  {
    boolean bool = NotVerifyClass.DO_VERIFY_CLASS;
    jdField_a_of_type_ArrayOfInt = new int[] { 2131368024, 2131369493, 2131370944, 2131370943, 2131370947, 2131370948, 2131370949 };
  }
  
  public RecentItemBaseBuilder() {}
  
  public RecentItemBaseBuilder(int paramInt) {}
  
  public int a()
  {
    return 1;
  }
  
  public abstract View a(int paramInt, Object paramObject, RecentFaceDecoder paramRecentFaceDecoder, View paramView, ViewGroup paramViewGroup, Context paramContext, View.OnClickListener paramOnClickListener, View.OnLongClickListener paramOnLongClickListener, DragFrameLayout.OnDragModeChangedListener paramOnDragModeChangedListener);
  
  public final View a(Context paramContext, int paramInt, RecentItemBaseBuilder.RecentItemBaseHolder paramRecentItemBaseHolder)
  {
    View localView = LayoutInflater.from(paramContext).inflate(paramInt, null);
    if ((jdField_a_of_type_ComTencentMobileqqActivityRecentRecentAdapter != null) && (jdField_a_of_type_ComTencentMobileqqActivityRecentRecentAdapter.a()))
    {
      if (jdField_a_of_type_ComTencentWidgetSwipRightMenuBuilder == null) {
        jdField_a_of_type_ComTencentWidgetSwipRightMenuBuilder = a(paramContext);
      }
      return jdField_a_of_type_ComTencentWidgetSwipRightMenuBuilder.a(paramContext, localView, paramRecentItemBaseHolder, -1);
    }
    jdField_a_of_type_AndroidViewView = localView;
    jdField_a_of_type_ArrayOfComTencentWidgetSwipRightMenuBuilder$SwipRightMenuItem = null;
    return localView;
  }
  
  public SwipRightMenuBuilder a(Context paramContext)
  {
    int i1 = paramContext.getResources().getDimensionPixelSize(2131493347);
    int i2 = paramContext.getResources().getDimensionPixelSize(2131493348);
    int i3 = a();
    paramContext = c;
    int[] arrayOfInt1 = jdField_a_of_type_ArrayOfInt;
    int[] arrayOfInt2 = b;
    return new mgz(this, i3, 2, new int[] { i1, i2 }, -1, paramContext, arrayOfInt1, arrayOfInt2);
  }
  
  public List a(RecentBaseData paramRecentBaseData, Context paramContext)
  {
    return null;
  }
  
  public void a(Context paramContext, View paramView, int paramInt, Object paramObject, RecentItemBaseBuilder.RecentItemBaseHolder paramRecentItemBaseHolder, View.OnClickListener paramOnClickListener)
  {
    if (jdField_a_of_type_ComTencentWidgetSwipRightMenuBuilder != null) {}
    for (int i1 = jdField_a_of_type_ComTencentWidgetSwipRightMenuBuilder.a(paramContext, paramView, paramInt, paramObject, paramRecentItemBaseHolder, paramOnClickListener);; i1 = 0)
    {
      if ((jdField_a_of_type_ComTencentMobileqqActivityRecentRecentAdapter != null) && (jdField_a_of_type_ComTencentMobileqqActivityRecentRecentAdapter.c != -1))
      {
        if (paramInt != jdField_a_of_type_ComTencentMobileqqActivityRecentRecentAdapter.c) {
          paramView.scrollTo(0, 0);
        }
      }
      else {
        return;
      }
      paramView.scrollTo(i1, 0);
      return;
    }
  }
  
  public void a(View paramView, Drawable paramDrawable) {}
  
  public void a(View paramView, RecentBaseData paramRecentBaseData) {}
  
  public void a(View paramView, RecentBaseData paramRecentBaseData, Context paramContext, Drawable paramDrawable) {}
  
  public void a(RecentAdapter paramRecentAdapter)
  {
    jdField_a_of_type_ComTencentMobileqqActivityRecentRecentAdapter = paramRecentAdapter;
  }
}
