package com.tencent.mobileqq.activity.aio.audiopanel;

import android.content.Context;
import android.os.Handler;
import android.os.Looper;
import android.os.Message;
import android.os.SystemClock;
import android.support.v4.view.ViewCompat;
import android.util.AttributeSet;
import android.view.LayoutInflater;
import android.view.MotionEvent;
import android.view.View;
import android.view.View.OnTouchListener;
import android.view.ViewGroup;
import android.view.animation.AlphaAnimation;
import android.view.animation.AnimationSet;
import android.view.animation.LinearInterpolator;
import android.view.animation.ScaleAnimation;
import android.widget.FrameLayout.LayoutParams;
import android.widget.ImageView;
import android.widget.PopupWindow;
import android.widget.RelativeLayout;
import android.widget.TextView;
import com.tencent.common.config.AppSetting;
import com.tencent.mobileqq.activity.BaseChatPie;
import com.tencent.mobileqq.activity.aio.panel.PanelIconLinearLayout;
import com.tencent.mobileqq.activity.aio.rebuild.DeviceMsgChatPie;
import com.tencent.mobileqq.app.BaseActivity;
import com.tencent.mobileqq.app.QQAppInterface;
import com.tencent.mobileqq.hotpatch.NotVerifyClass;
import com.tencent.mobileqq.ptt.preop.PttPreSendManager;
import com.tencent.mobileqq.statistics.ReportController;
import com.tencent.mobileqq.transfile.PttInfoCollector;
import com.tencent.mobileqq.utils.QQRecorder.OnQQRecorderListener;
import com.tencent.mobileqq.utils.QQRecorder.RecorderParam;
import com.tencent.mobileqq.widget.QQToast;
import com.tencent.qphone.base.util.BaseApplication;
import com.tencent.qphone.base.util.QLog;
import kth;
import kti;
import ktj;
import ktk;
import ktl;
import ktm;
import ktn;
import kto;
import ktq;
import ktr;
import kts;
import ktt;

