package com.tencent.mobileqq.activity.aio.audiopanel;

import android.content.Context;
import android.content.res.Resources;
import android.graphics.Canvas;
import android.graphics.Color;
import android.graphics.Paint;
import android.graphics.Paint.Style;
import android.graphics.Rect;
import android.graphics.Shader.TileMode;
import android.graphics.drawable.BitmapDrawable;
import android.os.Handler.Callback;
import android.os.Looper;
import android.os.Message;
import android.support.v4.view.ViewPager.OnPageChangeListener;
import android.util.AttributeSet;
import android.util.TypedValue;
import android.view.MotionEvent;
import android.view.View;
import android.view.View.OnClickListener;
import android.view.ViewGroup;
import android.view.ViewParent;
import android.widget.ImageView;
import android.widget.LinearLayout;
import android.widget.LinearLayout.LayoutParams;
import android.widget.PopupWindow;
import android.widget.RelativeLayout.LayoutParams;
import android.widget.TextView;
import com.tencent.common.config.AppSetting;
import com.tencent.mobileqq.activity.BaseChatPie;
import com.tencent.mobileqq.activity.aio.InputLinearLayout;
import com.tencent.mobileqq.activity.aio.SessionInfo;
import com.tencent.mobileqq.activity.aio.panel.PanelIconLinearLayout;
import com.tencent.mobileqq.app.QQAppInterface;
import com.tencent.mobileqq.app.ThreadManager;
import com.tencent.mobileqq.hotpatch.NotVerifyClass;
import com.tencent.mobileqq.statistics.ReportController;
import com.tencent.mobileqq.util.AccessibilityUtil;
import com.tencent.qphone.base.util.BaseApplication;
import com.tencent.qphone.base.util.QLog;
import com.tencent.theme.SkinnableBitmapDrawable;
import com.tencent.util.WeakReferenceHandler;
import com.tencent.widget.XPanelContainer;
import ksp;

