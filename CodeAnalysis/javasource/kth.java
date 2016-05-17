import android.graphics.Rect;
import android.os.Build;
import android.os.SystemClock;
import android.view.ViewGroup;
import com.tencent.mobileqq.activity.BaseChatPie;
import com.tencent.mobileqq.activity.ChatActivityUtils;
import com.tencent.mobileqq.activity.aio.audiopanel.AudioPanel;
import com.tencent.mobileqq.activity.aio.audiopanel.PressToChangeVoicePanel;
import com.tencent.mobileqq.app.BaseActivity;
import com.tencent.mobileqq.app.QQAppInterface;
import com.tencent.mobileqq.hotpatch.NotVerifyClass;
import com.tencent.mobileqq.statistics.ReportController;
import com.tencent.mobileqq.utils.AudioHelper;
import com.tencent.mobileqq.utils.FileUtils;
import com.tencent.mobileqq.utils.QQRecorder;
import com.tencent.mobileqq.utils.QQRecorder.RecorderParam;
import com.tencent.mobileqq.widget.QQToast;
import com.tencent.qphone.base.util.BaseApplication;
import com.tencent.qphone.base.util.QLog;
import com.tencent.util.VersionUtils;

public class kth
  implements Runnable
{
  public kth(PressToChangeVoicePanel paramPressToChangeVoicePanel)
  {
    boolean bool = NotVerifyClass.DO_VERIFY_CLASS;
  }
  
  public void run()
  {
    PressToChangeVoicePanel.a(a, true);
    boolean bool = a.jdField_a_of_type_ComTencentMobileqqActivityBaseChatPie.g();
    if (QLog.isColorLevel()) {
      QLog.d("AIOAudioPanel", 2, "isRecording is:" + bool);
    }
    if (bool)
    {
      if (a.jdField_a_of_type_ComTencentMobileqqActivityBaseChatPie.f())
      {
        a.setClickable(false);
        a.jdField_a_of_type_ComTencentMobileqqActivityBaseChatPie.e(2);
      }
      return;
    }
    com.tencent.mobileqq.transfile.PttInfoCollector.a = SystemClock.uptimeMillis();
    int i = a.jdField_a_of_type_ComTencentMobileqqActivityBaseChatPie.a().getTitleBarHeight();
    Object localObject = a.jdField_a_of_type_ComTencentMobileqqActivityBaseChatPie.a();
    if (!FileUtils.a())
    {
      QQToast.a(BaseApplication.getContext(), 2131367409, 0).b(i);
      label140:
      if (!a.jdField_a_of_type_ComTencentMobileqqActivityBaseChatPie.c) {
        break label538;
      }
    }
    label538:
    for (i = 1;; i = 2)
    {
      ReportController.b(a.jdField_a_of_type_ComTencentMobileqqAppQQAppInterface, "CliOper", "", "", "0X8005472", "0X8005472", i, 0, "", "", "", "6.3.3");
      if (a.jdField_a_of_type_ComTencentMobileqqActivityAioAudiopanelAudioPanel == null) {
        break;
      }
      a.jdField_a_of_type_ComTencentMobileqqActivityAioAudiopanelAudioPanel.a(a);
      return;
      if (!QQRecorder.d())
      {
        QQToast.a(BaseApplication.getContext(), 2131367410, 0).b(i);
        break label140;
      }
      if (!QQRecorder.a(c))
      {
        QQToast.a(BaseApplication.getContext(), 2131367413, 0).b(i);
        break label140;
      }
      if (a.jdField_a_of_type_ComTencentMobileqqAppQQAppInterface.d())
      {
        QQToast.a(BaseApplication.getContext(), 2131367775, 0).a();
        break label140;
      }
      if (AudioHelper.b(1))
      {
        ChatActivityUtils.a(a.jdField_a_of_type_ComTencentMobileqqActivityBaseChatPie.a());
        break label140;
      }
      a.f();
      a.jdField_a_of_type_ComTencentMobileqqActivityBaseChatPie.a(a, false, (QQRecorder.RecorderParam)localObject);
      a.jdField_a_of_type_ComTencentMobileqqActivityBaseChatPie.f(2);
      a.jdField_a_of_type_ComTencentMobileqqActivityAioAudiopanelAudioPanel.setStatus(3);
      a.h();
      localObject = new Rect();
      Rect localRect = new Rect();
      a.b.getGlobalVisibleRect(localRect);
      a.getWindowVisibleDisplayFrame((Rect)localObject);
      localRect = new Rect();
      a.c.getGlobalVisibleRect(localRect);
      int j = bottom;
      i = j;
      if (Build.MODEL.startsWith("Coolpad"))
      {
        i = j;
        if (VersionUtils.h()) {
          i = j - top;
        }
      }
      a.jdField_a_of_type_AndroidWidgetPopupWindow = AudioPanel.a(a.jdField_a_of_type_ComTencentMobileqqActivityBaseChatPie.a(), right, bottom, i, a, 0, 0, 0);
      a.jdField_a_of_type_AndroidViewView = AudioPanel.a(a.jdField_a_of_type_ComTencentMobileqqActivityBaseChatPie.a(), a.b, a.c);
      break label140;
    }
  }
}
