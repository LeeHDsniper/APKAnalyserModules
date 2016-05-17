package com.tencent.widget;

import android.content.Context;
import android.content.res.Resources;
import android.content.res.TypedArray;
import android.graphics.Canvas;
import android.graphics.Rect;
import android.graphics.drawable.Drawable;
import android.graphics.drawable.TransitionDrawable;
import android.os.Bundle;
import android.os.Handler;
import android.os.Parcelable;
import android.support.v4.view.ViewCompat;
import android.text.Editable;
import android.text.TextUtils;
import android.text.TextWatcher;
import android.util.AttributeSet;
import android.util.DisplayMetrics;
import android.util.SparseBooleanArray;
import android.view.ActionMode;
import android.view.ContextMenu.ContextMenuInfo;
import android.view.KeyEvent;
import android.view.KeyEvent.DispatcherState;
import android.view.LayoutInflater;
import android.view.MotionEvent;
import android.view.VelocityTracker;
import android.view.View;
import android.view.ViewConfiguration;
import android.view.ViewDebug.ExportedProperty;
import android.view.ViewGroup.LayoutParams;
import android.view.ViewParent;
import android.view.ViewTreeObserver;
import android.view.ViewTreeObserver.OnGlobalLayoutListener;
import android.view.ViewTreeObserver.OnTouchModeChangeListener;
import android.view.accessibility.AccessibilityEvent;
import android.view.accessibility.AccessibilityNodeInfo;
import android.view.inputmethod.BaseInputConnection;
import android.view.inputmethod.EditorInfo;
import android.view.inputmethod.InputConnection;
import android.view.inputmethod.InputConnectionWrapper;
import android.widget.EditText;
import android.widget.Filter;
import android.widget.Filter.FilterListener;
import android.widget.Filterable;
import android.widget.ListAdapter;
import android.widget.PopupWindow;
import com.tencent.common.config.AppSetting;
import com.tencent.mobileqq.hotpatch.NotVerifyClass;
import com.tencent.mobileqq.util.ThreadPriorityManager;
import com.tencent.qphone.base.util.QLog;
import com.tencent.util.LongSparseArray;
import com.tencent.util.VersionUtils;
import java.lang.reflect.Method;
import java.util.ArrayList;
import java.util.List;
import tzo;
import tzp;
import tzq;
import tzr;
import tzs;
import tzt;
import tzu;
import tzv;
import tzx;
import tzy;
import tzz;
import uaa;
import uab;

