package com.tencent.mobileqq.activity.aio.audiopanel;

import android.content.Context;
import android.graphics.Rect;
import android.os.Build;
import android.os.Handler;
import android.os.Looper;
import android.os.SystemClock;
import android.util.AttributeSet;
import android.view.MotionEvent;
import android.view.View;
import android.view.View.OnClickListener;
import android.view.ViewGroup;
import android.view.animation.AlphaAnimation;
import android.view.animation.LinearInterpolator;
import android.widget.ImageView;
import android.widget.PopupWindow;
import android.widget.RelativeLayout;
import android.widget.TextView;
import com.tencent.mobileqq.activity.BaseChatPie;
import com.tencent.mobileqq.activity.ChatActivityUtils;
import com.tencent.mobileqq.activity.aio.panel.PanelIconLinearLayout;
import com.tencent.mobileqq.activity.aio.rebuild.PublicAccountChatPie;
import com.tencent.mobileqq.app.BaseActivity;
import com.tencent.mobileqq.app.QQAppInterface;
import com.tencent.mobileqq.hotpatch.NotVerifyClass;
import com.tencent.mobileqq.statistics.ReportController;
import com.tencent.mobileqq.transfile.PttInfoCollector;
import com.tencent.mobileqq.utils.AudioHelper;
import com.tencent.mobileqq.utils.FileUtils;
import com.tencent.mobileqq.utils.QQRecorder;
import com.tencent.mobileqq.utils.QQRecorder.OnQQRecorderListener;
import com.tencent.mobileqq.utils.QQRecorder.RecorderParam;
import com.tencent.mobileqq.widget.QQToast;
import com.tencent.qphone.base.util.BaseApplication;
import com.tencent.qphone.base.util.QLog;
import com.tencent.util.VersionUtils;
import kui;
import kuj;
import kuk;
import kul;
import kum;
import kun;
import kuo;
import kup;
import kuq;
import kur;

