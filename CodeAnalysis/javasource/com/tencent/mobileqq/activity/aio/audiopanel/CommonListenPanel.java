package com.tencent.mobileqq.activity.aio.audiopanel;

import android.content.Context;
import android.content.res.Resources;
import android.os.Handler;
import android.util.AttributeSet;
import android.view.MotionEvent;
import android.view.View;
import android.view.View.OnClickListener;
import android.widget.RelativeLayout;
import android.widget.TextView;
import com.tencent.mobileqq.app.BaseActivity;
import com.tencent.mobileqq.app.QQAppInterface;
import com.tencent.mobileqq.hotpatch.NotVerifyClass;
import com.tencent.mobileqq.statistics.ReportController;
import com.tencent.mobileqq.util.SkinUtils;
import com.tencent.mobileqq.utils.VoicePlayer;
import com.tencent.mobileqq.utils.VoicePlayer.VoicePlayerListener;
import com.tencent.mobileqq.widget.QQToast;
import com.tencent.qphone.base.util.QLog;

public class CommonListenPanel
  extends RelativeLayout
  implements View.OnClickListener, AudioPanelCallback, VoicePlayer.VoicePlayerListener
{
  public static final int a = 1;
  public static final int b = 2;
  public static int c = 0;
  public static int d = jdField_c_of_type_Int + 1;
  public static final int e = 101;
  public static final int f = 102;
  public static final int g = 103;
  private double jdField_a_of_type_Double;
  Handler jdField_a_of_type_AndroidOsHandler;
  private TextView jdField_a_of_type_AndroidWidgetTextView;
  private CircleProgressView jdField_a_of_type_ComTencentMobileqqActivityAioAudiopanelCircleProgressView;
  private VolumeIndicateView jdField_a_of_type_ComTencentMobileqqActivityAioAudiopanelVolumeIndicateView;
  private BaseActivity jdField_a_of_type_ComTencentMobileqqAppBaseActivity;
  private QQAppInterface jdField_a_of_type_ComTencentMobileqqAppQQAppInterface;
  private VoicePlayer jdField_a_of_type_ComTencentMobileqqUtilsVoicePlayer;
  private String jdField_a_of_type_JavaLangString;
  private boolean jdField_a_of_type_Boolean = false;
  private TextView jdField_b_of_type_AndroidWidgetTextView;
  private VolumeIndicateView jdField_b_of_type_ComTencentMobileqqActivityAioAudiopanelVolumeIndicateView;
  private TextView c;
  private int h;
  private int i = jdField_c_of_type_Int;
  
  static
  {
    boolean bool = NotVerifyClass.DO_VERIFY_CLASS;
    jdField_c_of_type_Int = 1;
  }
  
  public CommonListenPanel(Context paramContext)
  {
    super(paramContext);
  }
  
  public CommonListenPanel(Context paramContext, AttributeSet paramAttributeSet)
  {
    super(paramContext, paramAttributeSet, 0);
  }
  
  void a()
  {
    if (jdField_a_of_type_ComTencentMobileqqUtilsVoicePlayer != null)
    {
      jdField_a_of_type_ComTencentMobileqqUtilsVoicePlayer.f();
      jdField_a_of_type_ComTencentMobileqqUtilsVoicePlayer = null;
    }
  }
  
  public void a(int paramInt1, String paramString, int paramInt2)
  {
    jdField_a_of_type_ComTencentMobileqqActivityAioAudiopanelCircleProgressView.setProgress(0);
    jdField_a_of_type_ComTencentMobileqqActivityAioAudiopanelCircleProgressView.setImageResource(2130840213);
    jdField_a_of_type_ComTencentMobileqqActivityAioAudiopanelCircleProgressView.setContentDescription("开始试听");
    a();
  }
  
  public void a(QQAppInterface paramQQAppInterface, BaseActivity paramBaseActivity, Handler paramHandler)
  {
    jdField_a_of_type_ComTencentMobileqqAppQQAppInterface = paramQQAppInterface;
    h = 2;
    jdField_a_of_type_ComTencentMobileqqAppBaseActivity = paramBaseActivity;
    jdField_a_of_type_AndroidOsHandler = paramHandler;
    jdField_a_of_type_ComTencentMobileqqActivityAioAudiopanelVolumeIndicateView = ((VolumeIndicateView)findViewById(2131299333));
    jdField_b_of_type_ComTencentMobileqqActivityAioAudiopanelVolumeIndicateView = ((VolumeIndicateView)findViewById(2131299335));
    jdField_a_of_type_AndroidWidgetTextView = ((TextView)findViewById(2131299334));
    jdField_a_of_type_AndroidWidgetTextView.setText(AudioPanel.a(0.0D));
    jdField_a_of_type_ComTencentMobileqqActivityAioAudiopanelCircleProgressView = ((CircleProgressView)findViewById(2131299336));
    jdField_b_of_type_AndroidWidgetTextView = ((TextView)findViewById(2131299338));
    jdField_c_of_type_AndroidWidgetTextView = ((TextView)findViewById(2131299339));
    paramBaseActivity = paramBaseActivity.getResources();
    jdField_a_of_type_ComTencentMobileqqActivityAioAudiopanelCircleProgressView.setOnClickListener(this);
    jdField_b_of_type_AndroidWidgetTextView.setOnClickListener(this);
    jdField_c_of_type_AndroidWidgetTextView.setOnClickListener(this);
    paramQQAppInterface = SkinUtils.a(paramBaseActivity.getDrawable(2130842468));
    paramBaseActivity = SkinUtils.a(paramBaseActivity.getDrawable(2130842469));
    jdField_a_of_type_ComTencentMobileqqActivityAioAudiopanelVolumeIndicateView.setIndicateVolumeBitmap(paramQQAppInterface, 3);
    jdField_b_of_type_ComTencentMobileqqActivityAioAudiopanelVolumeIndicateView.setIndicateVolumeBitmap(paramBaseActivity, 4);
    jdField_a_of_type_ComTencentMobileqqActivityAioAudiopanelVolumeIndicateView.setVisibility(8);
    jdField_b_of_type_ComTencentMobileqqActivityAioAudiopanelVolumeIndicateView.setVisibility(8);
    if (QLog.isColorLevel())
    {
      QLog.d("AIOAudioPanel", 2, "ListenPanel.init() is called");
      QLog.d("AIOAudioPanel", 2, "volumeFillLeftBmp is:" + paramQQAppInterface + ",volumeFillRightBmp is:" + paramBaseActivity);
    }
  }
  
  public void a(String paramString, int paramInt1, int paramInt2)
  {
    if ((paramInt1 <= 0) || (paramInt2 <= 0)) {
      paramInt1 = 0;
    }
    for (;;)
    {
      jdField_a_of_type_ComTencentMobileqqActivityAioAudiopanelCircleProgressView.setProgress(paramInt1);
      jdField_a_of_type_AndroidWidgetTextView.setText(AudioPanel.a(paramInt2));
      return;
      if (paramInt2 > paramInt1) {
        paramInt1 = 100;
      } else {
        paramInt1 = paramInt2 * 100 / paramInt1;
      }
    }
  }
  
  public boolean a()
  {
    if (QLog.isColorLevel()) {
      QLog.d("AIOAudioPanel", 2, "ListenPanel.onBackEvent() is called,audioPath is:" + jdField_a_of_type_JavaLangString);
    }
    a();
    return false;
  }
  
  public void b()
  {
    if (QLog.isColorLevel()) {
      QLog.d("AIOAudioPanel", 2, "ListenPanel.onPause() is called,audioPath is:" + jdField_a_of_type_JavaLangString);
    }
    if (jdField_a_of_type_ComTencentMobileqqUtilsVoicePlayer != null)
    {
      a();
      jdField_a_of_type_AndroidWidgetTextView.setText(AudioPanel.a(jdField_a_of_type_Double));
      jdField_a_of_type_ComTencentMobileqqActivityAioAudiopanelCircleProgressView.setProgress(0);
      jdField_a_of_type_ComTencentMobileqqActivityAioAudiopanelCircleProgressView.setImageResource(2130840213);
      jdField_a_of_type_ComTencentMobileqqActivityAioAudiopanelCircleProgressView.setContentDescription("开始试听");
    }
  }
  
  public void b(String paramString, int paramInt1, int paramInt2) {}
  
  public void c()
  {
    if (QLog.isColorLevel()) {
      QLog.d("AIOAudioPanel", 2, "ListenPanel.onDestroy() is called,audioPath is:" + jdField_a_of_type_JavaLangString);
    }
    a();
  }
  
  public void onClick(View paramView)
  {
    int j = paramView.getId();
    if (j == 2131299336) {
      if (!jdField_a_of_type_Boolean)
      {
        jdField_a_of_type_Boolean = true;
        paramView = jdField_a_of_type_ComTencentMobileqqAppQQAppInterface;
        StringBuilder localStringBuilder = new StringBuilder();
        if (i == d)
        {
          j = 1;
          ReportController.b(paramView, "CliOper", "", "", "0X8004602", "0X8004602", 0, 0, j + "", "", "", "");
          if (QLog.isColorLevel()) {
            QLog.d("QQRecorder", 2, "ListenPanel listened, jump source = " + i);
          }
          jdField_a_of_type_AndroidOsHandler.sendEmptyMessage(103);
        }
      }
      else
      {
        if (jdField_a_of_type_ComTencentMobileqqUtilsVoicePlayer != null) {
          break label216;
        }
        jdField_a_of_type_ComTencentMobileqqUtilsVoicePlayer = new VoicePlayer(jdField_a_of_type_JavaLangString, new Handler(), 1);
        jdField_a_of_type_ComTencentMobileqqUtilsVoicePlayer.a(getContext());
        jdField_a_of_type_ComTencentMobileqqUtilsVoicePlayer.a();
        jdField_a_of_type_ComTencentMobileqqUtilsVoicePlayer.a(this);
        jdField_a_of_type_ComTencentMobileqqUtilsVoicePlayer.c();
        jdField_a_of_type_ComTencentMobileqqActivityAioAudiopanelCircleProgressView.setImageResource(2130840214);
        jdField_a_of_type_ComTencentMobileqqActivityAioAudiopanelCircleProgressView.setContentDescription("ͣ停止试听");
      }
    }
    label216:
    label296:
    do
    {
      do
      {
        do
        {
          return;
          j = 2;
          break;
          a();
          jdField_a_of_type_AndroidWidgetTextView.setText(AudioPanel.a(jdField_a_of_type_Double));
          jdField_a_of_type_ComTencentMobileqqActivityAioAudiopanelCircleProgressView.setProgress(0);
          jdField_a_of_type_ComTencentMobileqqActivityAioAudiopanelCircleProgressView.setImageResource(2130840213);
          jdField_a_of_type_ComTencentMobileqqActivityAioAudiopanelCircleProgressView.setContentDescription("开始试听");
          return;
          if (j != 2131299338) {
            break label296;
          }
          a();
        } while (h != 2);
        setVisibility(8);
        jdField_a_of_type_AndroidOsHandler.sendEmptyMessage(101);
        return;
      } while (j != 2131299339);
      a();
      if (jdField_a_of_type_Double < 1000.0D)
      {
        QQToast.a(jdField_a_of_type_ComTencentMobileqqAppBaseActivity, jdField_a_of_type_ComTencentMobileqqAppBaseActivity.getString(2131367372), 0).a();
        return;
      }
    } while (h != 2);
    setVisibility(8);
    jdField_a_of_type_AndroidOsHandler.sendEmptyMessage(102);
  }
  
  public boolean onTouchEvent(MotionEvent paramMotionEvent)
  {
    super.onTouchEvent(paramMotionEvent);
    return true;
  }
  
  public void setAudioPath(String paramString, double paramDouble)
  {
    jdField_a_of_type_JavaLangString = paramString;
    jdField_a_of_type_Double = paramDouble;
    jdField_a_of_type_AndroidWidgetTextView.setText(AudioPanel.a(paramDouble));
    jdField_a_of_type_ComTencentMobileqqActivityAioAudiopanelCircleProgressView.setProgress(0);
    jdField_a_of_type_ComTencentMobileqqActivityAioAudiopanelCircleProgressView.setImageResource(2130840213);
    jdField_a_of_type_ComTencentMobileqqActivityAioAudiopanelCircleProgressView.setContentDescription("开始试听");
    if (QLog.isColorLevel()) {
      QLog.d("AIOAudioPanel", 2, "ListenPanel.setAudioPath() is called,path is:" + paramString + ",recordTime is:" + paramDouble);
    }
  }
  
  public void setJumpSource(int paramInt)
  {
    i = paramInt;
  }
}
