package com.tencent.widget;

import android.content.Context;
import android.content.pm.ApplicationInfo;
import android.content.res.Resources;
import android.graphics.Canvas;
import android.graphics.Paint;
import android.graphics.Rect;
import android.graphics.drawable.Drawable;
import android.util.AttributeSet;
import android.util.SparseBooleanArray;
import android.view.FocusFinder;
import android.view.KeyEvent;
import android.view.MotionEvent;
import android.view.SoundEffectConstants;
import android.view.View;
import android.view.View.MeasureSpec;
import android.view.ViewDebug.ExportedProperty;
import android.view.ViewGroup;
import android.view.ViewGroup.LayoutParams;
import android.view.ViewParent;
import android.view.animation.Animation;
import android.widget.ArrayAdapter;
import android.widget.Checkable;
import android.widget.ListAdapter;
import android.widget.PopupWindow;
import android.widget.RemoteViews.RemoteView;
import com.tencent.mobileqq.hotpatch.NotVerifyClass;
import com.tencent.mobileqq.statistics.StatisticCollector;
import com.tencent.qphone.base.util.BaseApplication;
import com.tencent.qphone.base.util.QLog;
import com.tencent.theme.SkinEngine;
import com.tencent.theme.SkinnableView;
import com.tencent.util.VersionUtils;
import java.lang.reflect.Field;
import java.lang.reflect.Method;
import java.util.ArrayList;
import java.util.Iterator;
import tzr;
import uab;
import uby;
import ubz;
import uca;
import ucb;

