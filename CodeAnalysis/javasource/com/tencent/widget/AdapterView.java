package com.tencent.widget;

import android.content.Context;
import android.content.res.Resources;
import android.content.res.Resources.Theme;
import android.os.SystemClock;
import android.util.AttributeSet;
import android.util.SparseArray;
import android.util.TypedValue;
import android.view.View;
import android.view.View.OnClickListener;
import android.view.ViewDebug.CapturedViewProperty;
import android.view.ViewDebug.ExportedProperty;
import android.view.ViewGroup;
import android.view.ViewGroup.LayoutParams;
import android.view.ViewParent;
import android.view.accessibility.AccessibilityEvent;
import android.view.accessibility.AccessibilityNodeInfo;
import android.widget.Adapter;
import com.tencent.mobileqq.hotpatch.NotVerifyClass;
import com.tencent.qphone.base.util.QLog;
import com.tencent.util.VersionUtils;
import java.lang.reflect.Field;
import uap;

public abstract class AdapterView
  extends ViewGroup
{
  static final int aA = 0;
  static final int aB = 1;
  static final int aC = 2;
  static final int aD = 100;
  public static final int aI = -1;
  public static final int as = -1;
  public static final int at = -2;
  public static final String c = "XListView";
  public static final long e = Long.MIN_VALUE;
  public static final boolean o = false;
  private float jdField_a_of_type_Float;
  long jdField_a_of_type_Long;
  private View jdField_a_of_type_AndroidViewView;
  AdapterView.OnItemLongClickListener jdField_a_of_type_ComTencentWidgetAdapterView$OnItemLongClickListener;
  AdapterView.OnItemSelectedListener jdField_a_of_type_ComTencentWidgetAdapterView$OnItemSelectedListener;
  private uap jdField_a_of_type_Uap;
  private boolean jdField_a_of_type_Boolean;
  @ViewDebug.ExportedProperty(category="list")
  int aE;
  @ViewDebug.ExportedProperty(category="list")
  public int aF;
  @ViewDebug.ExportedProperty(category="list")
  public int aG;
  int aH;
  protected int aJ;
  @ViewDebug.ExportedProperty(category="scrolling")
  public int au;
  int av;
  int aw;
  int ax;
  int ay;
  int az;
  long jdField_b_of_type_Long;
  AdapterView.OnItemClickListener jdField_b_of_type_ComTencentWidgetAdapterView$OnItemClickListener;
  private boolean jdField_b_of_type_Boolean;
  long c;
  public long d;
  long f;
  public boolean p;
  boolean q;
  public boolean r;
  boolean s;
  
  public AdapterView(Context paramContext)
  {
    super(paramContext);
    boolean bool = NotVerifyClass.DO_VERIFY_CLASS;
    au = 0;
    jdField_a_of_type_Long = Long.MIN_VALUE;
    p = false;
    q = false;
    aE = -1;
    c = Long.MIN_VALUE;
    aF = -1;
    d = Long.MIN_VALUE;
    aJ = -1;
    f = Long.MIN_VALUE;
    s = false;
  }
  
  public AdapterView(Context paramContext, AttributeSet paramAttributeSet)
  {
    super(paramContext, paramAttributeSet);
    au = 0;
    jdField_a_of_type_Long = Long.MIN_VALUE;
    p = false;
    q = false;
    aE = -1;
    c = Long.MIN_VALUE;
    aF = -1;
    d = Long.MIN_VALUE;
    aJ = -1;
    f = Long.MIN_VALUE;
    s = false;
  }
  
  public AdapterView(Context paramContext, AttributeSet paramAttributeSet, int paramInt)
  {
    super(paramContext, paramAttributeSet, paramInt);
    au = 0;
    jdField_a_of_type_Long = Long.MIN_VALUE;
    p = false;
    q = false;
    aE = -1;
    c = Long.MIN_VALUE;
    aF = -1;
    d = Long.MIN_VALUE;
    aJ = -1;
    f = Long.MIN_VALUE;
    s = false;
  }
  
  public static void B() {}
  
  protected static int a(String paramString)
  {
    try
    {
      int i = Class.forName("com.android.internal.R$styleable").getField(paramString).getInt(null);
      return i;
    }
    catch (Exception paramString) {}
    return -1;
  }
  
  private void a(boolean paramBoolean)
  {
    if (a_()) {
      paramBoolean = false;
    }
    if (paramBoolean)
    {
      if (jdField_a_of_type_AndroidViewView != null)
      {
        jdField_a_of_type_AndroidViewView.setVisibility(0);
        setVisibility(8);
      }
      for (;;)
      {
        if (r) {
          onLayout(false, mLeft, mTop, mRight, mBottom);
        }
        return;
        setVisibility(0);
      }
    }
    if (jdField_a_of_type_AndroidViewView != null) {
      jdField_a_of_type_AndroidViewView.setVisibility(8);
    }
    setVisibility(0);
  }
  
  protected static int[] a(String paramString)
  {
    try
    {
      paramString = (int[])Class.forName("com.android.internal.R$styleable").getField(paramString).get(null);
      return paramString;
    }
    catch (Exception paramString) {}
    return new int[0];
  }
  
  private void b()
  {
    if (jdField_a_of_type_ComTencentWidgetAdapterView$OnItemSelectedListener == null) {
      return;
    }
    int i = r();
    if (i >= 0)
    {
      View localView = a();
      jdField_a_of_type_ComTencentWidgetAdapterView$OnItemSelectedListener.b(this, localView, i, a().getItemId(i));
      return;
    }
    jdField_a_of_type_ComTencentWidgetAdapterView$OnItemSelectedListener.a(this);
  }
  
  public static void b(String paramString)
  {
    TraceUtils.a(paramString);
  }
  
  private boolean b()
  {
    boolean bool2 = false;
    Adapter localAdapter = a();
    boolean bool1 = bool2;
    if (localAdapter != null)
    {
      int i = localAdapter.getCount();
      bool1 = bool2;
      if (i > 0) {
        if (s() <= 0)
        {
          bool1 = bool2;
          if (t() >= i - 1) {}
        }
        else
        {
          bool1 = true;
        }
      }
    }
    return bool1;
  }
  
  protected void A()
  {
    if ((getParent() instanceof View)) {}
    try
    {
      Field localField = View.class.getDeclaredField("mPrivateFlags");
      localField.setAccessible(true);
      int i = localField.getInt(getParent());
      localField.set(getParent(), Integer.valueOf(i | 0x80000000));
      return;
    }
    catch (Exception localException)
    {
      if (QLog.isColorLevel()) {
        QLog.e("XListView", 2, localException.getMessage(), localException);
      }
      ((View)getParent()).invalidate();
    }
  }
  
  int a(int paramInt, boolean paramBoolean)
  {
    return paramInt;
  }
  
  @ViewDebug.CapturedViewProperty
  public long a()
  {
    return c;
  }
  
  public long a(int paramInt)
  {
    Adapter localAdapter = a();
    if ((localAdapter == null) || (paramInt < 0)) {
      return Long.MIN_VALUE;
    }
    return localAdapter.getItemId(paramInt);
  }
  
  public abstract View a();
  
  public abstract Adapter a();
  
  public final AdapterView.OnItemClickListener a()
  {
    return jdField_b_of_type_ComTencentWidgetAdapterView$OnItemClickListener;
  }
  
  public final AdapterView.OnItemLongClickListener a()
  {
    return jdField_a_of_type_ComTencentWidgetAdapterView$OnItemLongClickListener;
  }
  
  public final AdapterView.OnItemSelectedListener a()
  {
    return jdField_a_of_type_ComTencentWidgetAdapterView$OnItemSelectedListener;
  }
  
  public Object a()
  {
    Adapter localAdapter = a();
    int i = r();
    if ((localAdapter != null) && (localAdapter.getCount() > 0) && (i >= 0)) {
      return localAdapter.getItem(i);
    }
    return null;
  }
  
  public Object a(int paramInt)
  {
    Adapter localAdapter = a();
    if ((localAdapter == null) || (paramInt < 0)) {
      return null;
    }
    return localAdapter.getItem(paramInt);
  }
  
  public boolean a(View paramView, int paramInt, long paramLong)
  {
    boolean bool = false;
    if (jdField_b_of_type_ComTencentWidgetAdapterView$OnItemClickListener != null)
    {
      playSoundEffect(0);
      if (paramView != null) {
        paramView.sendAccessibilityEvent(1);
      }
      jdField_b_of_type_ComTencentWidgetAdapterView$OnItemClickListener.a(this, paramView, paramInt, paramLong);
      bool = true;
    }
    return bool;
  }
  
  boolean a_()
  {
    return false;
  }
  
  public void addView(View paramView)
  {
    throw new UnsupportedOperationException("addView(View) is not supported in AdapterView");
  }
  
  public void addView(View paramView, int paramInt)
  {
    throw new UnsupportedOperationException("addView(View, int) is not supported in AdapterView");
  }
  
  public void addView(View paramView, int paramInt, ViewGroup.LayoutParams paramLayoutParams)
  {
    throw new UnsupportedOperationException("addView(View, int, LayoutParams) is not supported in AdapterView");
  }
  
  public void addView(View paramView, ViewGroup.LayoutParams paramLayoutParams)
  {
    throw new UnsupportedOperationException("addView(View, LayoutParams) is not supported in AdapterView");
  }
  
  protected float b()
  {
    if (jdField_a_of_type_Float == 0.0F)
    {
      TypedValue localTypedValue = new TypedValue();
      if (!getContext().getTheme().resolveAttribute(16842829, localTypedValue, true)) {
        throw new IllegalStateException("Expected theme to define listPreferredItemHeight.");
      }
      jdField_a_of_type_Float = localTypedValue.getDimension(getContext().getResources().getDisplayMetrics());
    }
    return jdField_a_of_type_Float;
  }
  
  public View b()
  {
    return jdField_a_of_type_AndroidViewView;
  }
  
  public int c(View paramView)
  {
    try
    {
      for (;;)
      {
        View localView = (View)paramView.getParent();
        boolean bool = localView.equals(this);
        if (bool) {
          break;
        }
        paramView = localView;
      }
      j = getChildCount();
    }
    catch (ClassCastException paramView)
    {
      return -1;
    }
    int j;
    int i = 0;
    while (i < j)
    {
      if (getChildAt(i).equals(paramView)) {
        return i + au;
      }
      i += 1;
    }
    return -1;
  }
  
  @ViewDebug.CapturedViewProperty
  public int c_()
  {
    return aG;
  }
  
  protected boolean canAnimate()
  {
    return (super.canAnimate()) && (aG > 0);
  }
  
  void d_()
  {
    if (jdField_a_of_type_ComTencentWidgetAdapterView$OnItemSelectedListener != null)
    {
      if ((!q) && (!s)) {
        break label78;
      }
      if (jdField_a_of_type_Uap == null) {
        jdField_a_of_type_Uap = new uap(this, null);
      }
      post(jdField_a_of_type_Uap);
    }
    for (;;)
    {
      if ((aF != -1) && (isShown()) && (!isInTouchMode())) {
        sendAccessibilityEvent(4);
      }
      return;
      label78:
      b();
    }
  }
  
  public boolean dispatchPopulateAccessibilityEvent(AccessibilityEvent paramAccessibilityEvent)
  {
    View localView = a();
    return (localView != null) && (localView.getVisibility() == 0) && (localView.dispatchPopulateAccessibilityEvent(paramAccessibilityEvent));
  }
  
  protected void dispatchRestoreInstanceState(SparseArray paramSparseArray)
  {
    dispatchThawSelfOnly(paramSparseArray);
  }
  
  protected void dispatchSaveInstanceState(SparseArray paramSparseArray)
  {
    dispatchFreezeSelfOnly(paramSparseArray);
  }
  
  public void h(int paramInt)
  {
    aF = paramInt;
    d = a(paramInt);
  }
  
  public void i(int paramInt)
  {
    aE = paramInt;
    c = a(paramInt);
    if ((p) && (ay == 0) && (paramInt >= 0))
    {
      ax = paramInt;
      jdField_a_of_type_Long = c;
    }
  }
  
  protected void onDetachedFromWindow()
  {
    super.onDetachedFromWindow();
    removeCallbacks(jdField_a_of_type_Uap);
  }
  
  public void onInitializeAccessibilityEvent(AccessibilityEvent paramAccessibilityEvent)
  {
    super.onInitializeAccessibilityEvent(paramAccessibilityEvent);
    paramAccessibilityEvent.setScrollable(b());
    View localView = a();
    if (localView != null) {
      paramAccessibilityEvent.setEnabled(localView.isEnabled());
    }
    paramAccessibilityEvent.setCurrentItemIndex(r());
    paramAccessibilityEvent.setFromIndex(s());
    paramAccessibilityEvent.setToIndex(t());
    paramAccessibilityEvent.setItemCount(c_());
  }
  
  public void onInitializeAccessibilityNodeInfo(AccessibilityNodeInfo paramAccessibilityNodeInfo)
  {
    try
    {
      super.onInitializeAccessibilityNodeInfo(paramAccessibilityNodeInfo);
      paramAccessibilityNodeInfo.setScrollable(b());
      View localView = a();
      if (localView != null) {
        paramAccessibilityNodeInfo.setEnabled(localView.isEnabled());
      }
      return;
    }
    catch (Exception localException)
    {
      for (;;)
      {
        localException.printStackTrace();
      }
    }
  }
  
  public void onLayout(boolean paramBoolean, int paramInt1, int paramInt2, int paramInt3, int paramInt4)
  {
    az = getHeight();
  }
  
  public boolean onRequestSendAccessibilityEvent(View paramView, AccessibilityEvent paramAccessibilityEvent)
  {
    if (super.onRequestSendAccessibilityEvent(paramView, paramAccessibilityEvent))
    {
      AccessibilityEvent localAccessibilityEvent = AccessibilityEvent.obtain();
      onInitializeAccessibilityEvent(localAccessibilityEvent);
      paramView.dispatchPopulateAccessibilityEvent(localAccessibilityEvent);
      paramAccessibilityEvent.appendRecord(localAccessibilityEvent);
      return true;
    }
    return false;
  }
  
  public boolean p()
  {
    if (VersionUtils.d()) {
      for (ViewParent localViewParent = getParent(); (localViewParent != null) && ((localViewParent instanceof ViewGroup)); localViewParent = localViewParent.getParent()) {
        if (((ViewGroup)localViewParent).shouldDelayChildPressedState()) {
          return true;
        }
      }
    }
    return false;
  }
  
  void q()
  {
    int m = aG;
    int i;
    if (m > 0) {
      if (p)
      {
        p = false;
        i = u();
        if ((i >= 0) && (a(i, true) == i))
        {
          i(i);
          i = 1;
          if (i == 0)
          {
            int k = r();
            int j = k;
            if (k >= m) {
              j = m - 1;
            }
            k = j;
            if (j < 0) {
              k = 0;
            }
            j = a(k, true);
            if (j >= 0) {
              break label153;
            }
            j = a(k, false);
            label97:
            if (j >= 0)
            {
              i(j);
              y();
              i = 1;
            }
          }
        }
      }
    }
    for (;;)
    {
      if (i == 0)
      {
        aF = -1;
        d = Long.MIN_VALUE;
        aE = -1;
        c = Long.MIN_VALUE;
        p = false;
        y();
      }
      return;
      continue;
      label153:
      break label97;
      i = 0;
      break;
      i = 0;
    }
  }
  
  @ViewDebug.CapturedViewProperty
  public int r()
  {
    return aE;
  }
  
  void r()
  {
    if (getChildCount() > 0)
    {
      p = true;
      jdField_b_of_type_Long = az;
      if (aF >= 0)
      {
        localView = getChildAt(aF - au);
        jdField_a_of_type_Long = c;
        ax = aE;
        if (localView != null) {
          av = localView.getTop();
        }
        ay = 0;
      }
    }
    else
    {
      return;
    }
    View localView = getChildAt(0);
    Adapter localAdapter = a();
    if ((au >= 0) && (au < localAdapter.getCount())) {}
    for (jdField_a_of_type_Long = localAdapter.getItemId(au);; jdField_a_of_type_Long = -1L)
    {
      ax = au;
      if (localView != null) {
        av = localView.getTop();
      }
      ay = 1;
      return;
    }
  }
  
  public void removeAllViews()
  {
    throw new UnsupportedOperationException("removeAllViews() is not supported in AdapterView");
  }
  
  public void removeView(View paramView)
  {
    throw new UnsupportedOperationException("removeView(View) is not supported in AdapterView");
  }
  
  public void removeViewAt(int paramInt)
  {
    throw new UnsupportedOperationException("removeViewAt(int) is not supported in AdapterView");
  }
  
  public int s()
  {
    return au;
  }
  
  public abstract void setAdapter(Adapter paramAdapter);
  
  public void setEmptyView(View paramView)
  {
    jdField_a_of_type_AndroidViewView = paramView;
    paramView = a();
    if ((paramView == null) || (paramView.isEmpty())) {}
    for (boolean bool = true;; bool = false)
    {
      a(bool);
      return;
    }
  }
  
  public void setFocusable(boolean paramBoolean)
  {
    boolean bool = true;
    Adapter localAdapter = a();
    int i;
    if ((localAdapter == null) || (localAdapter.getCount() == 0))
    {
      i = 1;
      jdField_a_of_type_Boolean = paramBoolean;
      if (!paramBoolean) {
        jdField_b_of_type_Boolean = false;
      }
      if (!paramBoolean) {
        break label69;
      }
      paramBoolean = bool;
      if (i != 0) {
        if (!a_()) {
          break label69;
        }
      }
    }
    label69:
    for (paramBoolean = bool;; paramBoolean = false)
    {
      super.setFocusable(paramBoolean);
      return;
      i = 0;
      break;
    }
  }
  
  public void setFocusableInTouchMode(boolean paramBoolean)
  {
    boolean bool = true;
    Adapter localAdapter = a();
    int i;
    if ((localAdapter == null) || (localAdapter.getCount() == 0))
    {
      i = 1;
      jdField_b_of_type_Boolean = paramBoolean;
      if (paramBoolean) {
        jdField_a_of_type_Boolean = true;
      }
      if (!paramBoolean) {
        break label69;
      }
      paramBoolean = bool;
      if (i != 0) {
        if (!a_()) {
          break label69;
        }
      }
    }
    label69:
    for (paramBoolean = bool;; paramBoolean = false)
    {
      super.setFocusableInTouchMode(paramBoolean);
      return;
      i = 0;
      break;
    }
  }
  
  public void setOnClickListener(View.OnClickListener paramOnClickListener)
  {
    throw new RuntimeException("Don't call setOnClickListener for an AdapterView. You probably want setOnItemClickListener instead");
  }
  
  public void setOnItemClickListener(AdapterView.OnItemClickListener paramOnItemClickListener)
  {
    jdField_b_of_type_ComTencentWidgetAdapterView$OnItemClickListener = paramOnItemClickListener;
  }
  
  public void setOnItemLongClickListener(AdapterView.OnItemLongClickListener paramOnItemLongClickListener)
  {
    if (!isLongClickable()) {
      setLongClickable(true);
    }
    jdField_a_of_type_ComTencentWidgetAdapterView$OnItemLongClickListener = paramOnItemLongClickListener;
  }
  
  public void setOnItemSelectedListener(AdapterView.OnItemSelectedListener paramOnItemSelectedListener)
  {
    jdField_a_of_type_ComTencentWidgetAdapterView$OnItemSelectedListener = paramOnItemSelectedListener;
  }
  
  public abstract void setSelection(int paramInt);
  
  public int t()
  {
    return au + getChildCount() - 1;
  }
  
  int u()
  {
    int i2 = aG;
    int n;
    if (i2 == 0)
    {
      n = -1;
      return n;
    }
    long l1 = jdField_a_of_type_Long;
    int i = ax;
    if (l1 == Long.MIN_VALUE) {
      return -1;
    }
    i = Math.min(i2 - 1, Math.max(0, i));
    long l2 = SystemClock.uptimeMillis();
    Adapter localAdapter = a();
    label70:
    int i1;
    int j;
    int k;
    if (localAdapter == null)
    {
      return -1;
      if ((i1 != 0) || ((j != 0) && (n == 0)))
      {
        i = k + 1;
        k = i;
        j = 0;
      }
    }
    for (;;)
    {
      int m;
      if (SystemClock.uptimeMillis() <= l2 + 100L)
      {
        n = i;
        if (localAdapter.getItemId(i) == l1) {
          break;
        }
        if (k != i2 - 1) {
          break label153;
        }
        n = 1;
        if (m != 0) {
          break label159;
        }
      }
      label153:
      label159:
      for (i1 = 1;; i1 = 0)
      {
        if ((n == 0) || (i1 == 0)) {
          break label163;
        }
        return -1;
        n = 0;
        break;
      }
      label163:
      break label70;
      if ((n != 0) || ((j == 0) && (i1 == 0)))
      {
        i = m - 1;
        m = i;
        j = 1;
        continue;
        k = i;
        m = i;
        j = 0;
      }
    }
  }
  
  void x()
  {
    boolean bool2 = false;
    Adapter localAdapter = a();
    int i;
    if ((localAdapter == null) || (localAdapter.getCount() == 0))
    {
      i = 1;
      if ((i != 0) && (!a_())) {
        break label111;
      }
      i = 1;
      label38:
      if ((i == 0) || (!jdField_b_of_type_Boolean)) {
        break label116;
      }
      bool1 = true;
      label51:
      super.setFocusableInTouchMode(bool1);
      if ((i == 0) || (!jdField_a_of_type_Boolean)) {
        break label121;
      }
    }
    label111:
    label116:
    label121:
    for (boolean bool1 = true;; bool1 = false)
    {
      super.setFocusable(bool1);
      if (jdField_a_of_type_AndroidViewView != null)
      {
        if (localAdapter != null)
        {
          bool1 = bool2;
          if (!localAdapter.isEmpty()) {}
        }
        else
        {
          bool1 = true;
        }
        a(bool1);
      }
      return;
      i = 0;
      break;
      i = 0;
      break label38;
      bool1 = false;
      break label51;
    }
  }
  
  void y()
  {
    if ((aF != aJ) || (d != f))
    {
      d_();
      aJ = aF;
      f = d;
    }
  }
  
  protected void z()
  {
    if ((VersionUtils.e()) && (isHardwareAccelerated()) && ((getParent() instanceof View))) {
      ((View)getParent()).invalidate();
    }
  }
}
