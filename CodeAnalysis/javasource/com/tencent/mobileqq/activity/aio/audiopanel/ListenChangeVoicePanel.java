package com.tencent.mobileqq.activity.aio.audiopanel;

import android.content.Context;
import android.os.Handler;
import android.os.Looper;
import android.util.AttributeSet;
import android.view.MotionEvent;
import android.view.View;
import android.view.View.OnClickListener;
import android.view.ViewGroup;
import android.widget.RelativeLayout;
import android.widget.TextView;
import com.tencent.common.config.AppSetting;
import com.tencent.mobileqq.activity.BaseChatPie;
import com.tencent.mobileqq.activity.BaseChatPie.SaveInputTypeTask;
import com.tencent.mobileqq.activity.aio.SessionInfo;
import com.tencent.mobileqq.activity.aio.rebuild.PublicAccountChatPie;
import com.tencent.mobileqq.app.FriendsManager;
import com.tencent.mobileqq.app.QQAppInterface;
import com.tencent.mobileqq.app.ThreadManager;
import com.tencent.mobileqq.data.Card;
import com.tencent.mobileqq.data.ExtensionInfo;
import com.tencent.mobileqq.data.NoC2CExtensionInfo;
import com.tencent.mobileqq.hotpatch.NotVerifyClass;
import com.tencent.mobileqq.persistence.Entity;
import com.tencent.mobileqq.ptt.PttVoiceChangePreSender;
import com.tencent.mobileqq.ptt.preop.PttPreSendManager;
import com.tencent.mobileqq.statistics.ReportController;
import com.tencent.mobileqq.statistics.StatisticCollector;
import com.tencent.mobileqq.util.AccessibilityUtil;
import com.tencent.mobileqq.utils.QQRecorder.RecorderParam;
import com.tencent.mobileqq.voicechange.IVoiceChangeListener;
import com.tencent.mobileqq.voicechange.VoiceChangeBasicParams;
import com.tencent.mobileqq.voicechange.VoiceChangeManager;
import com.tencent.qphone.base.BaseConstants;
import com.tencent.qphone.base.util.BaseApplication;
import com.tencent.qphone.base.util.QLog;
import com.tencent.widget.XPanelContainer;
import java.util.Calendar;
import java.util.HashMap;
import kta;
import ktb;
import ktc;
import ktd;
import kte;
import ktf;
import mqq.os.MqqHandler;