public class PressToChangeVoicePanel
  extends RelativeLayout
  implements View.OnTouchListener, AudioPanelCallback, QQRecorder.OnQQRecorderListener
{
  private static final int jdField_a_of_type_Int = 150;
  private static final int jdField_b_of_type_Int = 1;
  public double a;
  public long a;
  private Handler jdField_a_of_type_AndroidOsHandler;
  public View a;
  protected ViewGroup a;
  private ImageView jdField_a_of_type_AndroidWidgetImageView;
  public PopupWindow a;
  private TextView jdField_a_of_type_AndroidWidgetTextView;
  public BaseChatPie a;
  public AudioPanel a;
  public AudioPanelAdapter a;
  protected VolumeIndicateSquareView a;
  public QQAppInterface a;
  public boolean a;
  public ViewGroup b;
  private TextView jdField_b_of_type_AndroidWidgetTextView;
  protected VolumeIndicateSquareView b;
  private boolean jdField_b_of_type_Boolean;
  public ViewGroup c;
  protected ViewGroup d;
  protected ViewGroup e;
  public ViewGroup f;
  
  public PressToChangeVoicePanel(Context paramContext, AttributeSet paramAttributeSet)
  {
    super(paramContext, paramAttributeSet);
    boolean bool = NotVerifyClass.DO_VERIFY_CLASS;
    jdField_b_of_type_Boolean = false;
    jdField_a_of_type_Long = 0L;
  }
  
  private boolean a(View paramView, MotionEvent paramMotionEvent)
  {
    int i = paramMotionEvent.getAction();
    int j = (int)paramMotionEvent.getRawY();
    int k = (int)paramMotionEvent.getRawX();
    if (i == 0) {
      if (jdField_a_of_type_ComTencentMobileqqActivityBaseChatPie.f()) {
        jdField_a_of_type_ComTencentMobileqqActivityBaseChatPie.e(2);
      }
    }
    for (;;)
    {
      return true;
      if (i == 2)
      {
        paramMotionEvent = new int[2];
        paramView.getLocationOnScreen(paramMotionEvent);
        double d1 = paramView.getWidth();
        double d2 = paramView.getHeight();
        double d3 = paramMotionEvent[0];
        double d4 = paramMotionEvent[1];
        if ((Math.abs(k - (d3 + d1)) > d1) || (Math.abs(j - (d4 + d2)) > d2)) {
          if (jdField_b_of_type_Boolean)
          {
            jdField_b_of_type_Boolean = false;
            if (jdField_a_of_type_ComTencentMobileqqActivityBaseChatPie.f())
            {
              setClickable(false);
              jdField_a_of_type_ComTencentMobileqqActivityBaseChatPie.e(2);
            }
          }
          else
          {
            jdField_a_of_type_AndroidOsHandler.removeMessages(1);
          }
        }
      }
      else if ((i == 1) || (i == 3))
      {
        if (jdField_b_of_type_Boolean)
        {
          jdField_b_of_type_Boolean = false;
          if (jdField_a_of_type_ComTencentMobileqqActivityBaseChatPie.f())
          {
            setClickable(false);
            jdField_a_of_type_ComTencentMobileqqActivityBaseChatPie.e(2);
          }
        }
        else
        {
          jdField_a_of_type_AndroidOsHandler.removeMessages(1);
        }
      }
    }
  }
  
  public int a()
  {
    jdField_a_of_type_Double = 0.0D;
    if (QLog.isColorLevel()) {
      QLog.d("AIOAudioPanel", 2, "PressToSpeakPanel.onRecorderStart() is called");
    }
    jdField_a_of_type_AndroidOsHandler.post(new ktm(this));
    PttInfoCollector.b(0);
    return 350;
  }
  
  public int a(String paramString, QQRecorder.RecorderParam paramRecorderParam)
  {
    if (QLog.isColorLevel()) {
      QLog.d("AIOAudioPanel", 2, "PressToSpeakPanel.onBeginReceiveData() is called");
    }
    PttPreSendManager.a(jdField_a_of_type_ComTencentMobileqqAppQQAppInterface).a(paramString, paramRecorderParam);
    return jdField_a_of_type_ComTencentMobileqqActivityBaseChatPie.e();
  }
  
  public void a()
  {
    if (QLog.isColorLevel()) {
      QLog.d("AIOAudioPanel", 2, "PressToChangePanel.onInitSuccess() is called");
    }
  }
  
  public void a(int paramInt)
  {
    jdField_a_of_type_ComTencentMobileqqActivityBaseChatPie.h(paramInt);
    if (paramInt == 1) {}
  }
  
  public void a(QQAppInterface paramQQAppInterface, BaseChatPie paramBaseChatPie, ViewGroup paramViewGroup1, AudioPanel paramAudioPanel, ViewGroup paramViewGroup2, ViewGroup paramViewGroup3, ViewGroup paramViewGroup4, AudioPanelAdapter paramAudioPanelAdapter)
  {
    jdField_a_of_type_ComTencentMobileqqAppQQAppInterface = paramQQAppInterface;
    jdField_a_of_type_ComTencentMobileqqActivityBaseChatPie = paramBaseChatPie;
    f = paramViewGroup1;
    jdField_a_of_type_ComTencentMobileqqActivityAioAudiopanelAudioPanel = paramAudioPanel;
    jdField_a_of_type_AndroidViewViewGroup = paramViewGroup2;
    jdField_b_of_type_AndroidViewViewGroup = paramViewGroup3;
    c = paramViewGroup4;
    jdField_a_of_type_ComTencentMobileqqActivityAioAudiopanelAudioPanelAdapter = paramAudioPanelAdapter;
    jdField_a_of_type_AndroidOsHandler = new Handler(Looper.getMainLooper());
    jdField_a_of_type_AndroidWidgetTextView = ((TextView)findViewById(2131300869));
    d = ((ViewGroup)findViewById(2131299342));
    e = ((ViewGroup)findViewById(2131299332));
    jdField_a_of_type_ComTencentMobileqqActivityAioAudiopanelVolumeIndicateSquareView = ((VolumeIndicateSquareView)findViewById(2131299333));
    jdField_b_of_type_ComTencentMobileqqActivityAioAudiopanelVolumeIndicateSquareView = ((VolumeIndicateSquareView)findViewById(2131299335));
    jdField_b_of_type_AndroidWidgetTextView = ((TextView)findViewById(2131299334));
    jdField_a_of_type_AndroidWidgetImageView = ((ImageView)findViewById(2131300870));
    jdField_a_of_type_AndroidWidgetImageView.setOnTouchListener(this);
    if (QLog.isColorLevel()) {
      QLog.d("AIOAudioPanel", 2, "PressToChangeVoice.init() is called");
    }
    if (AppSetting.i)
    {
      ViewCompat.setImportantForAccessibility(jdField_a_of_type_AndroidWidgetTextView, 2);
      jdField_a_of_type_AndroidWidgetImageView.setContentDescription(getContext().getString(2131362089));
    }
  }
  
  public void a(String paramString)
  {
    if (QLog.isColorLevel()) {
      QLog.d("AIOAudioPanel", 2, "PressToChanegVoicePanel.onRecorderNotReady() is called,path is:" + paramString);
    }
  }
  
  public void a(String paramString, QQRecorder.RecorderParam paramRecorderParam)
  {
    if (QLog.isColorLevel()) {
      QLog.d("AIOAudioPanel", 2, "PressToChanegVoicePanel.onRecorderPrepare() is called,path is:" + paramString);
    }
    jdField_a_of_type_AndroidOsHandler.post(new ktl(this));
    jdField_a_of_type_ComTencentMobileqqActivityBaseChatPie.a(paramString, false, paramRecorderParam);
  }
  
  public void a(String paramString, QQRecorder.RecorderParam paramRecorderParam, double paramDouble)
  {
    if (QLog.isColorLevel()) {
      QLog.d("AIOAudioPanel", 2, "RecordSoundPanel.onRecorderEnd() is called,path is:" + paramString + ", type: " + c + ", time:" + jdField_a_of_type_Double);
    }
    if (jdField_a_of_type_Double < 800.0D)
    {
      jdField_a_of_type_ComTencentMobileqqActivityBaseChatPie.a(paramString);
      jdField_a_of_type_AndroidOsHandler.post(new ktn(this, paramString, paramRecorderParam));
      PttPreSendManager.a(jdField_a_of_type_ComTencentMobileqqAppQQAppInterface).c();
      ReportController.b(jdField_a_of_type_ComTencentMobileqqAppQQAppInterface, "CliOper", "", "", "0X8005A17", "0X8005A17", 1, 0, String.valueOf((int)jdField_a_of_type_Double), "", "", "6.3.3");
    }
    int i;
    do
    {
      return;
      PttInfoCollector.a(3, (int)jdField_a_of_type_Double);
      i = jdField_a_of_type_ComTencentMobileqqActivityBaseChatPie.d();
      if (QLog.isColorLevel()) {
        QLog.d("AIOAudioPanel", 2, "fateOfRecorder is:" + i);
      }
      if (i == 2)
      {
        jdField_a_of_type_AndroidOsHandler.post(new kto(this, paramString, paramRecorderParam));
        return;
      }
    } while (i != 1);
    PttPreSendManager.a(jdField_a_of_type_ComTencentMobileqqAppQQAppInterface).c();
    jdField_a_of_type_ComTencentMobileqqActivityBaseChatPie.b(paramString, 4, paramRecorderParam);
    jdField_a_of_type_AndroidOsHandler.post(new ktq(this, paramString));
  }
  
  public void a(String paramString1, QQRecorder.RecorderParam paramRecorderParam, String paramString2)
  {
    if (QLog.isColorLevel()) {
      QLog.d("AIOAudioPanel", 2, "PressToChangeVoicePanel.onRecorderError() is called,path is:" + paramString1 + ",errorCode is:" + paramString2);
    }
    jdField_a_of_type_ComTencentMobileqqActivityBaseChatPie.a(paramString1, false, false, paramRecorderParam);
    jdField_a_of_type_AndroidOsHandler.post(new ktr(this));
    ReportController.b(jdField_a_of_type_ComTencentMobileqqAppQQAppInterface, "CliOper", "", "", "0X8005A17", "0X8005A17", 2, 0, "", "", "", "6.3.3");
    PttPreSendManager.a(jdField_a_of_type_ComTencentMobileqqAppQQAppInterface).c();
  }
  
  public void a(String paramString, byte[] paramArrayOfByte, int paramInt1, int paramInt2, double paramDouble, QQRecorder.RecorderParam paramRecorderParam)
  {
    jdField_a_of_type_ComTencentMobileqqActivityBaseChatPie.a(paramString, paramArrayOfByte, paramInt1, paramInt2, paramDouble, paramRecorderParam);
    jdField_a_of_type_ComTencentMobileqqActivityBaseChatPie.a(paramString, (int)paramDouble, paramRecorderParam);
    PttPreSendManager.a(jdField_a_of_type_ComTencentMobileqqAppQQAppInterface).a(paramArrayOfByte, paramInt1);
    if (b()) {
      jdField_a_of_type_AndroidOsHandler.post(new kti(this, paramInt2, paramDouble));
    }
    jdField_a_of_type_Double = paramDouble;
  }
  
  public boolean a()
  {
    boolean bool1 = false;
    boolean bool2 = jdField_a_of_type_ComTencentMobileqqActivityBaseChatPie.g();
    if (QLog.isColorLevel()) {
      QLog.d("AIOAudioPanel", 2, "PressToChangeVoicePanel.onBackEvent() is called,isRecording is:" + bool2);
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
    int i = paramMotionEvent.getAction();
    int j = (int)paramMotionEvent.getRawY();
    j = (int)paramMotionEvent.getRawX();
    if (i == 0) {
      if (jdField_a_of_type_ComTencentMobileqqActivityBaseChatPie.f()) {
        jdField_a_of_type_ComTencentMobileqqActivityBaseChatPie.e(2);
      }
    }
    while ((i == 2) || ((i != 1) && (i != 3)) || (!jdField_a_of_type_ComTencentMobileqqActivityBaseChatPie.f())) {
      return true;
    }
    jdField_a_of_type_ComTencentMobileqqActivityBaseChatPie.e(2);
    return true;
  }
  
  public void b()
  {
    boolean bool = jdField_a_of_type_ComTencentMobileqqActivityBaseChatPie.g();
    if (QLog.isColorLevel()) {
      QLog.d("AIOAudioPanel", 2, "PressToChangeVoicePanel.onPause() is called,isRecording is:" + bool);
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
    jdField_a_of_type_ComTencentMobileqqActivityBaseChatPie.a(paramString, true, false, paramRecorderParam);
    jdField_a_of_type_AndroidOsHandler.post(new ktt(this));
    ReportController.b(jdField_a_of_type_ComTencentMobileqqAppQQAppInterface, "CliOper", "", "", "0X8005A17", "0X8005A17", 4, 0, "", "", "", "6.3.3");
    PttPreSendManager.a(jdField_a_of_type_ComTencentMobileqqAppQQAppInterface).c();
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
  }
  
  public void c(String paramString, QQRecorder.RecorderParam paramRecorderParam)
  {
    if (QLog.isColorLevel()) {
      QLog.d("AIOAudioPanel", 2, "PressToChangePanel.onInitFailed() is called");
    }
    jdField_a_of_type_ComTencentMobileqqActivityBaseChatPie.a(paramString, true, false, paramRecorderParam);
    jdField_a_of_type_AndroidOsHandler.post(new kts(this));
    ReportController.b(jdField_a_of_type_ComTencentMobileqqAppQQAppInterface, "CliOper", "", "", "0X8005A17", "0X8005A17", 3, 0, "", "", "", "6.3.3");
  }
  
  public void d()
  {
    if (QLog.isColorLevel()) {
      QLog.d("AIOAudioPanel", 2, "PressToSpeakPanel.prepareRecord() is called,time is:" + System.currentTimeMillis());
    }
    com.tencent.mobileqq.activity.aio.AIOUtils.l = true;
    jdField_a_of_type_AndroidWidgetTextView.setVisibility(8);
    d.setVisibility(0);
    e.setVisibility(8);
    jdField_a_of_type_AndroidWidgetImageView.setVisibility(0);
    jdField_a_of_type_ComTencentMobileqqActivityAioAudiopanelVolumeIndicateSquareView.setVisibility(8);
    jdField_b_of_type_ComTencentMobileqqActivityAioAudiopanelVolumeIndicateSquareView.setVisibility(8);
    jdField_a_of_type_AndroidViewViewGroup.setVisibility(8);
  }
  
  public void e()
  {
    if (QLog.isColorLevel()) {
      QLog.d("AIOAudioPanel", 2, " PressToSpeakPanel.startRecord() is called, time is " + System.currentTimeMillis());
    }
    jdField_a_of_type_ComTencentMobileqqActivityAioAudiopanelVolumeIndicateSquareView.a();
    jdField_b_of_type_ComTencentMobileqqActivityAioAudiopanelVolumeIndicateSquareView.a();
    jdField_a_of_type_AndroidWidgetTextView.setVisibility(8);
    d.setVisibility(8);
    e.setVisibility(0);
    jdField_a_of_type_AndroidWidgetImageView.setVisibility(0);
    jdField_a_of_type_ComTencentMobileqqActivityAioAudiopanelVolumeIndicateSquareView.setVisibility(0);
    jdField_b_of_type_ComTencentMobileqqActivityAioAudiopanelVolumeIndicateSquareView.setVisibility(0);
    jdField_a_of_type_AndroidViewViewGroup.setVisibility(8);
  }
  
  public void f()
  {
    Object localObject;
    if (!jdField_a_of_type_Boolean)
    {
      if (jdField_a_of_type_ComTencentMobileqqActivityAioAudiopanelAudioPanelAdapter.jdField_b_of_type_AndroidViewViewGroup != null) {
        break label106;
      }
      localObject = (ListenChangeVoicePanel)LayoutInflater.from(jdField_a_of_type_ComTencentMobileqqAppQQAppInterface.a()).inflate(2130903995, null);
      ((ListenChangeVoicePanel)localObject).a(jdField_a_of_type_ComTencentMobileqqAppQQAppInterface, jdField_a_of_type_ComTencentMobileqqActivityBaseChatPie, f);
      jdField_a_of_type_ComTencentMobileqqActivityAioAudiopanelAudioPanelAdapter.jdField_b_of_type_AndroidViewViewGroup = ((ViewGroup)localObject);
    }
    for (;;)
    {
      localObject = (ListenChangeVoicePanel)jdField_a_of_type_ComTencentMobileqqActivityAioAudiopanelAudioPanelAdapter.jdField_b_of_type_AndroidViewViewGroup;
      ((ListenChangeVoicePanel)localObject).d();
      f.addView((View)localObject, new FrameLayout.LayoutParams(-1, -1));
      ((ListenChangeVoicePanel)localObject).setVisibility(8);
      jdField_a_of_type_Boolean = true;
      return;
      label106:
      localObject = (ViewGroup)jdField_a_of_type_ComTencentMobileqqActivityAioAudiopanelAudioPanelAdapter.jdField_b_of_type_AndroidViewViewGroup.getParent();
      if (localObject != null) {
        ((ViewGroup)localObject).removeView(jdField_a_of_type_ComTencentMobileqqActivityAioAudiopanelAudioPanelAdapter.jdField_b_of_type_AndroidViewViewGroup);
      }
      ((ListenChangeVoicePanel)jdField_a_of_type_ComTencentMobileqqActivityAioAudiopanelAudioPanelAdapter.jdField_b_of_type_AndroidViewViewGroup).a(jdField_a_of_type_ComTencentMobileqqAppQQAppInterface, jdField_a_of_type_ComTencentMobileqqActivityBaseChatPie, f);
    }
  }
  
  public void g()
  {
    if (QLog.isColorLevel()) {
      QLog.d("AIOAudioPanel", 2, "PressToSpeakPanel.reset() is called");
    }
    jdField_b_of_type_Boolean = false;
    if (jdField_a_of_type_ComTencentMobileqqActivityBaseChatPie.a().isFinishing()) {
      return;
    }
    jdField_a_of_type_AndroidWidgetTextView.setVisibility(0);
    d.setVisibility(8);
    e.setVisibility(8);
    jdField_a_of_type_AndroidWidgetImageView.setVisibility(0);
    jdField_b_of_type_AndroidWidgetTextView.setText(AudioPanel.a(0.0D));
    jdField_a_of_type_ComTencentMobileqqActivityAioAudiopanelVolumeIndicateSquareView.setVisibility(8);
    jdField_b_of_type_ComTencentMobileqqActivityAioAudiopanelVolumeIndicateSquareView.setVisibility(8);
    jdField_a_of_type_AndroidViewViewGroup.setVisibility(0);
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
      Object localObject = (PanelIconLinearLayout)c;
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
          break label301;
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
          QLog.d("AIOAudioPanel", 2, "PressToSpeakPanel.reset(),dismiss topMaskPanel caused exception,it is no matter.", localException);
          continue;
          AlphaAnimation localAlphaAnimation = new AlphaAnimation(1.0F, 1.0F);
          localAlphaAnimation.setDuration(0L);
          localAlphaAnimation.setInterpolator(new LinearInterpolator());
          localException.startAnimation(localAlphaAnimation);
        }
      }
      label301:
      i();
    }
  }
  
  public void h()
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
    localAnimationSet.setAnimationListener(new ktj(this));
    jdField_a_of_type_AndroidWidgetImageView.startAnimation(localAnimationSet);
  }
  
  public void i()
  {
    if (AppSetting.i) {
      jdField_a_of_type_AndroidWidgetImageView.postDelayed(new ktk(this), 500L);
    }
  }
  
  public boolean onTouch(View paramView, MotionEvent paramMotionEvent)
  {
    boolean bool = true;
    if ((jdField_a_of_type_ComTencentMobileqqActivityBaseChatPie != null) && ((jdField_a_of_type_ComTencentMobileqqActivityBaseChatPie instanceof DeviceMsgChatPie)))
    {
      QQToast.a(BaseApplication.getContext(), 2131371591, 0).b(jdField_a_of_type_ComTencentMobileqqActivityBaseChatPie.a().getTitleBarHeight());
      return false;
    }
    int i = paramMotionEvent.getAction();
    if (QLog.isColorLevel()) {
      QLog.d("AIOAudioPanel", 2, "PressToChangeVoice.onTouch() is called,action is:" + i);
    }
    if (paramView.getId() == 2131300870) {
      if (i == 0)
      {
        paramView = new kth(this);
        paramView = Message.obtain(jdField_a_of_type_AndroidOsHandler, paramView);
        what = 1;
        jdField_a_of_type_AndroidOsHandler.sendMessageDelayed(paramView, 150L);
      }
    }
    for (;;)
    {
      return bool;
      a(paramView, paramMotionEvent);
      continue;
      bool = false;
    }
  }
}
