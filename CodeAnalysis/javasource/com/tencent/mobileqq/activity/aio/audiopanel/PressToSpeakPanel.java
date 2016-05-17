package com.tencent.mobileqq.activity.aio.audiopanel;

import android.content.Context;
import android.content.SharedPreferences;
import android.content.SharedPreferences.Editor;
import android.content.res.Resources;
import android.graphics.Rect;
import android.os.Handler;
import android.os.Looper;
import android.os.Message;
import android.os.SystemClock;
import android.support.v4.view.ViewCompat;
import android.util.AttributeSet;
import android.view.MotionEvent;
import android.view.View;
import android.view.View.OnTouchListener;
import android.view.ViewGroup;
import android.view.animation.AlphaAnimation;
import android.view.animation.AnimationSet;
import android.view.animation.LinearInterpolator;
import android.view.animation.ScaleAnimation;
import android.widget.ImageView;
import android.widget.PopupWindow;
import android.widget.RelativeLayout;
import android.widget.TextView;
import com.tencent.common.config.AppSetting;
import com.tencent.mobileqq.activity.BaseChatPie;
import com.tencent.mobileqq.activity.aio.AIOUtils;
import com.tencent.mobileqq.activity.aio.panel.PanelIconLinearLayout;
import com.tencent.mobileqq.activity.aio.rebuild.PublicAccountChatPie;
import com.tencent.mobileqq.app.BaseActivity;
import com.tencent.mobileqq.app.QQAppInterface;
import com.tencent.mobileqq.hotpatch.NotVerifyClass;
import com.tencent.mobileqq.statistics.ReportController;
import com.tencent.mobileqq.transfile.PttInfoCollector;
import com.tencent.mobileqq.util.AccessibilityUtil;
import com.tencent.mobileqq.util.SkinUtils;
import com.tencent.mobileqq.utils.QQRecorder.OnQQRecorderListener;
import com.tencent.mobileqq.utils.QQRecorder.RecorderParam;
import com.tencent.qphone.base.util.BaseApplication;
import com.tencent.qphone.base.util.QLog;
import ktu;
import ktv;
import ktw;
import ktx;
import kty;
import ktz;
import kua;
import kub;
import kuc;
import kud;
import kue;
import kuf;
import kug;
import kuh;

