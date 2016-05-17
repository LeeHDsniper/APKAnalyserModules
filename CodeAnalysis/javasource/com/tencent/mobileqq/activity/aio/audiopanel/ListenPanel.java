package com.tencent.mobileqq.activity.aio.audiopanel;

import android.content.Context;
import android.os.Handler;
import android.os.Looper;
import android.support.v4.view.ViewCompat;
import android.util.AttributeSet;
import android.view.MotionEvent;
import android.view.View;
import android.view.View.OnClickListener;
import android.view.ViewGroup;
import android.widget.RelativeLayout;
import android.widget.TextView;
import com.tencent.common.config.AppSetting;
import com.tencent.mobileqq.activity.BaseChatPie;
import com.tencent.mobileqq.activity.aio.rebuild.PublicAccountChatPie;
import com.tencent.mobileqq.app.BaseActivity;
import com.tencent.mobileqq.app.QQAppInterface;
import com.tencent.mobileqq.hotpatch.NotVerifyClass;
import com.tencent.mobileqq.statistics.ReportController;
import com.tencent.mobileqq.utils.QQRecorder.RecorderParam;
import com.tencent.mobileqq.utils.VoicePlayer;
import com.tencent.mobileqq.utils.VoicePlayer.VoicePlayerListener;
import com.tencent.mobileqq.widget.QQToast;
import com.tencent.qphone.base.util.QLog;
import ktg;