public abstract class AbsListView
  extends AdapterView
  implements TextWatcher, ViewTreeObserver.OnGlobalLayoutListener, ViewTreeObserver.OnTouchModeChangeListener, Filter.FilterListener
{
  protected static final int A = 1;
  protected static final int B = 2;
  protected static final int C = 3;
  protected static final int D = 4;
  protected static final int E = 5;
  protected static final int F = 6;
  static final int G = 0;
  static final int H = 1;
  static final int I = 2;
  static final int J = 3;
  static final int K = 4;
  static final int L = 100;
  static final int M = 5;
  static final int N = 6;
  public static final int O = 0;
  public static final int P = 1;
  public static final int Q = 2;
  public static final int R = 3;
  private static final int jdField_a_of_type_Int;
  private static final int[] jdField_a_of_type_ArrayOfInt;
  static final int am = 3;
  public static final int ao = -1;
  private static final int jdField_b_of_type_Int;
  private static final int[] jdField_b_of_type_ArrayOfInt = { 0 };
  private static final int jdField_c_of_type_Int;
  private static final int jdField_d_of_type_Int;
  private static final int jdField_e_of_type_Int;
  private static final int jdField_f_of_type_Int;
  private static final int g;
  private static final int h;
  private static final int i;
  private static final int jdField_j_of_type_Int;
  private static final int jdField_k_of_type_Int;
  private static final int l = 30;
  private static final int m = 20;
  private static final int n = -1;
  private static final int o = 0;
  private static final int p = 1;
  private static final boolean jdField_t_of_type_Boolean = false;
  public static final int v = 0;
  private static final boolean v = false;
  public static final int w = 1;
  public static final int x = 2;
  protected static final int y = -1;
  protected static final int z = 0;
  private boolean A;
  private boolean B = false;
  private boolean C = false;
  int S = 0;
  int T;
  public int U = 0;
  public int V = -1;
  int W = 0;
  int X = 0;
  int Y = 0;
  int Z = 0;
  private float jdField_a_of_type_Float;
  private Rect jdField_a_of_type_AndroidGraphicsRect;
  public SparseBooleanArray a;
  public ActionMode a;
  private ContextMenu.ContextMenuInfo jdField_a_of_type_AndroidViewContextMenu$ContextMenuInfo = null;
  private VelocityTracker jdField_a_of_type_AndroidViewVelocityTracker;
  private InputConnection jdField_a_of_type_AndroidViewInputmethodInputConnection;
  private InputConnectionWrapper jdField_a_of_type_AndroidViewInputmethodInputConnectionWrapper;
  EditText jdField_a_of_type_AndroidWidgetEditText;
  public ListAdapter a;
  PopupWindow jdField_a_of_type_AndroidWidgetPopupWindow;
  LongSparseArray jdField_a_of_type_ComTencentUtilLongSparseArray;
  private AbsListView.OnScrollButtomListener jdField_a_of_type_ComTencentWidgetAbsListView$OnScrollButtomListener;
  private AbsListView.OnScrollListener jdField_a_of_type_ComTencentWidgetAbsListView$OnScrollListener;
  private EdgeEffect jdField_a_of_type_ComTencentWidgetEdgeEffect;
  public FastScroller a;
  private Object jdField_a_of_type_JavaLangObject = null;
  private Runnable jdField_a_of_type_JavaLangRunnable;
  Method jdField_a_of_type_JavaLangReflectMethod = null;
  tzr jdField_a_of_type_Tzr;
  private tzs jdField_a_of_type_Tzs;
  private tzt jdField_a_of_type_Tzt;
  private tzv jdField_a_of_type_Tzv;
  private tzx jdField_a_of_type_Tzx;
  tzy jdField_a_of_type_Tzy;
  private tzz jdField_a_of_type_Tzz;
  public uaa a;
  public final uab a;
  private boolean jdField_a_of_type_Boolean = false;
  public final boolean[] a;
  private int aK;
  private int aL = -1;
  private int aM;
  private int aN;
  private int aO = 0;
  private int aP;
  private int aQ;
  private int aR;
  private int aS;
  private int aT;
  private int aU;
  public int a_;
  int aa = 0;
  public int ab;
  public int ac;
  int ad;
  int ae;
  int af;
  public int ag = -1;
  int ah;
  int ai;
  int aj = 0;
  int ak = -1;
  int al;
  int an;
  public int ar;
  private float jdField_b_of_type_Float = 1.0F;
  Rect jdField_b_of_type_AndroidGraphicsRect = new Rect();
  private EdgeEffect jdField_b_of_type_ComTencentWidgetEdgeEffect;
  private Object jdField_b_of_type_JavaLangObject = null;
  private Runnable jdField_b_of_type_JavaLangRunnable;
  private boolean jdField_b_of_type_Boolean = false;
  public int b_;
  public Rect c;
  public Drawable c;
  private Runnable jdField_c_of_type_JavaLangRunnable;
  private boolean jdField_c_of_type_Boolean = true;
  private boolean jdField_d_of_type_Boolean;
  View jdField_e_of_type_AndroidViewView;
  private boolean jdField_e_of_type_Boolean;
  View jdField_f_of_type_AndroidViewView;
  boolean jdField_f_of_type_Boolean = false;
  public boolean g;
  public boolean h;
  public boolean i;
  boolean jdField_j_of_type_Boolean;
  boolean jdField_k_of_type_Boolean;
  public boolean l = false;
  public boolean m;
  public boolean n;
  private int q;
  private int r;
  private int s;
  private int jdField_t_of_type_Int;
  private int jdField_u_of_type_Int;
  private boolean jdField_u_of_type_Boolean = false;
  private boolean w = false;
  private boolean x;
  private boolean y;
  private boolean z;
  
  static
  {
    boolean bool = NotVerifyClass.DO_VERIFY_CLASS;
    jdField_a_of_type_ArrayOfInt = a("AbsListView");
    jdField_a_of_type_Int = a("AbsListView_listSelector");
    jdField_b_of_type_Int = a("AbsListView_fastScrollAlwaysVisible");
    jdField_c_of_type_Int = a("AbsListView_choiceMode");
    jdField_d_of_type_Int = a("AbsListView_smoothScrollbar");
    jdField_e_of_type_Int = a("AbsListView_fastScrollEnabled");
    jdField_f_of_type_Int = a("AbsListView_cacheColorHint");
    jdField_g_of_type_Int = a("AbsListView_transcriptMode");
    jdField_h_of_type_Int = a("AbsListView_textFilterEnabled");
    jdField_i_of_type_Int = a("AbsListView_scrollingCache");
    jdField_j_of_type_Int = a("AbsListView_stackFromBottom");
    jdField_k_of_type_Int = a("AbsListView_drawSelectorOnTop");
  }
  
  public AbsListView(Context paramContext)
  {
    super(paramContext);
    jdField_a_of_type_Uab = new uab(this);
    jdField_c_of_type_AndroidGraphicsRect = new Rect();
    jdField_q_of_type_Int = -1;
    jdField_s_of_type_Int = 0;
    jdField_a_of_type_ArrayOfBoolean = new boolean[1];
    c();
    setVerticalScrollBarEnabled(true);
    paramContext = paramContext.obtainStyledAttributes(a("View"));
    initializeScrollbars(paramContext);
    paramContext.recycle();
  }
  
  public AbsListView(Context paramContext, AttributeSet paramAttributeSet)
  {
    this(paramContext, paramAttributeSet, 16842858);
  }
  
  public AbsListView(Context paramContext, AttributeSet paramAttributeSet, int paramInt)
  {
    super(paramContext, paramAttributeSet, paramInt);
    jdField_a_of_type_Uab = new uab(this);
    jdField_c_of_type_AndroidGraphicsRect = new Rect();
    jdField_q_of_type_Int = -1;
    jdField_s_of_type_Int = 0;
    jdField_a_of_type_ArrayOfBoolean = new boolean[1];
    c();
    paramContext = new TypedArrayWarpper(paramContext.obtainStyledAttributes(paramAttributeSet, jdField_a_of_type_ArrayOfInt, paramInt, 0));
    paramAttributeSet = paramContext.a(jdField_a_of_type_Int);
    if (paramAttributeSet != null) {
      setSelector(paramAttributeSet);
    }
    jdField_f_of_type_Boolean = paramContext.a(jdField_k_of_type_Int, false);
    setStackFromBottom(paramContext.a(jdField_j_of_type_Int, false));
    setScrollingCacheEnabled(paramContext.a(jdField_i_of_type_Int, true));
    setTextFilterEnabled(paramContext.a(jdField_h_of_type_Int, false));
    setTranscriptMode(paramContext.a(jdField_g_of_type_Int, 0));
    setCacheColorHint(paramContext.b(jdField_f_of_type_Int, 0));
    setFastScrollEnabled(paramContext.a(jdField_e_of_type_Int, false));
    setSmoothScrollbarEnabled(paramContext.a(jdField_d_of_type_Int, true));
    setChoiceMode(paramContext.a(jdField_c_of_type_Int, 0));
    setFastScrollAlwaysVisible(paramContext.a(jdField_b_of_type_Int, false));
    paramContext.a();
  }
  
  private void C()
  {
    if (jdField_a_of_type_AndroidViewVelocityTracker != null)
    {
      jdField_a_of_type_AndroidViewVelocityTracker.recycle();
      jdField_a_of_type_AndroidViewVelocityTracker = null;
    }
  }
  
  private void D()
  {
    if ((jdField_j_of_type_Boolean) && (!jdField_g_of_type_Boolean))
    {
      setChildrenDrawnWithCacheEnabled(true);
      setChildrenDrawingCacheEnabled(true);
      jdField_h_of_type_Boolean = true;
      jdField_g_of_type_Boolean = true;
    }
  }
  
  private void E()
  {
    if (jdField_c_of_type_JavaLangRunnable == null) {
      jdField_c_of_type_JavaLangRunnable = new tzp(this);
    }
    post(jdField_c_of_type_JavaLangRunnable);
  }
  
  private void F()
  {
    if (jdField_a_of_type_AndroidWidgetPopupWindow != null) {
      jdField_a_of_type_AndroidWidgetPopupWindow.dismiss();
    }
  }
  
  private void G()
  {
    if (getWindowVisibility() == 0)
    {
      a(true);
      H();
      x();
    }
  }
  
  private void H()
  {
    int i1 = getResourcesgetDisplayMetricsheightPixels;
    int[] arrayOfInt = new int[2];
    getLocationOnScreen(arrayOfInt);
    i1 = i1 - arrayOfInt[1] - getHeight() + (int)(jdField_a_of_type_Float * 20.0F);
    if (!jdField_a_of_type_AndroidWidgetPopupWindow.isShowing())
    {
      jdField_a_of_type_AndroidWidgetPopupWindow.showAtLocation(this, 81, arrayOfInt[0], i1);
      return;
    }
    jdField_a_of_type_AndroidWidgetPopupWindow.update(arrayOfInt[0], i1, -1, -1);
  }
  
  private void I()
  {
    if (jdField_a_of_type_ComTencentWidgetEdgeEffect != null)
    {
      jdField_a_of_type_ComTencentWidgetEdgeEffect.a();
      jdField_b_of_type_ComTencentWidgetEdgeEffect.a();
    }
  }
  
  private int a(int paramInt)
  {
    if (mScrollY * paramInt < 0) {}
    while (az == 0) {
      return paramInt;
    }
    return (az - Math.abs(mScrollY)) * paramInt / az / 2;
  }
  
  static int a(Rect paramRect1, Rect paramRect2, int paramInt)
  {
    int i3;
    int i2;
    int i1;
    switch (paramInt)
    {
    default: 
      throw new IllegalArgumentException("direction must be one of {FOCUS_UP, FOCUS_DOWN, FOCUS_LEFT, FOCUS_RIGHT, FOCUS_FORWARD, FOCUS_BACKWARD}.");
    case 66: 
      i3 = right;
      i2 = top + paramRect1.height() / 2;
      i1 = left;
      paramInt = top + paramRect2.height() / 2;
    }
    for (;;)
    {
      i1 -= i3;
      paramInt -= i2;
      return paramInt * paramInt + i1 * i1;
      i3 = left + paramRect1.width() / 2;
      i2 = bottom;
      paramInt = left;
      i1 = paramRect2.width() / 2 + paramInt;
      paramInt = top;
      continue;
      i3 = left;
      i2 = top + paramRect1.height() / 2;
      i1 = right;
      paramInt = top + paramRect2.height() / 2;
      continue;
      i3 = left + paramRect1.width() / 2;
      i2 = top;
      paramInt = left;
      i1 = paramRect2.width() / 2 + paramInt;
      paramInt = bottom;
      continue;
      i3 = right + paramRect1.width() / 2;
      i2 = top + paramRect1.height() / 2;
      paramInt = left;
      i1 = paramRect2.width() / 2 + paramInt;
      paramInt = top + paramRect2.height() / 2;
    }
  }
  
  public static View a(ArrayList paramArrayList, int paramInt)
  {
    int i2 = paramArrayList.size();
    if (i2 > 0)
    {
      int i1 = 0;
      while (i1 < i2)
      {
        View localView = (View)paramArrayList.get(i1);
        if (getLayoutParamsjdField_b_of_type_Int == paramInt)
        {
          paramArrayList.remove(i1);
          return localView;
        }
        i1 += 1;
      }
      return (View)paramArrayList.remove(i2 - 1);
    }
    return null;
  }
  
  private Object a(Object paramObject)
  {
    return null;
  }
  
  private Object a(String paramString)
  {
    return null;
  }
  
  private void a(int paramInt)
  {
    int i5 = paramInt - af;
    int i4 = i5 - ai;
    int i2;
    Object localObject;
    int i1;
    if (ah != Integer.MIN_VALUE)
    {
      i2 = paramInt - ah;
      if (ag != 3) {
        break label425;
      }
      if (jdField_a_of_type_JavaLangObject == null) {
        jdField_a_of_type_JavaLangObject = a("AbsListView-scroll");
      }
      if (paramInt != ah)
      {
        if (((mGroupFlags & 0x80000) == 0) && (Math.abs(i5) > t))
        {
          localObject = getParent();
          if (localObject != null) {
            ((ViewParent)localObject).requestDisallowInterceptTouchEvent(true);
          }
        }
        if (ab < 0) {
          break label370;
        }
        i1 = ab - au;
        label127:
        localObject = getChildAt(i1);
        if (localObject == null) {
          break label774;
        }
      }
    }
    label211:
    label349:
    label370:
    label380:
    label385:
    label425:
    label513:
    label616:
    label717:
    label722:
    label763:
    label774:
    for (int i3 = ((View)localObject).getTop();; i3 = 0)
    {
      if (i2 != 0) {}
      for (boolean bool = a(i4, i2);; bool = false)
      {
        localObject = getChildAt(i1);
        if (localObject != null)
        {
          i1 = ((View)localObject).getTop();
          if (bool)
          {
            i2 = -i2 - (i1 - i3);
            i3 = a(i2);
            if ((l) && (i3 > 0)) {
              break label380;
            }
            i1 = 1;
            if (i1 != 0) {
              overScrollBy(0, i3, 0, getScrollY(), 0, 0, 0, a_, true);
            }
            if ((Math.abs(a_) == Math.abs(getScrollY())) && (jdField_a_of_type_AndroidViewVelocityTracker != null)) {
              jdField_a_of_type_AndroidViewVelocityTracker.clear();
            }
            i3 = getOverScrollMode();
            if ((i1 != 0) && ((i3 == 0) || ((i3 == 1) && (!b()))))
            {
              aO = 0;
              ag = 5;
              if (jdField_a_of_type_ComTencentWidgetEdgeEffect != null)
              {
                if (i5 <= 0) {
                  break label385;
                }
                jdField_a_of_type_ComTencentWidgetEdgeEffect.a(i2 / getHeight());
                if (!jdField_b_of_type_ComTencentWidgetEdgeEffect.a()) {
                  jdField_b_of_type_ComTencentWidgetEdgeEffect.b();
                }
              }
            }
          }
          af = paramInt;
          invalidate();
        }
        else
        {
          ah = paramInt;
        }
        do
        {
          return;
          i2 = i4;
          break;
          i1 = getChildCount() / 2;
          break label127;
          i1 = 0;
          break label211;
          if (i5 >= 0) {
            break label349;
          }
          jdField_b_of_type_ComTencentWidgetEdgeEffect.a(i2 / getHeight());
          if (jdField_a_of_type_ComTencentWidgetEdgeEffect.a()) {
            break label349;
          }
          jdField_a_of_type_ComTencentWidgetEdgeEffect.b();
          break label349;
        } while ((ag != 5) || (paramInt == ah));
        i4 = getScrollY();
        int i6 = i4 - i2;
        if (paramInt > ah)
        {
          i1 = 1;
          if (aO == 0) {
            aO = i1;
          }
          i3 = -i2;
          if (((i6 >= 0) || (i4 < 0)) && ((i6 <= 0) || (i4 > 0))) {
            break label717;
          }
          i4 = -i4;
          i3 = i4;
          i2 += i4;
          if (i3 != 0)
          {
            i4 = getScrollY();
            overScrollBy(0, a(i3), 0, i4, 0, 0, 0, a_, true);
            i4 = getOverScrollMode();
            if ((i4 == 0) || ((i4 == 1) && (!b())))
            {
              if (jdField_a_of_type_ComTencentWidgetEdgeEffect != null)
              {
                if (i5 <= 0) {
                  break label722;
                }
                jdField_a_of_type_ComTencentWidgetEdgeEffect.a(i3 / getHeight());
                if (!jdField_b_of_type_ComTencentWidgetEdgeEffect.a()) {
                  jdField_b_of_type_ComTencentWidgetEdgeEffect.b();
                }
              }
              invalidate();
            }
          }
          if (i2 != 0)
          {
            mScrollY = 0;
            z();
            if (i2 != 0) {
              a(i2, i2);
            }
            ag = 3;
            i3 = d(paramInt);
            ai = 0;
            localObject = getChildAt(i3 - au);
            if (localObject == null) {
              break label763;
            }
          }
        }
        for (i2 = ((View)localObject).getTop();; i2 = 0)
        {
          ac = i2;
          af = paramInt;
          ab = i3;
          ah = paramInt;
          aO = i1;
          return;
          i1 = -1;
          break;
          i2 = 0;
          break label513;
          if (i5 >= 0) {
            break label616;
          }
          jdField_b_of_type_ComTencentWidgetEdgeEffect.a(i3 / getHeight());
          if (jdField_a_of_type_ComTencentWidgetEdgeEffect.a()) {
            break label616;
          }
          jdField_a_of_type_ComTencentWidgetEdgeEffect.b();
          break label616;
        }
      }
    }
  }
  
  private void a(int paramInt1, int paramInt2, int paramInt3, int paramInt4)
  {
    jdField_b_of_type_AndroidGraphicsRect.set(paramInt1 - W, paramInt2 - X, Y + paramInt3, Z + paramInt4);
  }
  
  private void a(Canvas paramCanvas)
  {
    if (!jdField_b_of_type_AndroidGraphicsRect.isEmpty())
    {
      Drawable localDrawable = jdField_c_of_type_AndroidGraphicsDrawableDrawable;
      localDrawable.setBounds(jdField_b_of_type_AndroidGraphicsRect);
      localDrawable.draw(paramCanvas);
    }
  }
  
  private void a(MotionEvent paramMotionEvent)
  {
    int i1 = (paramMotionEvent.getAction() & 0xFF00) >> 8;
    if (paramMotionEvent.getPointerId(i1) == aL) {
      if (i1 != 0) {
        break label65;
      }
    }
    label65:
    for (i1 = 1;; i1 = 0)
    {
      ae = ((int)paramMotionEvent.getX(i1));
      af = ((int)paramMotionEvent.getY(i1));
      ai = 0;
      aL = paramMotionEvent.getPointerId(i1);
      return;
    }
  }
  
  private void a(View paramView)
  {
    try
    {
      if (jdField_a_of_type_JavaLangReflectMethod == null) {
        jdField_a_of_type_JavaLangReflectMethod = View.class.getMethod("dispatchStartTemporaryDetach", new Class[0]);
      }
      jdField_a_of_type_JavaLangReflectMethod.invoke(paramView, new Object[0]);
      return;
    }
    catch (Exception localException)
    {
      paramView.onStartTemporaryDetach();
    }
  }
  
  private void a(boolean paramBoolean)
  {
    if (jdField_a_of_type_AndroidWidgetPopupWindow == null)
    {
      Context localContext = getContext();
      PopupWindow localPopupWindow = new PopupWindow(localContext);
      jdField_a_of_type_AndroidWidgetEditText = ((EditText)((LayoutInflater)localContext.getSystemService("layout_inflater")).inflate(2130904894, null));
      jdField_a_of_type_AndroidWidgetEditText.setRawInputType(177);
      jdField_a_of_type_AndroidWidgetEditText.setImeOptions(268435456);
      jdField_a_of_type_AndroidWidgetEditText.addTextChangedListener(this);
      localPopupWindow.setFocusable(false);
      localPopupWindow.setTouchable(false);
      localPopupWindow.setInputMethodMode(2);
      localPopupWindow.setContentView(jdField_a_of_type_AndroidWidgetEditText);
      localPopupWindow.setWidth(-2);
      localPopupWindow.setHeight(-2);
      localPopupWindow.setBackgroundDrawable(null);
      jdField_a_of_type_AndroidWidgetPopupWindow = localPopupWindow;
      getViewTreeObserver().addOnGlobalLayoutListener(this);
      y = true;
    }
    if (paramBoolean)
    {
      jdField_a_of_type_AndroidWidgetPopupWindow.setAnimationStyle(2131558906);
      return;
    }
    jdField_a_of_type_AndroidWidgetPopupWindow.setAnimationStyle(2131558907);
  }
  
  private boolean a(int paramInt)
  {
    int i2 = paramInt - af;
    int i3 = Math.abs(i2);
    int i1;
    if (mScrollY != 0) {
      i1 = 1;
    }
    while (((i1 != 0) && (!l)) || (i3 > t))
    {
      D();
      if (i1 != 0)
      {
        ag = 5;
        ai = 0;
        Object localObject = getHandler();
        if (localObject != null) {
          ((Handler)localObject).removeCallbacks(jdField_a_of_type_Tzt);
        }
        setPressed(false);
        localObject = getChildAt(ab - au);
        if (localObject != null) {
          ((View)localObject).setPressed(false);
        }
        b(1);
        localObject = getParent();
        if (localObject != null) {
          ((ViewParent)localObject).requestDisallowInterceptTouchEvent(true);
        }
        a(paramInt);
        return true;
        i1 = 0;
      }
      else
      {
        ag = 3;
        if (i2 > 0) {}
        for (i1 = t;; i1 = -t)
        {
          ai = i1;
          break;
        }
      }
    }
    return false;
  }
  
  private boolean a(ArrayList paramArrayList)
  {
    boolean bool1 = true;
    boolean bool2 = true;
    if (paramArrayList == null) {
      return bool2;
    }
    int i2 = paramArrayList.size();
    int i1 = 0;
    for (;;)
    {
      bool2 = bool1;
      if (i1 >= i2) {
        break;
      }
      View localView = (View)paramArrayList.get(i1);
      if (localView.getParent() != null) {
        bool1 = false;
      }
      if (indexOfChild(localView) >= 0) {
        bool1 = false;
      }
      i1 += 1;
    }
  }
  
  private void b(View paramView)
  {
    try
    {
      View.class.getMethod("dispatchFinishTemporaryDetach", new Class[0]).invoke(paramView, new Object[0]);
      return;
    }
    catch (Exception localException)
    {
      paramView.onFinishTemporaryDetach();
    }
  }
  
  private boolean b()
  {
    int i1 = getChildCount();
    if (i1 == 0) {}
    do
    {
      return true;
      if (i1 != aG) {
        return false;
      }
    } while ((getChildAt(0).getTop() >= jdField_c_of_type_AndroidGraphicsRect.top) && (getChildAt(i1 - 1).getBottom() <= getHeight() - jdField_c_of_type_AndroidGraphicsRect.bottom));
    return false;
  }
  
  private boolean b(int paramInt1, int paramInt2)
  {
    return (aG > 0) && (paramInt1 != -1) && (paramInt1 < paramInt2);
  }
  
  private void c()
  {
    setClickable(true);
    setFocusableInTouchMode(true);
    setWillNotDraw(false);
    setAlwaysDrawnWithCacheEnabled(false);
    setScrollingCacheEnabled(true);
    ViewConfiguration localViewConfiguration = ViewConfiguration.get(getContext());
    t = localViewConfiguration.getScaledTouchSlop();
    jdField_u_of_type_Int = localViewConfiguration.getScaledMinimumFlingVelocity();
    aK = localViewConfiguration.getScaledMaximumFlingVelocity();
    float f1 = getResourcesgetDisplayMetricsdensity;
    a_ = ((int)(0.0F * f1 + 0.5F));
    int i1 = (int)(f1 * 30.0F + 0.5F);
    ar = i1;
    b_ = i1;
    jdField_a_of_type_Float = getContextgetResourcesgetDisplayMetricsdensity;
    setOverScrollMode(0);
    setVerticalFadingEdgeEnabled(false);
  }
  
  private boolean c()
  {
    return (jdField_d_of_type_Boolean) && ((a() instanceof Filterable)) && (((Filterable)a()).getFilter() != null);
  }
  
  private void d()
  {
    setSelector(getResources().getDrawable(17301602));
  }
  
  private void e()
  {
    if (jdField_a_of_type_AndroidViewVelocityTracker == null)
    {
      jdField_a_of_type_AndroidViewVelocityTracker = VelocityTracker.obtain();
      return;
    }
    jdField_a_of_type_AndroidViewVelocityTracker.clear();
  }
  
  private void f()
  {
    if (jdField_a_of_type_AndroidViewVelocityTracker == null) {
      jdField_a_of_type_AndroidViewVelocityTracker = VelocityTracker.obtain();
    }
  }
  
  public long a(int paramInt1, int paramInt2)
  {
    paramInt1 = b(paramInt1, paramInt2);
    if (paramInt1 >= 0) {
      return jdField_a_of_type_AndroidWidgetListAdapter.getItemId(paramInt1);
    }
    return Long.MIN_VALUE;
  }
  
  public Drawable a()
  {
    return jdField_c_of_type_AndroidGraphicsDrawableDrawable;
  }
  
  public SparseBooleanArray a()
  {
    if (S != 0) {
      return jdField_a_of_type_AndroidUtilSparseBooleanArray;
    }
    return null;
  }
  
  ContextMenu.ContextMenuInfo a(View paramView, int paramInt, long paramLong)
  {
    return new AdapterView.AdapterContextMenuInfo(paramView, paramInt, paramLong);
  }
  
  @ViewDebug.ExportedProperty
  public View a()
  {
    if ((aG > 0) && (aF >= 0) && (aF < aG)) {
      return getChildAt(aF - au);
    }
    return null;
  }
  
  public View a(int paramInt, boolean[] paramArrayOfBoolean)
  {
    paramArrayOfBoolean[0] = false;
    View localView2 = jdField_a_of_type_Uab.b(paramInt);
    View localView1;
    if (localView2 != null)
    {
      localView1 = jdField_a_of_type_AndroidWidgetListAdapter.getView(paramInt, localView2, this);
      if (ViewCompat.getImportantForAccessibility(localView1) == 0) {
        ViewCompat.setImportantForAccessibility(localView1, 1);
      }
      if (localView1 != localView2)
      {
        jdField_a_of_type_Uab.a(localView2, paramInt);
        paramArrayOfBoolean = localView1;
        if (an != 0)
        {
          localView1.setDrawingCacheBackgroundColor(an);
          paramArrayOfBoolean = localView1;
        }
      }
    }
    do
    {
      do
      {
        return paramArrayOfBoolean;
        paramArrayOfBoolean[0] = true;
        b(localView1);
        return localView1;
        localView1 = jdField_a_of_type_AndroidWidgetListAdapter.getView(paramInt, null, this);
        if (an != 0) {
          localView1.setDrawingCacheBackgroundColor(an);
        }
        paramArrayOfBoolean = localView1;
      } while (localView1 == null);
      paramArrayOfBoolean = localView1;
    } while (ViewCompat.getImportantForAccessibility(localView1) != 0);
    ViewCompat.setImportantForAccessibility(localView1, 1);
    return localView1;
  }
  
  public AbsListView.LayoutParams a(AttributeSet paramAttributeSet)
  {
    return new AbsListView.LayoutParams(getContext(), paramAttributeSet);
  }
  
  public CharSequence a()
  {
    if ((jdField_d_of_type_Boolean) && (jdField_a_of_type_AndroidWidgetEditText != null)) {
      return jdField_a_of_type_AndroidWidgetEditText.getText();
    }
    return null;
  }
  
  protected tzr a()
  {
    return new tzr(this);
  }
  
  public void a(int paramInt1, int paramInt2, int paramInt3)
  {
    if (jdField_a_of_type_Uaa == null) {
      jdField_a_of_type_Uaa = new uaa(this);
    }
    jdField_a_of_type_Uaa.a(paramInt1, paramInt2, paramInt3);
  }
  
  public void a(int paramInt, View paramView)
  {
    if (paramInt != -1) {
      V = paramInt;
    }
    Rect localRect = jdField_b_of_type_AndroidGraphicsRect;
    localRect.set(paramView.getLeft(), paramView.getTop(), paramView.getRight(), paramView.getBottom());
    if ((paramView instanceof AbsListView.SelectionBoundsAdjuster)) {
      ((AbsListView.SelectionBoundsAdjuster)paramView).a(localRect);
    }
    a(left, top, right, bottom);
    boolean bool = x;
    if (paramView.isEnabled() != bool) {
      if (bool) {
        break label116;
      }
    }
    label116:
    for (bool = true;; bool = false)
    {
      x = bool;
      if (r() != -1) {
        refreshDrawableState();
      }
      return;
    }
  }
  
  protected void a(Canvas paramCanvas, Drawable paramDrawable, int paramInt1, int paramInt2, int paramInt3, int paramInt4)
  {
    paramDrawable.setBounds(paramInt1, mScrollY + paramInt2, paramInt3, mScrollY + paramInt4);
    paramDrawable.draw(paramCanvas);
  }
  
  public void a(List paramList)
  {
    int i2 = getChildCount();
    AbsListView.RecyclerListener localRecyclerListener = uab.a(jdField_a_of_type_Uab);
    int i1 = 0;
    while (i1 < i2)
    {
      View localView = getChildAt(i1);
      AbsListView.LayoutParams localLayoutParams = (AbsListView.LayoutParams)localView.getLayoutParams();
      if ((localLayoutParams != null) && (jdField_a_of_type_Uab.a(jdField_a_of_type_Int)))
      {
        paramList.add(localView);
        if (localRecyclerListener != null) {
          localRecyclerListener.b(localView);
        }
      }
      i1 += 1;
    }
    jdField_a_of_type_Uab.a(paramList);
    removeAllViewsInLayout();
  }
  
  public boolean a(float paramFloat1, float paramFloat2, int paramInt)
  {
    paramInt = b((int)paramFloat1, (int)paramFloat2);
    if (paramInt != -1)
    {
      long l1 = jdField_a_of_type_AndroidWidgetListAdapter.getItemId(paramInt);
      View localView = getChildAt(paramInt - au);
      if (localView != null)
      {
        jdField_a_of_type_AndroidViewContextMenu$ContextMenuInfo = a(localView, paramInt, l1);
        return super.showContextMenuForChild(this);
      }
    }
    return super.showContextMenu();
  }
  
  public boolean a(int paramInt1, int paramInt2)
  {
    int i10 = getChildCount();
    if (i10 == 0) {
      return true;
    }
    b("AbsListView.trackMotionScroll");
    int i7;
    int i8;
    int i3;
    int i2;
    int i9;
    int i1;
    int i4;
    int i5;
    int i11;
    label235:
    boolean bool1;
    label266:
    label318:
    for (;;)
    {
      try
      {
        i7 = getChildAt(0).getTop();
        i8 = getChildAt(i10 - 1).getBottom();
        Rect localRect = jdField_c_of_type_AndroidGraphicsRect;
        i3 = 0;
        i2 = 0;
        if ((mGroupFlags & 0x22) == 34)
        {
          i3 = top;
          i2 = bottom;
        }
        i9 = getHeight();
        i1 = getHeight() - mPaddingBottom - mPaddingTop;
        if (paramInt1 < 0)
        {
          i4 = Math.max(-(i1 - 1), paramInt1);
          if (paramInt2 < 0)
          {
            i5 = Math.max(-(i1 - 1), paramInt2);
            i11 = au;
            if (i11 != 0) {
              continue;
            }
            aM = (i7 - top);
            if (i11 + i10 != aG) {
              break label318;
            }
            aN = (bottom + i8);
            if ((i11 != 0) || (i7 < top) || (i5 < 0)) {
              break label772;
            }
            paramInt1 = 1;
            if ((i11 + i10 != aG) || (i8 > getHeight() - bottom) || (i5 > 0)) {
              break label777;
            }
            paramInt2 = 1;
            break;
            if ((jdField_a_of_type_ComTencentWidgetAbsListView$OnScrollButtomListener != null) && (i5 <= 0)) {
              jdField_a_of_type_ComTencentWidgetAbsListView$OnScrollButtomListener.p(i5);
            }
            if (i5 == 0) {
              break label782;
            }
            bool1 = true;
            return bool1;
          }
        }
        else
        {
          i4 = Math.min(i1 - 1, paramInt1);
          continue;
        }
        i5 = Math.min(i1 - 1, paramInt2);
        continue;
        aM += i5;
        continue;
        aN += i5;
      }
      finally
      {
        B();
      }
    }
    label332:
    int i12;
    int i13;
    label400:
    View localView;
    for (;;)
    {
      boolean bool2 = isInTouchMode();
      if (bool2) {
        n();
      }
      i12 = m();
      i13 = aG - n();
      paramInt2 = 0;
      if (!bool1) {
        break label616;
      }
      paramInt1 = -i5;
      paramInt2 = paramInt1;
      if ((mGroupFlags & 0x22) != 34) {
        break label799;
      }
      paramInt2 = paramInt1 + top;
      break label799;
      if (i1 >= i10) {
        break label806;
      }
      localView = getChildAt(i1);
      if (localView.getBottom() < paramInt2) {
        break;
      }
      break label806;
      label425:
      ad = (ac + i4);
      jdField_s_of_type_Boolean = true;
      if (paramInt1 > 0) {
        detachViewsFromParent(paramInt2, paramInt1);
      }
      offsetChildrenTopAndBottom(i5);
      if (bool1) {
        au = (paramInt1 + au);
      }
      invalidate();
      paramInt1 = Math.abs(i5);
      if ((i3 - i7 < paramInt1) || (i8 - (i9 - i2) < paramInt1)) {
        c(bool1);
      }
      if ((bool2) || (aF == -1)) {
        break label705;
      }
      paramInt1 = aF - au;
      if ((paramInt1 >= 0) && (paramInt1 < getChildCount())) {
        a(aF, getChildAt(paramInt1));
      }
      label557:
      jdField_s_of_type_Boolean = false;
      h();
      awakenScrollBars();
      B();
      return false;
      label576:
      bool1 = false;
    }
    int i6 = i11 + i1;
    if ((i6 >= i12) && (i6 < i13))
    {
      jdField_a_of_type_Uab.a(localView, i6);
      break label811;
      label616:
      paramInt1 = getHeight() - i5;
      i6 = paramInt1;
      if ((mGroupFlags & 0x22) != 34) {
        break label822;
      }
      i6 = paramInt1 - bottom;
      break label822;
    }
    for (;;)
    {
      if (i1 >= 0)
      {
        localView = getChildAt(i1);
        if (localView.getTop() <= i6) {
          break label425;
        }
        paramInt2 = i11 + i1;
        if ((paramInt2 < i12) || (paramInt2 >= i13)) {
          break label832;
        }
        jdField_a_of_type_Uab.a(localView, paramInt2);
        break label832;
        label705:
        if (V != -1)
        {
          paramInt1 = V - au;
          if ((paramInt1 < 0) || (paramInt1 >= getChildCount())) {
            break label557;
          }
          a(-1, getChildAt(paramInt1));
          break label557;
        }
        jdField_b_of_type_AndroidGraphicsRect.setEmpty();
        break label557;
      }
      break label425;
      for (;;)
      {
        if (paramInt1 != 0) {
          break label780;
        }
        if (paramInt2 == 0) {
          break label788;
        }
        break label235;
        label772:
        paramInt1 = 0;
        break;
        label777:
        paramInt2 = 0;
      }
      label780:
      break label235;
      label782:
      bool1 = false;
      break label266;
      label788:
      if (i5 >= 0) {
        break label576;
      }
      bool1 = true;
      break label332;
      label799:
      paramInt1 = 0;
      i1 = 0;
      break label400;
      label806:
      paramInt2 = 0;
      break label425;
      label811:
      i1 += 1;
      paramInt1 += 1;
      break label400;
      label822:
      paramInt1 = 0;
      i1 = i10 - 1;
      continue;
      label832:
      paramInt1 += 1;
      paramInt2 = i1;
      i1 -= 1;
    }
  }
  
  boolean a(int paramInt1, int paramInt2, KeyEvent paramKeyEvent)
  {
    if (!c()) {
      return false;
    }
    boolean bool2;
    boolean bool1;
    Object localObject;
    switch (paramInt1)
    {
    default: 
      bool2 = true;
    case 19: 
    case 20: 
    case 21: 
    case 22: 
    case 23: 
    case 66: 
      for (bool1 = false;; bool1 = false)
      {
        if (bool2)
        {
          a(true);
          if (paramKeyEvent.getRepeatCount() <= 0) {
            break;
          }
          localObject = KeyEvent.changeTimeRepeat(paramKeyEvent, paramKeyEvent.getEventTime(), 0);
        }
        switch (paramKeyEvent.getAction())
        {
        default: 
          return bool1;
          bool2 = false;
        }
      }
    case 4: 
      label118:
      label148:
      if ((jdField_e_of_type_Boolean) && (jdField_a_of_type_AndroidWidgetPopupWindow != null) && (jdField_a_of_type_AndroidWidgetPopupWindow.isShowing())) {
        if ((paramKeyEvent.getAction() == 0) && (paramKeyEvent.getRepeatCount() == 0))
        {
          localObject = getKeyDispatcherState();
          if (localObject != null) {
            ((KeyEvent.DispatcherState)localObject).startTracking(paramKeyEvent, this);
          }
          bool1 = true;
        }
      }
      break;
    }
    for (;;)
    {
      bool2 = false;
      break;
      if ((paramKeyEvent.getAction() == 1) && (paramKeyEvent.isTracking()) && (!paramKeyEvent.isCanceled()))
      {
        jdField_a_of_type_AndroidWidgetEditText.setText("");
        bool1 = true;
        continue;
        bool2 = jdField_e_of_type_Boolean;
        bool1 = false;
        break;
        bool1 = jdField_a_of_type_AndroidWidgetEditText.onKeyDown(paramInt1, (KeyEvent)localObject);
        break label148;
        bool1 = jdField_a_of_type_AndroidWidgetEditText.onKeyUp(paramInt1, (KeyEvent)localObject);
        break label148;
        bool1 = jdField_a_of_type_AndroidWidgetEditText.onKeyMultiple(paramInt1, paramInt2, paramKeyEvent);
        break label148;
        localObject = paramKeyEvent;
        break label118;
      }
      bool1 = false;
    }
  }
  
  public boolean a(View paramView, int paramInt, long paramLong)
  {
    int i1 = 1;
    int i2 = 0;
    if ((b(paramInt, ((ListAdapter)a()).getCount())) && (S != 0)) {
      if ((S == 2) || ((S == 3) && (jdField_a_of_type_AndroidViewActionMode != null))) {
        if (!jdField_a_of_type_AndroidUtilSparseBooleanArray.get(paramInt, false))
        {
          bool1 = true;
          jdField_a_of_type_AndroidUtilSparseBooleanArray.put(paramInt, bool1);
          if ((jdField_a_of_type_ComTencentUtilLongSparseArray != null) && (jdField_a_of_type_AndroidWidgetListAdapter.hasStableIds()))
          {
            if (!bool1) {
              break label213;
            }
            jdField_a_of_type_ComTencentUtilLongSparseArray.a(jdField_a_of_type_AndroidWidgetListAdapter.getItemId(paramInt), Integer.valueOf(paramInt));
          }
          label126:
          if (!bool1) {
            break label233;
          }
          T += 1;
          label141:
          if (jdField_a_of_type_AndroidViewActionMode == null) {
            break label380;
          }
          jdField_a_of_type_Tzy.a(jdField_a_of_type_AndroidViewActionMode, paramInt, paramLong, bool1);
          i1 = i2;
          label167:
          jdField_r_of_type_Boolean = true;
          r();
          requestLayout();
        }
      }
    }
    for (boolean bool1 = true;; bool1 = false)
    {
      boolean bool2 = bool1;
      if (i1 != 0) {
        bool2 = bool1 | super.a(paramView, paramInt, paramLong);
      }
      return bool2;
      bool1 = false;
      break;
      label213:
      jdField_a_of_type_ComTencentUtilLongSparseArray.a(jdField_a_of_type_AndroidWidgetListAdapter.getItemId(paramInt));
      break label126;
      label233:
      T -= 1;
      break label141;
      if (S == 1)
      {
        if (!jdField_a_of_type_AndroidUtilSparseBooleanArray.get(paramInt, false)) {}
        for (i1 = 1;; i1 = 0)
        {
          if (i1 == 0) {
            break label354;
          }
          jdField_a_of_type_AndroidUtilSparseBooleanArray.clear();
          jdField_a_of_type_AndroidUtilSparseBooleanArray.put(paramInt, true);
          if ((jdField_a_of_type_ComTencentUtilLongSparseArray != null) && (jdField_a_of_type_AndroidWidgetListAdapter.hasStableIds()))
          {
            jdField_a_of_type_ComTencentUtilLongSparseArray.a();
            jdField_a_of_type_ComTencentUtilLongSparseArray.a(jdField_a_of_type_AndroidWidgetListAdapter.getItemId(paramInt), Integer.valueOf(paramInt));
          }
          T = 1;
          i1 = 1;
          break;
        }
        label354:
        if ((jdField_a_of_type_AndroidUtilSparseBooleanArray.size() == 0) || (!jdField_a_of_type_AndroidUtilSparseBooleanArray.valueAt(0))) {
          T = 0;
        }
      }
      label380:
      i1 = 1;
      break label167;
    }
  }
  
  public long[] a()
  {
    int i1 = 0;
    Object localObject;
    if ((S == 0) || (jdField_a_of_type_ComTencentUtilLongSparseArray == null) || (jdField_a_of_type_AndroidWidgetListAdapter == null))
    {
      localObject = new long[0];
      return localObject;
    }
    LongSparseArray localLongSparseArray = jdField_a_of_type_ComTencentUtilLongSparseArray;
    int i2 = localLongSparseArray.a();
    long[] arrayOfLong = new long[i2];
    for (;;)
    {
      localObject = arrayOfLong;
      if (i1 >= i2) {
        break;
      }
      arrayOfLong[i1] = localLongSparseArray.a(i1);
      i1 += 1;
    }
  }
  
  protected boolean a_()
  {
    return jdField_e_of_type_Boolean;
  }
  
  public void addChildrenForAccessibility(ArrayList paramArrayList)
  {
    int i2;
    int i1;
    do
    {
      try
      {
        super.addChildrenForAccessibility(paramArrayList);
        return;
      }
      catch (IllegalArgumentException localIllegalArgumentException)
      {
        i2 = getChildCount();
        i1 = 0;
      }
    } while (i1 >= i2);
    View localView = getChildAt(i1);
    if (localView.getVisibility() == 0)
    {
      if (!localView.includeForAccessibility()) {
        break label57;
      }
      paramArrayList.add(localView);
    }
    for (;;)
    {
      i1 += 1;
      break;
      label57:
      localView.addChildrenForAccessibility(paramArrayList);
    }
  }
  
  public void addTouchables(ArrayList paramArrayList)
  {
    int i2 = getChildCount();
    int i3 = au;
    ListAdapter localListAdapter = jdField_a_of_type_AndroidWidgetListAdapter;
    if (localListAdapter == null) {}
    for (;;)
    {
      return;
      int i1 = 0;
      while (i1 < i2)
      {
        View localView = getChildAt(i1);
        if (localListAdapter.isEnabled(i3 + i1)) {
          paramArrayList.add(localView);
        }
        localView.addTouchables(paramArrayList);
        i1 += 1;
      }
    }
  }
  
  public void afterTextChanged(Editable paramEditable) {}
  
  public int b(int paramInt1, int paramInt2)
  {
    Object localObject2 = jdField_a_of_type_AndroidGraphicsRect;
    Object localObject1 = localObject2;
    if (localObject2 == null)
    {
      jdField_a_of_type_AndroidGraphicsRect = new Rect();
      localObject1 = jdField_a_of_type_AndroidGraphicsRect;
    }
    int i1 = getChildCount() - 1;
    while (i1 >= 0)
    {
      localObject2 = getChildAt(i1);
      if ((localObject2 != null) && (((View)localObject2).getVisibility() == 0))
      {
        ((View)localObject2).getHitRect((Rect)localObject1);
        if (((Rect)localObject1).contains(paramInt1, paramInt2)) {
          return au + i1;
        }
      }
      i1 -= 1;
    }
    return -1;
  }
  
  public void b() {}
  
  public void b(int paramInt)
  {
    if (paramInt != jdField_s_of_type_Int)
    {
      jdField_s_of_type_Int = paramInt;
      if (AppSetting.n) {
        if (paramInt == 0) {
          break label48;
        }
      }
    }
    label48:
    for (boolean bool = true;; bool = false)
    {
      ThreadPriorityManager.a(bool);
      if (jdField_a_of_type_ComTencentWidgetAbsListView$OnScrollListener != null) {
        jdField_a_of_type_ComTencentWidgetAbsListView$OnScrollListener.a(this, paramInt);
      }
      return;
    }
  }
  
  protected boolean b(int paramInt1, int paramInt2, int paramInt3, int paramInt4)
  {
    boolean bool = super.setFrame(paramInt1, paramInt2, paramInt3, paramInt4);
    if (bool) {
      if (getWindowVisibility() != 0) {
        break label60;
      }
    }
    label60:
    for (paramInt1 = 1;; paramInt1 = 0)
    {
      if ((jdField_e_of_type_Boolean) && (paramInt1 != 0) && (jdField_a_of_type_AndroidWidgetPopupWindow != null) && (jdField_a_of_type_AndroidWidgetPopupWindow.isShowing())) {
        H();
      }
      return bool;
    }
  }
  
  public boolean b(View paramView, int paramInt, long paramLong)
  {
    boolean bool1 = true;
    if (S == 3)
    {
      bool2 = bool1;
      if (VersionUtils.e())
      {
        bool2 = bool1;
        if (jdField_a_of_type_AndroidViewActionMode == null)
        {
          paramView = startActionMode(jdField_a_of_type_Tzy);
          jdField_a_of_type_AndroidViewActionMode = paramView;
          bool2 = bool1;
          if (paramView != null)
          {
            setItemChecked(paramInt, true);
            performHapticFeedback(0);
            bool2 = bool1;
          }
        }
      }
      return bool2;
    }
    if (jdField_a_of_type_ComTencentWidgetAdapterView$OnItemLongClickListener != null) {}
    for (boolean bool2 = jdField_a_of_type_ComTencentWidgetAdapterView$OnItemLongClickListener.a(this, paramView, paramInt, paramLong);; bool2 = false)
    {
      bool1 = bool2;
      if (!bool2)
      {
        jdField_a_of_type_AndroidViewContextMenu$ContextMenuInfo = a(paramView, paramInt, paramLong);
        bool1 = super.showContextMenuForChild(this);
      }
      bool2 = bool1;
      if (!bool1) {
        break;
      }
      performHapticFeedback(0);
      return bool1;
    }
  }
  
  public void beforeTextChanged(CharSequence paramCharSequence, int paramInt1, int paramInt2, int paramInt3) {}
  
  abstract int c(int paramInt);
  
  public void c(int paramInt1, int paramInt2) {}
  
  abstract void c(boolean paramBoolean);
  
  public boolean c(int paramInt)
  {
    if ((S != 0) && (jdField_a_of_type_AndroidUtilSparseBooleanArray != null)) {
      return jdField_a_of_type_AndroidUtilSparseBooleanArray.get(paramInt);
    }
    return false;
  }
  
  protected boolean c(MotionEvent paramMotionEvent)
  {
    return (VersionUtils.d()) && ((paramMotionEvent.getButtonState() & 0x2) != 0) && (a(paramMotionEvent.getX(), paramMotionEvent.getY(), paramMotionEvent.getMetaState()));
  }
  
  public boolean checkInputConnectionProxy(View paramView)
  {
    return paramView == jdField_a_of_type_AndroidWidgetEditText;
  }
  
  protected boolean checkLayoutParams(ViewGroup.LayoutParams paramLayoutParams)
  {
    return paramLayoutParams instanceof AbsListView.LayoutParams;
  }
  
  public int computeVerticalScrollExtent()
  {
    int i3 = getChildCount();
    if (i3 > 0)
    {
      if (jdField_c_of_type_Boolean)
      {
        int i2 = i3 * 100;
        View localView = getChildAt(0);
        int i4 = localView.getTop();
        int i5 = localView.getHeight();
        int i1 = i2;
        if (i5 > 0) {
          i1 = i2 + i4 * 100 / i5;
        }
        localView = getChildAt(i3 - 1);
        i3 = localView.getBottom();
        i4 = localView.getHeight();
        i2 = i1;
        if (i4 > 0) {
          i2 = i1 - (i3 - getHeight()) * 100 / i4;
        }
        return i2;
      }
      return 1;
    }
    return 0;
  }
  
  public int computeVerticalScrollOffset()
  {
    int i3 = 0;
    int i2 = 0;
    int i4 = au;
    int i5 = getChildCount();
    int i1 = i2;
    if (i4 >= 0)
    {
      i1 = i2;
      if (i5 > 0)
      {
        if (!jdField_c_of_type_Boolean) {
          break label91;
        }
        View localView = getChildAt(0);
        i3 = localView.getTop();
        i5 = localView.getHeight();
        i1 = i2;
        if (i5 > 0) {
          i1 = Math.max(i4 * 100 - i3 * 100 / i5, 0);
        }
      }
    }
    return i1;
    label91:
    i2 = aG;
    if (i4 == 0) {
      i1 = i3;
    }
    for (;;)
    {
      float f1 = i4;
      float f2 = i5;
      return (int)(i1 / i2 * f2 + f1);
      if (i4 + i5 == i2) {
        i1 = i2;
      } else {
        i1 = i5 / 2 + i4;
      }
    }
  }
  
  public int computeVerticalScrollRange()
  {
    if (jdField_c_of_type_Boolean) {
      return Math.max(aG * 100, 0);
    }
    return aG;
  }
  
  int d(int paramInt)
  {
    int i2 = getChildCount();
    if (i2 == 0) {
      paramInt = -1;
    }
    int i1;
    do
    {
      return paramInt;
      i1 = c(paramInt);
      paramInt = i1;
    } while (i1 != -1);
    return au + i2 - 1;
  }
  
  public void d(int paramInt)
  {
    if (jdField_a_of_type_Tzv == null) {
      jdField_a_of_type_Tzv = new tzv(this);
    }
    jdField_a_of_type_Tzv.b(paramInt);
  }
  
  public void d(int paramInt1, int paramInt2)
  {
    if (jdField_a_of_type_Uaa == null) {
      jdField_a_of_type_Uaa = new uaa(this);
    }
    jdField_a_of_type_Uaa.b(paramInt1, paramInt2);
  }
  
  public boolean d()
  {
    return (jdField_k_of_type_Boolean) && (jdField_a_of_type_ComTencentWidgetFastScroller.a());
  }
  
  protected boolean d(int paramInt)
  {
    boolean bool1 = super.onConsistencyCheck(paramInt);
    if ((paramInt & 0x1) != 0) {}
    boolean bool2;
    for (paramInt = 1;; paramInt = 0)
    {
      bool2 = bool1;
      if (paramInt == 0) {
        break label121;
      }
      localObject = uab.a(jdField_a_of_type_Uab);
      i1 = localObject.length;
      paramInt = 0;
      while (paramInt < i1)
      {
        if (localObject[paramInt] != null) {
          bool1 = false;
        }
        paramInt += 1;
      }
    }
    if (!a(uab.a(jdField_a_of_type_Uab))) {
      bool1 = false;
    }
    Object localObject = uab.a(jdField_a_of_type_Uab);
    int i1 = localObject.length;
    paramInt = 0;
    for (;;)
    {
      bool2 = bool1;
      if (paramInt >= i1) {
        break;
      }
      if (!a(localObject[paramInt])) {
        bool1 = false;
      }
      paramInt += 1;
    }
    label121:
    return bool2;
  }
  
  protected void dispatchDraw(Canvas paramCanvas)
  {
    int i2 = 0;
    if ((mGroupFlags & 0x22) == 34) {}
    for (int i1 = 1;; i1 = 0)
    {
      if (i1 != 0)
      {
        i2 = paramCanvas.save();
        int i3 = getScrollX();
        int i4 = getScrollY();
        paramCanvas.clipRect(mPaddingLeft + i3, mPaddingTop + i4, i3 + mRight - mLeft - mPaddingRight, i4 + mBottom - mTop - mPaddingBottom);
        mGroupFlags &= 0xFFFFFFDD;
      }
      boolean bool = jdField_f_of_type_Boolean;
      if (!bool) {
        a(paramCanvas);
      }
      super.dispatchDraw(paramCanvas);
      if (bool) {
        a(paramCanvas);
      }
      if (i1 != 0)
      {
        paramCanvas.restoreToCount(i2);
        mGroupFlags |= 0x22;
      }
      return;
    }
  }
  
  protected void dispatchSetPressed(boolean paramBoolean) {}
  
  public boolean dispatchTouchEvent(MotionEvent paramMotionEvent)
  {
    boolean bool = super.dispatchTouchEvent(paramMotionEvent);
    if (C) {
      switch (paramMotionEvent.getAction() & 0xFF)
      {
      }
    }
    do
    {
      do
      {
        return bool;
      } while ((ag != -1) || (Math.abs(mScrollY) <= t));
      if (jdField_a_of_type_Tzv == null) {
        jdField_a_of_type_Tzv = new tzv(this);
      }
      int i1 = 0;
      if (l) {
        i1 = l();
      }
      jdField_a_of_type_Tzv.b(i1);
    } while (!QLog.isColorLevel());
    QLog.i("ListViewOverScroll", 2, "dispatchTouchEvent, springback, mScrollY = " + mScrollY);
    return bool;
  }
  
  public void draw(Canvas paramCanvas)
  {
    super.draw(paramCanvas);
    int i1;
    int i2;
    if (jdField_a_of_type_ComTencentWidgetEdgeEffect != null)
    {
      i1 = mScrollY;
      int i3;
      int i4;
      int i5;
      if (!jdField_a_of_type_ComTencentWidgetEdgeEffect.a())
      {
        i2 = paramCanvas.save();
        i3 = jdField_c_of_type_AndroidGraphicsRect.left + aP;
        i4 = jdField_c_of_type_AndroidGraphicsRect.right;
        i5 = aQ;
        int i6 = getWidth();
        paramCanvas.translate(i3, Math.min(0, aM + i1));
        jdField_a_of_type_ComTencentWidgetEdgeEffect.a(i6 - i3 - (i4 + i5), getHeight());
        if (jdField_a_of_type_ComTencentWidgetEdgeEffect.a(paramCanvas)) {
          invalidate();
        }
        paramCanvas.restoreToCount(i2);
      }
      if (!jdField_b_of_type_ComTencentWidgetEdgeEffect.a())
      {
        i2 = paramCanvas.save();
        i3 = jdField_c_of_type_AndroidGraphicsRect.left + aP;
        i4 = jdField_c_of_type_AndroidGraphicsRect.right;
        i5 = aQ;
        i4 = getWidth() - i3 - (i4 + i5);
        i5 = getHeight();
        paramCanvas.translate(i3 + -i4, Math.max(i5, i1 + aN));
        paramCanvas.rotate(180.0F, i4, 0.0F);
        jdField_b_of_type_ComTencentWidgetEdgeEffect.a(i4, i5);
        if (jdField_b_of_type_ComTencentWidgetEdgeEffect.a(paramCanvas)) {
          invalidate();
        }
        paramCanvas.restoreToCount(i2);
      }
    }
    if (jdField_a_of_type_ComTencentWidgetFastScroller != null)
    {
      i1 = mScrollY;
      if (i1 != 0)
      {
        i2 = paramCanvas.save();
        paramCanvas.translate(0.0F, i1);
        jdField_a_of_type_ComTencentWidgetFastScroller.a(paramCanvas);
        paramCanvas.restoreToCount(i2);
      }
    }
    else
    {
      return;
    }
    jdField_a_of_type_ComTencentWidgetFastScroller.a(paramCanvas);
  }
  
  protected void drawableStateChanged()
  {
    super.drawableStateChanged();
    m();
  }
  
  public int e()
  {
    return T;
  }
  
  public void e(int paramInt)
  {
    if (jdField_a_of_type_Uaa == null) {
      jdField_a_of_type_Uaa = new uaa(this);
    }
    jdField_a_of_type_Uaa.a(paramInt);
  }
  
  public void e(int paramInt1, int paramInt2)
  {
    if (jdField_a_of_type_Uaa == null) {
      jdField_a_of_type_Uaa = new uaa(this);
    }
    jdField_a_of_type_Uaa.a(paramInt1, paramInt2);
  }
  
  @ViewDebug.ExportedProperty
  public boolean e()
  {
    return jdField_k_of_type_Boolean;
  }
  
  public int f()
  {
    if ((S == 1) && (jdField_a_of_type_AndroidUtilSparseBooleanArray != null) && (jdField_a_of_type_AndroidUtilSparseBooleanArray.size() == 1)) {
      return jdField_a_of_type_AndroidUtilSparseBooleanArray.keyAt(0);
    }
    return -1;
  }
  
  void f(int paramInt)
  {
    int i1;
    if (paramInt < 0) {
      i1 = s();
    }
    for (;;)
    {
      int i2;
      float f1;
      if (i1 > -1)
      {
        View localView = getChildAt(i1 - s());
        if (localView != null)
        {
          Rect localRect = new Rect();
          i2 = i1;
          if (localView.getGlobalVisibleRect(localRect))
          {
            i2 = localView.getWidth();
            int i3 = localView.getHeight();
            int i4 = localRect.width();
            f1 = localRect.height() * i4 / (i3 * i2);
            if ((paramInt >= 0) || (f1 >= 0.75F)) {
              break label140;
            }
            i2 = i1 + 1;
          }
        }
      }
      for (;;)
      {
        e(Math.max(0, Math.min(c_(), i2 + paramInt)));
        return;
        if (paramInt <= 0) {
          break label166;
        }
        i1 = t();
        break;
        label140:
        i2 = i1;
        if (paramInt > 0)
        {
          i2 = i1;
          if (f1 < 0.75F) {
            i2 = i1 - 1;
          }
        }
      }
      label166:
      i1 = -1;
    }
  }
  
  public void f(int paramInt1, int paramInt2)
  {
    if (jdField_a_of_type_Tzv == null) {
      jdField_a_of_type_Tzv = new tzv(this);
    }
    int i1 = au;
    int i2 = getChildCount();
    int i3 = mPaddingTop;
    int i4 = getHeight();
    int i5 = mPaddingBottom;
    if ((paramInt1 == 0) || (aG == 0) || (i2 == 0) || ((i1 == 0) && (getChildAt(0).getTop() == i3) && (paramInt1 < 0)) || ((i1 + i2 - 1 == aG - 1) && (getChildAt(i2 - 1).getBottom() == i4 - i5) && (paramInt1 > 0)))
    {
      jdField_a_of_type_Tzv.a();
      if (jdField_a_of_type_Uaa != null) {
        jdField_a_of_type_Uaa.a();
      }
      if (jdField_a_of_type_Tzx != null) {
        jdField_a_of_type_Tzx.b();
      }
      return;
    }
    b(2);
    jdField_a_of_type_Tzv.a(paramInt1, paramInt2);
  }
  
  protected boolean f()
  {
    return (jdField_a_of_type_ComTencentWidgetFastScroller != null) && (jdField_a_of_type_ComTencentWidgetFastScroller.b());
  }
  
  public int g()
  {
    return S;
  }
  
  public void g()
  {
    if (jdField_a_of_type_AndroidUtilSparseBooleanArray != null) {
      jdField_a_of_type_AndroidUtilSparseBooleanArray.clear();
    }
    if (jdField_a_of_type_ComTencentUtilLongSparseArray != null) {
      jdField_a_of_type_ComTencentUtilLongSparseArray.a();
    }
    T = 0;
  }
  
  abstract void g(int paramInt);
  
  @ViewDebug.ExportedProperty
  public boolean g()
  {
    return jdField_c_of_type_Boolean;
  }
  
  protected ViewGroup.LayoutParams generateDefaultLayoutParams()
  {
    return new AbsListView.LayoutParams(-1, -2, 0);
  }
  
  protected ViewGroup.LayoutParams generateLayoutParams(ViewGroup.LayoutParams paramLayoutParams)
  {
    return new AbsListView.LayoutParams(paramLayoutParams);
  }
  
  protected float getBottomFadingEdgeStrength()
  {
    int i1 = getChildCount();
    float f1 = super.getBottomFadingEdgeStrength();
    if (i1 == 0) {}
    int i2;
    float f2;
    do
    {
      return f1;
      if (au + i1 - 1 < aG - 1) {
        return 1.0F;
      }
      i1 = getChildAt(i1 - 1).getBottom();
      i2 = getHeight();
      f2 = getVerticalFadingEdgeLength();
    } while (i1 <= i2 - mPaddingBottom);
    return (i1 - i2 + mPaddingBottom) / f2;
  }
  
  protected int getBottomPaddingOffset()
  {
    if ((mGroupFlags & 0x22) == 34) {
      return 0;
    }
    return mPaddingBottom;
  }
  
  protected ContextMenu.ContextMenuInfo getContextMenuInfo()
  {
    return jdField_a_of_type_AndroidViewContextMenu$ContextMenuInfo;
  }
  
  public void getFocusedRect(Rect paramRect)
  {
    View localView = a();
    if ((localView != null) && (localView.getParent() == this))
    {
      localView.getFocusedRect(paramRect);
      offsetDescendantRectToMyCoords(localView, paramRect);
      return;
    }
    super.getFocusedRect(paramRect);
  }
  
  protected int getLeftPaddingOffset()
  {
    if ((mGroupFlags & 0x22) == 34) {
      return 0;
    }
    return -getPaddingLeft();
  }
  
  public int getOverScrollMode()
  {
    return aU;
  }
  
  protected int getRightPaddingOffset()
  {
    if ((mGroupFlags & 0x22) == 34) {
      return 0;
    }
    return mPaddingRight;
  }
  
  public int getSolidColor()
  {
    return an;
  }
  
  protected float getTopFadingEdgeStrength()
  {
    int i1 = getChildCount();
    float f1 = super.getTopFadingEdgeStrength();
    if (i1 == 0) {}
    float f2;
    do
    {
      return f1;
      if (au > 0) {
        return 1.0F;
      }
      i1 = getChildAt(0).getTop();
      f2 = getVerticalFadingEdgeLength();
    } while (i1 >= mPaddingTop);
    return -(i1 - mPaddingTop) / f2;
  }
  
  protected int getTopPaddingOffset()
  {
    if ((mGroupFlags & 0x22) == 34) {
      return 0;
    }
    return -getPaddingTop();
  }
  
  public int getVerticalScrollbarWidth()
  {
    if (d()) {
      return Math.max(super.getVerticalScrollbarWidth(), jdField_a_of_type_ComTencentWidgetFastScroller.a());
    }
    return super.getVerticalScrollbarWidth();
  }
  
  public int h()
  {
    return jdField_c_of_type_AndroidGraphicsRect.top;
  }
  
  void h()
  {
    if (jdField_a_of_type_ComTencentWidgetFastScroller != null) {
      jdField_a_of_type_ComTencentWidgetFastScroller.a(this, au, getChildCount(), aG);
    }
    if (jdField_a_of_type_ComTencentWidgetAbsListView$OnScrollListener != null) {
      jdField_a_of_type_ComTencentWidgetAbsListView$OnScrollListener.a(this, au, getChildCount(), aG);
    }
    onScrollChanged(0, 0, 0, 0);
  }
  
  @ViewDebug.ExportedProperty
  public boolean h()
  {
    return jdField_j_of_type_Boolean;
  }
  
  public int i()
  {
    return jdField_c_of_type_AndroidGraphicsRect.bottom;
  }
  
  void i()
  {
    if (getChildCount() > 0)
    {
      j();
      requestLayout();
      invalidate();
    }
  }
  
  @ViewDebug.ExportedProperty
  public boolean i()
  {
    return jdField_d_of_type_Boolean;
  }
  
  public void invalidateDrawable(Drawable paramDrawable)
  {
    if (verifyDrawable(paramDrawable)) {
      invalidate(paramDrawable.getBounds());
    }
  }
  
  protected boolean isPaddingOffsetRequired()
  {
    return (mGroupFlags & 0x22) != 34;
  }
  
  public int j()
  {
    return jdField_c_of_type_AndroidGraphicsRect.left;
  }
  
  void j()
  {
    removeAllViewsInLayout();
    au = 0;
    jdField_r_of_type_Boolean = true;
    p = false;
    aJ = -1;
    jdField_f_of_type_Long = Long.MIN_VALUE;
    h(-1);
    i(-1);
    aj = 0;
    V = -1;
    jdField_b_of_type_AndroidGraphicsRect.setEmpty();
    invalidate();
  }
  
  @ViewDebug.ExportedProperty
  public boolean j()
  {
    return jdField_i_of_type_Boolean;
  }
  
  public void jumpDrawablesToCurrentState()
  {
    super.jumpDrawablesToCurrentState();
    if (jdField_c_of_type_AndroidGraphicsDrawableDrawable != null) {
      jdField_c_of_type_AndroidGraphicsDrawableDrawable.jumpToCurrentState();
    }
  }
  
  public int k()
  {
    return jdField_c_of_type_AndroidGraphicsRect.right;
  }
  
  void k()
  {
    int i4 = 1;
    int i3 = 0;
    int i1;
    int i2;
    label56:
    View localView;
    if (jdField_e_of_type_AndroidViewView != null)
    {
      if (au > 0)
      {
        i1 = 1;
        i2 = i1;
        if (i1 == 0)
        {
          i2 = i1;
          if (getChildCount() > 0)
          {
            if (getChildAt(0).getTop() >= jdField_c_of_type_AndroidGraphicsRect.top) {
              break label161;
            }
            i2 = 1;
          }
        }
        localView = jdField_e_of_type_AndroidViewView;
        if (i2 == 0) {
          break label166;
        }
        i1 = 0;
        label68:
        localView.setVisibility(i1);
      }
    }
    else if (jdField_f_of_type_AndroidViewView != null)
    {
      i2 = getChildCount();
      if (au + i2 >= aG) {
        break label171;
      }
      i1 = 1;
      label101:
      if ((i1 != 0) || (i2 <= 0)) {
        break label186;
      }
      if (getChildAt(i2 - 1).getBottom() <= mBottom - jdField_c_of_type_AndroidGraphicsRect.bottom) {
        break label176;
      }
      i1 = i4;
    }
    label137:
    label161:
    label166:
    label171:
    label176:
    label186:
    for (;;)
    {
      localView = jdField_f_of_type_AndroidViewView;
      if (i1 != 0) {}
      for (i1 = i3;; i1 = 4)
      {
        localView.setVisibility(i1);
        return;
        i1 = 0;
        break;
        i2 = 0;
        break label56;
        i1 = 4;
        break label68;
        i1 = 0;
        break label101;
        i1 = 0;
        break label137;
      }
    }
  }
  
  boolean k()
  {
    switch (ag)
    {
    default: 
      return false;
    }
    return true;
  }
  
  public int l()
  {
    return 0;
  }
  
  void l()
  {
    if ((!isEnabled()) || (!isClickable())) {}
    for (;;)
    {
      return;
      Drawable localDrawable = jdField_c_of_type_AndroidGraphicsDrawableDrawable;
      Object localObject = jdField_b_of_type_AndroidGraphicsRect;
      if ((localDrawable != null) && ((isFocused()) || (k())) && (!((Rect)localObject).isEmpty()))
      {
        localObject = getChildAt(aF - au);
        if (localObject != null)
        {
          if (!((View)localObject).hasFocusable()) {
            ((View)localObject).setPressed(true);
          }
        }
        else
        {
          setPressed(true);
          boolean bool = isLongClickable();
          localDrawable = localDrawable.getCurrent();
          if ((localDrawable != null) && ((localDrawable instanceof TransitionDrawable)))
          {
            if (!bool) {
              break label172;
            }
            ((TransitionDrawable)localDrawable).startTransition(ViewConfiguration.getLongPressTimeout());
          }
          while ((bool) && (!jdField_r_of_type_Boolean))
          {
            if (jdField_a_of_type_Tzs == null) {
              jdField_a_of_type_Tzs = new tzs(this, null);
            }
            jdField_a_of_type_Tzs.a();
            postDelayed(jdField_a_of_type_Tzs, ViewConfiguration.getLongPressTimeout());
            return;
            label172:
            ((TransitionDrawable)localDrawable).resetTransition();
          }
        }
      }
    }
  }
  
  public boolean l()
  {
    return ((hasFocus()) && (!isInTouchMode())) || (k());
  }
  
  int m()
  {
    return 0;
  }
  
  void m()
  {
    if (jdField_c_of_type_AndroidGraphicsDrawableDrawable != null)
    {
      if (l()) {
        jdField_c_of_type_AndroidGraphicsDrawableDrawable.setState(getDrawableState());
      }
    }
    else {
      return;
    }
    jdField_c_of_type_AndroidGraphicsDrawableDrawable.setState(jdField_b_of_type_ArrayOfInt);
  }
  
  boolean m()
  {
    if ((aF < 0) && (n()))
    {
      m();
      return true;
    }
    return false;
  }
  
  int n()
  {
    return 0;
  }
  
  void n()
  {
    if (aF != -1)
    {
      if (U != 4) {
        ak = aF;
      }
      if ((aE >= 0) && (aE != aF)) {
        ak = aE;
      }
      h(-1);
      i(-1);
      aj = 0;
    }
  }
  
  boolean n()
  {
    boolean bool2 = true;
    int i7 = getChildCount();
    if (i7 <= 0) {
      return false;
    }
    int i1 = jdField_c_of_type_AndroidGraphicsRect.top;
    int i2 = mBottom - mTop - jdField_c_of_type_AndroidGraphicsRect.bottom;
    int i6 = au;
    int i3 = ak;
    View localView;
    int i4;
    int i5;
    boolean bool1;
    if ((i3 >= i6) && (i3 < i6 + i7))
    {
      localView = getChildAt(i3 - au);
      i4 = localView.getTop();
      i5 = localView.getBottom();
      if (i4 < i1) {
        i1 = getVerticalFadingEdgeLength() + i1;
      }
      for (;;)
      {
        bool1 = true;
        i2 = i3;
        ak = -1;
        removeCallbacks(jdField_a_of_type_Tzv);
        if (jdField_a_of_type_Uaa != null) {
          jdField_a_of_type_Uaa.a();
        }
        if (jdField_a_of_type_Tzx != null) {
          jdField_a_of_type_Tzx.b();
        }
        ag = -1;
        E();
        av = i1;
        i1 = a(i2, bool1);
        if ((i1 < i6) || (i1 > t())) {
          break;
        }
        U = 4;
        m();
        g(i1);
        h();
        label208:
        b(0);
        if (i1 < 0) {
          break label445;
        }
        bool1 = bool2;
        label221:
        return bool1;
        i1 = i4;
        if (i5 > i2) {
          i1 = i2 - localView.getMeasuredHeight() - getVerticalFadingEdgeLength();
        }
      }
    }
    if (i3 < i6)
    {
      i4 = 0;
      i2 = 0;
      label260:
      if (i4 >= i7) {
        break label491;
      }
      i3 = getChildAt(i4).getTop();
      if (i4 != 0) {
        break label488;
      }
      if ((i6 <= 0) && (i3 >= i1)) {
        break label483;
      }
      i1 = getVerticalFadingEdgeLength() + i1;
      i2 = i3;
      label301:
      if (i3 >= i1) {
        i1 = i6 + i4;
      }
    }
    for (;;)
    {
      bool1 = true;
      i2 = i1;
      i1 = i3;
      break;
      i4 += 1;
      break label260;
      int i8 = aG;
      i4 = i7 - 1;
      i1 = 0;
      label345:
      if (i4 >= 0)
      {
        localView = getChildAt(i4);
        i3 = localView.getTop();
        int i9 = localView.getBottom();
        if (i4 == i7 - 1) {
          if ((i6 + i7 < i8) || (i9 > i2))
          {
            i1 = i2 - getVerticalFadingEdgeLength();
            i2 = i3;
          }
        }
        for (;;)
        {
          if (i9 <= i1)
          {
            i1 = i3;
            i2 = i6 + i4;
            bool1 = false;
            break;
          }
          i4 -= 1;
          i3 = i1;
          i1 = i2;
          i2 = i3;
          break label345;
          i1 = -1;
          break label208;
          label445:
          bool1 = false;
          break label221;
          i1 = i2;
          i2 = i3;
          continue;
          i5 = i1;
          i1 = i2;
          i2 = i5;
        }
      }
      i2 = i6 + i7 - 1;
      bool1 = false;
      break;
      label483:
      i2 = i3;
      break label301;
      label488:
      break label301;
      label491:
      i1 = i6;
      i3 = i2;
    }
  }
  
  int o()
  {
    int i2 = aF;
    int i1 = i2;
    if (i2 < 0) {
      i1 = ak;
    }
    return Math.min(Math.max(0, i1), aG - 1);
  }
  
  public void o()
  {
    jdField_r_of_type_Boolean = true;
    r();
    requestLayout();
    invalidate();
  }
  
  public boolean o()
  {
    return jdField_e_of_type_Boolean;
  }
  
  protected void onAttachedToWindow()
  {
    super.onAttachedToWindow();
    ViewTreeObserver localViewTreeObserver = getViewTreeObserver();
    localViewTreeObserver.addOnTouchModeChangeListener(this);
    if ((jdField_d_of_type_Boolean) && (jdField_a_of_type_AndroidWidgetPopupWindow != null) && (!y)) {
      localViewTreeObserver.addOnGlobalLayoutListener(this);
    }
    if ((jdField_a_of_type_AndroidWidgetListAdapter != null) && (jdField_a_of_type_Tzr == null))
    {
      jdField_a_of_type_Tzr = a();
      jdField_a_of_type_AndroidWidgetListAdapter.registerDataSetObserver(jdField_a_of_type_Tzr);
      jdField_r_of_type_Boolean = true;
      aH = aG;
      aG = jdField_a_of_type_AndroidWidgetListAdapter.getCount();
      requestLayout();
    }
    n = true;
  }
  
  protected int[] onCreateDrawableState(int paramInt)
  {
    Object localObject;
    if (x)
    {
      localObject = super.onCreateDrawableState(paramInt);
      return localObject;
    }
    int i1 = ENABLED_STATE_SET[0];
    int[] arrayOfInt = super.onCreateDrawableState(paramInt + 1);
    paramInt = arrayOfInt.length - 1;
    label36:
    if (paramInt >= 0) {
      if (arrayOfInt[paramInt] != i1) {}
    }
    for (;;)
    {
      localObject = arrayOfInt;
      if (paramInt < 0) {
        break;
      }
      System.arraycopy(arrayOfInt, paramInt + 1, arrayOfInt, paramInt, arrayOfInt.length - paramInt - 1);
      return arrayOfInt;
      paramInt -= 1;
      break label36;
      paramInt = -1;
    }
  }
  
  public InputConnection onCreateInputConnection(EditorInfo paramEditorInfo)
  {
    if (i())
    {
      a(false);
      if (jdField_a_of_type_AndroidViewInputmethodInputConnectionWrapper == null)
      {
        jdField_a_of_type_AndroidViewInputmethodInputConnection = new BaseInputConnection(this, false);
        jdField_a_of_type_AndroidViewInputmethodInputConnectionWrapper = new tzq(this, jdField_a_of_type_AndroidWidgetEditText.onCreateInputConnection(paramEditorInfo), true);
      }
      inputType = 177;
      imeOptions = 6;
      return jdField_a_of_type_AndroidViewInputmethodInputConnectionWrapper;
    }
    return null;
  }
  
  public void onDetachedFromWindow()
  {
    super.onDetachedFromWindow();
    F();
    try
    {
      jdField_a_of_type_Uab.b();
      ViewTreeObserver localViewTreeObserver = getViewTreeObserver();
      localViewTreeObserver.removeOnTouchModeChangeListener(this);
      if ((jdField_d_of_type_Boolean) && (jdField_a_of_type_AndroidWidgetPopupWindow != null))
      {
        localViewTreeObserver.removeGlobalOnLayoutListener(this);
        y = false;
      }
      if (jdField_a_of_type_AndroidWidgetListAdapter != null)
      {
        jdField_a_of_type_AndroidWidgetListAdapter.unregisterDataSetObserver(jdField_a_of_type_Tzr);
        jdField_a_of_type_Tzr = null;
      }
      if (jdField_a_of_type_JavaLangObject != null) {
        jdField_a_of_type_JavaLangObject = a(jdField_a_of_type_JavaLangObject);
      }
      if (jdField_b_of_type_JavaLangObject != null) {
        jdField_b_of_type_JavaLangObject = a(jdField_b_of_type_JavaLangObject);
      }
      if (jdField_a_of_type_Tzv != null) {
        removeCallbacks(jdField_a_of_type_Tzv);
      }
      if (jdField_a_of_type_Uaa != null) {
        jdField_a_of_type_Uaa.a();
      }
      if (jdField_a_of_type_Tzx != null) {
        jdField_a_of_type_Tzx.b();
      }
      if (jdField_c_of_type_JavaLangRunnable != null) {
        removeCallbacks(jdField_c_of_type_JavaLangRunnable);
      }
      if (jdField_a_of_type_Tzz != null) {
        removeCallbacks(jdField_a_of_type_Tzz);
      }
      if (jdField_b_of_type_JavaLangRunnable != null)
      {
        removeCallbacks(jdField_b_of_type_JavaLangRunnable);
        jdField_b_of_type_JavaLangRunnable = null;
      }
      n = false;
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
  
  protected void onDisplayHint(int paramInt)
  {
    super.onDisplayHint(paramInt);
    switch (paramInt)
    {
    default: 
      if (paramInt != 4) {
        break;
      }
    }
    for (boolean bool = true;; bool = false)
    {
      z = bool;
      return;
      if ((jdField_a_of_type_AndroidWidgetPopupWindow == null) || (!jdField_a_of_type_AndroidWidgetPopupWindow.isShowing())) {
        break;
      }
      F();
      break;
      if ((!jdField_e_of_type_Boolean) || (jdField_a_of_type_AndroidWidgetPopupWindow == null) || (jdField_a_of_type_AndroidWidgetPopupWindow.isShowing())) {
        break;
      }
      G();
      break;
    }
  }
  
  public void onFilterComplete(int paramInt)
  {
    if ((aF < 0) && (paramInt > 0))
    {
      ak = -1;
      n();
    }
  }
  
  protected void onFocusChanged(boolean paramBoolean, int paramInt, Rect paramRect)
  {
    super.onFocusChanged(paramBoolean, paramInt, paramRect);
    if ((paramBoolean) && (aF < 0) && (!isInTouchMode()))
    {
      if ((!n) && (jdField_a_of_type_AndroidWidgetListAdapter != null))
      {
        jdField_r_of_type_Boolean = true;
        aH = aG;
        aG = jdField_a_of_type_AndroidWidgetListAdapter.getCount();
      }
      n();
    }
  }
  
  public boolean onGenericMotionEvent(MotionEvent paramMotionEvent)
  {
    if ((paramMotionEvent.getSource() & 0x2) != 0) {
      switch (paramMotionEvent.getAction())
      {
      }
    }
    int i1;
    do
    {
      float f1;
      do
      {
        do
        {
          return super.onGenericMotionEvent(paramMotionEvent);
        } while (ag != -1);
        f1 = paramMotionEvent.getAxisValue(9);
      } while (f1 == 0.0F);
      i1 = (int)(f1 * b());
    } while (a(i1, i1));
    return true;
  }
  
  public void onGlobalLayout()
  {
    if (isShown()) {
      if ((jdField_e_of_type_Boolean) && (jdField_a_of_type_AndroidWidgetPopupWindow != null) && (!jdField_a_of_type_AndroidWidgetPopupWindow.isShowing()) && (!z)) {
        G();
      }
    }
    while ((jdField_a_of_type_AndroidWidgetPopupWindow == null) || (!jdField_a_of_type_AndroidWidgetPopupWindow.isShowing())) {
      return;
    }
    F();
  }
  
  public void onInitializeAccessibilityEvent(AccessibilityEvent paramAccessibilityEvent)
  {
    super.onInitializeAccessibilityEvent(paramAccessibilityEvent);
    paramAccessibilityEvent.setClassName(android.widget.AbsListView.class.getName());
  }
  
  public void onInitializeAccessibilityNodeInfo(AccessibilityNodeInfo paramAccessibilityNodeInfo)
  {
    super.onInitializeAccessibilityNodeInfo(paramAccessibilityNodeInfo);
    paramAccessibilityNodeInfo.setClassName(android.widget.AbsListView.class.getName());
    if (isEnabled())
    {
      if (s() > 0) {
        paramAccessibilityNodeInfo.addAction(8192);
      }
      if (t() < c_() - 1) {
        paramAccessibilityNodeInfo.addAction(4096);
      }
    }
  }
  
  public boolean onInterceptTouchEvent(MotionEvent paramMotionEvent)
  {
    boolean bool = false;
    int i1 = paramMotionEvent.getAction();
    if ((jdField_a_of_type_ComTencentWidgetFastScroller != null) && (jdField_a_of_type_ComTencentWidgetFastScroller.a(paramMotionEvent))) {
      bool = true;
    }
    do
    {
      do
      {
        return bool;
        switch (i1 & 0xFF)
        {
        case 4: 
        case 5: 
        default: 
          return false;
        case 0: 
          i1 = ag;
          if ((i1 == 6) || (i1 == 5))
          {
            ai = 0;
            return true;
          }
          i2 = (int)paramMotionEvent.getX();
          int i3 = (int)paramMotionEvent.getY();
          aL = paramMotionEvent.getPointerId(0);
          int i4 = d(i3);
          if ((i1 != 4) && (i4 >= 0))
          {
            ac = getChildAt(i4 - au).getTop();
            ae = i2;
            af = i3;
            ab = i4;
            ag = 0;
            E();
          }
          ah = Integer.MIN_VALUE;
          e();
          jdField_a_of_type_AndroidViewVelocityTracker.addMovement(paramMotionEvent);
        }
      } while (i1 != 4);
      return true;
      switch (ag)
      {
      default: 
        return false;
      }
      int i2 = paramMotionEvent.findPointerIndex(aL);
      i1 = i2;
      if (i2 == -1)
      {
        aL = paramMotionEvent.getPointerId(0);
        i1 = 0;
      }
      if (jdField_r_of_type_Boolean) {
        b();
      }
      i1 = (int)paramMotionEvent.getY(i1);
      f();
      jdField_a_of_type_AndroidViewVelocityTracker.addMovement(paramMotionEvent);
    } while (!a(i1));
    return true;
    ag = -1;
    aL = -1;
    C();
    b(0);
    return false;
    a(paramMotionEvent);
    return false;
  }
  
  public boolean onKeyDown(int paramInt, KeyEvent paramKeyEvent)
  {
    return false;
  }
  
  public boolean onKeyUp(int paramInt, KeyEvent paramKeyEvent)
  {
    boolean bool = true;
    switch (paramInt)
    {
    }
    do
    {
      bool = super.onKeyUp(paramInt, paramKeyEvent);
      do
      {
        return bool;
      } while (!isEnabled());
    } while ((!isClickable()) || (!isPressed()) || (aF < 0) || (jdField_a_of_type_AndroidWidgetListAdapter == null) || (aF >= jdField_a_of_type_AndroidWidgetListAdapter.getCount()));
    paramKeyEvent = getChildAt(aF - au);
    if (paramKeyEvent != null)
    {
      a(paramKeyEvent, aF, jdField_d_of_type_Long);
      paramKeyEvent.setPressed(false);
    }
    setPressed(false);
    return true;
  }
  
  protected void onLayout(boolean paramBoolean, int paramInt1, int paramInt2, int paramInt3, int paramInt4)
  {
    int i1 = 0;
    b("AbsListView.onLayout");
    try
    {
      super.onLayout(paramBoolean, paramInt1, paramInt2, paramInt3, paramInt4);
      jdField_q_of_type_Boolean = true;
      if (paramBoolean)
      {
        paramInt3 = getChildCount();
        paramInt1 = i1;
        while (paramInt1 < paramInt3)
        {
          getChildAt(paramInt1).forceLayout();
          paramInt1 += 1;
        }
        jdField_a_of_type_Uab.a();
      }
      if ((jdField_a_of_type_ComTencentWidgetFastScroller != null) && (aG != aH)) {
        jdField_a_of_type_ComTencentWidgetFastScroller.a(aH, aG);
      }
      b();
      jdField_q_of_type_Boolean = false;
      al = ((paramInt4 - paramInt2) / 3);
      if (m)
      {
        if (jdField_a_of_type_Tzx == null) {
          jdField_a_of_type_Tzx = new tzx(this);
        }
        jdField_a_of_type_Tzx.a();
      }
      return;
    }
    finally
    {
      B();
    }
  }
  
  protected void onMeasure(int paramInt1, int paramInt2)
  {
    if (jdField_c_of_type_AndroidGraphicsDrawableDrawable == null) {
      d();
    }
    Object localObject = jdField_c_of_type_AndroidGraphicsRect;
    left = (W + mPaddingLeft);
    top = (X + mPaddingTop);
    right = (Y + mPaddingRight);
    bottom = (Z + mPaddingBottom);
    if (jdField_r_of_type_Int == 1)
    {
      int i1 = getChildCount();
      if (i1 > 0)
      {
        paramInt2 = getHeight() - mPaddingBottom;
        localObject = getChildAt(i1 - 1);
        if (localObject == null) {
          break label148;
        }
        paramInt1 = ((View)localObject).getBottom();
        if ((i1 + au < aT) || (paramInt1 > paramInt2)) {
          break label153;
        }
      }
    }
    label148:
    label153:
    for (boolean bool = true;; bool = false)
    {
      A = bool;
      return;
      paramInt1 = paramInt2;
      break;
    }
  }
  
  protected void onOverScrolled(int paramInt1, int paramInt2, boolean paramBoolean1, boolean paramBoolean2)
  {
    if (getScrollY() != paramInt2)
    {
      onScrollChanged(getScrollX(), paramInt2, getScrollX(), getScrollY());
      mScrollY = paramInt2;
      z();
      awakenScrollBars();
    }
  }
  
  public void onRestoreInstanceState(Parcelable paramParcelable)
  {
    paramParcelable = (AbsListView.SavedState)paramParcelable;
    super.onRestoreInstanceState(paramParcelable.getSuperState());
    jdField_r_of_type_Boolean = true;
    jdField_b_of_type_Long = jdField_c_of_type_Int;
    if (jdField_a_of_type_Long >= 0L)
    {
      p = true;
      jdField_a_of_type_Long = jdField_a_of_type_Long;
      ax = jdField_b_of_type_Int;
      av = jdField_a_of_type_Int;
      aw = jdField_a_of_type_Int;
      ay = 0;
    }
    for (;;)
    {
      setFilterText(jdField_a_of_type_JavaLangString);
      if (jdField_a_of_type_AndroidUtilSparseBooleanArray != null) {
        jdField_a_of_type_AndroidUtilSparseBooleanArray = jdField_a_of_type_AndroidUtilSparseBooleanArray;
      }
      if (jdField_a_of_type_ComTencentUtilLongSparseArray != null) {
        jdField_a_of_type_ComTencentUtilLongSparseArray = jdField_a_of_type_ComTencentUtilLongSparseArray;
      }
      T = jdField_d_of_type_Int;
      if ((VersionUtils.e()) && (jdField_a_of_type_Boolean) && (S == 3) && (jdField_a_of_type_Tzy != null)) {
        jdField_a_of_type_AndroidViewActionMode = startActionMode(jdField_a_of_type_Tzy);
      }
      requestLayout();
      return;
      if (jdField_b_of_type_Long >= 0L)
      {
        h(-1);
        i(-1);
        V = -1;
        if (jdField_b_of_type_Int != Integer.MAX_VALUE)
        {
          p = true;
          jdField_a_of_type_Long = jdField_b_of_type_Long;
          if (!jdField_i_of_type_Boolean)
          {
            ax = jdField_b_of_type_Int;
            av = jdField_a_of_type_Int;
            ay = 1;
          }
          else
          {
            ax = jdField_b_of_type_Int;
            aw = jdField_a_of_type_Int;
            ay = 2;
          }
        }
      }
    }
  }
  
  public Parcelable onSaveInstanceState()
  {
    boolean bool = true;
    int i3 = 0;
    F();
    AbsListView.SavedState localSavedState = new AbsListView.SavedState(super.onSaveInstanceState());
    int i1;
    Object localObject;
    if ((getChildCount() > 0) && (aG > 0))
    {
      i1 = 1;
      jdField_c_of_type_Int = az;
      if (aF < 0) {
        break label288;
      }
      jdField_a_of_type_Long = jdField_c_of_type_Long;
      if (i1 != 0)
      {
        jdField_b_of_type_Int = r();
        localObject = getChildAt(aF - au);
        if (localObject != null)
        {
          if (!jdField_i_of_type_Boolean) {
            break label279;
          }
          i1 = az - ((View)localObject).getBottom();
          label114:
          jdField_a_of_type_Int = i1;
        }
        jdField_b_of_type_Long = -1L;
      }
      label128:
      jdField_a_of_type_JavaLangString = null;
      if (jdField_e_of_type_Boolean)
      {
        localObject = jdField_a_of_type_AndroidWidgetEditText;
        if (localObject != null)
        {
          localObject = ((EditText)localObject).getText();
          if (localObject != null) {
            jdField_a_of_type_JavaLangString = localObject.toString();
          }
        }
      }
      if ((S != 3) || (jdField_a_of_type_AndroidViewActionMode == null)) {
        break label553;
      }
    }
    for (;;)
    {
      jdField_a_of_type_Boolean = bool;
      if (jdField_a_of_type_AndroidUtilSparseBooleanArray != null) {
        jdField_a_of_type_AndroidUtilSparseBooleanArray = jdField_a_of_type_AndroidUtilSparseBooleanArray.clone();
      }
      if (jdField_a_of_type_ComTencentUtilLongSparseArray == null) {
        break label566;
      }
      localObject = new LongSparseArray();
      int i2 = jdField_a_of_type_ComTencentUtilLongSparseArray.a();
      i1 = i3;
      while (i1 < i2)
      {
        ((LongSparseArray)localObject).a(jdField_a_of_type_ComTencentUtilLongSparseArray.a(i1), jdField_a_of_type_ComTencentUtilLongSparseArray.a(i1));
        i1 += 1;
      }
      i1 = 0;
      break;
      label279:
      i1 = ((View)localObject).getTop();
      break label114;
      label288:
      if (!jdField_i_of_type_Boolean)
      {
        if ((i1 != 0) && (au >= 0))
        {
          jdField_a_of_type_Int = getChildAt(0).getTop();
          i2 = au;
          i1 = i2;
          if (i2 >= aG) {
            i1 = aG - 1;
          }
          jdField_b_of_type_Int = i1;
          jdField_b_of_type_Long = jdField_a_of_type_AndroidWidgetListAdapter.getItemId(i1);
          break label128;
        }
        jdField_a_of_type_Int = 0;
        jdField_b_of_type_Long = -1L;
        jdField_b_of_type_Int = 0;
        break label128;
      }
      if ((i1 != 0) && (au >= 0))
      {
        i2 = getChildCount();
        if (au == -1)
        {
          i1 = -1;
          label414:
          localObject = getChildAt(i2 - 1);
          jdField_a_of_type_Int = (az - ((View)localObject).getBottom());
          i2 = i1;
          if (i1 >= aG) {
            i2 = aG - 1;
          }
          if ((((View)localObject).getBottom() > az - jdField_c_of_type_AndroidGraphicsRect.bottom) || (jdField_r_of_type_Int != 1)) {
            break label521;
          }
        }
        label521:
        for (jdField_b_of_type_Int = Integer.MAX_VALUE;; jdField_b_of_type_Int = i2)
        {
          jdField_b_of_type_Long = jdField_a_of_type_AndroidWidgetListAdapter.getItemId(i2);
          break;
          i1 = au + i2 - 1;
          break label414;
        }
      }
      jdField_a_of_type_Int = 0;
      jdField_b_of_type_Long = -1L;
      jdField_b_of_type_Int = 0;
      break label128;
      label553:
      bool = false;
    }
    jdField_a_of_type_ComTencentUtilLongSparseArray = ((LongSparseArray)localObject);
    label566:
    jdField_d_of_type_Int = T;
    return localSavedState;
  }
  
  protected void onSizeChanged(int paramInt1, int paramInt2, int paramInt3, int paramInt4)
  {
    if (getChildCount() > 0)
    {
      jdField_r_of_type_Boolean = true;
      r();
    }
    if (jdField_a_of_type_ComTencentWidgetFastScroller != null) {
      jdField_a_of_type_ComTencentWidgetFastScroller.a(paramInt1, paramInt2, paramInt3, paramInt4);
    }
  }
  
  public void onTextChanged(CharSequence paramCharSequence, int paramInt1, int paramInt2, int paramInt3)
  {
    boolean bool;
    if ((jdField_a_of_type_AndroidWidgetPopupWindow != null) && (i()))
    {
      paramInt1 = paramCharSequence.length();
      bool = jdField_a_of_type_AndroidWidgetPopupWindow.isShowing();
      if ((bool) || (paramInt1 <= 0)) {
        break label85;
      }
      G();
    }
    for (jdField_e_of_type_Boolean = true;; jdField_e_of_type_Boolean = false)
    {
      label85:
      do
      {
        if ((jdField_a_of_type_AndroidWidgetListAdapter instanceof Filterable))
        {
          Filter localFilter = ((Filterable)jdField_a_of_type_AndroidWidgetListAdapter).getFilter();
          if (localFilter == null) {
            break;
          }
          localFilter.filter(paramCharSequence, this);
        }
        return;
      } while ((!bool) || (paramInt1 != 0));
      F();
    }
    throw new IllegalStateException("You cannot call onTextChanged with a non filterable adapter");
  }
  
  public boolean onTouchEvent(MotionEvent paramMotionEvent)
  {
    boolean bool2 = true;
    int i1 = 0;
    boolean bool1;
    if (!isEnabled()) {
      if ((isClickable()) || (isLongClickable())) {
        bool1 = true;
      }
    }
    do
    {
      for (;;)
      {
        return bool1;
        bool1 = false;
      }
      if (jdField_a_of_type_ComTencentWidgetFastScroller == null) {
        break;
      }
      bool1 = bool2;
    } while (jdField_a_of_type_ComTencentWidgetFastScroller.b(paramMotionEvent));
    int i2 = paramMotionEvent.getAction();
    f();
    jdField_a_of_type_AndroidViewVelocityTracker.addMovement(paramMotionEvent);
    int i3;
    switch (i2 & 0xFF)
    {
    case 4: 
    default: 
      return true;
    case 0: 
      switch (ag)
      {
      default: 
        aL = paramMotionEvent.getPointerId(0);
        i2 = (int)paramMotionEvent.getX();
        i3 = (int)paramMotionEvent.getY();
        i1 = b(i2, getScrollY() + i3);
        if (!jdField_r_of_type_Boolean) {
          if ((ag != 4) && (i1 >= 0) && (((ListAdapter)a()).isEnabled(i1)))
          {
            ag = 0;
            if (jdField_a_of_type_JavaLangRunnable == null) {
              jdField_a_of_type_JavaLangRunnable = new tzu(this);
            }
            postDelayed(jdField_a_of_type_JavaLangRunnable, ViewConfiguration.getTapTimeout());
          }
        }
        break;
      }
      break;
    }
    for (;;)
    {
      if (i1 >= 0) {
        ac = getChildAt(i1 - au).getTop();
      }
      ae = i2;
      af = i3;
      ab = i1;
      ah = Integer.MIN_VALUE;
      for (;;)
      {
        bool1 = bool2;
        if (!c(paramMotionEvent)) {
          break;
        }
        bool1 = bool2;
        if (ag != 0) {
          break;
        }
        removeCallbacks(jdField_a_of_type_JavaLangRunnable);
        return true;
        jdField_a_of_type_Tzv.a();
        if (jdField_a_of_type_Uaa != null) {
          jdField_a_of_type_Uaa.a();
        }
        if (jdField_a_of_type_Tzx != null) {
          jdField_a_of_type_Tzx.b();
        }
        ag = 5;
        ae = ((int)paramMotionEvent.getX());
        i1 = (int)paramMotionEvent.getY();
        ah = i1;
        af = i1;
        ai = 0;
        aL = paramMotionEvent.getPointerId(0);
        aO = 0;
      }
      if (ag == 4)
      {
        D();
        jdField_a_of_type_Tzv.a();
        ag = 3;
        ai = 0;
        i1 = c(i3);
        jdField_a_of_type_Tzv.b();
        continue;
        i2 = paramMotionEvent.findPointerIndex(aL);
        if (i2 == -1) {
          aL = paramMotionEvent.getPointerId(0);
        }
        for (;;)
        {
          if (jdField_r_of_type_Boolean) {
            b();
          }
          i1 = (int)paramMotionEvent.getY(i1);
          switch (ag)
          {
          case 4: 
          default: 
            return true;
          case 0: 
          case 1: 
          case 2: 
            a(i1);
            return true;
          }
          a(i1);
          return true;
          switch (ag)
          {
          case 4: 
          default: 
          case 0: 
          case 1: 
          case 2: 
          case 3: 
            for (;;)
            {
              setPressed(false);
              if (jdField_a_of_type_ComTencentWidgetEdgeEffect != null)
              {
                jdField_a_of_type_ComTencentWidgetEdgeEffect.b();
                jdField_b_of_type_ComTencentWidgetEdgeEffect.b();
              }
              invalidate();
              paramMotionEvent = getHandler();
              if (paramMotionEvent != null) {
                paramMotionEvent.removeCallbacks(jdField_a_of_type_Tzt);
              }
              C();
              aL = -1;
              bool1 = bool2;
              if (jdField_a_of_type_JavaLangObject == null) {
                break;
              }
              jdField_a_of_type_JavaLangObject = a(jdField_a_of_type_JavaLangObject);
              return true;
              i2 = ab;
              localObject = getChildAt(i2 - au);
              f1 = paramMotionEvent.getX();
              tzz localTzz;
              Handler localHandler;
              if ((f1 > jdField_c_of_type_AndroidGraphicsRect.left) && (f1 < getWidth() - jdField_c_of_type_AndroidGraphicsRect.right))
              {
                i1 = 1;
                if (jdField_a_of_type_Tzz == null) {
                  jdField_a_of_type_Tzz = new tzz(this, null);
                }
                localTzz = jdField_a_of_type_Tzz;
                jdField_a_of_type_Int = i2;
                localTzz.a();
                if ((localObject == null) || (((View)localObject).hasFocusable()) || (i1 == 0)) {
                  break label1082;
                }
                if (ag != 0) {
                  ((View)localObject).setPressed(false);
                }
                ak = i2;
                if ((ag != 0) && (ag != 1)) {
                  break label1044;
                }
                localHandler = getHandler();
                if (localHandler != null) {
                  if (ag != 0) {
                    break label1025;
                  }
                }
              }
              label1025:
              for (paramMotionEvent = jdField_a_of_type_JavaLangRunnable;; paramMotionEvent = jdField_a_of_type_Tzt)
              {
                localHandler.removeCallbacks(paramMotionEvent);
                U = 0;
                if ((jdField_r_of_type_Boolean) || (!jdField_a_of_type_AndroidWidgetListAdapter.isEnabled(i2))) {
                  break label1033;
                }
                ag = 1;
                h(ab);
                b();
                ((View)localObject).setPressed(true);
                a(ab, (View)localObject);
                setPressed(true);
                if (jdField_c_of_type_AndroidGraphicsDrawableDrawable != null)
                {
                  paramMotionEvent = jdField_c_of_type_AndroidGraphicsDrawableDrawable.getCurrent();
                  if ((paramMotionEvent != null) && ((paramMotionEvent instanceof TransitionDrawable))) {
                    ((TransitionDrawable)paramMotionEvent).resetTransition();
                  }
                }
                if (jdField_b_of_type_JavaLangRunnable != null) {
                  removeCallbacks(jdField_b_of_type_JavaLangRunnable);
                }
                jdField_b_of_type_JavaLangRunnable = new tzo(this, (View)localObject, localTzz);
                postDelayed(jdField_b_of_type_JavaLangRunnable, ViewConfiguration.getPressedStateDuration());
                return true;
                i1 = 0;
                break;
              }
              label1033:
              ag = -1;
              m();
              return true;
              label1044:
              if ((!jdField_r_of_type_Boolean) && (jdField_a_of_type_AndroidWidgetListAdapter.isEnabled(i2))) {
                localTzz.run();
              }
              for (;;)
              {
                ag = -1;
                m();
                break;
                label1082:
                localTzz.run();
              }
              i1 = getChildCount();
              if (i1 > 0)
              {
                i2 = getChildAt(0).getTop();
                i3 = getChildAt(i1 - 1).getBottom();
                int i4 = jdField_c_of_type_AndroidGraphicsRect.top;
                int i5 = getHeight() - jdField_c_of_type_AndroidGraphicsRect.bottom;
                if ((au == 0) && (i2 >= i4) && (au + i1 < aG) && (i3 <= getHeight() - i5))
                {
                  ag = -1;
                  b(0);
                }
                else
                {
                  paramMotionEvent = jdField_a_of_type_AndroidViewVelocityTracker;
                  paramMotionEvent.computeCurrentVelocity(1000, aK);
                  if (VersionUtils.b()) {}
                  for (f1 = paramMotionEvent.getYVelocity(aL);; f1 = paramMotionEvent.getYVelocity())
                  {
                    int i6 = (int)(f1 * jdField_b_of_type_Float);
                    if ((Math.abs(i6) <= jdField_u_of_type_Int) || ((au == 0) && (i2 == i4 - a_)) || ((i1 + au == aG) && (i3 == a_ + i5))) {
                      break label1338;
                    }
                    if (jdField_a_of_type_Tzv == null) {
                      jdField_a_of_type_Tzv = new tzv(this);
                    }
                    b(2);
                    jdField_a_of_type_Tzv.a(-i6);
                    break;
                  }
                  label1338:
                  ag = -1;
                  b(0);
                  if (jdField_a_of_type_Tzv != null) {
                    jdField_a_of_type_Tzv.a();
                  }
                  if (jdField_a_of_type_Uaa != null) {
                    jdField_a_of_type_Uaa.a();
                  }
                  if (jdField_a_of_type_Tzx != null) {
                    jdField_a_of_type_Tzx.b();
                  }
                }
              }
              else
              {
                ag = -1;
                b(0);
              }
            }
          }
          if (jdField_a_of_type_Tzv == null) {
            jdField_a_of_type_Tzv = new tzv(this);
          }
          b(2);
          jdField_a_of_type_Tzv.b(l());
          Object localObject = jdField_a_of_type_AndroidViewVelocityTracker;
          ((VelocityTracker)localObject).computeCurrentVelocity(1000, aK);
          if (VersionUtils.b()) {}
          for (float f1 = ((VelocityTracker)localObject).getYVelocity(aL);; f1 = ((VelocityTracker)localObject).getYVelocity())
          {
            c((int)(f1 * jdField_b_of_type_Float), (int)paramMotionEvent.getY());
            break;
          }
          switch (ag)
          {
          default: 
            ag = -1;
            setPressed(false);
            paramMotionEvent = getChildAt(ab - au);
            if (paramMotionEvent != null) {
              paramMotionEvent.setPressed(false);
            }
            E();
            paramMotionEvent = getHandler();
            if (paramMotionEvent != null) {
              paramMotionEvent.removeCallbacks(jdField_a_of_type_Tzt);
            }
            C();
          }
          for (;;)
          {
            if (jdField_a_of_type_ComTencentWidgetEdgeEffect != null)
            {
              jdField_a_of_type_ComTencentWidgetEdgeEffect.b();
              jdField_b_of_type_ComTencentWidgetEdgeEffect.b();
            }
            aL = -1;
            return true;
            if (jdField_a_of_type_Tzv == null) {
              jdField_a_of_type_Tzv = new tzv(this);
            }
            jdField_a_of_type_Tzv.b(0);
          }
          bool1 = bool2;
          if (!VersionUtils.b()) {
            break;
          }
          a(paramMotionEvent);
          i2 = ae;
          i1 = af;
          i2 = b(i2, i1);
          if (i2 >= 0)
          {
            ac = getChildAt(i2 - au).getTop();
            ab = i2;
          }
          ah = i1;
          return true;
          bool1 = bool2;
          if (!VersionUtils.b()) {
            break;
          }
          i3 = paramMotionEvent.getActionIndex();
          i1 = paramMotionEvent.getPointerId(i3);
          i2 = (int)paramMotionEvent.getX(i3);
          i3 = (int)paramMotionEvent.getY(i3);
          ai = 0;
          aL = i1;
          ae = i2;
          af = i3;
          i1 = b(i2, i3);
          if (i1 >= 0)
          {
            ac = getChildAt(i1 - au).getTop();
            ab = i1;
          }
          ah = i3;
          return true;
          i1 = i2;
        }
      }
    }
  }
  
  public void onTouchModeChanged(boolean paramBoolean)
  {
    if (paramBoolean)
    {
      n();
      if ((getHeight() > 0) && (getChildCount() > 0)) {
        b();
      }
      m();
    }
    do
    {
      int i1;
      do
      {
        return;
        i1 = ag;
      } while ((i1 != 5) && (i1 != 6));
      if ((jdField_a_of_type_Tzv != null) && (mScrollY == 0)) {
        jdField_a_of_type_Tzv.a();
      }
      if (jdField_a_of_type_Uaa != null) {
        jdField_a_of_type_Uaa.a();
      }
      if (jdField_a_of_type_Tzx != null) {
        jdField_a_of_type_Tzx.b();
      }
    } while (getScrollY() == 0);
    mScrollY = 0;
    A();
    I();
    invalidate();
  }
  
  public void onWindowFocusChanged(boolean paramBoolean)
  {
    super.onWindowFocusChanged(paramBoolean);
    int i1;
    if (isInTouchMode())
    {
      i1 = 0;
      if (paramBoolean) {
        break label133;
      }
      if (!l)
      {
        setChildrenDrawingCacheEnabled(false);
        if (jdField_a_of_type_Tzv != null)
        {
          removeCallbacks(jdField_a_of_type_Tzv);
          jdField_a_of_type_Tzv.a();
          if (jdField_a_of_type_Uaa != null) {
            jdField_a_of_type_Uaa.a();
          }
          if (jdField_a_of_type_Tzx != null) {
            jdField_a_of_type_Tzx.b();
          }
          if (getScrollY() != 0)
          {
            mScrollY = 0;
            A();
            I();
            invalidate();
          }
        }
        F();
        if (i1 == 1) {
          ak = aF;
        }
      }
    }
    for (;;)
    {
      jdField_q_of_type_Int = i1;
      return;
      i1 = 1;
      break;
      label133:
      if ((jdField_e_of_type_Boolean) && (!z)) {
        G();
      }
      if ((i1 != jdField_q_of_type_Int) && (jdField_q_of_type_Int != -1)) {
        if (i1 == 1)
        {
          n();
        }
        else
        {
          n();
          U = 0;
          b();
        }
      }
    }
  }
  
  public boolean overScrollBy(int paramInt1, int paramInt2, int paramInt3, int paramInt4, int paramInt5, int paramInt6, int paramInt7, int paramInt8, boolean paramBoolean)
  {
    int i3 = aU;
    int i1;
    int i2;
    if (computeHorizontalScrollRange() > computeHorizontalScrollExtent())
    {
      i1 = 1;
      if (computeVerticalScrollRange() <= computeVerticalScrollExtent()) {
        break label186;
      }
      i2 = 1;
      label34:
      if ((i3 != 0) && ((i3 != 1) || (i1 == 0))) {
        break label192;
      }
      i1 = 1;
      label53:
      if ((i3 != 0) && ((i3 != 1) || (i2 == 0))) {
        break label198;
      }
      i2 = 1;
      label72:
      paramInt1 = paramInt3 + paramInt1;
      if (i1 == 0) {
        paramInt7 = 0;
      }
      paramInt2 = paramInt4 + paramInt2;
      if (i2 == 0) {
        paramInt8 = 0;
      }
      paramInt4 = -paramInt7;
      paramInt7 += paramInt5;
      paramInt3 = -paramInt8;
      paramInt5 = paramInt8 + paramInt6;
      if (paramInt1 <= paramInt7) {
        break label204;
      }
      paramInt1 = paramInt7;
      paramBoolean = true;
    }
    for (;;)
    {
      label132:
      boolean bool = false;
      if (paramInt2 > paramInt5)
      {
        bool = true;
        paramInt2 = paramInt5;
      }
      label186:
      label192:
      label198:
      label204:
      label234:
      for (;;)
      {
        if ((!l) || (paramInt2 <= 0)) {
          onOverScrolled(paramInt1, paramInt2, paramBoolean, bool);
        }
        if ((paramBoolean) || (bool))
        {
          return true;
          i1 = 0;
          break;
          i2 = 0;
          break label34;
          i1 = 0;
          break label53;
          i2 = 0;
          break label72;
          if (paramInt1 >= paramInt4) {
            break label237;
          }
          paramBoolean = true;
          paramInt1 = paramInt4;
          break label132;
          if (paramInt2 >= paramInt3) {
            break label234;
          }
          bool = true;
          paramInt2 = paramInt3;
          continue;
        }
        return false;
      }
      label237:
      paramBoolean = false;
    }
  }
  
  public int p()
  {
    return jdField_r_of_type_Int;
  }
  
  void p()
  {
    jdField_a_of_type_AndroidUtilSparseBooleanArray.clear();
    int i1 = 0;
    int i2 = 0;
    long l1;
    int i5;
    int i3;
    if (i1 < jdField_a_of_type_ComTencentUtilLongSparseArray.a())
    {
      l1 = jdField_a_of_type_ComTencentUtilLongSparseArray.a(i1);
      i5 = ((Integer)jdField_a_of_type_ComTencentUtilLongSparseArray.a(i1)).intValue();
      if (l1 != jdField_a_of_type_AndroidWidgetListAdapter.getItemId(i5))
      {
        i3 = Math.max(0, i5 - 20);
        i4 = Math.min(i5 + 20, aG);
        label89:
        if (i3 >= i4) {
          break label251;
        }
        if (l1 == jdField_a_of_type_AndroidWidgetListAdapter.getItemId(i3))
        {
          jdField_a_of_type_AndroidUtilSparseBooleanArray.put(i3, true);
          jdField_a_of_type_ComTencentUtilLongSparseArray.a(i1, Integer.valueOf(i3));
        }
      }
    }
    label251:
    for (int i4 = 1;; i4 = 0)
    {
      i3 = i1;
      if (i4 == 0)
      {
        jdField_a_of_type_ComTencentUtilLongSparseArray.a(l1);
        T -= 1;
        if ((jdField_a_of_type_AndroidViewActionMode != null) && (jdField_a_of_type_Tzy != null)) {
          jdField_a_of_type_Tzy.a(jdField_a_of_type_AndroidViewActionMode, i5, l1, false);
        }
        i3 = i1 - 1;
        i2 = 1;
      }
      for (i1 = i2;; i1 = i2)
      {
        i2 = i1;
        i1 = i3 + 1;
        break;
        i3 += 1;
        break label89;
        jdField_a_of_type_AndroidUtilSparseBooleanArray.put(i5, true);
        i3 = i1;
      }
      if ((i2 != 0) && (jdField_a_of_type_AndroidViewActionMode != null)) {
        jdField_a_of_type_AndroidViewActionMode.invalidate();
      }
      return;
    }
  }
  
  public boolean performAccessibilityAction(int paramInt, Bundle paramBundle)
  {
    if (super.performAccessibilityAction(paramInt, paramBundle)) {
      return true;
    }
    switch (paramInt)
    {
    default: 
      return false;
    case 4096: 
      if ((isEnabled()) && (t() < c_() - 1))
      {
        f(getHeight() - jdField_c_of_type_AndroidGraphicsRect.top - jdField_c_of_type_AndroidGraphicsRect.bottom, 400);
        return true;
      }
      return false;
    }
    if ((isEnabled()) && (au > 0))
    {
      f(-(getHeight() - jdField_c_of_type_AndroidGraphicsRect.top - jdField_c_of_type_AndroidGraphicsRect.bottom), 400);
      return true;
    }
    return false;
  }
  
  @ViewDebug.ExportedProperty(category="drawing")
  public int q()
  {
    return an;
  }
  
  protected void q()
  {
    int i3 = aG;
    int i4 = aT;
    aT = aG;
    if ((S != 0) && (jdField_a_of_type_AndroidWidgetListAdapter != null) && (jdField_a_of_type_AndroidWidgetListAdapter.hasStableIds())) {
      p();
    }
    if (i3 > 0)
    {
      if (p)
      {
        p = false;
        if (jdField_r_of_type_Int == 2) {
          m = true;
        }
      }
      else
      {
        switch (ay)
        {
        default: 
          label108:
          if (!isInTouchMode())
          {
            i2 = r();
            i1 = i2;
            if (i2 >= i3) {
              i1 = i3 - 1;
            }
            i2 = i1;
            if (i1 < 0) {
              i2 = 0;
            }
            i1 = a(i2, true);
            if (i1 >= 0) {
              i(i1);
            }
          }
          break;
        }
      }
      while (ak >= 0)
      {
        return;
        if (jdField_r_of_type_Int != 1) {
          break;
        }
        if (A)
        {
          A = false;
          m = true;
          break;
        }
        if (getChildCount() <= 0) {
          break;
        }
        int i5 = getChildCount();
        int i2 = getHeight() - mPaddingBottom;
        View localView = getChildAt(i5 - 1);
        if (localView != null) {}
        for (i1 = localView.getBottom(); (i5 + au >= i4) && (i1 <= i2); i1 = i2)
        {
          U = 3;
          return;
        }
        if (isInTouchMode())
        {
          U = 5;
          ax = Math.min(Math.max(0, ax), i3 - 1);
          return;
        }
        i1 = u();
        if ((i1 < 0) || (a(i1, true) != i1)) {
          break label108;
        }
        ax = i1;
        if (jdField_b_of_type_Long == getHeight()) {}
        for (U = 5;; U = 2)
        {
          i(i1);
          return;
        }
        U = 5;
        ax = Math.min(Math.max(0, ax), i3 - 1);
        return;
        U = 5;
        ax = Math.max(Math.min(ax, i3 - 1), 0);
        return;
        i1 = a(i2, false);
        if (i1 < 0) {
          break label415;
        }
        i(i1);
        return;
      }
    }
    label415:
    if (jdField_i_of_type_Boolean) {}
    for (int i1 = 3;; i1 = 1)
    {
      U = i1;
      aF = -1;
      jdField_d_of_type_Long = Long.MIN_VALUE;
      aE = -1;
      jdField_c_of_type_Long = Long.MIN_VALUE;
      p = false;
      V = -1;
      y();
      return;
    }
  }
  
  public void r()
  {
    int i1 = -1;
    if (getChildCount() > 0)
    {
      p = true;
      jdField_b_of_type_Long = az;
      if (aF >= 0)
      {
        localObject1 = getChildAt(aF - au);
        jdField_a_of_type_Long = jdField_c_of_type_Long;
        ax = aE;
        if (localObject1 != null)
        {
          av = ((View)localObject1).getTop();
          aw = (az - ((View)localObject1).getBottom());
        }
        ay = 0;
      }
    }
    else
    {
      return;
    }
    Object localObject2;
    if (((mScrollY == 0) && (!jdField_i_of_type_Boolean)) || (mScrollY < 0))
    {
      localObject1 = getChildAt(0);
      localObject2 = (ListAdapter)a();
      if ((au >= 0) && (au < ((ListAdapter)localObject2).getCount())) {}
      for (jdField_a_of_type_Long = ((ListAdapter)localObject2).getItemId(au);; jdField_a_of_type_Long = -1L)
      {
        ax = au;
        if (localObject1 != null)
        {
          av = ((View)localObject1).getTop();
          aw = (az - ((View)localObject1).getBottom());
        }
        ay = 1;
        return;
      }
    }
    Object localObject1 = (ListAdapter)a();
    int i2 = getChildCount();
    if (au == -1)
    {
      localObject2 = getChildAt(i2 - 1);
      if ((i1 < 0) || (i1 >= ((ListAdapter)localObject1).getCount())) {
        break label318;
      }
    }
    label318:
    for (jdField_a_of_type_Long = ((ListAdapter)localObject1).getItemId(i1);; jdField_a_of_type_Long = -1L)
    {
      ax = i1;
      if (localObject2 != null)
      {
        av = ((View)localObject2).getTop();
        aw = (az - ((View)localObject2).getBottom());
      }
      ay = 2;
      return;
      i1 = au + i2 - 1;
      break;
    }
  }
  
  public void requestDisallowInterceptTouchEvent(boolean paramBoolean)
  {
    if (paramBoolean) {
      C();
    }
    super.requestDisallowInterceptTouchEvent(paramBoolean);
  }
  
  public void requestLayout()
  {
    if ((!jdField_s_of_type_Boolean) && (!jdField_q_of_type_Boolean))
    {
      r();
      super.requestLayout();
    }
  }
  
  public void s()
  {
    if (jdField_e_of_type_Boolean)
    {
      jdField_a_of_type_AndroidWidgetEditText.setText("");
      jdField_e_of_type_Boolean = false;
      if ((jdField_a_of_type_AndroidWidgetPopupWindow != null) && (jdField_a_of_type_AndroidWidgetPopupWindow.isShowing())) {
        F();
      }
    }
  }
  
  public void sendAccessibilityEvent(int paramInt)
  {
    if (paramInt == 4096)
    {
      int i1 = s();
      int i2 = t();
      if ((aR == i1) && (aS == i2)) {
        return;
      }
      aR = i1;
      aS = i2;
    }
    super.sendAccessibilityEvent(paramInt);
  }
  
  public void setAdapter(ListAdapter paramListAdapter)
  {
    if ((paramListAdapter != null) && (S != 0) && (jdField_a_of_type_AndroidWidgetListAdapter.hasStableIds()) && (jdField_a_of_type_ComTencentUtilLongSparseArray == null)) {
      jdField_a_of_type_ComTencentUtilLongSparseArray = new LongSparseArray();
    }
    if (jdField_a_of_type_AndroidUtilSparseBooleanArray != null) {
      jdField_a_of_type_AndroidUtilSparseBooleanArray.clear();
    }
    if (jdField_a_of_type_ComTencentUtilLongSparseArray != null) {
      jdField_a_of_type_ComTencentUtilLongSparseArray.a();
    }
  }
  
  public void setCacheColorHint(int paramInt)
  {
    if (paramInt != an)
    {
      an = paramInt;
      int i2 = getChildCount();
      int i1 = 0;
      while (i1 < i2)
      {
        getChildAt(i1).setDrawingCacheBackgroundColor(paramInt);
        i1 += 1;
      }
      jdField_a_of_type_Uab.b(paramInt);
    }
  }
  
  public void setCallbackOnUnClickItem(boolean paramBoolean)
  {
    B = paramBoolean;
  }
  
  public void setChoiceMode(int paramInt)
  {
    S = paramInt;
    if (jdField_a_of_type_AndroidViewActionMode != null)
    {
      jdField_a_of_type_AndroidViewActionMode.finish();
      jdField_a_of_type_AndroidViewActionMode = null;
    }
    if (S != 0)
    {
      if (jdField_a_of_type_AndroidUtilSparseBooleanArray == null) {
        jdField_a_of_type_AndroidUtilSparseBooleanArray = new SparseBooleanArray();
      }
      if ((jdField_a_of_type_ComTencentUtilLongSparseArray == null) && (jdField_a_of_type_AndroidWidgetListAdapter != null) && (jdField_a_of_type_AndroidWidgetListAdapter.hasStableIds())) {
        jdField_a_of_type_ComTencentUtilLongSparseArray = new LongSparseArray();
      }
      if (S == 3)
      {
        g();
        setLongClickable(true);
      }
    }
  }
  
  public void setDrawSelectorOnTop(boolean paramBoolean)
  {
    jdField_f_of_type_Boolean = paramBoolean;
  }
  
  public void setEdgeEffectEnabled(boolean paramBoolean)
  {
    Context localContext;
    if (jdField_a_of_type_Boolean != paramBoolean)
    {
      if (!paramBoolean) {
        break label62;
      }
      if ((aU != 2) && (jdField_a_of_type_ComTencentWidgetEdgeEffect == null))
      {
        localContext = getContext();
        jdField_a_of_type_ComTencentWidgetEdgeEffect = new EdgeEffect(localContext);
      }
    }
    for (jdField_b_of_type_ComTencentWidgetEdgeEffect = new EdgeEffect(localContext);; jdField_b_of_type_ComTencentWidgetEdgeEffect = null)
    {
      jdField_a_of_type_Boolean = paramBoolean;
      return;
      label62:
      jdField_a_of_type_ComTencentWidgetEdgeEffect = null;
    }
  }
  
  public void setFastScrollAlwaysVisible(boolean paramBoolean)
  {
    if ((paramBoolean) && (!jdField_k_of_type_Boolean)) {
      setFastScrollEnabled(true);
    }
    if (jdField_a_of_type_ComTencentWidgetFastScroller != null) {
      jdField_a_of_type_ComTencentWidgetFastScroller.a(paramBoolean);
    }
    try
    {
      localMethod = View.class.getDeclaredMethod("computeOpaqueFlags", new Class[0]);
      localMethod.setAccessible(true);
      localMethod.invoke(this, new Object[0]);
    }
    catch (Exception localException1)
    {
      try
      {
        for (;;)
        {
          Method localMethod = View.class.getDeclaredMethod("recomputePadding", new Class[0]);
          localMethod.setAccessible(true);
          localMethod.invoke(this, new Object[0]);
          return;
          localException1 = localException1;
          if (QLog.isColorLevel()) {
            QLog.e("XListView", 2, localException1.getMessage(), localException1);
          }
        }
      }
      catch (Exception localException2)
      {
        while (!QLog.isColorLevel()) {}
        QLog.e("XListView", 2, localException2.getMessage(), localException2);
      }
    }
  }
  
  public void setFastScrollEnabled(boolean paramBoolean)
  {
    jdField_k_of_type_Boolean = paramBoolean;
    if (paramBoolean) {
      if (jdField_a_of_type_ComTencentWidgetFastScroller == null) {
        jdField_a_of_type_ComTencentWidgetFastScroller = new FastScroller(getContext(), this);
      }
    }
    while (jdField_a_of_type_ComTencentWidgetFastScroller == null) {
      return;
    }
    jdField_a_of_type_ComTencentWidgetFastScroller.a();
    jdField_a_of_type_ComTencentWidgetFastScroller = null;
  }
  
  public void setFilterText(String paramString)
  {
    if ((jdField_d_of_type_Boolean) && (!TextUtils.isEmpty(paramString)))
    {
      a(false);
      jdField_a_of_type_AndroidWidgetEditText.setText(paramString);
      jdField_a_of_type_AndroidWidgetEditText.setSelection(paramString.length());
      if ((jdField_a_of_type_AndroidWidgetListAdapter instanceof Filterable))
      {
        if (jdField_a_of_type_AndroidWidgetPopupWindow == null) {
          ((Filterable)jdField_a_of_type_AndroidWidgetListAdapter).getFilter().filter(paramString);
        }
        jdField_e_of_type_Boolean = true;
        jdField_a_of_type_Tzr.a();
      }
    }
  }
  
  public void setFriction(float paramFloat)
  {
    if (jdField_a_of_type_Tzv == null) {
      jdField_a_of_type_Tzv = new tzv(this);
    }
    tzv.a(jdField_a_of_type_Tzv).a(paramFloat);
  }
  
  public void setItemChecked(int paramInt, boolean paramBoolean)
  {
    if (S == 0) {}
    label144:
    label226:
    label341:
    label368:
    for (;;)
    {
      return;
      if ((VersionUtils.e()) && (paramBoolean) && (S == 3) && (jdField_a_of_type_AndroidViewActionMode == null)) {
        jdField_a_of_type_AndroidViewActionMode = startActionMode(jdField_a_of_type_Tzy);
      }
      if ((S == 2) || (S == 3))
      {
        boolean bool = jdField_a_of_type_AndroidUtilSparseBooleanArray.get(paramInt);
        jdField_a_of_type_AndroidUtilSparseBooleanArray.put(paramInt, paramBoolean);
        if ((jdField_a_of_type_ComTencentUtilLongSparseArray != null) && (jdField_a_of_type_AndroidWidgetListAdapter.hasStableIds()))
        {
          if (paramBoolean) {
            jdField_a_of_type_ComTencentUtilLongSparseArray.a(jdField_a_of_type_AndroidWidgetListAdapter.getItemId(paramInt), Integer.valueOf(paramInt));
          }
        }
        else
        {
          if (bool != paramBoolean)
          {
            if (!paramBoolean) {
              break label226;
            }
            T += 1;
          }
          if (jdField_a_of_type_AndroidViewActionMode != null)
          {
            long l1 = jdField_a_of_type_AndroidWidgetListAdapter.getItemId(paramInt);
            jdField_a_of_type_Tzy.a(jdField_a_of_type_AndroidViewActionMode, paramInt, l1, paramBoolean);
          }
        }
      }
      for (;;)
      {
        if ((jdField_q_of_type_Boolean) || (jdField_s_of_type_Boolean)) {
          break label368;
        }
        jdField_r_of_type_Boolean = true;
        r();
        requestLayout();
        return;
        jdField_a_of_type_ComTencentUtilLongSparseArray.a(jdField_a_of_type_AndroidWidgetListAdapter.getItemId(paramInt));
        break;
        T -= 1;
        break label144;
        if ((jdField_a_of_type_ComTencentUtilLongSparseArray != null) && (jdField_a_of_type_AndroidWidgetListAdapter.hasStableIds())) {}
        for (int i1 = 1;; i1 = 0)
        {
          if ((paramBoolean) || (c(paramInt)))
          {
            jdField_a_of_type_AndroidUtilSparseBooleanArray.clear();
            if (i1 != 0) {
              jdField_a_of_type_ComTencentUtilLongSparseArray.a();
            }
          }
          if (!paramBoolean) {
            break label341;
          }
          jdField_a_of_type_AndroidUtilSparseBooleanArray.put(paramInt, true);
          if (i1 != 0) {
            jdField_a_of_type_ComTencentUtilLongSparseArray.a(jdField_a_of_type_AndroidWidgetListAdapter.getItemId(paramInt), Integer.valueOf(paramInt));
          }
          T = 1;
          break;
        }
        if ((jdField_a_of_type_AndroidUtilSparseBooleanArray.size() == 0) || (!jdField_a_of_type_AndroidUtilSparseBooleanArray.valueAt(0))) {
          T = 0;
        }
      }
    }
  }
  
  public void setMaximumVelocity(int paramInt)
  {
    aK = paramInt;
  }
  
  public void setMultiChoiceModeListener(AbsListView.MultiChoiceModeListener paramMultiChoiceModeListener)
  {
    if (jdField_a_of_type_Tzy == null) {
      jdField_a_of_type_Tzy = new tzy(this);
    }
    jdField_a_of_type_Tzy.a(paramMultiChoiceModeListener);
  }
  
  public void setNeedCheckSpringback(boolean paramBoolean)
  {
    C = paramBoolean;
  }
  
  public void setOnScrollListener(AbsListView.OnScrollListener paramOnScrollListener)
  {
    jdField_a_of_type_ComTencentWidgetAbsListView$OnScrollListener = paramOnScrollListener;
    h();
  }
  
  public void setOnScrollToButtomListener(AbsListView.OnScrollButtomListener paramOnScrollButtomListener)
  {
    jdField_a_of_type_ComTencentWidgetAbsListView$OnScrollButtomListener = paramOnScrollButtomListener;
  }
  
  public void setOverScrollEffectPadding(int paramInt1, int paramInt2)
  {
    aP = paramInt1;
    aQ = paramInt2;
  }
  
  public void setOverScrollMode(int paramInt)
  {
    if ((paramInt != 0) && (paramInt != 1) && (paramInt != 2)) {
      throw new IllegalArgumentException("Invalid overscroll mode " + paramInt);
    }
    Context localContext;
    if (paramInt != 2) {
      if ((jdField_a_of_type_ComTencentWidgetEdgeEffect == null) && (jdField_a_of_type_Boolean)) {
        localContext = getContext();
      }
    }
    try
    {
      jdField_a_of_type_ComTencentWidgetEdgeEffect = new EdgeEffect(localContext);
      for (jdField_b_of_type_ComTencentWidgetEdgeEffect = new EdgeEffect(localContext);; jdField_b_of_type_ComTencentWidgetEdgeEffect = null)
      {
        aU = paramInt;
        return;
        jdField_a_of_type_ComTencentWidgetEdgeEffect = null;
      }
    }
    catch (Throwable localThrowable)
    {
      for (;;) {}
    }
  }
  
  public void setRecyclerListener(AbsListView.RecyclerListener paramRecyclerListener)
  {
    uab.a(jdField_a_of_type_Uab, paramRecyclerListener);
  }
  
  public void setScrollIndicators(View paramView1, View paramView2)
  {
    jdField_e_of_type_AndroidViewView = paramView1;
    jdField_f_of_type_AndroidViewView = paramView2;
  }
  
  public void setScrollingCacheEnabled(boolean paramBoolean)
  {
    if ((jdField_j_of_type_Boolean) && (!paramBoolean)) {
      E();
    }
    jdField_j_of_type_Boolean = paramBoolean;
  }
  
  public void setSelector(int paramInt)
  {
    setSelector(getResources().getDrawable(paramInt));
  }
  
  public void setSelector(Drawable paramDrawable)
  {
    if (jdField_c_of_type_AndroidGraphicsDrawableDrawable != null)
    {
      jdField_c_of_type_AndroidGraphicsDrawableDrawable.setCallback(null);
      unscheduleDrawable(jdField_c_of_type_AndroidGraphicsDrawableDrawable);
    }
    jdField_c_of_type_AndroidGraphicsDrawableDrawable = paramDrawable;
    Rect localRect = new Rect();
    paramDrawable.getPadding(localRect);
    W = left;
    X = top;
    Y = right;
    Z = bottom;
    paramDrawable.setCallback(this);
    m();
  }
  
  public void setSmoothScrollbarEnabled(boolean paramBoolean)
  {
    jdField_c_of_type_Boolean = paramBoolean;
  }
  
  public void setStackFromBottom(boolean paramBoolean)
  {
    if (jdField_i_of_type_Boolean != paramBoolean)
    {
      jdField_i_of_type_Boolean = paramBoolean;
      i();
    }
  }
  
  public void setStackFromBottomWithoutRequestLayoutIfNecessary(boolean paramBoolean)
  {
    if (jdField_i_of_type_Boolean != paramBoolean) {
      jdField_i_of_type_Boolean = paramBoolean;
    }
  }
  
  public void setTextFilterEnabled(boolean paramBoolean)
  {
    jdField_d_of_type_Boolean = paramBoolean;
  }
  
  public void setTranscriptMode(int paramInt)
  {
    jdField_r_of_type_Int = paramInt;
  }
  
  public void setVelocityScale(float paramFloat)
  {
    jdField_b_of_type_Float = paramFloat;
  }
  
  public void setVerticalScrollbarPosition(int paramInt)
  {
    super.setVerticalScrollbarPosition(paramInt);
    if (jdField_a_of_type_ComTencentWidgetFastScroller != null) {
      jdField_a_of_type_ComTencentWidgetFastScroller.a(paramInt);
    }
  }
  
  public boolean showContextMenuForChild(View paramView)
  {
    boolean bool1 = false;
    boolean bool2 = false;
    int i1 = c(paramView);
    if (i1 >= 0)
    {
      long l1 = jdField_a_of_type_AndroidWidgetListAdapter.getItemId(i1);
      if (jdField_a_of_type_ComTencentWidgetAdapterView$OnItemLongClickListener != null) {
        bool2 = jdField_a_of_type_ComTencentWidgetAdapterView$OnItemLongClickListener.a(this, paramView, i1, l1);
      }
      bool1 = bool2;
      if (!bool2)
      {
        jdField_a_of_type_AndroidViewContextMenu$ContextMenuInfo = a(getChildAt(i1 - au), i1, l1);
        bool1 = super.showContextMenuForChild(paramView);
      }
    }
    return bool1;
  }
  
  public void t()
  {
    jdField_b_of_type_Boolean = true;
  }
  
  public void u() {}
  
  protected void v()
  {
    if (jdField_a_of_type_Tzv == null) {
      jdField_a_of_type_Tzv = new tzv(this);
    }
    jdField_a_of_type_Tzv.b(0);
  }
  
  public boolean verifyDrawable(Drawable paramDrawable)
  {
    return (jdField_c_of_type_AndroidGraphicsDrawableDrawable == paramDrawable) || (super.verifyDrawable(paramDrawable));
  }
  
  protected void w()
  {
    if (jdField_a_of_type_Tzv != null) {
      jdField_a_of_type_Tzv.a();
    }
  }
}