public class PressToSpeakPanel
  extends RelativeLayout
  implements View.OnTouchListener, AudioPanelCallback, QQRecorder.OnQQRecorderListener
{
  private static final String jdField_a_of_type_JavaLangString = "pref_ppt_hint";
  private static final int jdField_b_of_type_Int = 150;
  private static final String jdField_b_of_type_JavaLangString = "key_ppt_hint";
  private static final int jdField_c_of_type_Int = 1;
  private static final int jdField_d_of_type_Int = 0;
  private static final int jdField_e_of_type_Int = 1;
  private static final int jdField_f_of_type_Int = 2;
  private static final int jdField_g_of_type_Int = 3;
  private double jdField_a_of_type_Double;
  private int jdField_a_of_type_Int;
  public long a;
  private SharedPreferences jdField_a_of_type_AndroidContentSharedPreferences;
  private Rect jdField_a_of_type_AndroidGraphicsRect;
  private Handler jdField_a_of_type_AndroidOsHandler;
  private View jdField_a_of_type_AndroidViewView;
  public ViewGroup a;
  private ImageView jdField_a_of_type_AndroidWidgetImageView;
  private PopupWindow jdField_a_of_type_AndroidWidgetPopupWindow;
  private TextView jdField_a_of_type_AndroidWidgetTextView;
  private BaseChatPie jdField_a_of_type_ComTencentMobileqqActivityBaseChatPie;
  private AudioPanel jdField_a_of_type_ComTencentMobileqqActivityAioAudiopanelAudioPanel;
  private MoveDistIndicateView jdField_a_of_type_ComTencentMobileqqActivityAioAudiopanelMoveDistIndicateView;
  private VolumeIndicateSquareView jdField_a_of_type_ComTencentMobileqqActivityAioAudiopanelVolumeIndicateSquareView;
  private QQAppInterface jdField_a_of_type_ComTencentMobileqqAppQQAppInterface;
  private boolean jdField_a_of_type_Boolean;
  private Rect jdField_b_of_type_AndroidGraphicsRect;
  private ViewGroup jdField_b_of_type_AndroidViewViewGroup;
  private ImageView jdField_b_of_type_AndroidWidgetImageView;
  private TextView jdField_b_of_type_AndroidWidgetTextView;
  private MoveDistIndicateView jdField_b_of_type_ComTencentMobileqqActivityAioAudiopanelMoveDistIndicateView;
  private VolumeIndicateSquareView jdField_b_of_type_ComTencentMobileqqActivityAioAudiopanelVolumeIndicateSquareView;
  private boolean jdField_b_of_type_Boolean;
  private ViewGroup jdField_c_of_type_AndroidViewViewGroup;
  private ViewGroup jdField_d_of_type_AndroidViewViewGroup;
  private ViewGroup jdField_e_of_type_AndroidViewViewGroup;
  private ViewGroup jdField_f_of_type_AndroidViewViewGroup;
  private ViewGroup jdField_g_of_type_AndroidViewViewGroup;
  private int h;
  private int i;
  
  public PressToSpeakPanel(Context paramContext)
  {
    super(paramContext);
    boolean bool = NotVerifyClass.DO_VERIFY_CLASS;
    jdField_a_of_type_Int = -1;
    jdField_a_of_type_Boolean = false;
    h = 0;
    i = 0;
    jdField_b_of_type_Boolean = false;
    jdField_a_of_type_Long = 0L;
    jdField_a_of_type_AndroidGraphicsRect = null;
    jdField_b_of_type_AndroidGraphicsRect = null;
  }
  
  public PressToSpeakPanel(Context paramContext, AttributeSet paramAttributeSet)
  {
    super(paramContext, paramAttributeSet, 0);
    jdField_a_of_type_Int = -1;
    jdField_a_of_type_Boolean = false;
    h = 0;
    i = 0;
    jdField_b_of_type_Boolean = false;
    jdField_a_of_type_Long = 0L;
    jdField_a_of_type_AndroidGraphicsRect = null;
    jdField_b_of_type_AndroidGraphicsRect = null;
  }
  
  private double a(int paramInt1, int paramInt2, View paramView)
  {
    double d1 = paramView.getWidth();
    double d3 = paramView.getHeight();
    if (paramView.getVisibility() != 0) {
      return -1.0D;
    }
    int[] arrayOfInt = new int[2];
    paramView.getLocationOnScreen(arrayOfInt);
    d1 /= 2.0D;
    double d2 = arrayOfInt[0];
    d3 /= 2.0D;
    double d4 = arrayOfInt[1];
    return Math.sqrt(Math.pow(paramInt1 - (d1 + d2), 2.0D) + Math.pow(paramInt2 - (d3 + d4), 2.0D));
  }
  
  private boolean a(int paramInt1, int paramInt2)
  {
    if (jdField_a_of_type_ComTencentMobileqqActivityAioAudiopanelMoveDistIndicateView.getVisibility() != 0) {
      return false;
    }
    if ((jdField_a_of_type_AndroidGraphicsRect == null) || (jdField_a_of_type_AndroidGraphicsRect.left == jdField_a_of_type_AndroidGraphicsRect.right))
    {
      jdField_a_of_type_AndroidGraphicsRect = new Rect();
      jdField_a_of_type_ComTencentMobileqqActivityAioAudiopanelMoveDistIndicateView.getDrawingRect(jdField_a_of_type_AndroidGraphicsRect);
      int[] arrayOfInt = new int[2];
      jdField_a_of_type_ComTencentMobileqqActivityAioAudiopanelMoveDistIndicateView.getLocationOnScreen(arrayOfInt);
      jdField_a_of_type_AndroidGraphicsRect.left = arrayOfInt[0];
      jdField_a_of_type_AndroidGraphicsRect.top = arrayOfInt[1];
      Rect localRect = jdField_a_of_type_AndroidGraphicsRect;
      int j = right;
      right = (arrayOfInt[0] + j);
      localRect = jdField_a_of_type_AndroidGraphicsRect;
      j = bottom;
      bottom = (arrayOfInt[1] + j);
    }
    return jdField_a_of_type_AndroidGraphicsRect.contains(paramInt1, paramInt2);
  }
  
  private boolean b(int paramInt1, int paramInt2)
  {
    if (jdField_b_of_type_ComTencentMobileqqActivityAioAudiopanelMoveDistIndicateView.getVisibility() != 0) {
      return false;
    }
    if ((jdField_b_of_type_AndroidGraphicsRect == null) || (jdField_b_of_type_AndroidGraphicsRect.left == jdField_b_of_type_AndroidGraphicsRect.right))
    {
      jdField_b_of_type_AndroidGraphicsRect = new Rect();
      jdField_b_of_type_ComTencentMobileqqActivityAioAudiopanelMoveDistIndicateView.getDrawingRect(jdField_b_of_type_AndroidGraphicsRect);
      int[] arrayOfInt = new int[2];
      jdField_b_of_type_ComTencentMobileqqActivityAioAudiopanelMoveDistIndicateView.getLocationOnScreen(arrayOfInt);
      jdField_b_of_type_AndroidGraphicsRect.left = arrayOfInt[0];
      jdField_b_of_type_AndroidGraphicsRect.top = arrayOfInt[1];
      Rect localRect = jdField_b_of_type_AndroidGraphicsRect;
      int j = right;
      right = (arrayOfInt[0] + j);
      localRect = jdField_b_of_type_AndroidGraphicsRect;
      j = bottom;
      bottom = (arrayOfInt[1] + j);
    }
    return jdField_b_of_type_AndroidGraphicsRect.contains(paramInt1, paramInt2);
  }
  
  public int a()
  {
    if (QLog.isColorLevel()) {
      QLog.d("AIOAudioPanel", 2, "PressToSpeakPanel.onRecorderStart() is called");
    }
    jdField_a_of_type_AndroidOsHandler.post(new kuc(this));
    PttInfoCollector.b(1);
    jdField_a_of_type_Double = 0.0D;
    return 250;
  }
  
  public int a(String paramString, QQRecorder.RecorderParam paramRecorderParam)
  {
    if (QLog.isColorLevel()) {
      QLog.d("AIOAudioPanel", 2, "PressToSpeakPanel.onBeginReceiveData() is called");
    }
    return jdField_a_of_type_ComTencentMobileqqActivityBaseChatPie.e();
  }
  
  public ImageView a()
  {
    return jdField_b_of_type_AndroidWidgetImageView;
  }
  
  public void a()
  {
    if (QLog.isColorLevel()) {
      QLog.d("AIOAudioPanel", 2, "PressToSpeakPanel.onInitSuccess() is called");
    }
  }
  
  public void a(int paramInt)
  {
    jdField_a_of_type_ComTencentMobileqqActivityBaseChatPie.h(paramInt);
    if (paramInt == 1) {
      ReportController.b(jdField_a_of_type_ComTencentMobileqqAppQQAppInterface, "CliOper", "", "", "0X800484C", "0X800484C", 0, 0, "", "", "", "");
    }
  }
  
  public void a(QQAppInterface paramQQAppInterface, BaseChatPie paramBaseChatPie, ViewGroup paramViewGroup1, AudioPanel paramAudioPanel, ViewGroup paramViewGroup2, ViewGroup paramViewGroup3, ViewGroup paramViewGroup4)
  {
    jdField_a_of_type_ComTencentMobileqqAppQQAppInterface = paramQQAppInterface;
    jdField_a_of_type_ComTencentMobileqqActivityBaseChatPie = paramBaseChatPie;
    g = paramViewGroup1;
    jdField_a_of_type_ComTencentMobileqqActivityAioAudiopanelAudioPanel = paramAudioPanel;
    paramAudioPanel.setSpeakPanel(this);
    jdField_b_of_type_AndroidViewViewGroup = paramViewGroup2;
    c = paramViewGroup3;
    jdField_a_of_type_AndroidViewViewGroup = paramViewGroup4;
    jdField_a_of_type_AndroidOsHandler = new Handler(Looper.getMainLooper());
    jdField_a_of_type_AndroidWidgetImageView = ((ImageView)findViewById(2131300873));
    jdField_a_of_type_AndroidWidgetTextView = ((TextView)findViewById(2131300869));
    d = ((ViewGroup)findViewById(2131299342));
    e = ((ViewGroup)findViewById(2131299332));
    jdField_a_of_type_ComTencentMobileqqActivityAioAudiopanelVolumeIndicateSquareView = ((VolumeIndicateSquareView)findViewById(2131299333));
    jdField_b_of_type_ComTencentMobileqqActivityAioAudiopanelVolumeIndicateSquareView = ((VolumeIndicateSquareView)findViewById(2131299335));
    jdField_b_of_type_AndroidWidgetTextView = ((TextView)findViewById(2131299334));
    jdField_b_of_type_AndroidWidgetImageView = ((ImageView)findViewById(2131300876));
    jdField_a_of_type_ComTencentMobileqqActivityAioAudiopanelMoveDistIndicateView = ((MoveDistIndicateView)findViewById(2131300874));
    jdField_b_of_type_ComTencentMobileqqActivityAioAudiopanelMoveDistIndicateView = ((MoveDistIndicateView)findViewById(2131300875));
    f = ((ViewGroup)findViewById(2131300872));
    jdField_b_of_type_AndroidWidgetImageView.setOnTouchListener(this);
    paramBaseChatPie = paramBaseChatPie.a().getResources();
    paramViewGroup1 = SkinUtils.a(paramBaseChatPie.getDrawable(2130842449));
    paramAudioPanel = SkinUtils.a(paramBaseChatPie.getDrawable(2130842447));
    jdField_a_of_type_ComTencentMobileqqActivityAioAudiopanelMoveDistIndicateView.setScaleBitmap(paramViewGroup1);
    jdField_a_of_type_ComTencentMobileqqActivityAioAudiopanelMoveDistIndicateView.setAfterBitmap(paramAudioPanel);
    paramViewGroup2 = SkinUtils.a(paramBaseChatPie.getDrawable(2130842449));
    paramViewGroup3 = SkinUtils.a(paramBaseChatPie.getDrawable(2130842447));
    jdField_b_of_type_ComTencentMobileqqActivityAioAudiopanelMoveDistIndicateView.setScaleBitmap(paramViewGroup2);
    jdField_b_of_type_ComTencentMobileqqActivityAioAudiopanelMoveDistIndicateView.setAfterBitmap(paramViewGroup3);
    if (QLog.isColorLevel())
    {
      QLog.d("AIOAudioPanel", 2, "PressToSpeakPanel.init() is called");
      QLog.d("AIOAudioPanel", 2, "volumeFillLeftBmp is:,listenIndicateMoveDist is:" + paramViewGroup1 + ",listenIndicateEnter is:" + paramAudioPanel + ",delIndicateMoveDist is:" + paramViewGroup2 + ",delIndicateEnter is:" + paramViewGroup3);
    }
    if (jdField_a_of_type_Int == -1)
    {
      paramViewGroup1 = new Rect();
      getWindowVisibleDisplayFrame(paramViewGroup1);
      int j = right / 2;
      int k = AIOUtils.a(75.0F, paramBaseChatPie);
      jdField_a_of_type_Int = (j - k);
      if (QLog.isColorLevel()) {
        QLog.d("AIOAudioPanel", 2, "rect is:" + paramViewGroup1 + "entirePanelWidth is:" + j + ",listenRight is:" + k + ",mBasicDistance is:" + jdField_a_of_type_Int);
      }
    }
    if (AppSetting.i)
    {
      jdField_a_of_type_AndroidContentSharedPreferences = paramQQAppInterface.a().getSharedPreferences("pref_ppt_hint" + paramQQAppInterface.a(), 0);
      i = jdField_a_of_type_AndroidContentSharedPreferences.getInt("key_ppt_hint", 3);
      jdField_b_of_type_Boolean = false;
      setFocusable(false);
      ViewCompat.setImportantForAccessibility(this, 2);
      ViewCompat.setImportantForAccessibility(jdField_a_of_type_AndroidWidgetTextView, 2);
      jdField_b_of_type_AndroidWidgetImageView.setContentDescription(getContext().getString(2131367766));
      ViewCompat.setAccessibilityDelegate(jdField_b_of_type_AndroidWidgetImageView, new ktu(this));
    }
  }
  
  public void a(String paramString)
  {
    if (QLog.isColorLevel()) {
      QLog.d("AIOAudioPanel", 2, "PressToSpeakPanel.onRecorderNotReady() is called,path is:" + paramString);
    }
  }
  
  public void a(String paramString, QQRecorder.RecorderParam paramRecorderParam)
  {
    if (QLog.isColorLevel()) {
      QLog.d("AIOAudioPanel", 2, "PressToSpeakPanel.onRecorderPrepare() is called,path is:" + paramString);
    }
    jdField_a_of_type_AndroidOsHandler.post(new kub(this));
    jdField_a_of_type_ComTencentMobileqqActivityBaseChatPie.a(paramString, true, paramRecorderParam);
    if (a == null) {}
  }
  
  public void a(String paramString, QQRecorder.RecorderParam paramRecorderParam, double paramDouble)
  {
    if (QLog.isColorLevel()) {
      QLog.d("AIOAudioPanel", 2, "PressToSpeakPanel.onRecorderEnd() is called,path is:" + paramString);
    }
    if (jdField_a_of_type_Double < 500.0D)
    {
      jdField_a_of_type_ComTencentMobileqqActivityBaseChatPie.a(paramString);
      jdField_a_of_type_AndroidOsHandler.post(new kuh(this, paramString, paramRecorderParam));
      ReportController.b(jdField_a_of_type_ComTencentMobileqqAppQQAppInterface, "CliOper", "", "", "0X8005A17", "0X8005A17", 11, 0, String.valueOf((int)jdField_a_of_type_Double), "", "", "6.3.3");
    }
    do
    {
      return;
      PttInfoCollector.a(1, (int)jdField_a_of_type_Double);
      int j = jdField_a_of_type_ComTencentMobileqqActivityBaseChatPie.d();
      if (QLog.isColorLevel()) {
        QLog.d("AIOAudioPanel", 2, "time is:" + jdField_a_of_type_Double + ",fateOfRecorder is:" + j);
      }
      if (j == 2)
      {
        jdField_a_of_type_AndroidOsHandler.post(new ktv(this, paramString, paramRecorderParam));
        return;
      }
      if (j != 0) {
        break;
      }
      jdField_a_of_type_ComTencentMobileqqActivityBaseChatPie.a(paramString, 1, (int)paramDouble, paramRecorderParam, 0, true);
      jdField_a_of_type_AndroidOsHandler.post(new ktw(this, paramString));
    } while (!(jdField_a_of_type_ComTencentMobileqqActivityBaseChatPie instanceof PublicAccountChatPie));
    ReportController.b(jdField_a_of_type_ComTencentMobileqqAppQQAppInterface, "P_CliOper", "Pb_account_lifeservice", "", "0X8005853", "0X8005853", 0, 0, "", "", Double.toString(jdField_a_of_type_Double), "");
    return;
    jdField_a_of_type_ComTencentMobileqqActivityBaseChatPie.b(paramString, 1, paramRecorderParam);
    jdField_a_of_type_AndroidOsHandler.post(new ktx(this, paramString));
  }
  
  public void a(String paramString1, QQRecorder.RecorderParam paramRecorderParam, String paramString2)
  {
    if (QLog.isColorLevel()) {
      QLog.d("AIOAudioPanel", 2, "PressToSpeakPanel.onRecorderError() is called,path is:" + paramString1 + ",errorCode is:" + paramString2);
    }
    jdField_a_of_type_ComTencentMobileqqActivityBaseChatPie.a(paramString1, false, true, paramRecorderParam);
    jdField_a_of_type_AndroidOsHandler.post(new kug(this));
    ReportController.b(jdField_a_of_type_ComTencentMobileqqAppQQAppInterface, "CliOper", "", "", "0X8005A17", "0X8005A17", 12, 0, "", "", "", "6.3.3");
  }
  
  public void a(String paramString, byte[] paramArrayOfByte, int paramInt1, int paramInt2, double paramDouble, QQRecorder.RecorderParam paramRecorderParam)
  {
    jdField_a_of_type_ComTencentMobileqqActivityBaseChatPie.a(paramString, paramArrayOfByte, paramInt1, paramInt2, paramDouble, paramRecorderParam);
    jdField_a_of_type_ComTencentMobileqqActivityBaseChatPie.a(paramString, (int)paramDouble, paramRecorderParam);
    jdField_a_of_type_AndroidOsHandler.post(new kue(this, paramInt2, paramDouble));
    jdField_a_of_type_Double = paramDouble;
  }
  
  public boolean a()
  {
    boolean bool1 = false;
    boolean bool2 = jdField_a_of_type_ComTencentMobileqqActivityBaseChatPie.g();
    if (QLog.isColorLevel()) {
      QLog.d("AIOAudioPanel", 2, "PressToSpeakPanel.onBackEvent() is called,isRecording is:" + bool2);
    }
    if (bool2)
    {
      jdField_a_of_type_ComTencentMobileqqActivityBaseChatPie.e(2);
      bool1 = true;
    }
    return bool1;
  }
  
  public boolean a(MotionEvent paramMotionEvent)
  {
    int m = paramMotionEvent.getAction();
    int n = (int)paramMotionEvent.getRawY();
    int i1 = (int)paramMotionEvent.getRawX();
    double d1;
    label166:
    int k;
    if ((m == 0) || (m == 2))
    {
      h = 3;
      double d2;
      if (jdField_a_of_type_ComTencentMobileqqActivityAioAudiopanelMoveDistIndicateView.getVisibility() == 0)
      {
        j = jdField_a_of_type_ComTencentMobileqqActivityAioAudiopanelMoveDistIndicateView.getWidth();
        if (!AppSetting.i) {
          break label355;
        }
        d1 = j * 1.2D;
        d2 = a(i1, n, jdField_a_of_type_ComTencentMobileqqActivityAioAudiopanelMoveDistIndicateView);
        if ((d2 >= 0.0D) && (d2 <= jdField_a_of_type_Int + d1))
        {
          if (d2 <= d1) {
            h = 1;
          }
          j = (int)(100.0D - (d2 - d1) / jdField_a_of_type_Int * 100.0D);
          if (h != 1) {
            break label366;
          }
          j = 100;
          jdField_a_of_type_ComTencentMobileqqActivityAioAudiopanelVolumeIndicateSquareView.setVisibility(8);
          jdField_b_of_type_ComTencentMobileqqActivityAioAudiopanelVolumeIndicateSquareView.setVisibility(8);
          paramMotionEvent = jdField_a_of_type_ComTencentMobileqqActivityAioAudiopanelMoveDistIndicateView;
          k = j;
          if (j > 100) {
            k = 100;
          }
          paramMotionEvent.setLevel(k);
        }
      }
      if (jdField_b_of_type_ComTencentMobileqqActivityAioAudiopanelMoveDistIndicateView.getVisibility() == 0)
      {
        j = jdField_b_of_type_ComTencentMobileqqActivityAioAudiopanelMoveDistIndicateView.getWidth();
        if (!AppSetting.i) {
          break label385;
        }
        d1 = j * 1.2D;
        label225:
        d2 = a(i1, n, jdField_b_of_type_ComTencentMobileqqActivityAioAudiopanelMoveDistIndicateView);
        if ((d2 >= 0.0D) && (d2 <= jdField_a_of_type_Int + d1))
        {
          if (d2 <= d1) {
            h = 2;
          }
          j = (int)(100.0D - (d2 - d1) / jdField_a_of_type_Int * 100.0D);
          if (h != 2) {
            break label396;
          }
          j = 100;
          jdField_a_of_type_ComTencentMobileqqActivityAioAudiopanelVolumeIndicateSquareView.setVisibility(8);
          jdField_b_of_type_ComTencentMobileqqActivityAioAudiopanelVolumeIndicateSquareView.setVisibility(8);
          label322:
          paramMotionEvent = jdField_b_of_type_ComTencentMobileqqActivityAioAudiopanelMoveDistIndicateView;
          k = j;
          if (j > 100) {
            k = 100;
          }
          paramMotionEvent.setLevel(k);
        }
      }
    }
    if (m == 0) {}
    label355:
    label366:
    label385:
    label396:
    while ((m == 2) || ((m != 1) && (m != 3)))
    {
      return true;
      d1 = j / 2.0D;
      break;
      jdField_a_of_type_ComTencentMobileqqActivityAioAudiopanelVolumeIndicateSquareView.setVisibility(0);
      jdField_b_of_type_ComTencentMobileqqActivityAioAudiopanelVolumeIndicateSquareView.setVisibility(0);
      break label166;
      d1 = j / 2.0D;
      break label225;
      jdField_a_of_type_ComTencentMobileqqActivityAioAudiopanelVolumeIndicateSquareView.setVisibility(0);
      jdField_b_of_type_ComTencentMobileqqActivityAioAudiopanelVolumeIndicateSquareView.setVisibility(0);
      break label322;
    }
    jdField_a_of_type_ComTencentMobileqqActivityAioAudiopanelMoveDistIndicateView.setLevel(0);
    jdField_b_of_type_ComTencentMobileqqActivityAioAudiopanelMoveDistIndicateView.setLevel(0);
    int j = 0;
    if (h == 1) {
      j = 2;
    }
    for (;;)
    {
      jdField_a_of_type_ComTencentMobileqqActivityBaseChatPie.e(j);
      break;
      if (h == 2)
      {
        k = 1;
        j = k;
        if (AppSetting.i)
        {
          AccessibilityUtil.a(g, getContext().getString(2131362088));
          j = k;
        }
      }
      else if (h == 3)
      {
        j = 0;
      }
    }
  }
  
  public void b()
  {
    boolean bool = jdField_a_of_type_ComTencentMobileqqActivityBaseChatPie.g();
    if (QLog.isColorLevel()) {
      QLog.d("AIOAudioPanel", 2, "PressToSpeakPanel.onPause() is called,isRecording is:" + bool);
    }
    if (bool) {
      jdField_a_of_type_ComTencentMobileqqActivityBaseChatPie.e(2);
    }
  }
  
  public void b(int paramInt)
  {
    paramInt /= 1250;
    jdField_a_of_type_ComTencentMobileqqActivityAioAudiopanelVolumeIndicateSquareView.a(paramInt);
    jdField_b_of_type_ComTencentMobileqqActivityAioAudiopanelVolumeIndicateSquareView.a(paramInt);
  }
  
  public void b(String paramString, QQRecorder.RecorderParam paramRecorderParam)
  {
    jdField_a_of_type_ComTencentMobileqqActivityBaseChatPie.a(paramString, true, true, paramRecorderParam);
    jdField_a_of_type_AndroidOsHandler.post(new kuf(this));
    ReportController.b(jdField_a_of_type_ComTencentMobileqqAppQQAppInterface, "CliOper", "", "", "0X8005A17", "0X8005A17", 14, 0, "", "", "", "6.3.3");
  }
  
  public boolean b()
  {
    if (jdField_a_of_type_Long == 0L) {
      jdField_a_of_type_Long = SystemClock.uptimeMillis();
    }
    while (SystemClock.uptimeMillis() - jdField_a_of_type_Long >= 75L)
    {
      jdField_a_of_type_Long = SystemClock.uptimeMillis();
      return true;
    }
    return false;
  }
  
  public void c()
  {
    boolean bool = jdField_a_of_type_ComTencentMobileqqActivityBaseChatPie.g();
    if ((jdField_a_of_type_ComTencentMobileqqActivityBaseChatPie.a() != null) && (!jdField_a_of_type_ComTencentMobileqqActivityBaseChatPie.a().isFinishing()) && (jdField_a_of_type_AndroidWidgetPopupWindow != null) && (jdField_a_of_type_AndroidWidgetPopupWindow.isShowing())) {
      jdField_a_of_type_AndroidWidgetPopupWindow.dismiss();
    }
    if (QLog.isColorLevel()) {
      QLog.d("AIOAudioPanel", 2, "PressToSpeakPanel.onDestroy() is called,isRecording is:" + bool);
    }
    if (bool)
    {
      jdField_a_of_type_ComTencentMobileqqActivityBaseChatPie.e(1);
      jdField_a_of_type_ComTencentMobileqqActivityBaseChatPie.f(1);
    }
    if ((AppSetting.i) && (jdField_b_of_type_Boolean)) {
      jdField_a_of_type_AndroidContentSharedPreferences.edit().putInt("key_ppt_hint", i).commit();
    }
  }
  
  public void c(String paramString, QQRecorder.RecorderParam paramRecorderParam)
  {
    if (QLog.isColorLevel()) {
      QLog.d("AIOAudioPanel", 2, "PressToSpeakPanel.onInitFailed() is called");
    }
    jdField_a_of_type_ComTencentMobileqqActivityBaseChatPie.a(paramString, true, true, paramRecorderParam);
    jdField_a_of_type_AndroidOsHandler.post(new kud(this));
    ReportController.b(jdField_a_of_type_ComTencentMobileqqAppQQAppInterface, "CliOper", "", "", "0X8005A17", "0X8005A17", 13, 0, "", "", "", "6.3.3");
  }
  
  public void d()
  {
    if (QLog.isColorLevel()) {
      QLog.d("AIOAudioPanel", 2, "PressToSpeakPanel.reset() is called");
    }
    if (jdField_a_of_type_ComTencentMobileqqActivityBaseChatPie.a().isFinishing()) {}
    for (;;)
    {
      return;
      f.setVisibility(8);
      jdField_a_of_type_AndroidWidgetTextView.setVisibility(0);
      d.setVisibility(8);
      e.setVisibility(8);
      jdField_b_of_type_AndroidWidgetImageView.setVisibility(0);
      jdField_b_of_type_AndroidWidgetTextView.setText(AudioPanel.a(0.0D));
      jdField_a_of_type_ComTencentMobileqqActivityAioAudiopanelVolumeIndicateSquareView.setVisibility(8);
      jdField_b_of_type_ComTencentMobileqqActivityAioAudiopanelVolumeIndicateSquareView.setVisibility(8);
      jdField_b_of_type_AndroidViewViewGroup.setVisibility(0);
      jdField_b_of_type_AndroidWidgetImageView.setBackgroundResource(2130842461);
      jdField_a_of_type_ComTencentMobileqqActivityAioAudiopanelAudioPanel.setStatus(1);
      if ((jdField_a_of_type_AndroidWidgetPopupWindow == null) || (jdField_a_of_type_AndroidWidgetPopupWindow.isShowing())) {}
      try
      {
        jdField_a_of_type_AndroidWidgetPopupWindow.dismiss();
        jdField_a_of_type_AndroidWidgetPopupWindow = null;
        if (jdField_a_of_type_AndroidViewView != null)
        {
          if (jdField_a_of_type_AndroidViewView.getParent() != null) {
            ((ViewGroup)jdField_a_of_type_AndroidViewView.getParent()).removeView(jdField_a_of_type_AndroidViewView);
          }
          jdField_a_of_type_AndroidViewView = null;
        }
        Object localObject = (PanelIconLinearLayout)jdField_a_of_type_AndroidViewViewGroup;
        if (localObject != null)
        {
          ((PanelIconLinearLayout)localObject).setAllAlpha(1.0F);
          ((PanelIconLinearLayout)localObject).setAllEnable(true);
        }
        int k = c.getChildCount();
        int j = 0;
        while (j < k)
        {
          localObject = c.getChildAt(j);
          if (((View)localObject).getVisibility() != 8) {
            break label277;
          }
          j += 1;
        }
      }
      catch (Exception localException)
      {
        for (;;)
        {
          if (QLog.isColorLevel())
          {
            QLog.d("AIOAudioPanel", 2, "PressToSpeakPanel.reset(),dismiss topMaskPanel caused exception,it is no matter.", localException);
            continue;
            label277:
            AlphaAnimation localAlphaAnimation = new AlphaAnimation(1.0F, 1.0F);
            localAlphaAnimation.setDuration(0L);
            localAlphaAnimation.setInterpolator(new LinearInterpolator());
            localException.startAnimation(localAlphaAnimation);
          }
        }
      }
    }
  }
  
  public void e()
  {
    if (QLog.isColorLevel()) {
      QLog.d("AIOAudioPanel", 2, "PressToSpeakPanel.prepareRecord() is called,time is:" + System.currentTimeMillis());
    }
    AIOUtils.l = true;
    f.setVisibility(8);
    jdField_a_of_type_AndroidWidgetTextView.setVisibility(8);
    d.setVisibility(0);
    e.setVisibility(8);
    jdField_b_of_type_AndroidWidgetImageView.setVisibility(0);
    jdField_a_of_type_ComTencentMobileqqActivityAioAudiopanelVolumeIndicateSquareView.setVisibility(8);
    jdField_b_of_type_ComTencentMobileqqActivityAioAudiopanelVolumeIndicateSquareView.setVisibility(8);
    jdField_b_of_type_AndroidViewViewGroup.setVisibility(8);
  }
  
  public void f()
  {
    if (QLog.isColorLevel()) {
      QLog.d("AIOAudioPanel", 2, " PressToSpeakPanel.startRecord() is called, time is " + System.currentTimeMillis());
    }
    jdField_a_of_type_ComTencentMobileqqActivityAioAudiopanelVolumeIndicateSquareView.a();
    jdField_b_of_type_ComTencentMobileqqActivityAioAudiopanelVolumeIndicateSquareView.a();
    f.setVisibility(0);
    jdField_a_of_type_AndroidWidgetTextView.setVisibility(8);
    d.setVisibility(8);
    e.setVisibility(0);
    jdField_b_of_type_AndroidWidgetImageView.setVisibility(0);
    jdField_a_of_type_ComTencentMobileqqActivityAioAudiopanelVolumeIndicateSquareView.setVisibility(0);
    jdField_b_of_type_ComTencentMobileqqActivityAioAudiopanelVolumeIndicateSquareView.setVisibility(0);
    jdField_b_of_type_AndroidViewViewGroup.setVisibility(8);
    jdField_a_of_type_ComTencentMobileqqActivityAioAudiopanelMoveDistIndicateView.setLevel(0);
    jdField_b_of_type_ComTencentMobileqqActivityAioAudiopanelMoveDistIndicateView.setLevel(0);
    AnimationSet localAnimationSet = new AnimationSet(true);
    localAnimationSet.setDuration(150L);
    localAnimationSet.setInterpolator(new LinearInterpolator());
    ScaleAnimation localScaleAnimation = new ScaleAnimation(0.86F, 1.0F, 0.86F, 1.0F, 1, 0.5F, 1, 0.5F);
    AlphaAnimation localAlphaAnimation = new AlphaAnimation(0.0F, 1.0F);
    localAnimationSet.addAnimation(localScaleAnimation);
    localAnimationSet.addAnimation(localAlphaAnimation);
    localAnimationSet.setAnimationListener(new kua(this));
    f.startAnimation(localAnimationSet);
  }
  
  public void g()
  {
    AnimationSet localAnimationSet = new AnimationSet(false);
    ScaleAnimation localScaleAnimation = new ScaleAnimation(1.0F, 0.9F, 1.0F, 0.9F, 1, 0.5F, 1, 0.5F);
    localScaleAnimation.setStartOffset(0L);
    localScaleAnimation.setDuration(200L);
    localScaleAnimation.setInterpolator(new LinearInterpolator());
    localAnimationSet.addAnimation(localScaleAnimation);
    localScaleAnimation = new ScaleAnimation(0.9F, 1.0F, 0.9F, 1.0F, 1, 0.5F, 1, 0.5F);
    localScaleAnimation.setStartOffset(200L);
    localScaleAnimation.setDuration(150L);
    localScaleAnimation.setInterpolator(new LinearInterpolator());
    localAnimationSet.addAnimation(localScaleAnimation);
    localAnimationSet.setAnimationListener(new ktz(this));
    jdField_b_of_type_AndroidWidgetImageView.startAnimation(localAnimationSet);
  }
  
  public boolean onTouch(View paramView, MotionEvent paramMotionEvent)
  {
    int j = paramMotionEvent.getAction();
    if (QLog.isColorLevel()) {
      QLog.d("AIOAudioPanel", 2, "PressToSpeakPanel.onTouch() is called,action is:" + j);
    }
    jdField_a_of_type_ComTencentMobileqqActivityAioAudiopanelAudioPanel.d();
    if (paramView.getId() == 2131300876)
    {
      if (j == 0)
      {
        paramView = new kty(this, paramMotionEvent);
        paramView = Message.obtain(jdField_a_of_type_AndroidOsHandler, paramView);
        what = 1;
        jdField_a_of_type_AndroidOsHandler.sendMessageDelayed(paramView, 150L);
      }
      do
      {
        do
        {
          do
          {
            return true;
            if (j != 2) {
              break;
            }
          } while ((!jdField_a_of_type_Boolean) || (!jdField_a_of_type_ComTencentMobileqqActivityBaseChatPie.g()));
          a(paramMotionEvent);
          return true;
        } while ((j != 3) && (j != 1));
        if (!jdField_a_of_type_Boolean) {
          break;
        }
        jdField_a_of_type_Boolean = false;
      } while (!jdField_a_of_type_ComTencentMobileqqActivityBaseChatPie.g());
      a(paramMotionEvent);
      return true;
      jdField_a_of_type_AndroidOsHandler.removeMessages(1);
      return true;
    }
    return false;
  }
}