public class ListenPanel
  extends RelativeLayout
  implements View.OnClickListener, AudioPanelCallback, VoicePlayer.VoicePlayerListener
{
  public static final int a = 1;
  public static final int b = 2;
  public static int c;
  public static int d = jdField_c_of_type_Int + 1;
  private double jdField_a_of_type_Double;
  private Handler jdField_a_of_type_AndroidOsHandler;
  private ViewGroup jdField_a_of_type_AndroidViewViewGroup;
  private TextView jdField_a_of_type_AndroidWidgetTextView;
  private BaseChatPie jdField_a_of_type_ComTencentMobileqqActivityBaseChatPie;
  private AudioPanel jdField_a_of_type_ComTencentMobileqqActivityAioAudiopanelAudioPanel;
  private CircleProgressView jdField_a_of_type_ComTencentMobileqqActivityAioAudiopanelCircleProgressView;
  private QQAppInterface jdField_a_of_type_ComTencentMobileqqAppQQAppInterface;
  private QQRecorder.RecorderParam jdField_a_of_type_ComTencentMobileqqUtilsQQRecorder$RecorderParam;
  private VoicePlayer jdField_a_of_type_ComTencentMobileqqUtilsVoicePlayer;
  private String jdField_a_of_type_JavaLangString;
  private boolean jdField_a_of_type_Boolean = false;
  private ViewGroup jdField_b_of_type_AndroidViewViewGroup;
  private TextView jdField_b_of_type_AndroidWidgetTextView;
  private TextView c;
  private int e;
  private int f = jdField_c_of_type_Int;
  
  static
  {
    boolean bool = NotVerifyClass.DO_VERIFY_CLASS;
    jdField_c_of_type_Int = 1;
  }
  
  public ListenPanel(Context paramContext)
  {
    super(paramContext);
  }
  
  public ListenPanel(Context paramContext, AttributeSet paramAttributeSet)
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
    jdField_a_of_type_ComTencentMobileqqActivityAioAudiopanelCircleProgressView.setContentDescription(getContext().getString(2131362082));
    a();
  }
  
  public void a(QQAppInterface paramQQAppInterface, BaseChatPie paramBaseChatPie, ViewGroup paramViewGroup1, AudioPanel paramAudioPanel, ViewGroup paramViewGroup2, int paramInt)
  {
    jdField_a_of_type_ComTencentMobileqqAppQQAppInterface = paramQQAppInterface;
    jdField_a_of_type_ComTencentMobileqqActivityBaseChatPie = paramBaseChatPie;
    jdField_a_of_type_ComTencentMobileqqActivityAioAudiopanelAudioPanel = paramAudioPanel;
    jdField_a_of_type_AndroidViewViewGroup = paramViewGroup2;
    jdField_b_of_type_AndroidViewViewGroup = paramViewGroup1;
    e = paramInt;
    jdField_a_of_type_AndroidOsHandler = new Handler(Looper.getMainLooper());
    jdField_a_of_type_AndroidWidgetTextView = ((TextView)findViewById(2131299334));
    jdField_a_of_type_AndroidWidgetTextView.setText(AudioPanel.a(0.0D));
    jdField_a_of_type_ComTencentMobileqqActivityAioAudiopanelCircleProgressView = ((CircleProgressView)findViewById(2131299336));
    jdField_b_of_type_AndroidWidgetTextView = ((TextView)findViewById(2131299338));
    jdField_c_of_type_AndroidWidgetTextView = ((TextView)findViewById(2131299339));
    jdField_a_of_type_ComTencentMobileqqActivityAioAudiopanelCircleProgressView.setOnClickListener(this);
    jdField_b_of_type_AndroidWidgetTextView.setOnClickListener(this);
    jdField_c_of_type_AndroidWidgetTextView.setOnClickListener(this);
    if (QLog.isColorLevel()) {
      QLog.d("AIOAudioPanel", 2, "ListenPanel.init() is called");
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
    Object localObject = jdField_a_of_type_ComTencentMobileqqActivityBaseChatPie;
    String str = jdField_a_of_type_JavaLangString;
    int i;
    if (f == d)
    {
      i = 3;
      ((BaseChatPie)localObject).b(str, i, jdField_a_of_type_ComTencentMobileqqUtilsQQRecorder$RecorderParam);
      jdField_a_of_type_ComTencentMobileqqActivityBaseChatPie.b(jdField_a_of_type_JavaLangString, null);
      if (e != 1) {
        break label125;
      }
      setVisibility(8);
      localObject = (PressToSpeakPanel)jdField_b_of_type_AndroidViewViewGroup.findViewById(2131300871);
      ((PressToSpeakPanel)localObject).d();
      ((PressToSpeakPanel)localObject).setVisibility(0);
    }
    label125:
    while (e != 2)
    {
      return false;
      i = 2;
      break;
    }
    setVisibility(8);
    localObject = (RecordSoundPanel)jdField_b_of_type_AndroidViewViewGroup.findViewById(2131299340);
    ((RecordSoundPanel)localObject).d();
    ((RecordSoundPanel)localObject).setVisibility(0);
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
      jdField_a_of_type_ComTencentMobileqqActivityAioAudiopanelCircleProgressView.setContentDescription(getContext().getString(2131362082));
    }
  }
  
  public void b(String paramString, int paramInt1, int paramInt2) {}
  
  public void c()
  {
    if (QLog.isColorLevel()) {
      QLog.d("AIOAudioPanel", 2, "ListenPanel.onDestroy() is called,audioPath is:" + jdField_a_of_type_JavaLangString);
    }
    a();
    Object localObject = jdField_a_of_type_ComTencentMobileqqActivityBaseChatPie;
    String str = jdField_a_of_type_JavaLangString;
    int i;
    if (f == d)
    {
      i = 3;
      ((BaseChatPie)localObject).b(str, i, jdField_a_of_type_ComTencentMobileqqUtilsQQRecorder$RecorderParam);
      jdField_a_of_type_ComTencentMobileqqActivityBaseChatPie.b(jdField_a_of_type_JavaLangString, null);
      if (e != 1) {
        break label124;
      }
      setVisibility(8);
      localObject = (PressToSpeakPanel)jdField_b_of_type_AndroidViewViewGroup.findViewById(2131300871);
      ((PressToSpeakPanel)localObject).d();
      ((PressToSpeakPanel)localObject).setVisibility(0);
    }
    label124:
    while (e != 2)
    {
      return;
      i = 2;
      break;
    }
    setVisibility(8);
    localObject = (RecordSoundPanel)jdField_b_of_type_AndroidViewViewGroup.findViewById(2131299340);
    ((RecordSoundPanel)localObject).d();
    ((RecordSoundPanel)localObject).setVisibility(0);
  }
  
  public void onClick(View paramView)
  {
    int i = paramView.getId();
    Object localObject;
    if (i == 2131299336)
    {
      if (AppSetting.i) {
        jdField_a_of_type_ComTencentMobileqqActivityBaseChatPie.g(2131165197);
      }
      if (!jdField_a_of_type_Boolean)
      {
        jdField_a_of_type_Boolean = true;
        paramView = jdField_a_of_type_ComTencentMobileqqAppQQAppInterface;
        localObject = new StringBuilder();
        if (f != d) {
          break label233;
        }
        i = 1;
        ReportController.b(paramView, "CliOper", "", "", "0X8004602", "0X8004602", 0, 0, i + "", "", "", "");
        if (QLog.isColorLevel()) {
          QLog.d("QQRecorder", 2, "ListenPanel listened, jump source = " + f);
        }
      }
      if (jdField_a_of_type_ComTencentMobileqqUtilsVoicePlayer == null)
      {
        jdField_a_of_type_ComTencentMobileqqUtilsVoicePlayer = new VoicePlayer(jdField_a_of_type_JavaLangString, new Handler(), jdField_a_of_type_ComTencentMobileqqUtilsQQRecorder$RecorderParam.jdField_c_of_type_Int);
        jdField_a_of_type_ComTencentMobileqqUtilsVoicePlayer.a(getContext());
        jdField_a_of_type_ComTencentMobileqqUtilsVoicePlayer.a();
        jdField_a_of_type_ComTencentMobileqqUtilsVoicePlayer.a(this);
        jdField_a_of_type_ComTencentMobileqqUtilsVoicePlayer.c();
        jdField_a_of_type_ComTencentMobileqqActivityAioAudiopanelCircleProgressView.setImageResource(2130840214);
        jdField_a_of_type_ComTencentMobileqqActivityAioAudiopanelCircleProgressView.setContentDescription(getContext().getString(2131362085));
      }
    }
    label233:
    label495:
    do
    {
      do
      {
        do
        {
          do
          {
            return;
            i = 2;
            break;
            a();
            jdField_a_of_type_AndroidWidgetTextView.setText(AudioPanel.a(jdField_a_of_type_Double));
            jdField_a_of_type_ComTencentMobileqqActivityAioAudiopanelCircleProgressView.setProgress(0);
            jdField_a_of_type_ComTencentMobileqqActivityAioAudiopanelCircleProgressView.setImageResource(2130840213);
            jdField_a_of_type_ComTencentMobileqqActivityAioAudiopanelCircleProgressView.setContentDescription(getContext().getString(2131362082));
            return;
            if (i != 2131299338) {
              break label495;
            }
            a();
            paramView = jdField_a_of_type_ComTencentMobileqqActivityBaseChatPie;
            localObject = jdField_a_of_type_JavaLangString;
            if (f == d) {}
            for (i = 3;; i = 2)
            {
              paramView.b((String)localObject, i, jdField_a_of_type_ComTencentMobileqqUtilsQQRecorder$RecorderParam);
              jdField_a_of_type_ComTencentMobileqqActivityBaseChatPie.b(jdField_a_of_type_JavaLangString, null);
              if (e != 1) {
                break;
              }
              setVisibility(8);
              paramView = (PressToSpeakPanel)jdField_b_of_type_AndroidViewViewGroup.findViewById(2131300871);
              paramView.d();
              paramView.setVisibility(0);
              return;
            }
          } while (e != 2);
          setVisibility(8);
          paramView = (RecordSoundPanel)jdField_b_of_type_AndroidViewViewGroup.findViewById(2131299340);
          paramView.d();
          paramView.setVisibility(0);
          ReportController.b(jdField_a_of_type_ComTencentMobileqqAppQQAppInterface, "CliOper", "", "", "Voice_record", "Voice_record _cancel", 0, 0, "", "", "", "");
        } while (!(jdField_a_of_type_ComTencentMobileqqActivityBaseChatPie instanceof PublicAccountChatPie));
        ReportController.b(jdField_a_of_type_ComTencentMobileqqAppQQAppInterface, "P_CliOper", "Pb_account_lifeservice", "", "0X8005856", "0X8005856", 0, 0, "", "", "", "");
        return;
      } while (i != 2131299339);
      a();
      int j = (int)jdField_a_of_type_Double;
      if (e == 2)
      {
        ReportController.b(jdField_a_of_type_ComTencentMobileqqAppQQAppInterface, "CliOper", "", "", "Voice_record", "Record_attribute", 0, 0, String.valueOf(j), "", "", "");
        if ((jdField_a_of_type_ComTencentMobileqqActivityBaseChatPie instanceof PublicAccountChatPie)) {
          ReportController.b(jdField_a_of_type_ComTencentMobileqqAppQQAppInterface, "P_CliOper", "Pb_account_lifeservice", "", "0X8005855", "0X8005855", 0, 0, "", "", "", "");
        }
      }
      if (jdField_a_of_type_Double < 1000.0D)
      {
        QQToast.a(jdField_a_of_type_ComTencentMobileqqActivityBaseChatPie.a(), jdField_a_of_type_ComTencentMobileqqActivityBaseChatPie.a().getString(2131367372), 0).a();
        return;
      }
      jdField_a_of_type_ComTencentMobileqqActivityBaseChatPie.b(jdField_a_of_type_JavaLangString, null);
      paramView = jdField_a_of_type_ComTencentMobileqqActivityBaseChatPie;
      localObject = jdField_a_of_type_JavaLangString;
      if (f == jdField_c_of_type_Int) {}
      for (i = 2;; i = 3)
      {
        paramView.a((String)localObject, i, j, jdField_a_of_type_ComTencentMobileqqUtilsQQRecorder$RecorderParam, 0, true);
        if (e != 1) {
          break;
        }
        setVisibility(8);
        paramView = (PressToSpeakPanel)jdField_b_of_type_AndroidViewViewGroup.findViewById(2131300871);
        paramView.d();
        paramView.setVisibility(0);
        return;
      }
    } while (e != 2);
    setVisibility(8);
    paramView = (RecordSoundPanel)jdField_b_of_type_AndroidViewViewGroup.findViewById(2131299340);
    paramView.d();
    paramView.setVisibility(0);
  }
  
  public boolean onTouchEvent(MotionEvent paramMotionEvent)
  {
    super.onTouchEvent(paramMotionEvent);
    return true;
  }
  
  public void setAudioPath(String paramString, double paramDouble, QQRecorder.RecorderParam paramRecorderParam)
  {
    jdField_a_of_type_JavaLangString = paramString;
    jdField_a_of_type_Double = paramDouble;
    jdField_a_of_type_ComTencentMobileqqUtilsQQRecorder$RecorderParam = paramRecorderParam;
    jdField_a_of_type_AndroidWidgetTextView.setText(AudioPanel.a(paramDouble));
    jdField_a_of_type_ComTencentMobileqqActivityAioAudiopanelCircleProgressView.setProgress(0);
    jdField_a_of_type_ComTencentMobileqqActivityAioAudiopanelCircleProgressView.setImageResource(2130840213);
    jdField_a_of_type_ComTencentMobileqqActivityAioAudiopanelCircleProgressView.setContentDescription(getContext().getString(2131362082));
    if (AppSetting.i)
    {
      jdField_a_of_type_AndroidWidgetTextView.setFocusable(true);
      ViewCompat.setAccessibilityDelegate(jdField_a_of_type_AndroidWidgetTextView, new ktg(this));
      jdField_b_of_type_AndroidWidgetTextView.setContentDescription(jdField_b_of_type_AndroidWidgetTextView.getText() + getContext().getString(2131362075));
      jdField_c_of_type_AndroidWidgetTextView.setContentDescription(jdField_c_of_type_AndroidWidgetTextView.getText() + getContext().getString(2131362075));
      QQAppInterface.f(getContext().getString(2131362083));
    }
    if (QLog.isColorLevel()) {
      QLog.d("AIOAudioPanel", 2, "ListenPanel.setAudioPath() is called,path is:" + paramString + ",recordTime is:" + paramDouble);
    }
  }
  
  public void setJumpSource(int paramInt)
  {
    f = paramInt;
  }
}