public class RecordSoundPanel
  extends RelativeLayout
  implements View.OnClickListener, AudioPanelCallback, QQRecorder.OnQQRecorderListener
{
  public static final int a = 1;
  public static final int b = 2000;
  public double a;
  public long a;
  public Handler a;
  protected View a;
  protected ViewGroup a;
  protected ImageView a;
  protected PopupWindow a;
  protected TextView a;
  public BaseChatPie a;
  public AudioPanel a;
  protected VolumeIndicateSquareView a;
  protected QQAppInterface a;
  public String a;
  protected boolean a;
  protected ViewGroup b;
  public TextView b;
  protected VolumeIndicateSquareView b;
  protected boolean b;
  protected ViewGroup c;
  private boolean c;
  protected ViewGroup d;
  protected ViewGroup e;
  public ViewGroup f;
  
  public RecordSoundPanel(Context paramContext)
  {
    super(paramContext);
    boolean bool = NotVerifyClass.DO_VERIFY_CLASS;
    jdField_a_of_type_Boolean = true;
    jdField_c_of_type_Boolean = false;
    jdField_b_of_type_Boolean = true;
    jdField_a_of_type_AndroidOsHandler = new kui(this, Looper.getMainLooper());
    jdField_a_of_type_Long = 0L;
  }
  
  public RecordSoundPanel(Context paramContext, AttributeSet paramAttributeSet)
  {
    super(paramContext, paramAttributeSet, 0);
    jdField_a_of_type_Boolean = true;
    jdField_c_of_type_Boolean = false;
    jdField_b_of_type_Boolean = true;
    jdField_a_of_type_AndroidOsHandler = new kui(this, Looper.getMainLooper());
    jdField_a_of_type_Long = 0L;
  }
  
  public int a()
  {
    jdField_a_of_type_Double = 0.0D;
    if (QLog.isColorLevel()) {
      QLog.d("AIOAudioPanel", 2, "RecordSoundPanel.onRecorderStart() is called");
    }
    jdField_a_of_type_AndroidOsHandler.post(new kul(this));
    jdField_a_of_type_AndroidOsHandler.removeMessages(1);
    jdField_a_of_type_AndroidOsHandler.sendEmptyMessageDelayed(1, 2000L);
    jdField_a_of_type_Boolean = true;
    PttInfoCollector.b(2);
    return 350;
  }
  
  public int a(String paramString, QQRecorder.RecorderParam paramRecorderParam)
  {
    if (QLog.isColorLevel()) {
      QLog.d("AIOAudioPanel", 2, "RecordSoundPanel.onBeginReceiveData() is called");
    }
    return jdField_a_of_type_ComTencentMobileqqActivityBaseChatPie.e();
  }
  
  public void a()
  {
    if (QLog.isColorLevel()) {
      QLog.d("AIOAudioPanel", 2, "RecordSoundPanel.onInitSuccess() is called");
    }
  }
  
  public void a(int paramInt)
  {
    if (paramInt == 1) {
      ReportController.b(jdField_a_of_type_ComTencentMobileqqAppQQAppInterface, "CliOper", "", "", "0X800484D", "0X800484D", 0, 0, "", "", "", "");
    }
    jdField_a_of_type_ComTencentMobileqqActivityBaseChatPie.h(paramInt);
  }
  
  public void a(QQAppInterface paramQQAppInterface, BaseChatPie paramBaseChatPie, ViewGroup paramViewGroup1, AudioPanel paramAudioPanel, ViewGroup paramViewGroup2, ViewGroup paramViewGroup3, ViewGroup paramViewGroup4)
  {
    jdField_a_of_type_ComTencentMobileqqAppQQAppInterface = paramQQAppInterface;
    jdField_a_of_type_ComTencentMobileqqActivityBaseChatPie = paramBaseChatPie;
    f = paramViewGroup1;
    jdField_a_of_type_ComTencentMobileqqActivityAioAudiopanelAudioPanel = paramAudioPanel;
    jdField_a_of_type_AndroidViewViewGroup = paramViewGroup2;
    jdField_b_of_type_AndroidViewViewGroup = paramViewGroup3;
    jdField_c_of_type_AndroidViewViewGroup = paramViewGroup4;
    jdField_a_of_type_AndroidWidgetTextView = ((TextView)findViewById(2131299341));
    d = ((ViewGroup)findViewById(2131299342));
    e = ((ViewGroup)findViewById(2131299332));
    jdField_a_of_type_ComTencentMobileqqActivityAioAudiopanelVolumeIndicateSquareView = ((VolumeIndicateSquareView)findViewById(2131299333));
    jdField_b_of_type_ComTencentMobileqqActivityAioAudiopanelVolumeIndicateSquareView = ((VolumeIndicateSquareView)findViewById(2131299335));
    jdField_b_of_type_AndroidWidgetTextView = ((TextView)findViewById(2131299345));
    jdField_a_of_type_AndroidWidgetImageView = ((ImageView)findViewById(2131299346));
    jdField_a_of_type_AndroidWidgetImageView.setOnClickListener(this);
    paramBaseChatPie.a().getResources();
    setClickable(true);
    if (QLog.isColorLevel()) {
      QLog.d("AIOAudioPanel", 2, "RecordSoundPanel.init() is called,time is:" + System.currentTimeMillis());
    }
  }
  
  public void a(String paramString)
  {
    if (QLog.isColorLevel()) {
      QLog.d("AIOAudioPanel", 2, "RecordSoundPanel.onRecorderNotReady() is called,path is:" + paramString);
    }
  }
  
  public void a(String paramString, QQRecorder.RecorderParam paramRecorderParam)
  {
    if (QLog.isColorLevel()) {
      QLog.d("AIOAudioPanel", 2, "RecordSoundPanel.onRecorderPrepare() is called");
    }
    jdField_a_of_type_AndroidOsHandler.post(new kuk(this, paramString));
    jdField_a_of_type_ComTencentMobileqqActivityBaseChatPie.a(paramString, false, paramRecorderParam);
  }
  
  public void a(String paramString, QQRecorder.RecorderParam paramRecorderParam, double paramDouble)
  {
    if (QLog.isColorLevel()) {
      QLog.d("AIOAudioPanel", 2, "RecordSoundPanel.onRecorderEnd() is called,path is:" + paramString);
    }
    jdField_a_of_type_AndroidOsHandler.removeMessages(1);
    if (jdField_a_of_type_Double < 500.0D)
    {
      jdField_a_of_type_ComTencentMobileqqActivityBaseChatPie.a(paramString);
      jdField_a_of_type_AndroidOsHandler.post(new kuq(this, paramString, paramRecorderParam));
    }
    int i;
    do
    {
      return;
      PttInfoCollector.a(2, (int)jdField_a_of_type_Double);
      i = jdField_a_of_type_ComTencentMobileqqActivityBaseChatPie.d();
      if (QLog.isColorLevel()) {
        QLog.d("AIOAudioPanel", 2, "fateOfRecorder is:" + i);
      }
      if (i == 2)
      {
        jdField_a_of_type_AndroidOsHandler.post(new kur(this, paramString, paramRecorderParam));
        return;
      }
    } while (i != 1);
    jdField_a_of_type_ComTencentMobileqqActivityBaseChatPie.b(paramString, 3, paramRecorderParam);
    jdField_a_of_type_AndroidOsHandler.post(new kuj(this, paramString));
  }
  
  public void a(String paramString1, QQRecorder.RecorderParam paramRecorderParam, String paramString2)
  {
    if (QLog.isColorLevel()) {
      QLog.d("AIOAudioPanel", 2, "RecordSoundPanel.onRecorderError() is called,path is:" + paramString1);
    }
    jdField_a_of_type_ComTencentMobileqqActivityBaseChatPie.a(paramString1, false, false, paramRecorderParam);
    jdField_a_of_type_AndroidOsHandler.removeMessages(1);
    jdField_a_of_type_AndroidOsHandler.post(new kup(this));
  }
  
  public void a(String paramString, byte[] paramArrayOfByte, int paramInt1, int paramInt2, double paramDouble, QQRecorder.RecorderParam paramRecorderParam)
  {
    jdField_a_of_type_ComTencentMobileqqActivityBaseChatPie.a(paramString, paramArrayOfByte, paramInt1, paramInt2, paramDouble, paramRecorderParam);
    jdField_a_of_type_ComTencentMobileqqActivityBaseChatPie.a(paramString, (int)paramDouble, paramRecorderParam);
    if (jdField_a_of_type_Boolean)
    {
      jdField_a_of_type_Boolean = false;
      jdField_a_of_type_AndroidOsHandler.removeMessages(1);
    }
    if (b()) {
      jdField_a_of_type_AndroidOsHandler.post(new kun(this, paramInt2, paramDouble));
    }
    jdField_a_of_type_Double = paramDouble;
  }
  
  public boolean a()
  {
    boolean bool1 = false;
    boolean bool2 = jdField_a_of_type_ComTencentMobileqqActivityBaseChatPie.g();
    if (QLog.isColorLevel()) {
      QLog.d("AIOAudioPanel", 2, "RecordSoundPanel.onBackEvent() is called,isRecording is:" + bool2);
    }
    if (bool2)
    {
      jdField_a_of_type_ComTencentMobileqqActivityBaseChatPie.e(2);
      bool1 = true;
    }
    return bool1;
  }
  
  public void b()
  {
    boolean bool = jdField_a_of_type_ComTencentMobileqqActivityBaseChatPie.g();
    if (QLog.isColorLevel()) {
      QLog.d("AIOAudioPanel", 2, "RecordSoundPanel.onPause() is called,isRecording is:" + bool);
    }
    if (bool) {
      jdField_a_of_type_ComTencentMobileqqActivityBaseChatPie.e(2);
    }
  }
  
  public void b(int paramInt)
  {
    paramInt /= 1180;
    jdField_a_of_type_ComTencentMobileqqActivityAioAudiopanelVolumeIndicateSquareView.a(paramInt);
    jdField_b_of_type_ComTencentMobileqqActivityAioAudiopanelVolumeIndicateSquareView.a(paramInt);
  }
  
  public void b(String paramString, QQRecorder.RecorderParam paramRecorderParam)
  {
    jdField_a_of_type_ComTencentMobileqqActivityBaseChatPie.a(paramString, true, false, paramRecorderParam);
    jdField_a_of_type_AndroidOsHandler.removeMessages(1);
    jdField_a_of_type_AndroidOsHandler.post(new kuo(this));
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
    d();
    boolean bool = jdField_a_of_type_ComTencentMobileqqActivityBaseChatPie.g();
    if (QLog.isColorLevel()) {
      QLog.d("AIOAudioPanel", 2, "RecordSoundPanel.onDestroy() is called,isRecording is:" + bool);
    }
    if (bool)
    {
      jdField_a_of_type_ComTencentMobileqqActivityBaseChatPie.e(1);
      jdField_a_of_type_ComTencentMobileqqActivityBaseChatPie.f(1);
    }
  }
  
  public void c(String paramString, QQRecorder.RecorderParam paramRecorderParam)
  {
    if (QLog.isColorLevel()) {
      QLog.d("AIOAudioPanel", 2, "RecordSoundPanel.onInitFailed() is called");
    }
    jdField_a_of_type_ComTencentMobileqqActivityBaseChatPie.a(paramString, true, false, paramRecorderParam);
    jdField_a_of_type_AndroidOsHandler.post(new kum(this));
  }
  
  public void d()
  {
    if (QLog.isColorLevel()) {
      QLog.d("AIOAudioPanel", 2, "RecordSoundPanel.reset() is called");
    }
    setClickable(true);
    jdField_a_of_type_AndroidWidgetTextView.setVisibility(0);
    d.setVisibility(8);
    e.setVisibility(8);
    jdField_a_of_type_AndroidWidgetImageView.setVisibility(0);
    jdField_a_of_type_AndroidWidgetImageView.setImageResource(2130840215);
    jdField_a_of_type_AndroidWidgetImageView.setContentDescription("开始录音");
    jdField_b_of_type_AndroidWidgetTextView.setText(AudioPanel.a(0.0D));
    jdField_a_of_type_ComTencentMobileqqActivityAioAudiopanelAudioPanel.setStatus(1);
    jdField_a_of_type_AndroidViewViewGroup.setVisibility(0);
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
      Object localObject = (PanelIconLinearLayout)jdField_c_of_type_AndroidViewViewGroup;
      if (localObject != null)
      {
        ((PanelIconLinearLayout)localObject).setAllAlpha(1.0F);
        ((PanelIconLinearLayout)localObject).setAllEnable(true);
      }
      int j = jdField_b_of_type_AndroidViewViewGroup.getChildCount();
      int i = 0;
      for (;;)
      {
        if (i >= j) {
          return;
        }
        localObject = jdField_b_of_type_AndroidViewViewGroup.getChildAt(i);
        if (((View)localObject).getVisibility() != 8) {
          break;
        }
        i += 1;
      }
    }
    catch (Exception localException)
    {
      for (;;)
      {
        if (QLog.isColorLevel())
        {
          QLog.d("AIOAudioPanel", 2, "RecordSoundPanel.reset(),dismiss topMaskPanel caused exception,it is no matter.", localException);
          continue;
          AlphaAnimation localAlphaAnimation = new AlphaAnimation(1.0F, 1.0F);
          localAlphaAnimation.setDuration(0L);
          localAlphaAnimation.setInterpolator(new LinearInterpolator());
          localException.startAnimation(localAlphaAnimation);
        }
      }
    }
  }
  
  public void e()
  {
    jdField_a_of_type_AndroidWidgetTextView.setVisibility(8);
    d.setVisibility(0);
    e.setVisibility(8);
    jdField_a_of_type_AndroidWidgetImageView.setVisibility(0);
    jdField_a_of_type_AndroidViewViewGroup.setVisibility(8);
  }
  
  public void f()
  {
    if ((jdField_a_of_type_ComTencentMobileqqActivityAioAudiopanelVolumeIndicateSquareView != null) && (jdField_b_of_type_ComTencentMobileqqActivityAioAudiopanelVolumeIndicateSquareView != null))
    {
      jdField_a_of_type_ComTencentMobileqqActivityAioAudiopanelVolumeIndicateSquareView.a();
      jdField_b_of_type_ComTencentMobileqqActivityAioAudiopanelVolumeIndicateSquareView.a();
    }
    jdField_a_of_type_AndroidWidgetTextView.setVisibility(8);
    d.setVisibility(8);
    e.setVisibility(0);
    jdField_a_of_type_AndroidWidgetImageView.setVisibility(0);
    jdField_a_of_type_AndroidViewViewGroup.setVisibility(8);
  }
  
  public void onClick(View paramView)
  {
    int i = paramView.getId();
    if (QLog.isColorLevel()) {
      QLog.d("AIOAudioPanel", 2, "RecordSoundPanel.onClick() is called");
    }
    com.tencent.mobileqq.activity.aio.AIOUtils.l = true;
    if (i == 2131299346)
    {
      boolean bool = jdField_a_of_type_ComTencentMobileqqActivityBaseChatPie.g();
      if (QLog.isColorLevel()) {
        QLog.d("AIOAudioPanel", 2, "isRecording is:" + bool);
      }
      if (!bool) {
        break label101;
      }
      if (jdField_a_of_type_ComTencentMobileqqActivityBaseChatPie.f())
      {
        setClickable(false);
        jdField_a_of_type_ComTencentMobileqqActivityBaseChatPie.e(2);
      }
    }
    return;
    label101:
    PttInfoCollector.jdField_a_of_type_Long = SystemClock.uptimeMillis();
    i = jdField_a_of_type_ComTencentMobileqqActivityBaseChatPie.a().getTitleBarHeight();
    paramView = jdField_a_of_type_ComTencentMobileqqActivityBaseChatPie.a();
    if (!FileUtils.a()) {
      QQToast.a(BaseApplication.getContext(), 2131367409, 0).b(i);
    }
    for (;;)
    {
      ReportController.b(jdField_a_of_type_ComTencentMobileqqAppQQAppInterface, "CliOper", "", "", "Voice_record", "Voice_record_clk", 0, 0, "", "", "", "");
      if (!(jdField_a_of_type_ComTencentMobileqqActivityBaseChatPie instanceof PublicAccountChatPie)) {
        break;
      }
      ReportController.b(jdField_a_of_type_ComTencentMobileqqAppQQAppInterface, "P_CliOper", "Pb_account_lifeservice", "", "0X8005854", "0X8005854", 0, 0, "", "", Double.toString(jdField_a_of_type_Double), "");
      return;
      if (!QQRecorder.d())
      {
        QQToast.a(BaseApplication.getContext(), 2131367410, 0).b(i);
      }
      else if (!QQRecorder.a(c))
      {
        QQToast.a(BaseApplication.getContext(), 2131367413, 0).b(i);
      }
      else if (jdField_a_of_type_ComTencentMobileqqAppQQAppInterface.d())
      {
        QQToast.a(BaseApplication.getContext(), 2131367775, 0).a();
      }
      else if (AudioHelper.b(1))
      {
        ChatActivityUtils.a(jdField_a_of_type_ComTencentMobileqqActivityBaseChatPie.a());
      }
      else
      {
        jdField_a_of_type_AndroidWidgetImageView.setImageResource(2130840214);
        jdField_a_of_type_AndroidWidgetImageView.setContentDescription("停止录音");
        jdField_a_of_type_ComTencentMobileqqActivityBaseChatPie.a(this, jdField_b_of_type_Boolean, paramView);
        jdField_a_of_type_ComTencentMobileqqActivityBaseChatPie.f(2);
        jdField_a_of_type_ComTencentMobileqqActivityAioAudiopanelAudioPanel.setStatus(3);
        paramView = new Rect();
        getWindowVisibleDisplayFrame(paramView);
        Rect localRect = new Rect();
        jdField_b_of_type_AndroidViewViewGroup.getGlobalVisibleRect(localRect);
        localRect = new Rect();
        jdField_c_of_type_AndroidViewViewGroup.getGlobalVisibleRect(localRect);
        int j = bottom;
        i = j;
        if (Build.MODEL.startsWith("Coolpad"))
        {
          i = j;
          if (VersionUtils.h()) {
            i = j - top;
          }
        }
        jdField_a_of_type_AndroidWidgetPopupWindow = AudioPanel.a(jdField_a_of_type_ComTencentMobileqqActivityBaseChatPie.a(), right, bottom, i, this, 0, 0, 0);
        jdField_a_of_type_AndroidViewView = AudioPanel.a(jdField_a_of_type_ComTencentMobileqqActivityBaseChatPie.a(), jdField_b_of_type_AndroidViewViewGroup, jdField_c_of_type_AndroidViewViewGroup);
      }
    }
  }
  
  public boolean onTouchEvent(MotionEvent paramMotionEvent)
  {
    super.onTouchEvent(paramMotionEvent);
    return jdField_a_of_type_ComTencentMobileqqActivityBaseChatPie.g();
  }
}