@RemoteViews.RemoteView
public class ListView
  extends AbsListView
  implements SkinnableView
{
  private static final float jdField_a_of_type_Float = 0.33F;
  private static final int jdField_a_of_type_Int = a("ListView_footerDividersEnabled");
  static final int aK = -1;
  private static final int jdField_b_of_type_Int = a("ListView_headerDividersEnabled");
  private static final int jdField_c_of_type_Int = a("ListView_dividerHeight");
  private static final int jdField_d_of_type_Int = a("ListView_overScrollFooter");
  private static final int jdField_e_of_type_Int = a("ListView_overScrollHeader");
  private static final int jdField_f_of_type_Int = a("ListView_divider");
  private static final int jdField_g_of_type_Int = a("ListView_entries");
  private static final int h = 2;
  private static final int i = 0;
  private static final int j = 1;
  private static final int k = 2;
  private static final int l = 3;
  private static final int n = 2131230829;
  private static final int o = 350;
  private Paint jdField_a_of_type_AndroidGraphicsPaint;
  private final Rect jdField_a_of_type_AndroidGraphicsRect = new Rect();
  private Drawable jdField_a_of_type_AndroidGraphicsDrawableDrawable;
  private Animation jdField_a_of_type_AndroidViewAnimationAnimation;
  private ListView.OnScrollChangeListener jdField_a_of_type_ComTencentWidgetListView$OnScrollChangeListener;
  private OverScrollViewListener jdField_a_of_type_ComTencentWidgetOverScrollViewListener;
  protected ArrayList a;
  private final uby jdField_a_of_type_Uby = new uby(null);
  private ubz jdField_a_of_type_Ubz;
  private ucb jdField_a_of_type_Ucb;
  private boolean jdField_a_of_type_Boolean;
  private int[] jdField_a_of_type_ArrayOfInt = null;
  public int aL;
  protected int aM = 0;
  protected int aN = 0;
  private ArrayList jdField_b_of_type_JavaUtilArrayList = new ArrayList();
  private ucb jdField_b_of_type_Ucb;
  private boolean jdField_b_of_type_Boolean;
  private boolean jdField_c_of_type_Boolean;
  Drawable jdField_d_of_type_AndroidGraphicsDrawableDrawable;
  private boolean jdField_d_of_type_Boolean;
  Drawable jdField_e_of_type_AndroidGraphicsDrawableDrawable;
  private boolean jdField_e_of_type_Boolean = true;
  Drawable jdField_f_of_type_AndroidGraphicsDrawableDrawable;
  private long jdField_g_of_type_Long;
  protected Drawable g;
  private int m = 0;
  private boolean t = false;
  private boolean u;
  private boolean v = false;
  private boolean w = true;
  
  static
  {
    boolean bool = NotVerifyClass.DO_VERIFY_CLASS;
  }
  
  public ListView(Context paramContext)
  {
    this(paramContext, null);
  }
  
  public ListView(Context paramContext, AttributeSet paramAttributeSet)
  {
    this(paramContext, paramAttributeSet, 16842868);
  }
  
  public ListView(Context paramContext, AttributeSet paramAttributeSet, int paramInt)
  {
    super(paramContext, paramAttributeSet, paramInt);
    jdField_a_of_type_JavaUtilArrayList = new ArrayList();
    paramAttributeSet = new TypedArrayWarpper(paramContext.obtainStyledAttributes(paramAttributeSet, a("ListView"), paramInt, 0));
    CharSequence[] arrayOfCharSequence = paramAttributeSet.a(jdField_g_of_type_Int);
    if (arrayOfCharSequence != null) {
      setAdapter(new ArrayAdapter(paramContext, 17367043, arrayOfCharSequence));
    }
    paramContext = paramAttributeSet.a(jdField_f_of_type_Int);
    if (paramContext != null) {
      setDivider(paramContext);
    }
    paramContext = paramAttributeSet.a(jdField_e_of_type_Int);
    if (paramContext != null) {
      setOverscrollHeader(paramContext);
    }
    paramContext = paramAttributeSet.a(jdField_d_of_type_Int);
    if (paramContext != null) {
      setOverscrollFooter(paramContext);
    }
    paramInt = paramAttributeSet.e(jdField_c_of_type_Int, 0);
    if (paramInt != 0) {
      setDividerHeight(paramInt);
    }
    jdField_c_of_type_Boolean = paramAttributeSet.a(jdField_b_of_type_Int, true);
    jdField_d_of_type_Boolean = paramAttributeSet.a(jdField_a_of_type_Int, true);
    paramAttributeSet.a();
  }
  
  private int a()
  {
    return Math.max(2, getVerticalFadingEdgeLength());
  }
  
  private int a(int paramInt)
  {
    int i2 = au;
    ListAdapter localListAdapter;
    if (paramInt == 130)
    {
      if (aF != -1) {}
      for (i1 = aF + 1; i1 >= jdField_a_of_type_AndroidWidgetListAdapter.getCount(); i1 = i2)
      {
        paramInt = -1;
        return paramInt;
      }
      paramInt = i1;
      if (i1 < i2) {
        paramInt = i2;
      }
      int i3 = t();
      localListAdapter = a();
      i1 = paramInt;
      for (;;)
      {
        if (i1 > i3) {
          break label215;
        }
        if (localListAdapter.isEnabled(i1))
        {
          paramInt = i1;
          if (getChildAt(i1 - i2).getVisibility() == 0) {
            break;
          }
        }
        i1 += 1;
      }
    }
    int i1 = getChildCount() + i2 - 1;
    if (aF != -1) {}
    for (paramInt = aF - 1; (paramInt < 0) || (paramInt >= jdField_a_of_type_AndroidWidgetListAdapter.getCount()); paramInt = getChildCount() + i2 - 1) {
      return -1;
    }
    if (paramInt > i1) {}
    for (;;)
    {
      localListAdapter = a();
      for (;;)
      {
        if (i1 < i2) {
          break label215;
        }
        if (localListAdapter.isEnabled(i1))
        {
          paramInt = i1;
          if (getChildAt(i1 - i2).getVisibility() == 0) {
            break;
          }
        }
        i1 -= 1;
      }
      label215:
      return -1;
      i1 = paramInt;
    }
  }
  
  private int a(int paramInt1, int paramInt2)
  {
    int i1 = getHeight() - jdField_c_of_type_AndroidGraphicsRect.bottom;
    int i2 = jdField_c_of_type_AndroidGraphicsRect.top;
    int i3 = getChildCount();
    View localView;
    if (paramInt1 == 130)
    {
      paramInt1 = i3 - 1;
      if (paramInt2 != -1) {
        paramInt1 = paramInt2 - au;
      }
      i2 = au;
      localView = getChildAt(paramInt1);
      if (i2 + paramInt1 >= aG - 1) {
        break label285;
      }
    }
    label285:
    for (paramInt1 = i1 - a();; paramInt1 = i1)
    {
      if (localView.getBottom() <= paramInt1) {}
      while ((paramInt2 != -1) && (paramInt1 - localView.getTop() >= w())) {
        return 0;
      }
      paramInt2 = localView.getBottom() - paramInt1;
      paramInt1 = paramInt2;
      if (au + i3 == aG) {
        paramInt1 = Math.min(paramInt2, getChildAt(i3 - 1).getBottom() - i1);
      }
      return Math.min(paramInt1, w());
      if (paramInt2 != -1) {}
      for (paramInt1 = paramInt2 - au;; paramInt1 = 0)
      {
        i1 = au;
        localView = getChildAt(paramInt1);
        if (i1 + paramInt1 > 0) {}
        for (paramInt1 = a() + i2; (localView.getTop() < paramInt1) && ((paramInt2 == -1) || (localView.getBottom() - paramInt1 < w())); paramInt1 = i2)
        {
          paramInt2 = paramInt1 - localView.getTop();
          paramInt1 = paramInt2;
          if (au == 0) {
            paramInt1 = Math.min(paramInt2, i2 - getChildAt(0).getTop());
          }
          return Math.min(paramInt1, w());
        }
        break;
      }
    }
  }
  
  private int a(int paramInt1, int paramInt2, int paramInt3)
  {
    int i1 = paramInt1;
    if (paramInt3 != aG - 1) {
      i1 = paramInt1 - paramInt2;
    }
    return i1;
  }
  
  private int a(int paramInt1, View paramView, int paramInt2)
  {
    int i1 = 0;
    paramView.getDrawingRect(jdField_a_of_type_AndroidGraphicsRect);
    offsetDescendantRectToMyCoords(paramView, jdField_a_of_type_AndroidGraphicsRect);
    if (paramInt1 == 33)
    {
      paramInt1 = i1;
      if (jdField_a_of_type_AndroidGraphicsRect.top < jdField_c_of_type_AndroidGraphicsRect.top)
      {
        i1 = jdField_c_of_type_AndroidGraphicsRect.top - jdField_a_of_type_AndroidGraphicsRect.top;
        paramInt1 = i1;
        if (paramInt2 > 0) {
          paramInt1 = i1 + a();
        }
      }
    }
    do
    {
      int i2;
      do
      {
        return paramInt1;
        i2 = getHeight() - jdField_c_of_type_AndroidGraphicsRect.bottom;
        paramInt1 = i1;
      } while (jdField_a_of_type_AndroidGraphicsRect.bottom <= i2);
      i1 = jdField_a_of_type_AndroidGraphicsRect.bottom - i2;
      paramInt1 = i1;
    } while (paramInt2 >= aG - 1);
    return i1 + a();
  }
  
  private int a(View paramView)
  {
    int i2 = getChildCount();
    int i1 = 0;
    while (i1 < i2)
    {
      if (a(paramView, getChildAt(i1))) {
        return i1 + au;
      }
      i1 += 1;
    }
    throw new IllegalArgumentException("newFocus is not a child of any of the children of the list!");
  }
  
  private int a(View paramView, int paramInt1, int paramInt2, boolean paramBoolean, int paramInt3, int paramInt4)
  {
    int i1 = paramView.getHeight();
    int i2 = getLayoutParamsjdField_a_of_type_Int;
    int i3 = jdField_a_of_type_AndroidWidgetListAdapter.getItemViewType(paramInt1);
    View localView;
    AbsListView.LayoutParams localLayoutParams;
    if (i2 == i3)
    {
      localView = jdField_a_of_type_AndroidWidgetListAdapter.getView(paramInt1, paramView, this);
      localLayoutParams = (AbsListView.LayoutParams)localView.getLayoutParams();
      if (localLayoutParams != null) {
        break label506;
      }
      localLayoutParams = new AbsListView.LayoutParams(-1, -2, 0);
    }
    label221:
    label284:
    label293:
    label312:
    label414:
    label470:
    label478:
    label506:
    for (;;)
    {
      jdField_a_of_type_Int = i3;
      if (localView != paramView)
      {
        bool1 = paramView.isSelected();
        boolean bool2 = paramView.isPressed();
        jdField_a_of_type_Uab.a(paramView, paramInt1);
        if (an != 0) {
          localView.setDrawingCacheBackgroundColor(an);
        }
        detachViewFromParent(paramInt4);
        addViewInLayout(localView, paramInt4, localLayoutParams, true);
        if (localView.isSelected() != bool1) {
          localView.setSelected(bool1);
        }
        if (localView.isPressed() != bool2) {
          localView.setPressed(bool2);
        }
        if ((S != 0) && (jdField_a_of_type_AndroidUtilSparseBooleanArray != null))
        {
          if (!(localView instanceof Checkable)) {
            break label414;
          }
          ((Checkable)localView).setChecked(jdField_a_of_type_AndroidUtilSparseBooleanArray.get(paramInt1));
        }
      }
      boolean bool1 = localView.isLayoutRequested();
      if (bool1)
      {
        i2 = ViewGroup.getChildMeasureSpec(aa, jdField_c_of_type_AndroidGraphicsRect.left + jdField_c_of_type_AndroidGraphicsRect.right, width);
        paramInt4 = height;
        if (paramInt4 > 0)
        {
          paramInt4 = View.MeasureSpec.makeMeasureSpec(paramInt4, 1073741824);
          localView.measure(i2, paramInt4);
          paramInt4 = localView.getMeasuredWidth();
          i2 = localView.getMeasuredHeight();
          if (!paramBoolean) {
            break label470;
          }
          if (!bool1) {
            break label478;
          }
          localView.layout(paramInt3, paramInt2, paramInt4 + paramInt3, i2 + paramInt2);
        }
      }
      for (;;)
      {
        if ((jdField_g_of_type_Boolean) && (!localView.isDrawingCacheEnabled())) {
          localView.setDrawingCacheEnabled(true);
        }
        if ((VersionUtils.e()) && (getLayoutParamsjdField_b_of_type_Int != paramInt1)) {
          localView.jumpDrawablesToCurrentState();
        }
        return localView.getHeight() - i1;
        localView = jdField_a_of_type_AndroidWidgetListAdapter.getView(paramInt1, jdField_a_of_type_Uab.b(paramInt1), this);
        break;
        if ((getContextgetApplicationInfotargetSdkVersion < 11) || (!VersionUtils.e())) {
          break label221;
        }
        localView.setActivated(jdField_a_of_type_AndroidUtilSparseBooleanArray.get(paramInt1));
        break label221;
        paramInt4 = View.MeasureSpec.makeMeasureSpec(0, 0);
        break label284;
        cleanupLayoutState(localView);
        break label293;
        paramInt2 -= i2;
        break label312;
        localView.offsetLeftAndRight(paramInt3 - localView.getLeft());
        localView.offsetTopAndBottom(paramInt2 - localView.getTop());
      }
    }
  }
  
  private View a(int paramInt)
  {
    au = Math.min(au, aF);
    au = Math.min(au, aG - 1);
    if (au < 0) {
      au = 0;
    }
    return a(au, paramInt);
  }
  
  private View a(int paramInt1, int paramInt2)
  {
    Object localObject = null;
    int i1 = mBottom - mTop;
    int i2;
    if ((mGroupFlags & 0x22) == 34)
    {
      i1 -= jdField_c_of_type_AndroidGraphicsRect.bottom;
      i2 = paramInt1;
      paramInt1 = paramInt2;
      paramInt2 = i2;
    }
    for (;;)
    {
      boolean bool;
      if ((paramInt1 < i1) && (paramInt2 < aG)) {
        if (paramInt2 == aF)
        {
          bool = true;
          label67:
          View localView = a(paramInt2, paramInt1, true, jdField_c_of_type_AndroidGraphicsRect.left, bool);
          if (localView == null) {
            break label133;
          }
          i2 = localView.getBottom() + aL;
          paramInt1 = i2;
          if (!bool) {
            break label133;
          }
          paramInt1 = i2;
          localObject = localView;
        }
      }
      label133:
      for (;;)
      {
        paramInt2 += 1;
        break;
        bool = false;
        break label67;
        return localObject;
      }
      i2 = paramInt2;
      paramInt2 = paramInt1;
      paramInt1 = i2;
    }
  }
  
  private View a(int paramInt1, int paramInt2, int paramInt3)
  {
    int i2 = getVerticalFadingEdgeLength();
    int i1 = aF;
    paramInt2 = b(paramInt2, i2, i1);
    paramInt3 = a(paramInt3, i2, i1);
    View localView = a(i1, paramInt1, true, jdField_c_of_type_AndroidGraphicsRect.left, true);
    if (localView.getBottom() > paramInt3) {
      localView.offsetTopAndBottom(-Math.min(localView.getTop() - paramInt2, localView.getBottom() - paramInt3));
    }
    for (;;)
    {
      a(localView, i1);
      if (i) {
        break;
      }
      a(getChildCount());
      return localView;
      if (localView.getTop() < paramInt2) {
        localView.offsetTopAndBottom(Math.min(paramInt2 - localView.getTop(), paramInt3 - localView.getBottom()));
      }
    }
    c(getChildCount());
    return localView;
  }
  
  private View a(int paramInt1, int paramInt2, boolean paramBoolean1, int paramInt3, boolean paramBoolean2)
  {
    b("ListView.makeAndAddView");
    try
    {
      if (!r)
      {
        localView = jdField_a_of_type_Uab.a(paramInt1);
        if (localView != null)
        {
          a(localView, paramInt1, paramInt2, paramBoolean1, paramInt3, paramBoolean2, true);
          return localView;
        }
      }
      View localView = a(paramInt1, jdField_a_of_type_ArrayOfBoolean);
      a(localView, paramInt1, paramInt2, paramBoolean1, paramInt3, paramBoolean2, jdField_a_of_type_ArrayOfBoolean[0]);
      return localView;
    }
    finally
    {
      B();
    }
  }
  
  private View a(View paramView, int paramInt)
  {
    paramInt -= 1;
    View localView = a(paramInt, jdField_a_of_type_ArrayOfBoolean);
    a(localView, paramInt, paramView.getTop() - aL, false, jdField_c_of_type_AndroidGraphicsRect.left, false, jdField_a_of_type_ArrayOfBoolean[0]);
    return localView;
  }
  
  private View a(View paramView1, View paramView2, int paramInt1, int paramInt2, int paramInt3)
  {
    int i2 = getVerticalFadingEdgeLength();
    int i3 = aF;
    int i1 = b(paramInt2, i2, i3);
    i2 = a(paramInt2, i2, i3);
    int i4;
    if (paramInt1 > 0)
    {
      paramView1 = a(i3 - 1, paramView1.getTop(), true, jdField_c_of_type_AndroidGraphicsRect.left, false);
      paramInt1 = aL;
      paramView2 = a(i3, paramView1.getBottom() + paramInt1, true, jdField_c_of_type_AndroidGraphicsRect.left, true);
      if (paramView2.getBottom() > i2)
      {
        i3 = paramView2.getTop();
        i4 = paramView2.getBottom();
        paramInt2 = (paramInt3 - paramInt2) / 2;
        paramInt2 = Math.min(Math.min(i3 - i1, i4 - i2), paramInt2);
        paramView1.offsetTopAndBottom(-paramInt2);
        paramView2.offsetTopAndBottom(-paramInt2);
      }
      if (!i)
      {
        b(aF - 2, paramView2.getTop() - paramInt1);
        d();
        a(aF + 1, paramView2.getBottom() + paramInt1);
        return paramView2;
      }
      a(aF + 1, paramView2.getBottom() + paramInt1);
      d();
      b(aF - 2, paramView2.getTop() - paramInt1);
      return paramView2;
    }
    if (paramInt1 < 0)
    {
      if (paramView2 != null) {}
      for (paramView1 = a(i3, paramView2.getTop(), true, jdField_c_of_type_AndroidGraphicsRect.left, true);; paramView1 = a(i3, paramView1.getTop(), false, jdField_c_of_type_AndroidGraphicsRect.left, true))
      {
        if (paramView1.getTop() < i1)
        {
          paramInt1 = paramView1.getTop();
          i4 = paramView1.getBottom();
          paramInt2 = (paramInt3 - paramInt2) / 2;
          paramView1.offsetTopAndBottom(Math.min(Math.min(i1 - paramInt1, i2 - i4), paramInt2));
        }
        a(paramView1, i3);
        return paramView1;
      }
    }
    paramInt1 = paramView1.getTop();
    paramView1 = a(i3, paramInt1, true, jdField_c_of_type_AndroidGraphicsRect.left, true);
    if ((paramInt1 < paramInt2) && (paramView1.getBottom() < paramInt2 + 20)) {
      paramView1.offsetTopAndBottom(paramInt2 - paramView1.getTop());
    }
    a(paramView1, i3);
    return paramView1;
  }
  
  private uby a(int paramInt)
  {
    int i2 = 1;
    int i1 = 1;
    View localView = a();
    if ((localView != null) && (localView.hasFocus()))
    {
      localView = localView.findFocus();
      localView = FocusFinder.getInstance().findNextFocus(this, localView, paramInt);
      if (localView == null) {
        break label376;
      }
      i1 = a(localView);
      if ((aF != -1) && (i1 != aF))
      {
        i2 = a(paramInt);
        if ((i2 != -1) && (((paramInt == 130) && (i2 < i1)) || ((paramInt == 33) && (i2 > i1)))) {
          return null;
        }
      }
    }
    else
    {
      if (paramInt == 130)
      {
        if (au > 0)
        {
          label120:
          i2 = jdField_c_of_type_AndroidGraphicsRect.top;
          if (i1 == 0) {
            break label198;
          }
        }
        label198:
        for (i1 = a();; i1 = 0)
        {
          i2 = i1 + i2;
          i1 = i2;
          if (localView != null)
          {
            i1 = i2;
            if (localView.getTop() > i2) {
              i1 = localView.getTop();
            }
          }
          jdField_a_of_type_AndroidGraphicsRect.set(0, i1, 0, i1);
          localView = FocusFinder.getInstance().findNextFocusFromRect(this, jdField_a_of_type_AndroidGraphicsRect, paramInt);
          break;
          i1 = 0;
          break label120;
        }
      }
      if (au + getChildCount() - 1 < aG)
      {
        i1 = i2;
        label223:
        i2 = getHeight();
        i3 = jdField_c_of_type_AndroidGraphicsRect.bottom;
        if (i1 == 0) {
          break label296;
        }
      }
      label296:
      for (i1 = a();; i1 = 0)
      {
        i2 = i2 - i3 - i1;
        i1 = i2;
        if (localView != null)
        {
          i1 = i2;
          if (localView.getBottom() < i2) {
            i1 = localView.getBottom();
          }
        }
        jdField_a_of_type_AndroidGraphicsRect.set(0, i1, 0, i1);
        break;
        i1 = 0;
        break label223;
      }
    }
    i2 = a(paramInt, localView, i1);
    int i3 = w();
    if (i2 < i3)
    {
      localView.requestFocus(paramInt);
      jdField_a_of_type_Uby.a(i1, i2);
      return jdField_a_of_type_Uby;
    }
    if (b(localView) < i3)
    {
      localView.requestFocus(paramInt);
      jdField_a_of_type_Uby.a(i1, i3);
      return jdField_a_of_type_Uby;
    }
    label376:
    return null;
  }
  
  private void a(int paramInt)
  {
    if ((au + paramInt - 1 == aG - 1) && (paramInt > 0))
    {
      paramInt = getChildAt(paramInt - 1).getBottom();
      int i1 = getBottom() - mTop - jdField_c_of_type_AndroidGraphicsRect.bottom - paramInt;
      View localView = getChildAt(0);
      int i2 = localView.getTop();
      if ((i1 > 0) && ((au > 0) || (i2 < jdField_c_of_type_AndroidGraphicsRect.top)))
      {
        paramInt = i1;
        if (au == 0) {
          paramInt = Math.min(i1, jdField_c_of_type_AndroidGraphicsRect.top - i2);
        }
        offsetChildrenTopAndBottom(paramInt);
        if (au > 0)
        {
          b(au - 1, localView.getTop() - aL);
          d();
        }
      }
    }
  }
  
  private void a(Rect paramRect)
  {
    try
    {
      Field localField = View.class.getDeclaredField("mPrivateFlags");
      localField.setAccessible(true);
      localField.set(this, Integer.valueOf(localField.getInt(this) | 0x80000000));
      return;
    }
    catch (Exception localException)
    {
      if (QLog.isColorLevel()) {
        QLog.e("XListView", 2, localException.getMessage(), localException);
      }
      postInvalidate(left, top, right, bottom);
    }
  }
  
  private void a(View paramView, int paramInt)
  {
    int i1 = aL;
    if (!i)
    {
      b(paramInt - 1, paramView.getTop() - i1);
      d();
      a(paramInt + 1, i1 + paramView.getBottom());
      return;
    }
    a(paramInt + 1, paramView.getBottom() + i1);
    d();
    b(paramInt - 1, paramView.getTop() - i1);
  }
  
  private void a(View paramView, int paramInt1, int paramInt2)
  {
    AbsListView.LayoutParams localLayoutParams2 = (AbsListView.LayoutParams)paramView.getLayoutParams();
    AbsListView.LayoutParams localLayoutParams1 = localLayoutParams2;
    if (localLayoutParams2 == null)
    {
      localLayoutParams1 = new AbsListView.LayoutParams(-1, -2, 0);
      paramView.setLayoutParams(localLayoutParams1);
    }
    jdField_a_of_type_Int = jdField_a_of_type_AndroidWidgetListAdapter.getItemViewType(paramInt1);
    jdField_b_of_type_Boolean = true;
    paramInt2 = ViewGroup.getChildMeasureSpec(paramInt2, jdField_c_of_type_AndroidGraphicsRect.left + jdField_c_of_type_AndroidGraphicsRect.right, width);
    paramInt1 = height;
    if (paramInt1 > 0) {}
    for (paramInt1 = View.MeasureSpec.makeMeasureSpec(paramInt1, 1073741824);; paramInt1 = View.MeasureSpec.makeMeasureSpec(0, 0))
    {
      paramView.measure(paramInt2, paramInt1);
      return;
    }
  }
  
  private void a(View paramView, int paramInt1, int paramInt2, boolean paramBoolean)
  {
    boolean bool2 = true;
    if (paramInt2 == -1) {
      throw new IllegalArgumentException("newSelectedPosition needs to be valid");
    }
    int i1 = aF - au;
    paramInt2 -= au;
    int i2;
    View localView1;
    boolean bool1;
    if (paramInt1 == 33)
    {
      View localView2 = getChildAt(paramInt2);
      paramInt1 = i1;
      i2 = 1;
      localView1 = paramView;
      paramView = localView2;
      i1 = paramInt2;
      paramInt2 = paramInt1;
      paramInt1 = i2;
      i2 = getChildCount();
      if (paramView != null)
      {
        if ((paramBoolean) || (paramInt1 == 0)) {
          break label154;
        }
        bool1 = true;
        label92:
        paramView.setSelected(bool1);
        b(paramView, i1, i2);
      }
      if (localView1 != null) {
        if ((paramBoolean) || (paramInt1 != 0)) {
          break label160;
        }
      }
    }
    label154:
    label160:
    for (paramBoolean = bool2;; paramBoolean = false)
    {
      localView1.setSelected(paramBoolean);
      b(localView1, paramInt2, i2);
      return;
      localView1 = getChildAt(paramInt2);
      paramInt1 = 0;
      break;
      bool1 = false;
      break label92;
    }
  }
  
  private void a(View paramView, int paramInt1, int paramInt2, boolean paramBoolean1, int paramInt3, boolean paramBoolean2, boolean paramBoolean3)
  {
    if (paramBoolean1) {}
    for (int i1 = -1;; i1 = 0)
    {
      a(paramView, paramInt1, paramInt2, paramBoolean1, paramInt3, paramBoolean2, paramBoolean3, i1);
      return;
    }
  }
  
  private void a(View paramView, int paramInt1, int paramInt2, boolean paramBoolean1, int paramInt3, boolean paramBoolean2, boolean paramBoolean3, int paramInt4)
  {
    b("ListView.setupChild");
    if (paramView == null)
    {
      if (QLog.isColorLevel()) {
        QLog.e("XListView", 2, "ListView setupChild view is null");
      }
      setStatisticCollector();
      B();
      return;
    }
    if (paramBoolean2) {}
    try
    {
      if (!l()) {
        break label435;
      }
      paramBoolean2 = true;
    }
    catch (NullPointerException paramView)
    {
      for (;;)
      {
        int i2;
        try
        {
          AbsListView.LayoutParams localLayoutParams;
          paramView.measure(i2, paramInt4);
          B();
          paramInt4 = paramView.getMeasuredWidth();
          i2 = paramView.getMeasuredHeight();
          if (!paramBoolean1) {
            break label642;
          }
          if (i1 == 0) {
            break label609;
          }
          b("ListView.childLayout");
          paramView.layout(paramInt3, paramInt2, paramInt4 + paramInt3, i2 + paramInt2);
          B();
          if ((jdField_g_of_type_Boolean) && (!paramView.isDrawingCacheEnabled())) {
            paramView.setDrawingCacheEnabled(true);
          }
          if ((VersionUtils.e()) && (paramBoolean3) && (getLayoutParamsjdField_b_of_type_Int != paramInt1)) {
            paramView.jumpDrawablesToCurrentState();
          }
          B();
          return;
          paramBoolean2 = false;
          continue;
          i2 = 0;
          continue;
          boolean bool = false;
          continue;
          int i3 = 0;
          continue;
          i1 = 0;
          continue;
          jdField_b_of_type_Boolean = false;
          if (jdField_a_of_type_Int == -2) {
            jdField_a_of_type_Boolean = true;
          }
          addViewInLayout(paramView, paramInt4, localLayoutParams, true);
          continue;
          paramView = paramView;
          setStatisticCollector();
          continue;
          if ((getContextgetApplicationInfotargetSdkVersion < 11) || (!VersionUtils.e())) {
            continue;
          }
          paramView.setActivated(jdField_a_of_type_AndroidUtilSparseBooleanArray.get(paramInt1));
          continue;
          paramInt4 = View.MeasureSpec.makeMeasureSpec(0, 0);
        }
        catch (StringIndexOutOfBoundsException localStringIndexOutOfBoundsException)
        {
          if (!QLog.isColorLevel()) {
            continue;
          }
          QLog.e("XListView", 2, localStringIndexOutOfBoundsException.getStackTrace());
          continue;
        }
        catch (Exception localException)
        {
          if (!QLog.isColorLevel()) {
            continue;
          }
          QLog.e("XListView", 2, localException.getStackTrace());
          continue;
        }
        cleanupLayoutState(paramView);
        continue;
        paramView.offsetLeftAndRight(paramInt3 - paramView.getLeft());
        paramView.offsetTopAndBottom(paramInt2 - paramView.getTop());
        continue;
        continue;
        int i1 = 1;
        continue;
        paramInt2 -= i2;
      }
    }
    if (paramBoolean2 != paramView.isSelected())
    {
      i2 = 1;
      i1 = ag;
      if ((i1 <= 0) || (i1 >= 3) || (ab != paramInt1)) {
        break label447;
      }
      bool = true;
      if (bool == paramView.isPressed()) {
        break label453;
      }
      i3 = 1;
      if ((!paramBoolean3) || (i2 != 0)) {
        break label636;
      }
      if (!paramView.isLayoutRequested()) {
        break label459;
      }
      break label636;
      localLayoutParams = (AbsListView.LayoutParams)paramView.getLayoutParams();
      if (localLayoutParams != null) {
        break label633;
      }
      localLayoutParams = new AbsListView.LayoutParams(-1, -2, 0);
      jdField_a_of_type_Int = jdField_a_of_type_AndroidWidgetListAdapter.getItemViewType(paramInt1);
      if (((!paramBoolean3) || (jdField_b_of_type_Boolean)) && ((!jdField_a_of_type_Boolean) || (jdField_a_of_type_Int != -2))) {
        break label465;
      }
      attachViewToParent(paramView, paramInt4, localLayoutParams);
      if (i2 != 0) {
        paramView.setSelected(paramBoolean2);
      }
      if (i3 != 0) {
        paramView.setPressed(bool);
      }
      if ((S != 0) && (jdField_a_of_type_AndroidUtilSparseBooleanArray != null))
      {
        if (!(paramView instanceof Checkable)) {
          break label509;
        }
        ((Checkable)paramView).setChecked(jdField_a_of_type_AndroidUtilSparseBooleanArray.get(paramInt1));
      }
      if (i1 == 0) {
        break label601;
      }
      i2 = ViewGroup.getChildMeasureSpec(aa, jdField_c_of_type_AndroidGraphicsRect.left + jdField_c_of_type_AndroidGraphicsRect.right, width);
      paramInt4 = height;
      if (paramInt4 <= 0) {
        break label545;
      }
      paramInt4 = View.MeasureSpec.makeMeasureSpec(paramInt4, 1073741824);
      b("ListView.childMeasure");
    }
  }
  
  private void a(View paramView, ArrayList paramArrayList)
  {
    int i2 = paramArrayList.size();
    int i1 = 0;
    for (;;)
    {
      if (i1 < i2)
      {
        if (getjdField_a_of_type_AndroidViewView == paramView) {
          paramArrayList.remove(i1);
        }
      }
      else {
        return;
      }
      i1 += 1;
    }
  }
  
  private void a(ArrayList paramArrayList)
  {
    if (paramArrayList != null)
    {
      int i2 = paramArrayList.size();
      int i1 = 0;
      while (i1 < i2)
      {
        AbsListView.LayoutParams localLayoutParams = (AbsListView.LayoutParams)getjdField_a_of_type_AndroidViewView.getLayoutParams();
        if (localLayoutParams != null) {
          jdField_a_of_type_Boolean = false;
        }
        i1 += 1;
      }
    }
  }
  
  private boolean a(int paramInt)
  {
    if ((paramInt != 17) && (paramInt != 66)) {
      throw new IllegalArgumentException("direction must be one of {View.FOCUS_LEFT, View.FOCUS_RIGHT}");
    }
    int i1 = getChildCount();
    if ((t) && (i1 > 0) && (aF != -1))
    {
      View localView2 = a();
      if ((localView2 != null) && (localView2.hasFocus()) && ((localView2 instanceof ViewGroup)))
      {
        View localView1 = localView2.findFocus();
        localView2 = FocusFinder.getInstance().findNextFocus((ViewGroup)localView2, localView1, paramInt);
        if (localView2 != null)
        {
          localView1.getFocusedRect(jdField_a_of_type_AndroidGraphicsRect);
          offsetDescendantRectToMyCoords(localView1, jdField_a_of_type_AndroidGraphicsRect);
          offsetRectIntoDescendantCoords(localView2, jdField_a_of_type_AndroidGraphicsRect);
          if (localView2.requestFocus(paramInt, jdField_a_of_type_AndroidGraphicsRect)) {
            return true;
          }
        }
        localView1 = FocusFinder.getInstance().findNextFocus((ViewGroup)getRootView(), localView1, paramInt);
        if (localView1 != null) {
          return a(localView1, this);
        }
      }
    }
    return false;
  }
  
  private boolean a(View paramView1, View paramView2)
  {
    if (paramView1 == paramView2) {
      return true;
    }
    paramView1 = paramView1.getParent();
    if (((paramView1 instanceof ViewGroup)) && (a((View)paramView1, paramView2))) {}
    for (boolean bool = true;; bool = false) {
      return bool;
    }
  }
  
  private int b(int paramInt1, int paramInt2, int paramInt3)
  {
    int i1 = paramInt1;
    if (paramInt3 > 0) {
      i1 = paramInt1 + paramInt2;
    }
    return i1;
  }
  
  private int b(View paramView)
  {
    int i1 = 0;
    paramView.getDrawingRect(jdField_a_of_type_AndroidGraphicsRect);
    offsetDescendantRectToMyCoords(paramView, jdField_a_of_type_AndroidGraphicsRect);
    int i2 = mBottom - mTop - jdField_c_of_type_AndroidGraphicsRect.bottom;
    if (jdField_a_of_type_AndroidGraphicsRect.bottom < jdField_c_of_type_AndroidGraphicsRect.top) {
      i1 = jdField_c_of_type_AndroidGraphicsRect.top - jdField_a_of_type_AndroidGraphicsRect.bottom;
    }
    while (jdField_a_of_type_AndroidGraphicsRect.top <= i2) {
      return i1;
    }
    return jdField_a_of_type_AndroidGraphicsRect.top - i2;
  }
  
  private View b(int paramInt1, int paramInt2)
  {
    Object localObject = null;
    int i1;
    if ((mGroupFlags & 0x22) == 34) {
      i1 = jdField_c_of_type_AndroidGraphicsRect.top;
    }
    for (;;)
    {
      boolean bool;
      label43:
      int i2;
      if ((paramInt2 > i1) && (paramInt1 >= 0)) {
        if (paramInt1 == aF)
        {
          bool = true;
          View localView = a(paramInt1, paramInt2, false, jdField_c_of_type_AndroidGraphicsRect.left, bool);
          paramInt2 = localView.getTop();
          i2 = aL;
          if (!bool) {
            break label110;
          }
          localObject = localView;
        }
      }
      label110:
      for (;;)
      {
        paramInt2 -= i2;
        paramInt1 -= 1;
        break;
        bool = false;
        break label43;
        au = (paramInt1 + 1);
        return localObject;
      }
      i1 = 0;
    }
  }
  
  private View b(View paramView, int paramInt)
  {
    paramInt += 1;
    View localView = a(paramInt, jdField_a_of_type_ArrayOfBoolean);
    int i1 = paramView.getBottom();
    a(localView, paramInt, aL + i1, true, jdField_c_of_type_AndroidGraphicsRect.left, false, jdField_a_of_type_ArrayOfBoolean[0]);
    return localView;
  }
  
  private void b(View paramView, int paramInt1, int paramInt2)
  {
    int i1 = paramView.getHeight();
    c(paramView);
    if (paramView.getMeasuredHeight() != i1)
    {
      d(paramView);
      int i2 = paramView.getMeasuredHeight();
      paramInt1 += 1;
      while (paramInt1 < paramInt2)
      {
        getChildAt(paramInt1).offsetTopAndBottom(i2 - i1);
        paramInt1 += 1;
      }
    }
  }
  
  private boolean b()
  {
    boolean bool = false;
    int i1 = mScrollY;
    int i2 = jdField_c_of_type_AndroidGraphicsRect.top;
    if ((au > 0) || (getChildAt(0).getTop() > i1 + i2)) {
      bool = true;
    }
    return bool;
  }
  
  private boolean b(int paramInt)
  {
    if (getChildCount() <= 0) {
      return false;
    }
    View localView1 = a();
    int i4 = aF;
    int i1 = a(paramInt);
    int i2 = a(paramInt, i1);
    Object localObject;
    int i3;
    label73:
    boolean bool;
    if (t)
    {
      localObject = a(paramInt);
      if (localObject != null)
      {
        i1 = ((uby)localObject).a();
        i2 = ((uby)localObject).b();
      }
      if (localObject == null) {
        break label311;
      }
      i3 = 1;
      if (i1 == -1) {
        break label332;
      }
      if (localObject == null) {
        break label317;
      }
      bool = true;
      label86:
      a(localView1, paramInt, i1, bool);
      h(i1);
      i(i1);
      localView1 = a();
      if ((t) && (localObject == null))
      {
        View localView2 = getFocusedChild();
        if (localView2 != null) {
          localView2.clearFocus();
        }
      }
      y();
      i3 = 1;
      i4 = i1;
    }
    label160:
    label311:
    label317:
    label329:
    label330:
    label332:
    for (;;)
    {
      if (i2 > 0)
      {
        if (paramInt == 33)
        {
          j(i2);
          i3 = 1;
        }
      }
      else
      {
        if ((t) && (localObject == null) && (localView1 != null) && (localView1.hasFocus()))
        {
          localObject = localView1.findFocus();
          if ((localObject != null) && ((!a((View)localObject, this)) || (b((View)localObject) > 0))) {
            ((View)localObject).clearFocus();
          }
        }
        if ((i1 != -1) || (localView1 == null) || (a(localView1, this))) {
          break label329;
        }
        n();
        ak = -1;
        localView1 = null;
      }
      for (;;)
      {
        if (i3 == 0) {
          break label330;
        }
        if (localView1 != null)
        {
          a(i4, localView1);
          aj = localView1.getTop();
        }
        if (!awakenScrollBars()) {
          invalidate();
        }
        h();
        return true;
        localObject = null;
        break;
        i3 = 0;
        break label73;
        bool = false;
        break label86;
        i2 = -i2;
        break label160;
      }
      break;
    }
  }
  
  private boolean b(int paramInt1, int paramInt2, KeyEvent paramKeyEvent)
  {
    boolean bool3 = true;
    boolean bool2;
    if ((jdField_a_of_type_AndroidWidgetListAdapter == null) || (!n))
    {
      bool2 = false;
      return bool2;
    }
    if (r) {
      b();
    }
    int i3 = paramKeyEvent.getAction();
    if (i3 != 1) {}
    label144:
    boolean bool1;
    int i1;
    switch (paramInt1)
    {
    default: 
      bool1 = false;
      i1 = paramInt2;
    }
    for (;;)
    {
      bool2 = bool3;
      if (bool1) {
        break;
      }
      bool2 = bool3;
      if (a(paramInt1, i1, paramKeyEvent)) {
        break;
      }
      switch (i3)
      {
      default: 
        return false;
        int i2;
        if ((VersionUtils.e()) && (paramKeyEvent.hasNoModifiers()))
        {
          bool2 = m();
          bool1 = bool2;
          i1 = paramInt2;
          if (!bool2) {
            for (;;)
            {
              i2 = paramInt2 - 1;
              bool1 = bool2;
              i1 = i2;
              if (paramInt2 <= 0) {
                break;
              }
              bool1 = bool2;
              i1 = i2;
              if (!h(33)) {
                break;
              }
              bool2 = true;
              paramInt2 = i2;
            }
          }
        }
        else
        {
          if ((!VersionUtils.e()) || (!paramKeyEvent.hasModifiers(2))) {
            break label144;
          }
          if ((m()) || (g(33)))
          {
            bool1 = true;
            i1 = paramInt2;
          }
          else
          {
            bool1 = false;
            i1 = paramInt2;
            continue;
            if ((VersionUtils.e()) && (paramKeyEvent.hasNoModifiers()))
            {
              bool2 = m();
              bool1 = bool2;
              i1 = paramInt2;
              if (!bool2) {
                for (;;)
                {
                  i2 = paramInt2 - 1;
                  bool1 = bool2;
                  i1 = i2;
                  if (paramInt2 <= 0) {
                    break;
                  }
                  bool1 = bool2;
                  i1 = i2;
                  if (!h(130)) {
                    break;
                  }
                  bool2 = true;
                  paramInt2 = i2;
                }
              }
            }
            else
            {
              if ((!VersionUtils.e()) || (!paramKeyEvent.hasModifiers(2))) {
                break label144;
              }
              if ((m()) || (g(130)))
              {
                bool1 = true;
                i1 = paramInt2;
              }
              else
              {
                bool1 = false;
                i1 = paramInt2;
                continue;
                if ((!VersionUtils.e()) || (!paramKeyEvent.hasNoModifiers())) {
                  break label144;
                }
                bool1 = a(17);
                i1 = paramInt2;
                continue;
                if ((!VersionUtils.e()) || (!paramKeyEvent.hasNoModifiers())) {
                  break label144;
                }
                bool1 = a(66);
                i1 = paramInt2;
                continue;
                if ((!VersionUtils.e()) || (!paramKeyEvent.hasNoModifiers())) {
                  break label144;
                }
                bool2 = m();
                bool1 = bool2;
                i1 = paramInt2;
                if (!bool2)
                {
                  bool1 = bool2;
                  i1 = paramInt2;
                  if (paramKeyEvent.getRepeatCount() == 0)
                  {
                    bool1 = bool2;
                    i1 = paramInt2;
                    if (getChildCount() > 0)
                    {
                      l();
                      bool1 = true;
                      i1 = paramInt2;
                      continue;
                      if ((jdField_a_of_type_AndroidWidgetPopupWindow != null) && (jdField_a_of_type_AndroidWidgetPopupWindow.isShowing())) {
                        break label144;
                      }
                      if ((VersionUtils.e()) && (paramKeyEvent.hasNoModifiers())) {
                        if ((m()) || (!f(130))) {}
                      }
                      for (;;)
                      {
                        bool1 = true;
                        i1 = paramInt2;
                        break;
                        if ((!VersionUtils.e()) || (!paramKeyEvent.hasModifiers(1)) || (m()) || (!f(33))) {}
                      }
                      if ((VersionUtils.e()) && (paramKeyEvent.hasNoModifiers()))
                      {
                        if ((m()) || (f(33)))
                        {
                          bool1 = true;
                          i1 = paramInt2;
                        }
                        else
                        {
                          bool1 = false;
                          i1 = paramInt2;
                        }
                      }
                      else
                      {
                        if ((!VersionUtils.e()) || (!paramKeyEvent.hasModifiers(2))) {
                          break label144;
                        }
                        if ((m()) || (g(33)))
                        {
                          bool1 = true;
                          i1 = paramInt2;
                        }
                        else
                        {
                          bool1 = false;
                          i1 = paramInt2;
                          continue;
                          if ((VersionUtils.e()) && (paramKeyEvent.hasNoModifiers()))
                          {
                            if ((m()) || (f(130)))
                            {
                              bool1 = true;
                              i1 = paramInt2;
                            }
                            else
                            {
                              bool1 = false;
                              i1 = paramInt2;
                            }
                          }
                          else
                          {
                            if ((!VersionUtils.e()) || (!paramKeyEvent.hasModifiers(2))) {
                              break label144;
                            }
                            if ((m()) || (g(130)))
                            {
                              bool1 = true;
                              i1 = paramInt2;
                            }
                            else
                            {
                              bool1 = false;
                              i1 = paramInt2;
                              continue;
                              if ((!VersionUtils.e()) || (!paramKeyEvent.hasNoModifiers())) {
                                break label144;
                              }
                              if ((m()) || (g(33)))
                              {
                                bool1 = true;
                                i1 = paramInt2;
                              }
                              else
                              {
                                bool1 = false;
                                i1 = paramInt2;
                                continue;
                                if ((!VersionUtils.e()) || (!paramKeyEvent.hasNoModifiers())) {
                                  break label144;
                                }
                                if ((m()) || (g(130)))
                                {
                                  bool1 = true;
                                  i1 = paramInt2;
                                }
                                else
                                {
                                  bool1 = false;
                                  i1 = paramInt2;
                                }
                              }
                            }
                          }
                        }
                      }
                    }
                  }
                }
              }
            }
          }
        }
        break;
      }
    }
    return super.onKeyDown(paramInt1, paramKeyEvent);
    return super.onKeyUp(paramInt1, paramKeyEvent);
    return super.onKeyMultiple(paramInt1, i1, paramKeyEvent);
  }
  
  private View c(int paramInt1, int paramInt2)
  {
    paramInt2 -= paramInt1;
    int i1 = o();
    View localView = a(i1, paramInt1, true, jdField_c_of_type_AndroidGraphicsRect.left, true);
    au = i1;
    paramInt1 = localView.getMeasuredHeight();
    if (paramInt1 <= paramInt2) {
      localView.offsetTopAndBottom((paramInt2 - paramInt1) / 2);
    }
    a(localView, i1);
    if (!i)
    {
      a(getChildCount());
      return localView;
    }
    c(getChildCount());
    return localView;
  }
  
  private void c()
  {
    if ((i) && (au == 0) && (getChildCount() > 0))
    {
      int i1 = getChildAt(0).getTop() - jdField_c_of_type_AndroidGraphicsRect.top;
      if (i1 > 0) {
        offsetChildrenTopAndBottom(-i1);
      }
    }
  }
  
  private void c(int paramInt)
  {
    int i4;
    if ((au == 0) && (paramInt > 0))
    {
      int i1 = getChildAt(0).getTop();
      int i3 = jdField_c_of_type_AndroidGraphicsRect.top;
      int i2 = getBottom() - mTop - jdField_c_of_type_AndroidGraphicsRect.bottom;
      i1 -= i3;
      View localView = getChildAt(paramInt - 1);
      i3 = localView.getBottom();
      i4 = au + paramInt - 1;
      if (i1 > 0)
      {
        if ((i4 >= aG - 1) && (i3 <= i2)) {
          break label162;
        }
        paramInt = i1;
        if (i4 == aG - 1) {
          paramInt = Math.min(i1, i3 - i2);
        }
        offsetChildrenTopAndBottom(-paramInt);
        if (i4 < aG - 1)
        {
          a(i4 + 1, localView.getBottom() + aL);
          d();
        }
      }
    }
    label162:
    while (i4 != aG - 1) {
      return;
    }
    d();
  }
  
  private void c(View paramView)
  {
    ViewGroup.LayoutParams localLayoutParams2 = paramView.getLayoutParams();
    ViewGroup.LayoutParams localLayoutParams1 = localLayoutParams2;
    if (localLayoutParams2 == null) {
      localLayoutParams1 = new ViewGroup.LayoutParams(-1, -2);
    }
    int i2 = ViewGroup.getChildMeasureSpec(aa, jdField_c_of_type_AndroidGraphicsRect.left + jdField_c_of_type_AndroidGraphicsRect.right, width);
    int i1 = height;
    if (i1 > 0) {}
    for (i1 = View.MeasureSpec.makeMeasureSpec(i1, 1073741824);; i1 = View.MeasureSpec.makeMeasureSpec(0, 0))
    {
      paramView.measure(i2, i1);
      return;
    }
  }
  
  private boolean c(View paramView)
  {
    ArrayList localArrayList = jdField_a_of_type_JavaUtilArrayList;
    int i2 = localArrayList.size();
    int i1 = 0;
    while (i1 < i2)
    {
      if (paramView == getjdField_a_of_type_AndroidViewView) {
        return true;
      }
      i1 += 1;
    }
    localArrayList = jdField_b_of_type_JavaUtilArrayList;
    i2 = localArrayList.size();
    i1 = 0;
    while (i1 < i2)
    {
      if (paramView == getjdField_a_of_type_AndroidViewView) {
        return true;
      }
      i1 += 1;
    }
    return false;
  }
  
  private View d(int paramInt1, int paramInt2)
  {
    boolean bool;
    View localView5;
    View localView3;
    View localView4;
    View localView1;
    View localView2;
    if (paramInt1 == aF)
    {
      bool = true;
      localView5 = a(paramInt1, paramInt2, false, jdField_c_of_type_AndroidGraphicsRect.left, bool);
      au = paramInt1;
      paramInt2 = aL;
      if (i) {
        break label122;
      }
      localView3 = b(paramInt1 - 1, localView5.getTop() - paramInt2);
      d();
      localView4 = a(paramInt1 + 1, paramInt2 + localView5.getBottom());
      paramInt1 = getChildCount();
      localView1 = localView3;
      localView2 = localView4;
      if (paramInt1 > 0)
      {
        a(paramInt1);
        localView2 = localView4;
        localView1 = localView3;
      }
    }
    for (;;)
    {
      if (!bool) {
        break label191;
      }
      return localView5;
      bool = false;
      break;
      label122:
      localView3 = a(paramInt1 + 1, localView5.getBottom() + paramInt2);
      d();
      localView4 = b(paramInt1 - 1, localView5.getTop() - paramInt2);
      paramInt1 = getChildCount();
      localView1 = localView4;
      localView2 = localView3;
      if (paramInt1 > 0)
      {
        c(paramInt1);
        localView1 = localView4;
        localView2 = localView3;
      }
    }
    label191:
    if (localView1 != null) {
      return localView1;
    }
    return localView2;
  }
  
  private void d()
  {
    int i3 = 0;
    int i4 = getChildCount();
    int i2;
    int i1;
    if (i4 > 0)
    {
      if (i) {
        break label72;
      }
      i2 = getChildAt(0).getTop() - jdField_c_of_type_AndroidGraphicsRect.top;
      i1 = i2;
      if (au != 0) {
        i1 = i2 - aL;
      }
      i2 = i1;
      if (i1 >= 0) {
        break label128;
      }
      i2 = i3;
    }
    label72:
    label128:
    for (;;)
    {
      if (i2 != 0) {
        offsetChildrenTopAndBottom(-i2);
      }
      return;
      i2 = getChildAt(i4 - 1).getBottom() - (getHeight() - jdField_c_of_type_AndroidGraphicsRect.bottom);
      i1 = i2;
      if (i4 + au < aG) {
        i1 = i2 + aL;
      }
      i2 = i3;
      if (i1 <= 0) {
        i2 = i1;
      }
    }
  }
  
  private void d(View paramView)
  {
    int i1 = paramView.getMeasuredWidth();
    int i2 = paramView.getMeasuredHeight();
    int i3 = jdField_c_of_type_AndroidGraphicsRect.left;
    int i4 = paramView.getTop();
    paramView.layout(i3, i4, i1 + i3, i2 + i4);
  }
  
  private View e(int paramInt1, int paramInt2)
  {
    boolean bool;
    View localView5;
    View localView3;
    View localView4;
    View localView1;
    View localView2;
    if (paramInt1 == aF)
    {
      bool = true;
      localView5 = a(paramInt1, paramInt2, true, jdField_c_of_type_AndroidGraphicsRect.left, bool);
      au = paramInt1;
      paramInt2 = aL;
      if (i) {
        break label122;
      }
      localView3 = b(paramInt1 - 1, localView5.getTop() - paramInt2);
      d();
      localView4 = a(paramInt1 + 1, paramInt2 + localView5.getBottom());
      paramInt1 = getChildCount();
      localView1 = localView3;
      localView2 = localView4;
      if (paramInt1 > 0)
      {
        a(paramInt1);
        localView2 = localView4;
        localView1 = localView3;
      }
    }
    for (;;)
    {
      if (!bool) {
        break label191;
      }
      return localView5;
      bool = false;
      break;
      label122:
      localView3 = a(paramInt1 + 1, localView5.getBottom() + paramInt2);
      d();
      localView4 = b(paramInt1 - 1, localView5.getTop() - paramInt2);
      paramInt1 = getChildCount();
      localView1 = localView4;
      localView2 = localView3;
      if (paramInt1 > 0)
      {
        c(paramInt1);
        localView1 = localView4;
        localView2 = localView3;
      }
    }
    label191:
    if (localView1 != null) {
      return localView1;
    }
    return localView2;
  }
  
  private void e()
  {
    int i1;
    if ((ag == 5) && (getScrollY() != 0))
    {
      i1 = getScrollY();
      if ((i1 >= 0) || (jdField_a_of_type_Ucb == null) || (i1 <= -d()) || ((m != 0) && (m != 2))) {
        break label87;
      }
      if (jdField_a_of_type_ComTencentWidgetOverScrollViewListener != null) {
        jdField_a_of_type_ComTencentWidgetOverScrollViewListener.a(0, jdField_a_of_type_Ucb.getChildAt(0), this);
      }
      m = 1;
    }
    label87:
    while ((i1 <= 0) || (jdField_b_of_type_Ucb == null) || (i1 >= v()) || ((m != 0) && (m != 2))) {
      return;
    }
    if (jdField_a_of_type_ComTencentWidgetOverScrollViewListener != null) {
      jdField_a_of_type_ComTencentWidgetOverScrollViewListener.a(1, jdField_b_of_type_Ucb.getChildAt(0), this);
    }
    m = 1;
  }
  
  private void e(View paramView)
  {
    int i1 = getScrollY();
    paramView.getHeight();
    if (paramView == jdField_a_of_type_Ucb) {
      if ((m == 1) && (i1 <= -d()))
      {
        m = 2;
        if (jdField_a_of_type_ComTencentWidgetOverScrollViewListener != null) {
          jdField_a_of_type_ComTencentWidgetOverScrollViewListener.b(0, jdField_a_of_type_Ucb.getChildAt(0), this);
        }
      }
    }
    do
    {
      do
      {
        return;
      } while ((paramView != jdField_b_of_type_Ucb) || (m != 1) || (i1 < v()));
      m = 2;
    } while (jdField_a_of_type_ComTencentWidgetOverScrollViewListener == null);
    jdField_a_of_type_ComTencentWidgetOverScrollViewListener.b(1, jdField_b_of_type_Ucb.getChildAt(0), this);
  }
  
  private void f(View paramView)
  {
    try
    {
      Object localObject = View.class.getDeclaredField("mAttachInfo");
      ((Field)localObject).setAccessible(true);
      localObject = ((Field)localObject).get(this);
      if (localObject != null)
      {
        Method localMethod = View.class.getDeclaredMethod("dispatchAttachedToWindow", new Class[] { localObject.getClass(), Integer.TYPE });
        localMethod.setAccessible(true);
        localMethod.invoke(paramView, new Object[] { localObject, Integer.valueOf(getVisibility()) });
      }
      return;
    }
    catch (Exception paramView)
    {
      while (!QLog.isColorLevel()) {}
      QLog.e("XListView", 2, paramView.getMessage(), paramView);
    }
  }
  
  private void g(View paramView)
  {
    try
    {
      Object localObject = View.class.getDeclaredField("mAttachInfo");
      ((Field)localObject).setAccessible(true);
      if (((Field)localObject).get(paramView) != null)
      {
        localObject = View.class.getDeclaredMethod("dispatchDetachedFromWindow", new Class[0]);
        ((Method)localObject).setAccessible(true);
        ((Method)localObject).invoke(paramView, new Object[0]);
      }
      return;
    }
    catch (Exception paramView)
    {
      while (!QLog.isColorLevel()) {}
      QLog.e("XListView", 2, paramView.getMessage(), paramView);
    }
  }
  
  private void j(int paramInt)
  {
    offsetChildrenTopAndBottom(paramInt);
    int i1 = getHeight() - jdField_c_of_type_AndroidGraphicsRect.bottom;
    int i2 = jdField_c_of_type_AndroidGraphicsRect.top;
    uab localUab = jdField_a_of_type_Uab;
    View localView;
    if (paramInt < 0)
    {
      paramInt = getChildCount();
      localView = getChildAt(paramInt - 1);
      while (localView.getBottom() < i1)
      {
        int i3 = au + paramInt - 1;
        if (i3 >= aG - 1) {
          break;
        }
        localView = b(localView, i3);
        paramInt += 1;
      }
      if (localView.getBottom() < i1) {
        offsetChildrenTopAndBottom(i1 - localView.getBottom());
      }
      localView = getChildAt(0);
      if (localView.getBottom() < i2)
      {
        if (localUab.a(getLayoutParamsjdField_a_of_type_Int))
        {
          detachViewFromParent(localView);
          localUab.a(localView, au);
        }
        for (;;)
        {
          localView = getChildAt(0);
          au += 1;
          break;
          removeViewInLayout(localView);
        }
      }
    }
    else
    {
      localView = getChildAt(0);
      while ((localView.getTop() > i2) && (au > 0))
      {
        localView = a(localView, au);
        au -= 1;
      }
      if (localView.getTop() > i2) {
        offsetChildrenTopAndBottom(i2 - localView.getTop());
      }
      paramInt = getChildCount() - 1;
      localView = getChildAt(paramInt);
      if (localView.getTop() > i1)
      {
        if (localUab.a(getLayoutParamsjdField_a_of_type_Int))
        {
          detachViewFromParent(localView);
          localUab.a(localView, au + paramInt);
        }
        for (;;)
        {
          paramInt -= 1;
          localView = getChildAt(paramInt);
          break;
          removeViewInLayout(localView);
        }
      }
    }
  }
  
  private boolean t()
  {
    int i1 = getChildCount();
    int i2 = getChildAt(i1 - 1).getBottom();
    int i3 = au;
    int i4 = getScrollY();
    int i5 = getHeight();
    int i6 = jdField_c_of_type_AndroidGraphicsRect.bottom;
    return (i1 + i3 - 1 < aG - 1) || (i2 < i4 + i5 - i6);
  }
  
  public void H()
  {
    I();
  }
  
  public void I()
  {
    if ((getScrollY() != 0) && (!v)) {
      v();
    }
    m = 0;
  }
  
  public void J()
  {
    if (mScrollY < 0)
    {
      w();
      if (!i)
      {
        setSelectionFromTop(au, jdField_c_of_type_AndroidGraphicsRect.top - mScrollY);
        onScrollChanged(0, 0, 0, mScrollY);
        mScrollY = 0;
      }
    }
    else
    {
      m = 0;
      return;
    }
    U = 100;
    View localView = getChildAt(0);
    if (localView == null) {}
    for (int i1 = 0;; i1 = az - localView.getBottom() - jdField_c_of_type_AndroidGraphicsRect.bottom)
    {
      setSelectionFromBottom(au, i1 + mScrollY);
      break;
    }
  }
  
  public void K()
  {
    int i2 = getChildCount();
    int i1 = 0;
    while (i1 < i2)
    {
      View localView = getChildAt(i1);
      if (localView.getAnimation() != null) {
        localView.clearAnimation();
      }
      i1 += 1;
    }
  }
  
  public void L()
  {
    scrollTo(0, -d() - 1);
    if ((jdField_a_of_type_ComTencentWidgetOverScrollViewListener != null) && (jdField_a_of_type_Ucb != null))
    {
      if (!jdField_a_of_type_ComTencentWidgetOverScrollViewListener.a(0, jdField_a_of_type_Ucb.getChildAt(0), this)) {
        I();
      }
    }
    else {
      return;
    }
    m = 3;
  }
  
  public void M()
  {
    scrollTo(0, v() + 1);
    if ((jdField_a_of_type_ComTencentWidgetOverScrollViewListener != null) && (jdField_b_of_type_Ucb != null))
    {
      if (!jdField_a_of_type_ComTencentWidgetOverScrollViewListener.a(1, jdField_b_of_type_Ucb.getChildAt(0), this)) {
        I();
      }
    }
    else {
      return;
    }
    m = 3;
  }
  
  final int a(int paramInt1, int paramInt2, int paramInt3, int paramInt4, int paramInt5)
  {
    int i3 = 0;
    Object localObject = jdField_a_of_type_AndroidWidgetListAdapter;
    if (localObject == null)
    {
      paramInt1 = jdField_c_of_type_AndroidGraphicsRect.top + jdField_c_of_type_AndroidGraphicsRect.bottom;
      return paramInt1;
    }
    int i4 = jdField_c_of_type_AndroidGraphicsRect.top + jdField_c_of_type_AndroidGraphicsRect.bottom;
    int i1;
    label69:
    boolean bool;
    label111:
    View localView;
    if ((aL > 0) && (jdField_d_of_type_AndroidGraphicsDrawableDrawable != null))
    {
      i1 = aL;
      int i2 = paramInt3;
      if (paramInt3 == -1) {
        i2 = ((ListAdapter)localObject).getCount() - 1;
      }
      localObject = jdField_a_of_type_Uab;
      bool = q();
      boolean[] arrayOfBoolean = jdField_a_of_type_ArrayOfBoolean;
      paramInt3 = paramInt2;
      paramInt2 = i4;
      if (paramInt3 > i2) {
        break label265;
      }
      localView = a(paramInt3, arrayOfBoolean);
      a(localView, paramInt3, paramInt1);
      if (paramInt3 <= 0) {
        break label267;
      }
      paramInt2 += i1;
    }
    label265:
    label267:
    for (;;)
    {
      if ((bool) && (((uab)localObject).a(getLayoutParamsjdField_a_of_type_Int))) {
        ((uab)localObject).a(localView, -1);
      }
      paramInt2 = localView.getMeasuredHeight() + paramInt2;
      if (paramInt2 >= paramInt4)
      {
        paramInt1 = paramInt4;
        if (paramInt5 < 0) {
          break;
        }
        paramInt1 = paramInt4;
        if (paramInt3 <= paramInt5) {
          break;
        }
        paramInt1 = paramInt4;
        if (i3 <= 0) {
          break;
        }
        paramInt1 = paramInt4;
        if (paramInt2 == paramInt4) {
          break;
        }
        return i3;
        i1 = 0;
        break label69;
      }
      i4 = i3;
      if (paramInt5 >= 0)
      {
        i4 = i3;
        if (paramInt3 >= paramInt5) {
          i4 = paramInt2;
        }
      }
      paramInt3 += 1;
      i3 = i4;
      break label111;
      return paramInt2;
    }
  }
  
  int a(int paramInt, boolean paramBoolean)
  {
    ListAdapter localListAdapter = jdField_a_of_type_AndroidWidgetListAdapter;
    int i1;
    if ((localListAdapter == null) || (isInTouchMode())) {
      i1 = -1;
    }
    int i2;
    label125:
    do
    {
      do
      {
        return i1;
        i2 = localListAdapter.getCount();
        if (jdField_e_of_type_Boolean) {
          break label125;
        }
        if (paramBoolean)
        {
          i1 = Math.max(0, paramInt);
          for (;;)
          {
            paramInt = i1;
            if (i1 >= i2) {
              break;
            }
            paramInt = i1;
            if (localListAdapter.isEnabled(i1)) {
              break;
            }
            i1 += 1;
          }
        }
        i1 = Math.min(paramInt, i2 - 1);
        for (;;)
        {
          paramInt = i1;
          if (i1 < 0) {
            break;
          }
          paramInt = i1;
          if (localListAdapter.isEnabled(i1)) {
            break;
          }
          i1 -= 1;
        }
        if (paramInt < 0) {
          break;
        }
        i1 = paramInt;
      } while (paramInt < i2);
      return -1;
      if (paramInt < 0) {
        break;
      }
      i1 = paramInt;
    } while (paramInt < i2);
    return -1;
  }
  
  public ListAdapter a()
  {
    return jdField_a_of_type_AndroidWidgetListAdapter;
  }
  
  protected tzr a()
  {
    return new uca(this);
  }
  
  void a(Canvas paramCanvas, Rect paramRect, int paramInt)
  {
    Drawable localDrawable = jdField_d_of_type_AndroidGraphicsDrawableDrawable;
    localDrawable.setBounds(paramRect);
    localDrawable.draw(paramCanvas);
  }
  
  void a(Canvas paramCanvas, View paramView, Drawable paramDrawable, Rect paramRect)
  {
    paramCanvas.save();
    if (paramDrawable != null)
    {
      int i1 = paramDrawable.getMinimumHeight();
      paramCanvas.clipRect(paramRect);
      if (bottom - top < i1) {
        bottom = (i1 + top);
      }
      paramDrawable.setBounds(paramRect);
      paramDrawable.draw(paramCanvas);
    }
    if (paramView != null)
    {
      e(paramView);
      paramView.offsetTopAndBottom(top - paramView.getTop());
      drawChild(paramCanvas, paramView, getDrawingTime());
    }
    paramCanvas.restore();
  }
  
  void a(Canvas paramCanvas, View paramView, Drawable paramDrawable1, Drawable paramDrawable2, Rect paramRect)
  {
    int i1 = paramCanvas.save();
    int i2;
    if (paramDrawable1 != null)
    {
      i2 = paramDrawable1.getIntrinsicHeight();
      if (i2 >= paramRect.height()) {
        break label162;
      }
      Rect localRect = new Rect(paramRect);
      top = (top + paramRect.height() - i2);
      paramDrawable1.setBounds(localRect);
    }
    for (;;)
    {
      paramDrawable1.draw(paramCanvas);
      if (paramDrawable2 != null)
      {
        i2 = paramDrawable2.getMinimumHeight();
        if (bottom - top < i2) {
          top = (bottom - i2);
        }
        paramDrawable2.setBounds(paramRect);
        paramDrawable2.draw(paramCanvas);
      }
      if (paramView != null)
      {
        e(paramView);
        paramView.offsetTopAndBottom(bottom - paramView.getBottom());
        drawChild(paramCanvas, paramView, getDrawingTime());
      }
      paramCanvas.restoreToCount(i1);
      return;
      label162:
      paramDrawable1.setBounds(paramRect);
    }
  }
  
  public void a(View paramView)
  {
    a(paramView, null, true);
  }
  
  public void a(View paramView, Object paramObject, boolean paramBoolean)
  {
    if ((jdField_a_of_type_AndroidWidgetListAdapter != null) && (!(jdField_a_of_type_AndroidWidgetListAdapter instanceof HeaderViewListAdapter))) {
      throw new IllegalStateException("Cannot add header view to list -- setAdapter has already been called.");
    }
    ListView.FixedViewInfo localFixedViewInfo = new ListView.FixedViewInfo(this);
    jdField_a_of_type_AndroidViewView = paramView;
    jdField_a_of_type_JavaLangObject = paramObject;
    jdField_a_of_type_Boolean = paramBoolean;
    jdField_a_of_type_JavaUtilArrayList.add(localFixedViewInfo);
    if ((jdField_a_of_type_AndroidWidgetListAdapter != null) && (jdField_a_of_type_Tzr != null)) {
      jdField_a_of_type_Tzr.onChanged();
    }
  }
  
  public boolean a(View paramView)
  {
    if (jdField_a_of_type_JavaUtilArrayList.size() > 0)
    {
      if ((jdField_a_of_type_AndroidWidgetListAdapter == null) || (!((HeaderViewListAdapter)jdField_a_of_type_AndroidWidgetListAdapter).a(paramView))) {
        break label60;
      }
      if (jdField_a_of_type_Tzr != null) {
        jdField_a_of_type_Tzr.onChanged();
      }
    }
    label60:
    for (boolean bool = true;; bool = false)
    {
      a(paramView, jdField_a_of_type_JavaUtilArrayList);
      return bool;
      return false;
    }
  }
  
  public Drawable b()
  {
    return jdField_d_of_type_AndroidGraphicsDrawableDrawable;
  }
  
  public void b()
  {
    boolean bool1 = s;
    if (!bool1)
    {
      s = true;
      b("ListView.layoutChildren");
    }
    int i2;
    int i4;
    int i6;
    int i5;
    int i1;
    View localView1;
    View localView3;
    Object localObject5;
    int i3;
    View localView2;
    label230:
    boolean bool2;
    try
    {
      super.b();
      invalidate();
      if (jdField_a_of_type_AndroidWidgetListAdapter == null)
      {
        j();
        h();
        return;
      }
      i2 = jdField_c_of_type_AndroidGraphicsRect.top;
      i4 = mBottom - mTop - jdField_c_of_type_AndroidGraphicsRect.bottom;
      i6 = getChildCount();
      i5 = au + i6 - 1;
      i1 = 0;
      localView1 = null;
      localView3 = null;
      localObject5 = null;
      switch (U)
      {
      case 2: 
        i3 = aF - au;
        Object localObject1 = localView1;
        if (i3 >= 0)
        {
          localObject1 = localView1;
          if (i3 < i6) {
            localObject1 = getChildAt(i3);
          }
        }
        localView2 = getChildAt(0);
        localView1 = getChildAt(i6 - 1);
        if (aE >= 0) {
          i1 = aE - aF;
        }
        localView3 = getChildAt(i3 + i1);
        for (;;)
        {
          bool2 = r;
          if (bool2) {
            q();
          }
          if (aG != 0) {
            break;
          }
          j();
          h();
          return;
          i1 = aE - au;
          if ((i1 < 0) || (i1 >= i6)) {
            break label1509;
          }
          localView3 = getChildAt(i1);
          localView1 = null;
          localView2 = null;
          localObject1 = null;
          i1 = 0;
        }
        if (aG != jdField_a_of_type_AndroidWidgetListAdapter.getCount())
        {
          localObject1 = jdField_a_of_type_AndroidWidgetListAdapter.getClass();
          if ((jdField_a_of_type_AndroidWidgetListAdapter instanceof HeaderViewListAdapter)) {
            localObject1 = ((HeaderViewListAdapter)jdField_a_of_type_AndroidWidgetListAdapter).getWrappedAdapter().getClass();
          }
          throw new IllegalStateException("The content of the adapter has changed but ListView did not receive a notification. Make sure the content of your adapter is not modified from a background thread, but only from the UI thread. [in ListView(" + getId() + ", " + getClass() + ") with Adapter(" + localObject1 + ")]" + "mItemCount=" + aG + "mAdapter.getCount()=" + jdField_a_of_type_AndroidWidgetListAdapter.getCount());
        }
        break;
      }
    }
    finally
    {
      if (!bool1) {
        s = false;
      }
      B();
    }
    h(aE);
    int i7 = au;
    uab localUab = jdField_a_of_type_Uab;
    Object localObject4 = null;
    if (bool2)
    {
      i3 = 0;
      while (i3 < i6)
      {
        localUab.a(getChildAt(i3), i7 + i3);
        i3 += 1;
      }
    }
    localUab.a(i6, i7);
    Object localObject6 = getFocusedChild();
    label585:
    label602:
    label676:
    Object localObject3;
    if (localObject6 != null)
    {
      if ((!bool2) || (c((View)localObject6)))
      {
        localObject5 = findFocus();
        if (localObject5 == null) {
          break label1540;
        }
        ((View)localObject5).onStartTemporaryDetach();
        break label1540;
      }
      requestFocus();
      localObject6 = localObject4;
      localObject4 = localObject5;
      localObject5 = localObject6;
      detachAllViewsFromParent();
      switch (U)
      {
      case 2: 
        if (i6 == 0) {
          if (!i)
          {
            h(a(0, true));
            localObject3 = a(i2);
            label705:
            c();
            localUab.c();
            if (localObject3 == null) {
              break label1400;
            }
            if ((!t) || (!hasFocus()) || (((View)localObject3).hasFocus())) {
              break label1390;
            }
            if ((localObject3 == localObject5) && (localObject4.requestFocus())) {
              break label1550;
            }
            if (!((View)localObject3).requestFocus()) {
              break label1562;
            }
          }
        }
        break;
      }
    }
    for (;;)
    {
      label767:
      if (i1 == 0)
      {
        localView1 = getFocusedChild();
        if (localView1 != null) {
          localView1.clearFocus();
        }
        a(-1, (View)localObject3);
        label794:
        aj = ((View)localObject3).getTop();
        label803:
        if ((localObject4 != null) && (localObject4.getWindowToken() != null)) {
          localObject4.onFinishTemporaryDetach();
        }
        U = 0;
        r = false;
        p = false;
        i(aF);
        k();
        if (aG > 0) {
          y();
        }
        h();
        i2 = au + getChildCount() - 1;
        if ((jdField_a_of_type_AndroidViewAnimationAnimation == null) || (jdField_a_of_type_ArrayOfInt == null) || (!bool2) || (aG <= 0) || (i2 < aG - 1) || (getChildAt(getChildCount() - 1).getBottom() >= i4)) {
          break label1481;
        }
        localObject3 = jdField_a_of_type_ArrayOfInt;
        i3 = localObject3.length;
        i1 = 0;
      }
      for (;;)
      {
        if (i1 < i3)
        {
          i4 = localObject3[i1];
          if ((i4 < au) || (i4 > i2)) {
            break label1555;
          }
          getChildAt(i4 - au).startAnimation(jdField_a_of_type_AndroidViewAnimationAnimation);
          break label1555;
          if (localView3 != null)
          {
            localObject3 = a(localView3.getTop(), i2, i4);
            break label705;
          }
          localObject3 = c(i2, i4);
          break label705;
          if (!i)
          {
            localObject3 = e(ax, av);
            break label705;
          }
          localObject3 = d(ax, az - aw);
          break label705;
          localObject3 = b(aG - 1, i4);
          d();
          break label705;
          au = 0;
          localObject3 = a(i2);
          d();
          break label705;
          localObject3 = e(o(), av);
          break label705;
          localObject3 = d(o(), az - aw);
          break label705;
          localObject3 = a((View)localObject3, localView3, i1, i2, i4);
          break label705;
          h(a(aG - 1, false));
          localObject3 = b(aG - 1, i4);
          break label705;
          if ((aF >= 0) && (aF < aG))
          {
            i1 = aF;
            if (localObject3 == null) {}
            for (;;)
            {
              localObject3 = e(i1, i2);
              break;
              i2 = ((View)localObject3).getTop();
            }
          }
          if (((mScrollY == 0) && (!i)) || (mScrollY < 0))
          {
            if (au < aG)
            {
              i1 = au;
              if (localView2 == null) {}
              for (;;)
              {
                localObject3 = e(i1, i2);
                break;
                i2 = localView2.getTop();
              }
            }
            localObject3 = e(0, i2);
            break label705;
          }
          if (i5 < aG)
          {
            if (localView1 == null) {}
            for (i1 = i4;; i1 = localView1.getBottom())
            {
              localObject3 = d(i5, i1);
              break;
            }
          }
          localObject3 = d(aG - 1, az);
          break label705;
          ((View)localObject3).setSelected(false);
          jdField_b_of_type_AndroidGraphicsRect.setEmpty();
          break label794;
          label1390:
          a(-1, (View)localObject3);
          break label794;
          label1400:
          if ((ag > 0) && (ag < 3))
          {
            localObject3 = getChildAt(ab - au);
            if (localObject3 != null) {
              a(ab, (View)localObject3);
            }
          }
          for (;;)
          {
            if ((!hasFocus()) || (localObject4 == null)) {
              break label1479;
            }
            localObject4.requestFocus();
            break;
            aj = 0;
            jdField_b_of_type_AndroidGraphicsRect.setEmpty();
          }
          label1479:
          break label803;
        }
        label1481:
        jdField_a_of_type_ArrayOfInt = null;
        if (!bool1) {
          s = false;
        }
        B();
        return;
        localObject4 = null;
        localObject5 = null;
        break label602;
        label1509:
        localView1 = null;
        localView2 = null;
        localObject3 = null;
        i1 = 0;
        break label230;
        break;
        localView1 = null;
        localView2 = null;
        localObject3 = null;
        i1 = 0;
        break label230;
        label1540:
        localObject4 = localObject6;
        break label585;
        break label676;
        label1550:
        i1 = 1;
        break label767;
        label1555:
        i1 += 1;
      }
      label1562:
      i1 = 0;
    }
  }
  
  public void b(View paramView)
  {
    b(paramView, null, true);
  }
  
  public void b(View paramView, Object paramObject, boolean paramBoolean)
  {
    ListView.FixedViewInfo localFixedViewInfo = new ListView.FixedViewInfo(this);
    jdField_a_of_type_AndroidViewView = paramView;
    jdField_a_of_type_JavaLangObject = paramObject;
    jdField_a_of_type_Boolean = paramBoolean;
    jdField_b_of_type_JavaUtilArrayList.add(localFixedViewInfo);
    if ((jdField_a_of_type_AndroidWidgetListAdapter != null) && (jdField_a_of_type_Tzr != null)) {
      jdField_a_of_type_Tzr.onChanged();
    }
  }
  
  public boolean b(View paramView)
  {
    if (jdField_b_of_type_JavaUtilArrayList.size() > 0)
    {
      if ((jdField_a_of_type_AndroidWidgetListAdapter == null) || (!((HeaderViewListAdapter)jdField_a_of_type_AndroidWidgetListAdapter).b(paramView))) {
        break label60;
      }
      if (jdField_a_of_type_Tzr != null) {
        jdField_a_of_type_Tzr.onChanged();
      }
    }
    label60:
    for (boolean bool = true;; bool = false)
    {
      a(paramView, jdField_b_of_type_JavaUtilArrayList);
      return bool;
      return false;
    }
  }
  
  @Deprecated
  public long[] b()
  {
    if ((jdField_a_of_type_AndroidWidgetListAdapter != null) && (jdField_a_of_type_AndroidWidgetListAdapter.hasStableIds())) {
      return a();
    }
    Object localObject;
    int i4;
    long[] arrayOfLong;
    int i2;
    int i1;
    if ((S != 0) && (jdField_a_of_type_AndroidUtilSparseBooleanArray != null) && (jdField_a_of_type_AndroidWidgetListAdapter != null))
    {
      localObject = jdField_a_of_type_AndroidUtilSparseBooleanArray;
      i4 = ((SparseBooleanArray)localObject).size();
      arrayOfLong = new long[i4];
      ListAdapter localListAdapter = jdField_a_of_type_AndroidWidgetListAdapter;
      i2 = 0;
      i1 = 0;
      if (i2 < i4)
      {
        if (!((SparseBooleanArray)localObject).valueAt(i2)) {
          break label150;
        }
        int i3 = i1 + 1;
        arrayOfLong[i1] = localListAdapter.getItemId(((SparseBooleanArray)localObject).keyAt(i2));
        i1 = i3;
      }
    }
    label150:
    for (;;)
    {
      i2 += 1;
      break;
      if (i1 == i4) {
        return arrayOfLong;
      }
      localObject = new long[i1];
      System.arraycopy(arrayOfLong, 0, localObject, 0, i1);
      return localObject;
      return new long[0];
    }
  }
  
  int c(int paramInt)
  {
    int i2 = getChildCount();
    if (i2 > 0)
    {
      if (!i)
      {
        i1 = 0;
        while (i1 < i2)
        {
          if (paramInt <= getChildAt(i1).getBottom()) {
            return i1 + au;
          }
          i1 += 1;
        }
      }
      int i1 = i2 - 1;
      while (i1 >= 0)
      {
        if (paramInt >= getChildAt(i1).getTop()) {
          return i1 + au;
        }
        i1 -= 1;
      }
    }
    return -1;
  }
  
  public Drawable c()
  {
    return jdField_e_of_type_AndroidGraphicsDrawableDrawable;
  }
  
  public View c()
  {
    return jdField_a_of_type_Ucb;
  }
  
  public void c(boolean paramBoolean)
  {
    int i2 = getChildCount();
    if (paramBoolean) {
      if ((mGroupFlags & 0x22) != 34) {
        break label138;
      }
    }
    label138:
    for (int i1 = h();; i1 = 0)
    {
      if (i2 > 0) {
        i1 = getChildAt(i2 - 1).getBottom() + aL;
      }
      a(au + i2, i1);
      a(getChildCount());
      return;
      if ((mGroupFlags & 0x22) == 34) {}
      for (i1 = i();; i1 = 0)
      {
        if (i2 > 0) {}
        for (i1 = getChildAt(0).getTop() - aL;; i1 = getHeight() - i1)
        {
          b(au - 1, i1);
          c(getChildCount());
          return;
        }
      }
    }
  }
  
  public boolean c()
  {
    return (mScrollY < 0) && (jdField_a_of_type_Ucb != null);
  }
  
  protected boolean canAnimate()
  {
    return (super.canAnimate()) && (aG > 0);
  }
  
  public int d()
  {
    if ((aM == 0) && (jdField_a_of_type_Ucb != null)) {
      return jdField_a_of_type_Ucb.getHeight();
    }
    return aM;
  }
  
  public long d()
  {
    if (jdField_g_of_type_Long > 0L) {
      return jdField_g_of_type_Long;
    }
    return 350L;
  }
  
  public Drawable d()
  {
    return jdField_f_of_type_AndroidGraphicsDrawableDrawable;
  }
  
  public View d()
  {
    return jdField_b_of_type_Ucb;
  }
  
  public void dispatchDraw(Canvas paramCanvas)
  {
    if (jdField_g_of_type_Boolean) {
      h = true;
    }
    int i6 = aL;
    Drawable localDrawable1 = jdField_e_of_type_AndroidGraphicsDrawableDrawable;
    ucb localUcb1 = jdField_a_of_type_Ucb;
    ucb localUcb2 = jdField_b_of_type_Ucb;
    Drawable localDrawable2 = jdField_f_of_type_AndroidGraphicsDrawableDrawable;
    Drawable localDrawable3 = jdField_g_of_type_AndroidGraphicsDrawableDrawable;
    int i4;
    int i3;
    label79:
    int i5;
    label94:
    Rect localRect;
    int i7;
    int i2;
    int i8;
    Object localObject;
    label238:
    label244:
    int i9;
    boolean bool1;
    label416:
    Paint localPaint;
    int i15;
    if ((localDrawable1 != null) || (localUcb1 != null) || (localDrawable3 != null))
    {
      i4 = 1;
      if ((localDrawable2 == null) && (localUcb2 == null)) {
        break label747;
      }
      i3 = 1;
      if ((i6 <= 0) || (jdField_d_of_type_AndroidGraphicsDrawableDrawable == null)) {
        break label753;
      }
      i5 = 1;
      if (jdField_a_of_type_AndroidGraphicsDrawableDrawable != null)
      {
        localRect = jdField_a_of_type_AndroidGraphicsRect;
        top = 0;
        bottom = getHeight();
        left = 0;
        right = getWidth();
        i7 = paramCanvas.save();
        if (mScrollY > 0)
        {
          top += mScrollY;
          bottom += mScrollY;
        }
        if (u)
        {
          i2 = 0;
          i8 = getChildCount();
          i1 = i2;
          if (i8 > 0)
          {
            localObject = getChildAt(i8 - 1);
            i1 = i2;
            if (localObject != null)
            {
              if (t() != c_() - 1) {
                break label759;
              }
              i1 = ((View)localObject).getTop();
            }
          }
          if (i1 >= 0) {
            break label768;
          }
          i2 = 0;
          paramCanvas.clipRect(0, i2, right, bottom);
        }
        jdField_a_of_type_AndroidGraphicsDrawableDrawable.setBounds(localRect);
        jdField_a_of_type_AndroidGraphicsDrawableDrawable.draw(paramCanvas);
        paramCanvas.restoreToCount(i7);
      }
      if ((i5 == 0) && (i4 == 0) && (i3 == 0)) {
        break label903;
      }
      localRect = jdField_a_of_type_AndroidGraphicsRect;
      left = mPaddingLeft;
      right = (mRight - mLeft - mPaddingRight);
      i7 = getChildCount();
      int i10 = jdField_a_of_type_JavaUtilArrayList.size();
      i8 = aG;
      int i11 = jdField_b_of_type_JavaUtilArrayList.size();
      boolean bool2 = jdField_c_of_type_Boolean;
      boolean bool3 = jdField_d_of_type_Boolean;
      i9 = au;
      boolean bool4 = jdField_e_of_type_Boolean;
      localObject = jdField_a_of_type_AndroidWidgetListAdapter;
      if (!VersionUtils.a()) {
        break label794;
      }
      if ((!isOpaque()) || (super.isOpaque())) {
        break label788;
      }
      bool1 = true;
      if ((bool1) && (jdField_a_of_type_AndroidGraphicsPaint == null) && (jdField_a_of_type_Boolean))
      {
        jdField_a_of_type_AndroidGraphicsPaint = new Paint();
        jdField_a_of_type_AndroidGraphicsPaint.setColor(q());
      }
      localPaint = jdField_a_of_type_AndroidGraphicsPaint;
      i1 = 0;
      if ((mGroupFlags & 0x22) == 34) {
        i1 = jdField_c_of_type_AndroidGraphicsRect.bottom;
      }
      int i12 = mBottom;
      int i13 = mTop;
      int i14 = getScrollY();
      i15 = getScrollY();
      if ((i7 > 0) && (i15 < 0))
      {
        if (i4 != 0)
        {
          bottom = (0 - aL);
          top = i15;
          a(paramCanvas, localUcb1, localDrawable3, localDrawable1, localRect);
        }
        if (i5 != 0)
        {
          bottom = 0;
          top = (-i6);
          a(paramCanvas, localRect, -1);
        }
      }
      if (i5 == 0) {
        break label836;
      }
      i2 = 0;
      label589:
      if (i2 >= i7) {
        break label836;
      }
      if (((bool2) || (i9 + i2 >= i10)) && ((bool3) || (i9 + i2 < i8 - i11 - 1)))
      {
        i4 = getChildAt(i2).getBottom();
        if ((i4 < i14 + (i12 - i13 - i1)) && ((i3 == 0) || (i2 != i7 - 1)))
        {
          if ((!bool4) && ((!((ListAdapter)localObject).isEnabled(i9 + i2)) || ((i2 != i7 - 1) && (!((ListAdapter)localObject).isEnabled(i9 + i2 + 1))))) {
            break label803;
          }
          top = i4;
          bottom = (i4 + i6);
          a(paramCanvas, localRect, i2);
        }
      }
    }
    for (;;)
    {
      i2 += 1;
      break label589;
      i4 = 0;
      break;
      label747:
      i3 = 0;
      break label79;
      label753:
      i5 = 0;
      break label94;
      label759:
      i1 = ((View)localObject).getBottom();
      break label238;
      label768:
      i2 = i1;
      if (i1 <= bottom) {
        break label244;
      }
      i2 = bottom;
      break label244;
      label788:
      bool1 = false;
      break label416;
      label794:
      bool1 = isOpaque();
      break label416;
      label803:
      if (bool1)
      {
        top = i4;
        bottom = (i4 + i6);
        paramCanvas.drawRect(localRect, localPaint);
      }
    }
    label836:
    int i1 = mBottom + i15 + aL;
    if ((i3 != 0) && (i9 + i7 == i8) && (i1 > mBottom))
    {
      top = (mBottom + aL);
      bottom = i1;
      a(paramCanvas, localUcb2, localDrawable2, localRect);
    }
    label903:
    super.dispatchDraw(paramCanvas);
  }
  
  public boolean dispatchKeyEvent(KeyEvent paramKeyEvent)
  {
    boolean bool2 = super.dispatchKeyEvent(paramKeyEvent);
    boolean bool1 = bool2;
    if (!bool2)
    {
      bool1 = bool2;
      if (getFocusedChild() != null)
      {
        bool1 = bool2;
        if (paramKeyEvent.getAction() == 0) {
          bool1 = onKeyDown(paramKeyEvent.getKeyCode(), paramKeyEvent);
        }
      }
    }
    return bool1;
  }
  
  public boolean drawChild(Canvas paramCanvas, View paramView, long paramLong)
  {
    boolean bool = super.drawChild(paramCanvas, paramView, paramLong);
    if (h) {
      h = false;
    }
    return bool;
  }
  
  public void e(int paramInt)
  {
    super.e(paramInt);
  }
  
  public void f(int paramInt)
  {
    super.f(paramInt);
  }
  
  boolean f(int paramInt)
  {
    boolean bool;
    if (paramInt == 33)
    {
      paramInt = Math.max(0, aF - getChildCount() - 1);
      bool = false;
    }
    for (;;)
    {
      if (paramInt >= 0)
      {
        paramInt = a(paramInt, bool);
        if (paramInt >= 0)
        {
          U = 4;
          av = (mPaddingTop + getVerticalFadingEdgeLength());
          if ((bool) && (paramInt > aG - getChildCount())) {
            U = 3;
          }
          if ((!bool) && (paramInt < getChildCount())) {
            U = 1;
          }
          g(paramInt);
          h();
          if (!awakenScrollBars()) {
            invalidate();
          }
          return true;
          if (paramInt != 130) {
            break label153;
          }
          paramInt = Math.min(aG - 1, aF + getChildCount() - 1);
          bool = true;
          continue;
        }
      }
      return false;
      label153:
      paramInt = -1;
      bool = false;
    }
  }
  
  void g(int paramInt)
  {
    int i1 = 1;
    i(paramInt);
    int i2 = aF;
    if (i2 >= 0) {
      if (paramInt != i2 - 1) {}
    }
    for (;;)
    {
      b();
      if (i1 != 0) {
        awakenScrollBars();
      }
      return;
      if (paramInt != i2 + 1) {
        i1 = 0;
      }
    }
  }
  
  boolean g(int paramInt)
  {
    boolean bool2 = true;
    boolean bool1;
    if (paramInt == 33)
    {
      if (aF == 0) {
        break label123;
      }
      paramInt = a(0, true);
      bool1 = bool2;
      if (paramInt >= 0)
      {
        U = 1;
        g(paramInt);
        h();
        bool1 = bool2;
      }
    }
    for (;;)
    {
      if ((bool1) && (!awakenScrollBars()))
      {
        awakenScrollBars();
        invalidate();
      }
      return bool1;
      if ((paramInt == 130) && (aF < aG - 1))
      {
        paramInt = a(aG - 1, true);
        bool1 = bool2;
        if (paramInt >= 0)
        {
          U = 3;
          g(paramInt);
          h();
          bool1 = bool2;
        }
      }
      else
      {
        label123:
        bool1 = false;
      }
    }
  }
  
  boolean h(int paramInt)
  {
    try
    {
      q = true;
      boolean bool = b(paramInt);
      if (bool) {
        playSoundEffect(SoundEffectConstants.getContantForFocusDirection(paramInt));
      }
      return bool;
    }
    finally
    {
      q = false;
    }
  }
  
  public ViewParent invalidateChildInParent(int[] paramArrayOfInt, Rect paramRect)
  {
    paramArrayOfInt = super.invalidateChildInParent(paramArrayOfInt, paramRect);
    int i1;
    if ((bottom > 0) && (top < getHeight()))
    {
      i1 = getScrollY();
      if ((i1 >= 0) || (top + i1 >= 0)) {
        break label50;
      }
      a(paramRect);
    }
    label50:
    while ((i1 <= 0) || (bottom <= getHeight() - i1)) {
      return paramArrayOfInt;
    }
    a(paramRect);
    return paramArrayOfInt;
  }
  
  public boolean isOpaque()
  {
    return false;
  }
  
  void j()
  {
    a(jdField_a_of_type_JavaUtilArrayList);
    a(jdField_b_of_type_JavaUtilArrayList);
    super.j();
    U = 0;
  }
  
  protected int l()
  {
    int i2 = 0;
    int i3 = getScrollY();
    boolean bool;
    if ((jdField_a_of_type_Ucb != null) && (i3 < 0)) {
      if (i3 <= -d())
      {
        if (m != 2) {
          break label291;
        }
        if (jdField_a_of_type_ComTencentWidgetOverScrollViewListener == null) {
          break label285;
        }
        bool = jdField_a_of_type_ComTencentWidgetOverScrollViewListener.a(0, jdField_a_of_type_Ucb.getChildAt(0), this);
        m = 3;
      }
    }
    for (;;)
    {
      int i1;
      if (bool)
      {
        i1 = i2;
        if (jdField_a_of_type_Ucb != null) {
          i1 = -d();
        }
      }
      do
      {
        do
        {
          do
          {
            return i1;
            m = 0;
            return 0;
            i1 = i2;
          } while (m >= 2);
          if (jdField_a_of_type_ComTencentWidgetOverScrollViewListener != null) {
            jdField_a_of_type_ComTencentWidgetOverScrollViewListener.c(0, jdField_a_of_type_Ucb.getChildAt(0), this);
          }
          m = 0;
          return 0;
          i1 = i2;
        } while (jdField_b_of_type_Ucb == null);
        i1 = i2;
      } while (i3 <= 0);
      if (i3 >= v())
      {
        if (m != 2) {
          break label279;
        }
        if (jdField_a_of_type_ComTencentWidgetOverScrollViewListener == null) {
          break label273;
        }
        bool = jdField_a_of_type_ComTencentWidgetOverScrollViewListener.a(1, jdField_b_of_type_Ucb.getChildAt(0), this);
        label199:
        m = 3;
      }
      for (;;)
      {
        if (bool)
        {
          i1 = i2;
          if (jdField_b_of_type_Ucb == null) {
            break;
          }
          return v();
        }
        m = 0;
        return 0;
        i1 = i2;
        if (m >= 2) {
          break;
        }
        if (jdField_a_of_type_ComTencentWidgetOverScrollViewListener != null) {
          jdField_a_of_type_ComTencentWidgetOverScrollViewListener.c(1, jdField_b_of_type_Ucb.getChildAt(0), this);
        }
        m = 0;
        return 0;
        label273:
        bool = false;
        break label199;
        label279:
        bool = false;
      }
      label285:
      bool = false;
      break;
      label291:
      bool = false;
    }
  }
  
  public int m()
  {
    return jdField_a_of_type_JavaUtilArrayList.size();
  }
  
  public int n()
  {
    return jdField_b_of_type_JavaUtilArrayList.size();
  }
  
  public void onFinishInflate()
  {
    super.onFinishInflate();
    int i2 = getChildCount();
    if (i2 > 0)
    {
      int i1 = 0;
      while (i1 < i2)
      {
        a(getChildAt(i1));
        i1 += 1;
      }
      removeAllViews();
    }
  }
  
  protected void onFocusChanged(boolean paramBoolean, int paramInt, Rect paramRect)
  {
    int i3 = 0;
    int i2 = 0;
    super.onFocusChanged(paramBoolean, paramInt, paramRect);
    ListAdapter localListAdapter = jdField_a_of_type_AndroidWidgetListAdapter;
    int i1 = -1;
    int i5 = i3;
    int i6 = i1;
    Rect localRect;
    int i4;
    if (localListAdapter != null)
    {
      i5 = i3;
      i6 = i1;
      if (paramBoolean)
      {
        i5 = i3;
        i6 = i1;
        if (paramRect != null)
        {
          paramRect.offset(getScrollX(), getScrollY());
          if (localListAdapter.getCount() < getChildCount() + au)
          {
            U = 0;
            b();
          }
          localRect = jdField_a_of_type_AndroidGraphicsRect;
          i4 = Integer.MAX_VALUE;
          int i7 = getChildCount();
          int i8 = au;
          i3 = 0;
          i5 = i2;
          i6 = i1;
          if (i3 < i7) {
            if (!localListAdapter.isEnabled(i8 + i3))
            {
              i5 = i2;
              i2 = i1;
              i1 = i5;
            }
          }
        }
      }
    }
    for (;;)
    {
      i5 = i3 + 1;
      i3 = i2;
      i2 = i1;
      i1 = i3;
      i3 = i5;
      break;
      View localView = getChildAt(i3);
      localView.getDrawingRect(localRect);
      offsetDescendantRectToMyCoords(localView, localRect);
      i5 = a(paramRect, localRect, paramInt);
      if (i5 < i4)
      {
        i1 = localView.getTop();
        i2 = i3;
        i4 = i5;
        continue;
        if (i6 >= 0)
        {
          setSelectionFromTop(au + i6, i5);
          return;
        }
        requestLayout();
      }
      else
      {
        i5 = i1;
        i1 = i2;
        i2 = i5;
      }
    }
  }
  
  public boolean onInterceptTouchEvent(MotionEvent paramMotionEvent)
  {
    boolean bool = super.onInterceptTouchEvent(paramMotionEvent);
    e();
    return bool;
  }
  
  public boolean onKeyDown(int paramInt, KeyEvent paramKeyEvent)
  {
    return b(paramInt, 1, paramKeyEvent);
  }
  
  public boolean onKeyMultiple(int paramInt1, int paramInt2, KeyEvent paramKeyEvent)
  {
    return b(paramInt1, paramInt2, paramKeyEvent);
  }
  
  public boolean onKeyUp(int paramInt, KeyEvent paramKeyEvent)
  {
    return b(paramInt, 1, paramKeyEvent);
  }
  
  public void onLayout(boolean paramBoolean, int paramInt1, int paramInt2, int paramInt3, int paramInt4)
  {
    super.onLayout(paramBoolean, paramInt1, paramInt2, paramInt3, paramInt4);
    if (jdField_a_of_type_Ucb != null)
    {
      jdField_a_of_type_Ucb.layout(jdField_c_of_type_AndroidGraphicsRect.left, jdField_c_of_type_AndroidGraphicsRect.top, jdField_c_of_type_AndroidGraphicsRect.left + jdField_a_of_type_Ucb.getMeasuredWidth(), jdField_a_of_type_Ucb.getMeasuredHeight());
      b_ = jdField_a_of_type_Ucb.getHeight();
    }
    if (jdField_b_of_type_Ucb != null)
    {
      jdField_b_of_type_Ucb.layout(jdField_c_of_type_AndroidGraphicsRect.left, getMeasuredHeight() - jdField_b_of_type_Ucb.getMeasuredHeight() - jdField_c_of_type_AndroidGraphicsRect.bottom, jdField_c_of_type_AndroidGraphicsRect.left + jdField_b_of_type_Ucb.getMeasuredWidth(), getMeasuredHeight() - jdField_c_of_type_AndroidGraphicsRect.bottom);
      ar = jdField_b_of_type_Ucb.getHeight();
    }
  }
  
  public void onMeasure(int paramInt1, int paramInt2)
  {
    super.onMeasure(paramInt1, paramInt2);
    int i6 = View.MeasureSpec.getMode(paramInt1);
    int i5 = View.MeasureSpec.getMode(paramInt2);
    int i4 = View.MeasureSpec.getSize(paramInt1);
    int i3 = View.MeasureSpec.getSize(paramInt2);
    int i1;
    int i2;
    if (jdField_a_of_type_AndroidWidgetListAdapter == null)
    {
      paramInt2 = 0;
      aG = paramInt2;
      if ((aG <= 0) || ((i6 != 0) && (i5 != 0))) {
        break label362;
      }
      View localView = a(0, jdField_a_of_type_ArrayOfBoolean);
      a(localView, 0, paramInt1);
      i1 = localView.getMeasuredWidth();
      i2 = localView.getMeasuredHeight();
      if (!VersionUtils.e()) {
        break label357;
      }
      paramInt2 = combineMeasuredStates(0, localView.getMeasuredState());
      label109:
      if ((q()) && (jdField_a_of_type_Uab.a(getLayoutParamsjdField_a_of_type_Int))) {
        jdField_a_of_type_Uab.a(localView, -1);
      }
    }
    for (;;)
    {
      if (i6 == 0) {
        paramInt2 = i1 + (jdField_c_of_type_AndroidGraphicsRect.left + jdField_c_of_type_AndroidGraphicsRect.right) + getVerticalScrollbarWidth();
      }
      for (;;)
      {
        i1 = i3;
        if (i5 == 0) {
          i1 = jdField_c_of_type_AndroidGraphicsRect.top + jdField_c_of_type_AndroidGraphicsRect.bottom + i2 + getVerticalFadingEdgeLength() * 2;
        }
        i2 = i1;
        if (i5 == Integer.MIN_VALUE) {
          i2 = a(paramInt1, 0, -1, i1, -1);
        }
        setMeasuredDimension(paramInt2, i2);
        aa = paramInt1;
        if ((jdField_a_of_type_Ucb != null) || (jdField_b_of_type_Ucb != null))
        {
          paramInt1 = ViewGroup.getChildMeasureSpec(aa, jdField_c_of_type_AndroidGraphicsRect.left + jdField_c_of_type_AndroidGraphicsRect.right, -1);
          paramInt2 = View.MeasureSpec.makeMeasureSpec(0, 0);
          if (jdField_a_of_type_Ucb != null) {
            jdField_a_of_type_Ucb.measure(paramInt1, paramInt2);
          }
          if (jdField_b_of_type_Ucb != null) {
            jdField_b_of_type_Ucb.measure(paramInt1, paramInt2);
          }
        }
        return;
        paramInt2 = jdField_a_of_type_AndroidWidgetListAdapter.getCount();
        break;
        if (VersionUtils.e()) {
          paramInt2 = 0xFF000000 & paramInt2 | i4;
        } else {
          paramInt2 = i4;
        }
      }
      label357:
      paramInt2 = 0;
      break label109;
      label362:
      paramInt2 = 0;
      i2 = 0;
      i1 = 0;
    }
  }
  
  public void onScrollChanged(int paramInt1, int paramInt2, int paramInt3, int paramInt4)
  {
    if ((paramInt2 < 0) && (paramInt4 == 0) && (jdField_a_of_type_Ucb != null)) {
      f(jdField_a_of_type_Ucb);
    }
    for (;;)
    {
      if (jdField_a_of_type_ComTencentWidgetListView$OnScrollChangeListener != null) {
        jdField_a_of_type_ComTencentWidgetListView$OnScrollChangeListener.b(au, getChildCount(), aG);
      }
      return;
      if ((paramInt2 == 0) && (paramInt4 < 0) && (jdField_a_of_type_Ucb != null)) {
        g(jdField_a_of_type_Ucb);
      } else if ((paramInt2 > 0) && (paramInt4 == 0) && (jdField_b_of_type_Ucb != null)) {
        f(jdField_b_of_type_Ucb);
      } else if ((paramInt2 == 0) && (paramInt4 > 0) && (jdField_b_of_type_Ucb != null)) {
        g(jdField_b_of_type_Ucb);
      }
    }
  }
  
  protected void onSizeChanged(int paramInt1, int paramInt2, int paramInt3, int paramInt4)
  {
    if (getChildCount() > 0)
    {
      View localView = getFocusedChild();
      if (localView != null)
      {
        int i1 = au;
        int i2 = indexOfChild(localView);
        int i3 = Math.max(0, localView.getBottom() - (paramInt2 - mPaddingTop));
        int i4 = localView.getTop();
        if (jdField_a_of_type_Ubz == null) {
          jdField_a_of_type_Ubz = new ubz(this, null);
        }
        post(jdField_a_of_type_Ubz.a(i1 + i2, i4 - i3));
      }
      K();
    }
    super.onSizeChanged(paramInt1, paramInt2, paramInt3, paramInt4);
  }
  
  public void onThemeChanged()
  {
    jdField_a_of_type_Uab.b();
    Iterator localIterator = jdField_a_of_type_JavaUtilArrayList.iterator();
    while (localIterator.hasNext()) {
      SkinEngine.invalidateAll(nextjdField_a_of_type_AndroidViewView);
    }
    localIterator = jdField_b_of_type_JavaUtilArrayList.iterator();
    while (localIterator.hasNext()) {
      SkinEngine.invalidateAll(nextjdField_a_of_type_AndroidViewView);
    }
  }
  
  public boolean onTouchEvent(MotionEvent paramMotionEvent)
  {
    int i1 = paramMotionEvent.getAction() & 0xFF;
    if (i1 == 0) {}
    for (v = true;; v = false) {
      do
      {
        boolean bool = super.onTouchEvent(paramMotionEvent);
        e();
        return bool;
      } while ((i1 != 1) && (i1 != 3));
    }
  }
  
  @ViewDebug.ExportedProperty(category="list")
  protected boolean q()
  {
    return true;
  }
  
  public boolean r()
  {
    return t;
  }
  
  public boolean requestChildRectangleOnScreen(View paramView, Rect paramRect, boolean paramBoolean)
  {
    int i5 = top;
    paramRect.offset(paramView.getLeft(), paramView.getTop());
    paramRect.offset(-paramView.getScrollX(), -paramView.getScrollY());
    int i4 = getHeight();
    int i2 = getScrollY();
    int i3 = i2 + i4;
    int i6 = getVerticalFadingEdgeLength();
    int i1 = i2;
    if (b()) {
      if (aF <= 0)
      {
        i1 = i2;
        if (i5 <= i6) {}
      }
      else
      {
        i1 = i2 + i6;
      }
    }
    i5 = getChildAt(getChildCount() - 1).getBottom();
    i2 = i3;
    if (t()) {
      if (aF >= aG - 1)
      {
        i2 = i3;
        if (bottom >= i5 - i6) {}
      }
      else
      {
        i2 = i3 - i6;
      }
    }
    if ((bottom > i2) && (top > i1)) {
      if (paramRect.height() > i4)
      {
        i1 = top - i1 + 0;
        i1 = Math.min(i1, i5 - i2);
      }
    }
    for (;;)
    {
      if (i1 != 0) {}
      for (paramBoolean = true;; paramBoolean = false)
      {
        if (paramBoolean)
        {
          j(-i1);
          a(-1, paramView);
          aj = paramView.getTop();
          invalidate();
        }
        return paramBoolean;
        i1 = bottom - i2 + 0;
        break;
        if ((top >= i1) || (bottom >= i2)) {
          break label335;
        }
        if (paramRect.height() > i4) {}
        for (i2 = 0 - (i2 - bottom);; i2 = 0 - (i1 - top))
        {
          i1 = Math.max(i2, getChildAt(0).getTop() - i1);
          break;
        }
      }
      label335:
      i1 = 0;
    }
  }
  
  public boolean s()
  {
    return (mScrollY > 0) && (jdField_b_of_type_Ucb != null);
  }
  
  public void setAdapter(ListAdapter paramListAdapter)
  {
    if ((jdField_a_of_type_AndroidWidgetListAdapter != null) && (jdField_a_of_type_Tzr != null)) {
      jdField_a_of_type_AndroidWidgetListAdapter.unregisterDataSetObserver(jdField_a_of_type_Tzr);
    }
    j();
    jdField_a_of_type_Uab.b();
    int i1;
    if ((jdField_a_of_type_JavaUtilArrayList.size() > 0) || (jdField_b_of_type_JavaUtilArrayList.size() > 0))
    {
      jdField_a_of_type_AndroidWidgetListAdapter = new HeaderViewListAdapter(jdField_a_of_type_JavaUtilArrayList, jdField_b_of_type_JavaUtilArrayList, paramListAdapter);
      aJ = -1;
      jdField_f_of_type_Long = Long.MIN_VALUE;
      super.setAdapter(paramListAdapter);
      if (jdField_a_of_type_AndroidWidgetListAdapter == null) {
        break label244;
      }
      jdField_e_of_type_Boolean = jdField_a_of_type_AndroidWidgetListAdapter.areAllItemsEnabled();
      aH = aG;
      aG = jdField_a_of_type_AndroidWidgetListAdapter.getCount();
      x();
      jdField_a_of_type_Tzr = new uca(this);
      jdField_a_of_type_AndroidWidgetListAdapter.registerDataSetObserver(jdField_a_of_type_Tzr);
      jdField_a_of_type_Uab.a(jdField_a_of_type_AndroidWidgetListAdapter.getViewTypeCount());
      if (!i) {
        break label234;
      }
      i1 = a(aG - 1, false);
      label200:
      h(i1);
      i(i1);
      if (aG == 0) {
        y();
      }
    }
    for (;;)
    {
      requestLayout();
      return;
      jdField_a_of_type_AndroidWidgetListAdapter = paramListAdapter;
      break;
      label234:
      i1 = a(0, true);
      break label200;
      label244:
      jdField_e_of_type_Boolean = true;
      x();
      y();
    }
  }
  
  public void setCacheColorHint(int paramInt)
  {
    if (paramInt >>> 24 == 255) {}
    for (boolean bool = true;; bool = false)
    {
      jdField_a_of_type_Boolean = bool;
      if (bool)
      {
        if (jdField_a_of_type_AndroidGraphicsPaint == null) {
          jdField_a_of_type_AndroidGraphicsPaint = new Paint();
        }
        jdField_a_of_type_AndroidGraphicsPaint.setColor(paramInt);
      }
      super.setCacheColorHint(paramInt);
      return;
    }
  }
  
  public void setContentBackground(int paramInt)
  {
    setContentBackground(getContext().getResources().getDrawable(paramInt));
  }
  
  public void setContentBackground(Drawable paramDrawable)
  {
    setContentBackground(paramDrawable, true);
  }
  
  public void setContentBackground(Drawable paramDrawable, boolean paramBoolean)
  {
    setContentBackground(paramDrawable, paramBoolean, false);
  }
  
  public void setContentBackground(Drawable paramDrawable, boolean paramBoolean1, boolean paramBoolean2)
  {
    if (paramDrawable == null)
    {
      jdField_a_of_type_AndroidGraphicsDrawableDrawable = null;
      jdField_g_of_type_AndroidGraphicsDrawableDrawable = null;
    }
    for (;;)
    {
      u = paramBoolean2;
      return;
      jdField_a_of_type_AndroidGraphicsDrawableDrawable = paramDrawable;
      if (paramBoolean1) {
        jdField_g_of_type_AndroidGraphicsDrawableDrawable = getResources().getDrawable(2130838521);
      }
    }
  }
  
  public void setDelAnimationDuration(long paramLong)
  {
    if (paramLong > 0L) {
      jdField_g_of_type_Long = paramLong;
    }
  }
  
  public void setDivider(Drawable paramDrawable)
  {
    boolean bool = false;
    if (paramDrawable != null)
    {
      aL = paramDrawable.getIntrinsicHeight();
      if (aL >= 0) {
        break label69;
      }
    }
    label69:
    for (int i1 = 0;; i1 = aL)
    {
      aL = i1;
      jdField_d_of_type_AndroidGraphicsDrawableDrawable = paramDrawable;
      if ((paramDrawable == null) || (paramDrawable.getOpacity() == -1)) {
        bool = true;
      }
      jdField_b_of_type_Boolean = bool;
      requestLayout();
      invalidate();
      return;
      aL = 0;
      break;
    }
  }
  
  public void setDividerHeight(int paramInt)
  {
    aL = paramInt;
    requestLayout();
    invalidate();
  }
  
  public void setFooterDividersEnabled(boolean paramBoolean)
  {
    jdField_d_of_type_Boolean = paramBoolean;
    invalidate();
  }
  
  public void setHeaderDividersEnabled(boolean paramBoolean)
  {
    jdField_c_of_type_Boolean = paramBoolean;
    invalidate();
  }
  
  public void setInsertAnimation(Animation paramAnimation)
  {
    jdField_a_of_type_AndroidViewAnimationAnimation = paramAnimation;
  }
  
  public void setItemsCanFocus(boolean paramBoolean)
  {
    t = paramBoolean;
    if (!paramBoolean) {
      setDescendantFocusability(393216);
    }
  }
  
  public void setOnScrollChangeListener(ListView.OnScrollChangeListener paramOnScrollChangeListener)
  {
    jdField_a_of_type_ComTencentWidgetListView$OnScrollChangeListener = paramOnScrollChangeListener;
  }
  
  public void setOverScrollFooter(View paramView)
  {
    if (paramView == null) {
      if (jdField_b_of_type_Ucb != null)
      {
        jdField_b_of_type_Ucb.removeAllViewsInLayout();
        ucb.a(jdField_b_of_type_Ucb, null);
        jdField_b_of_type_Ucb = null;
      }
    }
    for (;;)
    {
      m = 0;
      mScrollY = 0;
      return;
      if (jdField_b_of_type_Ucb == null)
      {
        jdField_b_of_type_Ucb = new ucb(getContext());
        ucb.a(jdField_b_of_type_Ucb, this);
      }
      jdField_b_of_type_Ucb.removeAllViewsInLayout();
      jdField_b_of_type_Ucb.addView(paramView);
    }
  }
  
  public void setOverScrollFooterHeight(int paramInt)
  {
    aN = paramInt;
  }
  
  public void setOverScrollHeader(View paramView)
  {
    if (paramView == null) {
      if (jdField_a_of_type_Ucb != null)
      {
        jdField_a_of_type_Ucb.removeAllViewsInLayout();
        ucb.a(jdField_a_of_type_Ucb, null);
        jdField_a_of_type_Ucb = null;
      }
    }
    for (;;)
    {
      m = 0;
      mScrollY = 0;
      return;
      if (jdField_a_of_type_Ucb == null)
      {
        jdField_a_of_type_Ucb = new ucb(getContext());
        ucb.a(jdField_a_of_type_Ucb, this);
      }
      jdField_a_of_type_Ucb.removeAllViewsInLayout();
      jdField_a_of_type_Ucb.addView(paramView);
    }
  }
  
  public void setOverScrollHeight(int paramInt)
  {
    aM = paramInt;
  }
  
  public void setOverScrollListener(OverScrollViewListener paramOverScrollViewListener)
  {
    jdField_a_of_type_ComTencentWidgetOverScrollViewListener = paramOverScrollViewListener;
  }
  
  public void setOverscrollFooter(Drawable paramDrawable)
  {
    jdField_f_of_type_AndroidGraphicsDrawableDrawable = paramDrawable;
    invalidate();
  }
  
  public void setOverscrollHeader(Drawable paramDrawable)
  {
    jdField_e_of_type_AndroidGraphicsDrawableDrawable = paramDrawable;
    if (getScrollY() < 0) {
      invalidate();
    }
  }
  
  public void setSelection(int paramInt)
  {
    setSelectionFromTop(paramInt, 0);
  }
  
  public void setSelectionAfterHeaderView()
  {
    int i1 = jdField_a_of_type_JavaUtilArrayList.size();
    if (i1 > 0)
    {
      aE = 0;
      return;
    }
    if (jdField_a_of_type_AndroidWidgetListAdapter != null)
    {
      setSelection(i1);
      return;
    }
    aE = i1;
    U = 2;
  }
  
  public void setSelectionFromBottom(int paramInt1, int paramInt2)
  {
    if (jdField_a_of_type_AndroidWidgetListAdapter == null) {}
    for (;;)
    {
      return;
      if (!isInTouchMode())
      {
        int i1 = a(paramInt1, true);
        paramInt1 = i1;
        if (i1 >= 0)
        {
          i(i1);
          paramInt1 = i1;
        }
      }
      while (paramInt1 >= 0)
      {
        requestLayout();
        U = 100;
        if (p)
        {
          ax = paramInt1;
          jdField_a_of_type_Long = jdField_a_of_type_AndroidWidgetListAdapter.getItemId(paramInt1);
        }
        aw = (jdField_c_of_type_AndroidGraphicsRect.bottom + paramInt2);
        return;
        ak = paramInt1;
      }
    }
  }
  
  public void setSelectionFromTop(int paramInt1, int paramInt2)
  {
    if (jdField_a_of_type_AndroidWidgetListAdapter == null) {}
    for (;;)
    {
      return;
      if (!isInTouchMode())
      {
        int i1 = a(paramInt1, true);
        paramInt1 = i1;
        if (i1 >= 0)
        {
          i(i1);
          paramInt1 = i1;
        }
      }
      while (paramInt1 >= 0)
      {
        requestLayout();
        U = 4;
        if (p)
        {
          ax = paramInt1;
          jdField_a_of_type_Long = jdField_a_of_type_AndroidWidgetListAdapter.getItemId(paramInt1);
        }
        av = (jdField_c_of_type_AndroidGraphicsRect.top + paramInt2);
        return;
        ak = paramInt1;
      }
    }
  }
  
  public void setStatisticCollector()
  {
    Object localObject = a();
    if ((localObject instanceof HeaderViewListAdapter))
    {
      localObject = ((HeaderViewListAdapter)localObject).getWrappedAdapter();
      if ((localObject instanceof ExpandableListConnector)) {
        localObject = ((ExpandableListConnector)localObject).a().getClass().getName();
      }
    }
    for (;;)
    {
      StatisticCollector.a(BaseApplication.getContext()).a("SetupChild", "" + (String)localObject);
      return;
      localObject = localObject.getClass().getName();
      continue;
      if ((localObject instanceof ExpandableListConnector)) {
        localObject = ((ExpandableListConnector)localObject).a().getClass().getName();
      } else {
        localObject = localObject.getClass().getName();
      }
    }
  }
  
  public int v()
  {
    if ((aN == 0) && (jdField_b_of_type_Ucb != null)) {
      return jdField_b_of_type_Ucb.getHeight();
    }
    return aN;
  }
  
  public int w()
  {
    return (int)(0.33F * (getBottom() - mTop));
  }
  
  public int x()
  {
    return aL;
  }
}