public class ListenChangeVoicePanel
  extends RelativeLayout
  implements View.OnClickListener, AudioPanelCallback, IVoiceChangeListener
{
  public static final int a = 0;
  public static volatile PttVoiceChangePreSender a;
  public static final int b = 1;
  public static final int c = 2;
  public static final int d = 3;
  public static final int e = 4;
  public static final int f = 5;
  public static final int g = -1;
  private double jdField_a_of_type_Double;
  private Handler jdField_a_of_type_AndroidOsHandler = new Handler(Looper.getMainLooper());
  private ViewGroup jdField_a_of_type_AndroidViewViewGroup;
  private TextView jdField_a_of_type_AndroidWidgetTextView;
  public BaseChatPie a;
  private QQAppInterface jdField_a_of_type_ComTencentMobileqqAppQQAppInterface;
  private QQRecorder.RecorderParam jdField_a_of_type_ComTencentMobileqqUtilsQQRecorder$RecorderParam;
  private VoiceChangeBasicParams jdField_a_of_type_ComTencentMobileqqVoicechangeVoiceChangeBasicParams;
  private String jdField_a_of_type_JavaLangString;
  boolean jdField_a_of_type_Boolean;
  private int[] jdField_a_of_type_ArrayOfInt = new int[6];
  public ChangeVoiceView[] a;
  private TextView b;
  private volatile int h = -1;
  private int i = -1;
  
  static
  {
    boolean bool = NotVerifyClass.DO_VERIFY_CLASS;
    jdField_a_of_type_ComTencentMobileqqPttPttVoiceChangePreSender = null;
  }
  
  public ListenChangeVoicePanel(Context paramContext)
  {
    super(paramContext);
  }
  
  public ListenChangeVoicePanel(Context paramContext, AttributeSet paramAttributeSet)
  {
    super(paramContext, paramAttributeSet);
  }
  
  private int a()
  {
    int j = 0;
    int m;
    for (int k = 0; j < jdField_a_of_type_ArrayOfInt.length; k = m)
    {
      m = k;
      if (jdField_a_of_type_ArrayOfInt[j] == 1)
      {
        m = k + 1;
        jdField_a_of_type_ArrayOfInt[j] = 0;
      }
      j += 1;
    }
    return k;
  }
  
  public void a()
  {
    jdField_a_of_type_ArrayOfComTencentMobileqqActivityAioAudiopanelChangeVoiceView = new ChangeVoiceView[6];
    jdField_a_of_type_ArrayOfComTencentMobileqqActivityAioAudiopanelChangeVoiceView[0] = ((ChangeVoiceView)findViewById(2131300856));
    jdField_a_of_type_ArrayOfComTencentMobileqqActivityAioAudiopanelChangeVoiceView[1] = ((ChangeVoiceView)findViewById(2131300857));
    jdField_a_of_type_ArrayOfComTencentMobileqqActivityAioAudiopanelChangeVoiceView[2] = ((ChangeVoiceView)findViewById(2131300858));
    jdField_a_of_type_ArrayOfComTencentMobileqqActivityAioAudiopanelChangeVoiceView[3] = ((ChangeVoiceView)findViewById(2131300859));
    jdField_a_of_type_ArrayOfComTencentMobileqqActivityAioAudiopanelChangeVoiceView[4] = ((ChangeVoiceView)findViewById(2131300860));
    jdField_a_of_type_ArrayOfComTencentMobileqqActivityAioAudiopanelChangeVoiceView[5] = ((ChangeVoiceView)findViewById(2131300861));
    int j = 0;
    while (j < jdField_a_of_type_ArrayOfComTencentMobileqqActivityAioAudiopanelChangeVoiceView.length)
    {
      jdField_a_of_type_ArrayOfComTencentMobileqqActivityAioAudiopanelChangeVoiceView[j].a(jdField_a_of_type_ComTencentMobileqqAppQQAppInterface, j);
      jdField_a_of_type_ArrayOfComTencentMobileqqActivityAioAudiopanelChangeVoiceView[j].setOnClickListener(this);
      j += 1;
    }
    j = XPanelContainer.e / 6;
    View localView = findViewById(2131300855);
    localView.setPadding(localView.getPaddingLeft(), localView.getPaddingTop(), localView.getPaddingRight(), j);
  }
  
  public void a(int paramInt1, int paramInt2, int paramInt3)
  {
    paramInt1 = AudioPanel.a(paramInt1) / 1250;
    jdField_a_of_type_AndroidOsHandler.post(new ktc(this, paramInt2, paramInt3, paramInt1));
  }
  
  public void a(int paramInt1, int paramInt2, int paramInt3, int paramInt4)
  {
    int k;
    int j;
    if ((jdField_a_of_type_ComTencentMobileqqActivityBaseChatPie != null) && (jdField_a_of_type_ComTencentMobileqqActivityBaseChatPie.a != null) && (jdField_a_of_type_ComTencentMobileqqAppQQAppInterface != null))
    {
      if (!jdField_a_of_type_ComTencentMobileqqActivityBaseChatPie.c) {
        break label313;
      }
      k = 1;
      if (jdField_a_of_type_ComTencentMobileqqActivityBaseChatPie.a.jdField_a_of_type_Int != 0) {
        break label319;
      }
      j = 1;
    }
    for (;;)
    {
      ReportController.b(jdField_a_of_type_ComTencentMobileqqAppQQAppInterface, "CliOper", "", "", "0X8005474", "0X8005474", k, 0, paramInt3 + "", j + "", "", "6.3.3");
      if ((jdField_a_of_type_ComTencentMobileqqActivityBaseChatPie instanceof PublicAccountChatPie)) {
        ReportController.b(jdField_a_of_type_ComTencentMobileqqAppQQAppInterface, "P_CliOper", "Pb_account_lifeservice", "", "0X8005851", "0X8005851", 0, 0, "", "", "", "");
      }
      paramInt3 = Calendar.getInstance().get(11);
      Card localCard = ((FriendsManager)jdField_a_of_type_ComTencentMobileqqAppQQAppInterface.getManager(50)).b(jdField_a_of_type_ComTencentMobileqqAppQQAppInterface.a());
      StatisticCollector localStatisticCollector = StatisticCollector.a(BaseApplication.getContext());
      HashMap localHashMap = new HashMap();
      localHashMap.put("gender", String.valueOf(shGender));
      localHashMap.put("age", String.valueOf(age));
      localHashMap.put("time", String.valueOf(paramInt3));
      localHashMap.put("extra", String.valueOf(paramInt4));
      paramInt3 = paramInt1;
      if (paramInt2 == paramInt1) {
        paramInt3 = paramInt1 + 10;
      }
      localHashMap.put("param_FailCode", String.valueOf(paramInt3));
      localHashMap.put(BaseConstants.RDM_NoChangeFailCode, "");
      localStatisticCollector.a("", "VCPttSendEvent", false, 0L, 0L, localHashMap, "");
      return;
      label313:
      k = 2;
      break;
      label319:
      if (jdField_a_of_type_ComTencentMobileqqActivityBaseChatPie.a.jdField_a_of_type_Int == 3000) {
        j = 2;
      } else if (jdField_a_of_type_ComTencentMobileqqActivityBaseChatPie.a.jdField_a_of_type_Int == 1) {
        j = 3;
      } else {
        j = 4;
      }
    }
  }
  
  public void a(QQAppInterface paramQQAppInterface, BaseChatPie paramBaseChatPie, ViewGroup paramViewGroup)
  {
    jdField_a_of_type_ComTencentMobileqqAppQQAppInterface = paramQQAppInterface;
    jdField_a_of_type_ComTencentMobileqqActivityBaseChatPie = paramBaseChatPie;
    jdField_a_of_type_AndroidViewViewGroup = paramViewGroup;
    jdField_a_of_type_AndroidWidgetTextView = ((TextView)findViewById(2131299338));
    b = ((TextView)findViewById(2131299339));
    jdField_a_of_type_AndroidWidgetTextView.setOnClickListener(this);
    b.setOnClickListener(this);
    a();
    if (AppSetting.i)
    {
      jdField_a_of_type_AndroidWidgetTextView.setContentDescription(jdField_a_of_type_AndroidWidgetTextView.getText() + getContext().getString(2131362075));
      b.setContentDescription(b.getText() + getContext().getString(2131362075));
    }
  }
  
  public boolean a()
  {
    int j = 2;
    if (QLog.isColorLevel()) {
      QLog.d("AIOAudioPanel", 2, "ListenPanel.onBackEvent() is called,audioPath is:" + jdField_a_of_type_JavaLangString);
    }
    setVisibility(8);
    PressToChangeVoicePanel localPressToChangeVoicePanel = (PressToChangeVoicePanel)jdField_a_of_type_AndroidViewViewGroup.findViewById(2131300868);
    localPressToChangeVoicePanel.g();
    localPressToChangeVoicePanel.setVisibility(0);
    jdField_a_of_type_ComTencentMobileqqActivityBaseChatPie.b(jdField_a_of_type_JavaLangString, null);
    VoiceChangeManager.a(jdField_a_of_type_ComTencentMobileqqVoicechangeVoiceChangeBasicParams);
    if (jdField_a_of_type_ComTencentMobileqqActivityBaseChatPie.c) {
      j = 1;
    }
    ReportController.b(jdField_a_of_type_ComTencentMobileqqAppQQAppInterface, "CliOper", "", "", "0X8005475", "0X8005475", j, 0, "", "", "", "6.3.3");
    if (jdField_a_of_type_ComTencentMobileqqPttPttVoiceChangePreSender != null) {
      jdField_a_of_type_ComTencentMobileqqPttPttVoiceChangePreSender.a(jdField_a_of_type_ComTencentMobileqqAppQQAppInterface, -1);
    }
    PttPreSendManager.a(jdField_a_of_type_ComTencentMobileqqAppQQAppInterface).b();
    return false;
  }
  
  public void b()
  {
    VoiceChangeManager.b(jdField_a_of_type_ComTencentMobileqqVoicechangeVoiceChangeBasicParams);
    jdField_a_of_type_ArrayOfComTencentMobileqqActivityAioAudiopanelChangeVoiceView[h].a(1);
  }
  
  public void c()
  {
    int k = 0;
    if (jdField_a_of_type_JavaLangString == null) {}
    for (;;)
    {
      return;
      if (QLog.isColorLevel()) {
        QLog.d("AIOAudioPanel", 2, "ListenPanel.onBackEvent() is called,audioPath is:" + jdField_a_of_type_JavaLangString);
      }
      j();
      VoiceChangeManager.a(jdField_a_of_type_ComTencentMobileqqVoicechangeVoiceChangeBasicParams);
      if (jdField_a_of_type_ComTencentMobileqqActivityBaseChatPie != null)
      {
        jdField_a_of_type_ComTencentMobileqqActivityBaseChatPie.b(jdField_a_of_type_JavaLangString, null);
        Object localObject = (FriendsManager)jdField_a_of_type_ComTencentMobileqqAppQQAppInterface.getManager(50);
        int j;
        if (!jdField_a_of_type_ComTencentMobileqqActivityBaseChatPie.j())
        {
          localObject = ((FriendsManager)localObject).a(jdField_a_of_type_ComTencentMobileqqActivityBaseChatPie.a.jdField_a_of_type_JavaLangString, jdField_a_of_type_ComTencentMobileqqActivityBaseChatPie.a.jdField_a_of_type_Int, false);
          if ((localObject == null) || (pttChangeVoiceType == h)) {
            break label239;
          }
          pttChangeVoiceType = h;
          j = 1;
        }
        while ((j != 0) && (localObject != null))
        {
          ThreadManager.a().post(new BaseChatPie.SaveInputTypeTask((Entity)localObject, jdField_a_of_type_ComTencentMobileqqAppQQAppInterface));
          return;
          ExtensionInfo localExtensionInfo = ((FriendsManager)localObject).a(jdField_a_of_type_ComTencentMobileqqActivityBaseChatPie.a.jdField_a_of_type_JavaLangString, false);
          localObject = localExtensionInfo;
          j = k;
          if (localExtensionInfo != null)
          {
            localObject = localExtensionInfo;
            j = k;
            if (pttChangeVoiceType != h)
            {
              pttChangeVoiceType = h;
              j = 1;
              localObject = localExtensionInfo;
              continue;
              label239:
              j = 0;
            }
          }
        }
      }
    }
  }
  
  public void d()
  {
    if (h == -1) {
      ThreadManager.b().post(new kta(this));
    }
  }
  
  public void e()
  {
    i = h;
    if (h == -1) {
      h = 0;
    }
    jdField_a_of_type_ArrayOfComTencentMobileqqActivityAioAudiopanelChangeVoiceView[h].a(1);
    int j = 0;
    while (j < jdField_a_of_type_ArrayOfComTencentMobileqqActivityAioAudiopanelChangeVoiceView.length)
    {
      if (j != h) {
        jdField_a_of_type_ArrayOfComTencentMobileqqActivityAioAudiopanelChangeVoiceView[j].a(0);
      }
      j += 1;
    }
    jdField_a_of_type_Boolean = false;
  }
  
  public void f()
  {
    jdField_a_of_type_ComTencentMobileqqVoicechangeVoiceChangeBasicParams.f = h;
    VoiceChangeManager.b(jdField_a_of_type_ComTencentMobileqqAppQQAppInterface.a(), jdField_a_of_type_ComTencentMobileqqVoicechangeVoiceChangeBasicParams, this);
  }
  
  public void g()
  {
    jdField_a_of_type_AndroidOsHandler.post(new ktd(this));
  }
  
  public void h()
  {
    jdField_a_of_type_AndroidOsHandler.post(new kte(this));
    VoiceChangeManager.b(jdField_a_of_type_ComTencentMobileqqVoicechangeVoiceChangeBasicParams);
  }
  
  public void i()
  {
    jdField_a_of_type_AndroidOsHandler.post(new ktf(this));
  }
  
  public void j()
  {
    setVisibility(8);
    if (jdField_a_of_type_AndroidViewViewGroup != null)
    {
      PressToChangeVoicePanel localPressToChangeVoicePanel = (PressToChangeVoicePanel)jdField_a_of_type_AndroidViewViewGroup.findViewById(2131300868);
      localPressToChangeVoicePanel.g();
      localPressToChangeVoicePanel.setVisibility(0);
    }
    int j = 0;
    while (j < jdField_a_of_type_ArrayOfInt.length)
    {
      jdField_a_of_type_ArrayOfInt[j] = 0;
      j += 1;
    }
  }
  
  public void onClick(View paramView)
  {
    int j = 2;
    int k = paramView.getId();
    if (k == 2131299338)
    {
      jdField_a_of_type_ArrayOfComTencentMobileqqActivityAioAudiopanelChangeVoiceView[h].a(1);
      jdField_a_of_type_ComTencentMobileqqActivityBaseChatPie.b(jdField_a_of_type_JavaLangString, null);
      j();
      VoiceChangeManager.a(jdField_a_of_type_ComTencentMobileqqVoicechangeVoiceChangeBasicParams);
      if (jdField_a_of_type_ComTencentMobileqqActivityBaseChatPie.c) {
        j = 1;
      }
      ReportController.b(jdField_a_of_type_ComTencentMobileqqAppQQAppInterface, "CliOper", "", "", "0X8005475", "0X8005475", j, 0, "", "", "", "6.3.3");
      if ((jdField_a_of_type_ComTencentMobileqqActivityBaseChatPie instanceof PublicAccountChatPie)) {
        ReportController.b(jdField_a_of_type_ComTencentMobileqqAppQQAppInterface, "P_CliOper", "Pb_account_lifeservice", "", "0X8005852", "0X8005852", 0, 0, "", "", "", "");
      }
      PttPreSendManager.a(jdField_a_of_type_ComTencentMobileqqAppQQAppInterface).b();
      if (jdField_a_of_type_ComTencentMobileqqPttPttVoiceChangePreSender != null) {
        jdField_a_of_type_ComTencentMobileqqPttPttVoiceChangePreSender.a(jdField_a_of_type_ComTencentMobileqqAppQQAppInterface, -1);
      }
    }
    label351:
    do
    {
      do
      {
        return;
        if (k == 2131299339)
        {
          VoiceChangeManager.a(jdField_a_of_type_ComTencentMobileqqAppQQAppInterface.a(), jdField_a_of_type_ComTencentMobileqqVoicechangeVoiceChangeBasicParams, this);
          int m = (int)jdField_a_of_type_Double;
          String str;
          QQRecorder.RecorderParam localRecorderParam;
          if (!PttPreSendManager.a(jdField_a_of_type_ComTencentMobileqqAppQQAppInterface).a(jdField_a_of_type_ComTencentMobileqqActivityBaseChatPie, h))
          {
            if (QLog.isColorLevel()) {
              QLog.d(PttPreSendManager.jdField_a_of_type_JavaLangString, 2, "presend not hit, do origin logic");
            }
            paramView = jdField_a_of_type_ComTencentMobileqqActivityBaseChatPie;
            str = jdField_a_of_type_JavaLangString;
            localRecorderParam = jdField_a_of_type_ComTencentMobileqqUtilsQQRecorder$RecorderParam;
            if (h <= 0) {
              break label351;
            }
          }
          for (j = 1;; j = 0)
          {
            paramView.a(str, 4, m, localRecorderParam, j, false);
            jdField_a_of_type_ComTencentMobileqqActivityBaseChatPie.b(jdField_a_of_type_JavaLangString, null);
            if (jdField_a_of_type_ComTencentMobileqqPttPttVoiceChangePreSender != null) {
              jdField_a_of_type_ComTencentMobileqqPttPttVoiceChangePreSender.a(jdField_a_of_type_ComTencentMobileqqAppQQAppInterface, h);
            }
            j();
            k = a();
            j = k;
            if (jdField_a_of_type_Boolean) {
              j = k + 10;
            }
            k = h;
            int n = i;
            ThreadManager.b().post(new ktb(this, k, n, m, j));
            return;
          }
        }
        jdField_a_of_type_Boolean = true;
      } while (!(paramView instanceof ChangeVoiceView));
      paramView = (ChangeVoiceView)paramView;
      k = paramView.a();
      if (k != h)
      {
        jdField_a_of_type_ArrayOfComTencentMobileqqActivityAioAudiopanelChangeVoiceView[h].a(0);
        jdField_a_of_type_ArrayOfComTencentMobileqqActivityAioAudiopanelChangeVoiceView[k].a(2);
        h = k;
        f();
        if (jdField_a_of_type_ComTencentMobileqqActivityBaseChatPie.c) {
          j = 1;
        }
        ReportController.b(jdField_a_of_type_ComTencentMobileqqAppQQAppInterface, "CliOper", "", "", "0X8005473", "0X8005473", j, 0, h + "", "", "", "6.3.3");
        jdField_a_of_type_ArrayOfInt[h] = 1;
        return;
      }
      if (paramView.b() == 2)
      {
        jdField_a_of_type_ArrayOfComTencentMobileqqActivityAioAudiopanelChangeVoiceView[h].a(1);
        VoiceChangeManager.b(jdField_a_of_type_ComTencentMobileqqVoicechangeVoiceChangeBasicParams);
        return;
      }
      if (paramView.b() == 1)
      {
        f();
        jdField_a_of_type_ArrayOfComTencentMobileqqActivityAioAudiopanelChangeVoiceView[h].a(2);
        if (jdField_a_of_type_ComTencentMobileqqActivityBaseChatPie.c) {
          j = 1;
        }
        ReportController.b(jdField_a_of_type_ComTencentMobileqqAppQQAppInterface, "CliOper", "", "", "0X8005473", "0X8005473", j, 0, h + "", "", "", "6.3.3");
        return;
      }
    } while (!QLog.isColorLevel());
    QLog.e("changevoice", 2, "CLICK EXCEPTION， curtype = " + h + " newtype is " + k + " state is " + paramView.b());
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
    jdField_a_of_type_ComTencentMobileqqVoicechangeVoiceChangeBasicParams = new VoiceChangeBasicParams(jdField_a_of_type_JavaLangString, jdField_a_of_type_ComTencentMobileqqUtilsQQRecorder$RecorderParam.jdField_a_of_type_Int, jdField_a_of_type_ComTencentMobileqqUtilsQQRecorder$RecorderParam.b, jdField_a_of_type_ComTencentMobileqqUtilsQQRecorder$RecorderParam.c, h);
    if (AppSetting.i) {
      AccessibilityUtil.b(jdField_a_of_type_ArrayOfComTencentMobileqqActivityAioAudiopanelChangeVoiceView[h]);
    }
  }
}