public class AudioPanel
  extends LinearLayout
  implements Handler.Callback, ViewPager.OnPageChangeListener, View.OnClickListener
{
  private static final float jdField_a_of_type_Float = 0.98F;
  public static final int a = 1;
  private static PopupWindow jdField_a_of_type_AndroidWidgetPopupWindow = null;
  private static final int[] jdField_a_of_type_ArrayOfInt;
  private static final float jdField_b_of_type_Float = 1.5F;
  public static final int b = 2;
  private static final float jdField_c_of_type_Float = 0.045933332F;
  public static final int c = 3;
  public static final int d = 4;
  public static final int e = 0;
  public static final int f = 1;
  public static final int g = 2;
  public static final int h = 3;
  private static final int i;
  private static final int k = -15158044;
  private static final int l = -8355712;
  private static final int q = 1;
  private static final int r = 2;
  private static final int s = 55;
  private static final int t = 51;
  private static final int u = 1200;
  private static final int v = 40;
  private static final int w = 0;
  private static final int x = -3;
  private Paint jdField_a_of_type_AndroidGraphicsPaint;
  private Rect jdField_a_of_type_AndroidGraphicsRect;
  private ViewGroup jdField_a_of_type_AndroidViewViewGroup;
  private TextView jdField_a_of_type_AndroidWidgetTextView;
  private BaseChatPie jdField_a_of_type_ComTencentMobileqqActivityBaseChatPie;
  private InputLinearLayout jdField_a_of_type_ComTencentMobileqqActivityAioInputLinearLayout;
  private SessionInfo jdField_a_of_type_ComTencentMobileqqActivityAioSessionInfo;
  private AudioPanelAdapter jdField_a_of_type_ComTencentMobileqqActivityAioAudiopanelAudioPanelAdapter;
  private AudioPanelViewPager jdField_a_of_type_ComTencentMobileqqActivityAioAudiopanelAudioPanelViewPager;
  private PressToSpeakPanel jdField_a_of_type_ComTencentMobileqqActivityAioAudiopanelPressToSpeakPanel;
  private PanelIconLinearLayout jdField_a_of_type_ComTencentMobileqqActivityAioPanelPanelIconLinearLayout;
  private QQAppInterface jdField_a_of_type_ComTencentMobileqqAppQQAppInterface;
  private WeakReferenceHandler jdField_a_of_type_ComTencentUtilWeakReferenceHandler = new WeakReferenceHandler(Looper.getMainLooper(), this);
  private boolean jdField_a_of_type_Boolean;
  private String[] jdField_a_of_type_ArrayOfJavaLangString = new String[3];
  private Rect jdField_b_of_type_AndroidGraphicsRect;
  private ViewGroup jdField_b_of_type_AndroidViewViewGroup;
  private TextView jdField_b_of_type_AndroidWidgetTextView;
  private boolean jdField_b_of_type_Boolean = false;
  private TextView jdField_c_of_type_AndroidWidgetTextView;
  private boolean jdField_c_of_type_Boolean = false;
  private float jdField_d_of_type_Float;
  private boolean jdField_d_of_type_Boolean = false;
  private float jdField_e_of_type_Float;
  private boolean jdField_e_of_type_Boolean = false;
  private boolean f;
  private int j = 1;
  private int m;
  private int n;
  private int o;
  private int p = -1;
  private int y;
  
  static
  {
    boolean bool = NotVerifyClass.DO_VERIFY_CLASS;
    jdField_a_of_type_ArrayOfInt = new int[] { 1038, 1948, 2857, 3766, 4675, 5584, 6493, 7402, 8311, 10000 };
    i = jdField_a_of_type_ArrayOfInt[1] - jdField_a_of_type_ArrayOfInt[0];
  }
  
  public AudioPanel(Context paramContext)
  {
    super(paramContext);
  }
  
  public AudioPanel(Context paramContext, AttributeSet paramAttributeSet)
  {
    super(paramContext, paramAttributeSet);
  }
  
  public static int a(int paramInt)
  {
    int i1 = 8000;
    if (paramInt < 5000) {
      i1 = 4000;
    }
    for (;;)
    {
      paramInt = Math.min((int)(i1 * 0.3F / i), jdField_a_of_type_ArrayOfInt.length - 1);
      return jdField_a_of_type_ArrayOfInt[paramInt];
      if (paramInt >= 8000) {
        if (paramInt < 10000) {
          i1 = 10000;
        } else if (paramInt < 14000) {
          i1 = 13000;
        } else if (paramInt < 18000) {
          i1 = 16000;
        } else if (paramInt < 23000) {
          i1 = 19000;
        } else if (paramInt < 27000) {
          i1 = 22000;
        } else if (paramInt < 32000) {
          i1 = 25000;
        } else if (paramInt < 35000) {
          i1 = 28000;
        } else if (paramInt < 40000) {
          i1 = 32000;
        } else if (paramInt < 50000) {
          i1 = 40000;
        } else {
          i1 = 40000;
        }
      }
    }
  }
  
  public static View a(Context paramContext, ViewGroup paramViewGroup1, ViewGroup paramViewGroup2)
  {
    paramViewGroup2 = (ViewGroup)paramViewGroup1.getParent();
    int i2 = paramViewGroup2.getChildCount();
    int i1 = 0;
    if (i1 < i2) {
      if (paramViewGroup2.getChildAt(i1) != paramViewGroup1) {}
    }
    for (;;)
    {
      if (i1 >= 0)
      {
        paramContext = new View(paramContext);
        RelativeLayout.LayoutParams localLayoutParams = new RelativeLayout.LayoutParams(-1, paramViewGroup1.getHeight());
        localLayoutParams.addRule(6, paramViewGroup1.getId());
        localLayoutParams.addRule(8, paramViewGroup1.getId());
        paramContext.setLayoutParams(localLayoutParams);
        paramViewGroup2.addView(paramContext, i1);
        return paramContext;
        i1 += 1;
        break;
      }
      return null;
      i1 = -1;
    }
  }
  
  public static PopupWindow a(Context paramContext, int paramInt1, int paramInt2, int paramInt3, View paramView, int paramInt4, int paramInt5, int paramInt6)
  {
    if ((jdField_a_of_type_AndroidWidgetPopupWindow != null) && (jdField_a_of_type_AndroidWidgetPopupWindow.isShowing())) {
      return jdField_a_of_type_AndroidWidgetPopupWindow;
    }
    paramContext = new View(paramContext);
    paramContext.setBackgroundColor(1275068416);
    jdField_a_of_type_AndroidWidgetPopupWindow = new PopupWindow(paramContext, paramInt1, paramInt3);
    jdField_a_of_type_AndroidWidgetPopupWindow.showAtLocation(paramView, paramInt4, paramInt5, paramInt6);
    return jdField_a_of_type_AndroidWidgetPopupWindow;
  }
  
  public static String a(double paramDouble)
  {
    if (paramDouble < 1000.0D) {}
    int i2;
    for (int i1 = 0;; i1 = (int)(paramDouble / 1000.0D + 0.5D))
    {
      i2 = i1 / 60;
      i1 %= 60;
      if (i1 >= 10) {
        break;
      }
      return i2 + ":0" + i1;
    }
    return i2 + ":" + i1;
  }
  
  private void f()
  {
    if ((jdField_a_of_type_ComTencentMobileqqActivityAioAudiopanelAudioPanelViewPager.getCurrentItem() == 1) && (jdField_a_of_type_ComTencentMobileqqActivityAioAudiopanelPressToSpeakPanel != null))
    {
      Object localObject = jdField_a_of_type_ComTencentMobileqqActivityAioAudiopanelPressToSpeakPanel.a();
      Rect localRect = new Rect();
      ((ImageView)localObject).getGlobalVisibleRect(localRect);
      localObject = new Rect();
      super.getGlobalVisibleRect((Rect)localObject);
      int i1 = left - left;
      int i2 = top - top;
      jdField_d_of_type_Float = TypedValue.applyDimension(1, 30.0F, getResources().getDisplayMetrics());
      jdField_a_of_type_AndroidGraphicsRect = new Rect(i1, i2, localRect.width() + i1, localRect.height() + i2);
      y = 40;
      jdField_e_of_type_Float = 0.98F;
      if (QLog.isColorLevel()) {
        QLog.d("HollowRound", 2, "initAndStartHollowRoundAnim:" + y + ", " + jdField_e_of_type_Float);
      }
      jdField_a_of_type_AndroidGraphicsPaint = new Paint();
      jdField_a_of_type_AndroidGraphicsPaint.setAntiAlias(true);
      jdField_a_of_type_AndroidGraphicsPaint.setStyle(Paint.Style.STROKE);
      h();
    }
  }
  
  private void g()
  {
    if (jdField_a_of_type_AndroidGraphicsRect != null)
    {
      y -= 3;
      jdField_e_of_type_Float += 0.045933332F;
      if (QLog.isColorLevel()) {
        QLog.d("HollowRound", 2, "updateHollowRoundAnim:" + y + ", " + jdField_e_of_type_Float);
      }
    }
  }
  
  private void h()
  {
    if (jdField_b_of_type_AndroidGraphicsRect == null)
    {
      super.invalidate();
      return;
    }
    super.invalidate(jdField_b_of_type_AndroidGraphicsRect);
  }
  
  public int a()
  {
    int i1 = -1;
    if (jdField_a_of_type_ComTencentMobileqqActivityAioAudiopanelAudioPanelViewPager != null) {
      i1 = jdField_a_of_type_ComTencentMobileqqActivityAioAudiopanelAudioPanelViewPager.getCurrentItem();
    }
    return i1;
  }
  
  public TextView a()
  {
    return jdField_c_of_type_AndroidWidgetTextView;
  }
  
  public void a()
  {
    BaseChatPie.x = false;
    e();
    int i1;
    View localView;
    if (jdField_a_of_type_ComTencentMobileqqActivityAioAudiopanelAudioPanelAdapter.jdField_a_of_type_AndroidViewViewGroup != null)
    {
      ViewGroup localViewGroup = jdField_a_of_type_ComTencentMobileqqActivityAioAudiopanelAudioPanelAdapter.jdField_a_of_type_AndroidViewViewGroup;
      int i2 = localViewGroup.getChildCount();
      i1 = 0;
      if (i1 >= i2) {
        break label87;
      }
      localView = localViewGroup.getChildAt(i1);
      if (localView.getVisibility() != 0) {
        break label80;
      }
    }
    for (;;)
    {
      if ((localView != null) && ((localView instanceof AudioPanelCallback))) {
        ((AudioPanelCallback)localView).b();
      }
      b(true);
      return;
      label80:
      i1 += 1;
      break;
      label87:
      localView = null;
    }
  }
  
  public void a(int paramInt)
  {
    if (jdField_a_of_type_ComTencentMobileqqActivityAioAudiopanelAudioPanelViewPager.getCurrentItem() != paramInt)
    {
      jdField_a_of_type_ComTencentMobileqqActivityAioAudiopanelAudioPanelViewPager.setCurrentItem(paramInt);
      requestLayout();
      a(jdField_b_of_type_AndroidViewViewGroup, jdField_b_of_type_AndroidViewViewGroup.getChildAt(jdField_a_of_type_ComTencentMobileqqActivityAioAudiopanelAudioPanelViewPager.getCurrentItem()), -8355712, -15158044);
    }
  }
  
  public void a(ViewGroup paramViewGroup)
  {
    if (jdField_e_of_type_Boolean)
    {
      jdField_e_of_type_Boolean = false;
      jdField_a_of_type_ComTencentMobileqqActivityBaseChatPie.a(0, jdField_c_of_type_Boolean, false);
    }
  }
  
  void a(ViewGroup paramViewGroup, View paramView, int paramInt1, int paramInt2)
  {
    if (paramViewGroup != null)
    {
      int i2 = paramViewGroup.getChildCount();
      int i1 = 0;
      while (i1 < i2)
      {
        View localView = paramViewGroup.getChildAt(i1);
        if ((localView instanceof TextView)) {
          ((TextView)localView).setTextColor(paramInt1);
        }
        i1 += 1;
      }
    }
    if ((paramView != null) && ((paramView instanceof TextView))) {
      ((TextView)paramView).setTextColor(paramInt2);
    }
  }
  
  public void a(QQAppInterface paramQQAppInterface, BaseChatPie paramBaseChatPie, SessionInfo paramSessionInfo, InputLinearLayout paramInputLinearLayout, PanelIconLinearLayout paramPanelIconLinearLayout)
  {
    jdField_a_of_type_ComTencentMobileqqAppQQAppInterface = paramQQAppInterface;
    jdField_a_of_type_ComTencentMobileqqActivityAioSessionInfo = paramSessionInfo;
    jdField_a_of_type_ComTencentMobileqqActivityAioInputLinearLayout = paramInputLinearLayout;
    jdField_a_of_type_ComTencentMobileqqActivityAioPanelPanelIconLinearLayout = paramPanelIconLinearLayout;
    jdField_a_of_type_ComTencentMobileqqActivityBaseChatPie = paramBaseChatPie;
    jdField_a_of_type_ComTencentMobileqqActivityAioAudiopanelAudioPanelViewPager = ((AudioPanelViewPager)findViewById(2131298613));
    jdField_a_of_type_AndroidViewViewGroup = ((ViewGroup)findViewById(2131300842));
    jdField_a_of_type_AndroidWidgetTextView = ((TextView)findViewById(2131300846));
    jdField_b_of_type_AndroidWidgetTextView = ((TextView)findViewById(2131300847));
    jdField_c_of_type_AndroidWidgetTextView = ((TextView)findViewById(2131300845));
    jdField_b_of_type_AndroidViewViewGroup = ((ViewGroup)findViewById(2131300844));
    jdField_a_of_type_ComTencentMobileqqActivityAioAudiopanelAudioPanelAdapter = new AudioPanelAdapter(paramQQAppInterface, paramBaseChatPie, this, jdField_a_of_type_AndroidViewViewGroup, jdField_a_of_type_ComTencentMobileqqActivityAioInputLinearLayout, jdField_a_of_type_ComTencentMobileqqActivityAioPanelPanelIconLinearLayout);
    jdField_a_of_type_ComTencentMobileqqActivityAioAudiopanelAudioPanelViewPager.a(paramQQAppInterface, this);
    jdField_a_of_type_ComTencentMobileqqActivityAioAudiopanelAudioPanelViewPager.setAdapter(jdField_a_of_type_ComTencentMobileqqActivityAioAudiopanelAudioPanelAdapter);
    jdField_a_of_type_ComTencentMobileqqActivityAioAudiopanelAudioPanelViewPager.setOnPageChangeListener(this);
    jdField_a_of_type_ComTencentMobileqqActivityAioAudiopanelAudioPanelViewPager.setCurrentItem(1);
    jdField_a_of_type_AndroidWidgetTextView.setTextColor(-15158044);
    jdField_b_of_type_AndroidWidgetTextView.setTextColor(-8355712);
    jdField_c_of_type_Boolean = true;
    jdField_a_of_type_AndroidWidgetTextView.setOnClickListener(this);
    jdField_b_of_type_AndroidWidgetTextView.setOnClickListener(this);
    jdField_c_of_type_AndroidWidgetTextView.setOnClickListener(this);
    paramQQAppInterface = getResources().getDrawable(2130842663);
    if ((paramQQAppInterface instanceof BitmapDrawable)) {
      paramQQAppInterface = ((BitmapDrawable)paramQQAppInterface).getBitmap();
    }
    for (;;)
    {
      paramQQAppInterface = new BitmapDrawable(paramQQAppInterface);
      if (paramQQAppInterface != null)
      {
        paramQQAppInterface.setTileModeXY(Shader.TileMode.REPEAT, Shader.TileMode.REPEAT);
        paramQQAppInterface.setDither(true);
        setBackgroundDrawable(paramQQAppInterface);
      }
      for (;;)
      {
        if (QLog.isColorLevel()) {
          QLog.d("AIOAudioPanel", 2, "AudioPanel.init() is called,time is:" + System.currentTimeMillis());
        }
        return;
        if (!(paramQQAppInterface instanceof SkinnableBitmapDrawable)) {
          break label352;
        }
        paramQQAppInterface = ((SkinnableBitmapDrawable)paramQQAppInterface).getBitmap();
        break;
        if (QLog.isColorLevel()) {
          QLog.d("AIOAudioPanel", 2, "AudioPanel background is null:");
        }
      }
      label352:
      paramQQAppInterface = null;
    }
  }
  
  public void a(boolean paramBoolean)
  {
    int i1 = 0;
    b(false);
    f = paramBoolean;
    WeakReferenceHandler localWeakReferenceHandler = jdField_a_of_type_ComTencentUtilWeakReferenceHandler;
    if (paramBoolean) {
      i1 = 600;
    }
    localWeakReferenceHandler.sendEmptyMessageDelayed(1, i1 + 1200);
  }
  
  public boolean a()
  {
    int i1;
    View localView;
    if (jdField_a_of_type_ComTencentMobileqqActivityAioAudiopanelAudioPanelAdapter.jdField_a_of_type_AndroidViewViewGroup != null)
    {
      ViewGroup localViewGroup = jdField_a_of_type_ComTencentMobileqqActivityAioAudiopanelAudioPanelAdapter.jdField_a_of_type_AndroidViewViewGroup;
      int i2 = localViewGroup.getChildCount();
      i1 = 0;
      if (i1 >= i2) {
        break label91;
      }
      localView = localViewGroup.getChildAt(i1);
      if (localView.getVisibility() != 0) {}
    }
    for (;;)
    {
      if ((localView != null) && ((localView instanceof AudioPanelCallback))) {}
      for (boolean bool = ((AudioPanelCallback)localView).a();; bool = false)
      {
        b(true);
        return bool;
        i1 += 1;
        break;
      }
      label91:
      localView = null;
    }
  }
  
  public int b()
  {
    return j;
  }
  
  public void b()
  {
    jdField_a_of_type_AndroidWidgetPopupWindow = null;
    int i1;
    View localView;
    if (jdField_a_of_type_ComTencentMobileqqActivityAioAudiopanelAudioPanelAdapter.jdField_a_of_type_AndroidViewViewGroup != null)
    {
      ViewGroup localViewGroup = jdField_a_of_type_ComTencentMobileqqActivityAioAudiopanelAudioPanelAdapter.jdField_a_of_type_AndroidViewViewGroup;
      int i2 = localViewGroup.getChildCount();
      i1 = 0;
      if (i1 >= i2) {
        break label82;
      }
      localView = localViewGroup.getChildAt(i1);
      if (localView.getVisibility() != 0) {
        break label75;
      }
    }
    for (;;)
    {
      if ((localView != null) && ((localView instanceof AudioPanelCallback))) {
        ((AudioPanelCallback)localView).c();
      }
      e();
      return;
      label75:
      i1 += 1;
      break;
      label82:
      localView = null;
    }
  }
  
  public void b(boolean paramBoolean)
  {
    if (jdField_a_of_type_AndroidGraphicsRect != null)
    {
      jdField_a_of_type_AndroidGraphicsRect = null;
      jdField_b_of_type_AndroidGraphicsRect = null;
    }
    f = false;
    jdField_a_of_type_ComTencentUtilWeakReferenceHandler.removeMessages(2);
    jdField_a_of_type_ComTencentUtilWeakReferenceHandler.removeMessages(1);
    if (paramBoolean) {
      h();
    }
  }
  
  public void c()
  {
    if ((jdField_a_of_type_ComTencentMobileqqActivityAioAudiopanelAudioPanelAdapter.jdField_b_of_type_AndroidViewViewGroup != null) && ((jdField_a_of_type_ComTencentMobileqqActivityAioAudiopanelAudioPanelAdapter.jdField_b_of_type_AndroidViewViewGroup instanceof ListenChangeVoicePanel)))
    {
      ((AudioPanelCallback)jdField_a_of_type_ComTencentMobileqqActivityAioAudiopanelAudioPanelAdapter.jdField_b_of_type_AndroidViewViewGroup).c();
      jdField_a_of_type_ComTencentMobileqqActivityAioAudiopanelAudioPanelAdapter.jdField_b_of_type_AndroidViewViewGroup = null;
    }
  }
  
  public void d()
  {
    if (jdField_a_of_type_AndroidGraphicsRect != null) {
      b(true);
    }
  }
  
  public void dispatchDraw(Canvas paramCanvas)
  {
    super.dispatchDraw(paramCanvas);
    Rect localRect = jdField_a_of_type_AndroidGraphicsRect;
    if (localRect != null)
    {
      if (y > 0) {
        break label42;
      }
      if (!f) {
        a(true);
      }
    }
    else
    {
      return;
    }
    b(false);
    return;
    label42:
    float f1 = localRect.width() / 2;
    float f2 = jdField_e_of_type_Float * f1;
    if (f2 > jdField_d_of_type_Float + f1) {
      f1 = jdField_d_of_type_Float;
    }
    for (;;)
    {
      if (f1 > 0.0F)
      {
        float f3 = f1 / 2.0F;
        jdField_a_of_type_AndroidGraphicsPaint.setColor(Color.argb(y, 0, 0, 255));
        jdField_a_of_type_AndroidGraphicsPaint.setStrokeWidth(f1);
        paramCanvas.drawCircle(localRect.centerX(), localRect.centerY(), f2 - f3, jdField_a_of_type_AndroidGraphicsPaint);
      }
      jdField_a_of_type_ComTencentUtilWeakReferenceHandler.sendEmptyMessageDelayed(2, 55L);
      return;
      if (f2 > f1) {
        f1 = f2 - f1;
      } else {
        f1 = 0.0F;
      }
    }
  }
  
  public void e()
  {
    int i1 = jdField_a_of_type_ComTencentMobileqqActivityBaseChatPie.r;
    if (i1 < 0) {
      return;
    }
    jdField_a_of_type_ComTencentMobileqqActivityBaseChatPie.r = -1;
    ThreadManager.a(new ksp(this, i1), 8, null, false);
  }
  
  public boolean handleMessage(Message paramMessage)
  {
    if (what == 1) {
      f();
    }
    while (what != 2) {
      return true;
    }
    g();
    h();
    return true;
  }
  
  public void onClick(View paramView)
  {
    int i1 = paramView.getId();
    if (i1 == 2131300846) {
      setCurrentPannel(1, false);
    }
    do
    {
      return;
      if (i1 == 2131300847)
      {
        setCurrentPannel(2, false);
        return;
      }
    } while (i1 != 2131300845);
    setCurrentPannel(0, false);
  }
  
  public boolean onInterceptTouchEvent(MotionEvent paramMotionEvent)
  {
    int i1 = paramMotionEvent.getAction() & 0xFF;
    if (i1 == 0) {
      getParent().requestDisallowInterceptTouchEvent(true);
    }
    for (;;)
    {
      return super.onInterceptTouchEvent(paramMotionEvent);
      if ((i1 == 1) || (i1 == 3)) {
        getParent().requestDisallowInterceptTouchEvent(false);
      }
    }
  }
  
  protected void onLayout(boolean paramBoolean, int paramInt1, int paramInt2, int paramInt3, int paramInt4)
  {
    super.onLayout(paramBoolean, paramInt1, paramInt2, paramInt3, paramInt4);
    if (!jdField_b_of_type_Boolean)
    {
      paramInt2 = jdField_a_of_type_ComTencentMobileqqActivityAioAudiopanelAudioPanelViewPager.getCurrentItem();
      View localView = jdField_b_of_type_AndroidViewViewGroup.getChildAt(paramInt2);
      if (localView != null)
      {
        paramInt1 = (paramInt3 - paramInt1 - localView.getWidth()) / 2;
        paramInt1 = localView.getLeft() - paramInt1;
        if (QLog.isColorLevel()) {
          QLog.d("AIOAudioPanel", 2, "needScrollX is:" + paramInt1);
        }
        jdField_b_of_type_AndroidViewViewGroup.scrollTo(paramInt1, jdField_b_of_type_AndroidViewViewGroup.getScrollY());
      }
    }
  }
  
  protected void onMeasure(int paramInt1, int paramInt2)
  {
    try
    {
      jdField_a_of_type_ComTencentMobileqqActivityAioAudiopanelAudioPanelViewPager.getLayoutParams()).topMargin = (XPanelContainer.e / 2);
      super.onMeasure(paramInt1, paramInt2);
      return;
    }
    catch (Exception localException)
    {
      for (;;) {}
    }
  }
  
  public void onPageScrollStateChanged(int paramInt)
  {
    if (QLog.isColorLevel()) {
      QLog.d("AIOAudioPanel", 2, "onPageScrollStateChanged() is called,state is:" + paramInt);
    }
    if (paramInt == 0)
    {
      jdField_b_of_type_Boolean = false;
      a(jdField_b_of_type_AndroidViewViewGroup, jdField_b_of_type_AndroidViewViewGroup.getChildAt(jdField_a_of_type_ComTencentMobileqqActivityAioAudiopanelAudioPanelViewPager.getCurrentItem()), -8355712, -15158044);
    }
  }
  
  public void onPageScrolled(int paramInt1, float paramFloat, int paramInt2)
  {
    paramInt1 = jdField_a_of_type_ComTencentMobileqqActivityAioAudiopanelAudioPanelViewPager.getWidth();
    paramInt2 = jdField_a_of_type_ComTencentMobileqqActivityAioAudiopanelAudioPanelViewPager.getPageMargin() + paramInt1;
    if (!jdField_b_of_type_Boolean)
    {
      o = jdField_a_of_type_ComTencentMobileqqActivityAioAudiopanelAudioPanelViewPager.getCurrentItem();
      m = ((o + p) * paramInt2);
      n = jdField_b_of_type_AndroidViewViewGroup.getScrollX();
      jdField_b_of_type_Boolean = true;
    }
    paramFloat = jdField_a_of_type_ComTencentMobileqqActivityAioAudiopanelAudioPanelViewPager.getScrollX() - m;
    if (paramFloat < 0.0F) {
      paramInt1 = o - 1;
    }
    for (;;)
    {
      View localView1 = jdField_b_of_type_AndroidViewViewGroup.getChildAt(o);
      View localView2 = jdField_b_of_type_AndroidViewViewGroup.getChildAt(paramInt1);
      if (QLog.isColorLevel())
      {
        QLog.d("AIOAudioPanel", 2, "onPageScrolled() is called,pageBeforeScroll is:" + o + ",nextPage is:" + paramInt1 + ",vpWidthWithMargin is:" + paramInt2);
        QLog.d("AIOAudioPanel", 2, "vpRelativeScrollX is:" + paramFloat + ",vpScrollXBeforeScroll is:" + m + ",pdScrollXBeforeScroll is:" + n);
      }
      if ((localView1 != null) && (localView2 != null))
      {
        paramInt1 = localView1.getLeft() + localView1.getWidth() / 2;
        int i1 = localView2.getLeft() + localView2.getWidth() / 2;
        int i2 = (int)(Math.abs(paramFloat / paramInt2) * (i1 - paramInt1));
        if (QLog.isColorLevel()) {
          QLog.d("AIOAudioPanel", 2, "centerChildCenterX is:" + paramInt1 + ",nextCenterChildCenterX is:" + i1 + ",pdRelativeScrollX is:" + i2);
        }
        jdField_b_of_type_AndroidViewViewGroup.scrollTo(n + i2, jdField_b_of_type_AndroidViewViewGroup.getScrollY());
        if (Math.abs(paramFloat) == paramInt2) {
          a(jdField_b_of_type_AndroidViewViewGroup, localView2, -8355712, -15158044);
        }
      }
      return;
      if (paramFloat > 0.0F) {
        paramInt1 = o + 1;
      } else {
        paramInt1 = o;
      }
    }
  }
  
  public void onPageSelected(int paramInt)
  {
    if (QLog.isColorLevel()) {
      QLog.d("AIOAudioPanel", 2, "onPageSelected() is called,position is:" + paramInt);
    }
    if (paramInt == 0) {
      ReportController.b(jdField_a_of_type_ComTencentMobileqqAppQQAppInterface, "CliOper", "", "", "0X8005471", "0X8005471", 0, 0, "", "", "", "");
    }
    jdField_a_of_type_ComTencentMobileqqActivityBaseChatPie.a(paramInt, jdField_c_of_type_Boolean, jdField_d_of_type_Boolean);
    jdField_d_of_type_Boolean = false;
    if ((AppSetting.i) && (jdField_a_of_type_ArrayOfJavaLangString != null) && (paramInt < jdField_a_of_type_ArrayOfJavaLangString.length))
    {
      int i1 = 0;
      if (i1 < jdField_b_of_type_AndroidViewViewGroup.getChildCount())
      {
        Object localObject = jdField_b_of_type_AndroidViewViewGroup.getChildAt(i1);
        if ((localObject != null) && ((localObject instanceof TextView)) && (i1 < jdField_a_of_type_ArrayOfJavaLangString.length))
        {
          localObject = (TextView)localObject;
          jdField_a_of_type_ArrayOfJavaLangString[i1] = jdField_a_of_type_ComTencentMobileqqAppQQAppInterface.a().getString(2131367767, new Object[] { ((TextView)localObject).getText() });
          if (paramInt != i1) {
            break label234;
          }
          ((TextView)localObject).setContentDescription("已选定" + jdField_a_of_type_ArrayOfJavaLangString[i1]);
        }
        for (;;)
        {
          i1 += 1;
          break;
          label234:
          ((TextView)localObject).setContentDescription(jdField_a_of_type_ArrayOfJavaLangString[i1]);
        }
      }
      AccessibilityUtil.a(jdField_b_of_type_AndroidViewViewGroup, "已选定" + jdField_a_of_type_ArrayOfJavaLangString[paramInt]);
    }
  }
  
  public boolean onTouchEvent(MotionEvent paramMotionEvent)
  {
    return true;
  }
  
  public void setCurrentPannel(int paramInt, boolean paramBoolean)
  {
    if ((paramInt < 0) || (paramInt >= 3)) {}
    do
    {
      return;
      if (jdField_a_of_type_ComTencentMobileqqActivityAioAudiopanelAudioPanelViewPager.getCurrentItem() != paramInt)
      {
        jdField_d_of_type_Boolean = paramBoolean;
        jdField_e_of_type_Boolean = paramBoolean;
        jdField_a_of_type_ComTencentMobileqqActivityAioAudiopanelAudioPanelViewPager.setCurrentItem(paramInt);
        requestLayout();
        a(jdField_b_of_type_AndroidViewViewGroup, jdField_b_of_type_AndroidViewViewGroup.getChildAt(jdField_a_of_type_ComTencentMobileqqActivityAioAudiopanelAudioPanelViewPager.getCurrentItem()), -8355712, -15158044);
      }
    } while (!jdField_a_of_type_ComTencentMobileqqActivityAioAudiopanelAudioPanelViewPager.jdField_a_of_type_Boolean);
    p = (-paramInt);
  }
  
  public void setSpeakPanel(PressToSpeakPanel paramPressToSpeakPanel)
  {
    jdField_a_of_type_ComTencentMobileqqActivityAioAudiopanelPressToSpeakPanel = paramPressToSpeakPanel;
  }
  
  public void setStatus(int paramInt)
  {
    j = paramInt;
    jdField_a_of_type_ComTencentMobileqqActivityAioInputLinearLayout.setStatus(paramInt);
  }
  
  public void setVisibility(int paramInt)
  {
    super.setVisibility(paramInt);
    if (jdField_a_of_type_Boolean) {
      jdField_a_of_type_Boolean = false;
    }
  }
}
