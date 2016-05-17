import android.graphics.Rect;
import android.os.Build;
import android.os.SystemClock;
import android.view.MotionEvent;
import android.view.ViewGroup;
import android.widget.ImageView;
import com.tencent.mobileqq.activity.BaseChatPie;
import com.tencent.mobileqq.activity.ChatActivityUtils;
import com.tencent.mobileqq.activity.aio.SessionInfo;
import com.tencent.mobileqq.activity.aio.audiopanel.AudioPanel;
import com.tencent.mobileqq.activity.aio.audiopanel.PressToSpeakPanel;
import com.tencent.mobileqq.app.BaseActivity;
import com.tencent.mobileqq.app.QQAppInterface;
import com.tencent.mobileqq.hotpatch.NotVerifyClass;
import com.tencent.mobileqq.ptt.StreamParams;
import com.tencent.mobileqq.utils.AudioHelper;
import com.tencent.mobileqq.utils.FileUtils;
import com.tencent.mobileqq.utils.QQRecorder;
import com.tencent.mobileqq.utils.QQRecorder.RecorderParam;
import com.tencent.mobileqq.widget.QQToast;
import com.tencent.qphone.base.util.BaseApplication;
import com.tencent.qphone.base.util.QLog;
import com.tencent.util.VersionUtils;

public class kty
  implements Runnable
{
  public kty(PressToSpeakPanel paramPressToSpeakPanel, MotionEvent paramMotionEvent)
  {
    boolean bool = NotVerifyClass.DO_VERIFY_CLASS;
  }
  
  public void run()
  {
    PressToSpeakPanel.b(jdField_a_of_type_ComTencentMobileqqActivityAioAudiopanelPressToSpeakPanel, true);
    if (QLog.isColorLevel()) {
      QLog.d("AIOAudioPanel", 2, "delay start record runnable is run,touchValid is:" + PressToSpeakPanel.b(jdField_a_of_type_ComTencentMobileqqActivityAioAudiopanelPressToSpeakPanel));
    }
    Object localObject = PressToSpeakPanel.a(jdField_a_of_type_ComTencentMobileqqActivityAioAudiopanelPressToSpeakPanel).a();
    if ((ajdField_a_of_type_ComTencentMobileqqActivityAioAudiopanelPressToSpeakPanel).a.a == 0) && (StreamParams.a(PressToSpeakPanel.a(jdField_a_of_type_ComTencentMobileqqActivityAioAudiopanelPressToSpeakPanel)))) {}
    for (int i = 1;; i = 0)
    {
      if (i != 0) {
        a = Boolean.TRUE;
      }
      i = PressToSpeakPanel.a(jdField_a_of_type_ComTencentMobileqqActivityAioAudiopanelPressToSpeakPanel).a().getTitleBarHeight();
      com.tencent.mobileqq.transfile.PttInfoCollector.a = SystemClock.uptimeMillis();
      if (FileUtils.a()) {
        break;
      }
      QQToast.a(BaseApplication.getContext(), 2131367409, 0).b(i);
      return;
    }
    if (!QQRecorder.d())
    {
      QQToast.a(BaseApplication.getContext(), 2131367410, 0).b(i);
      return;
    }
    if (!QQRecorder.a(c))
    {
      QQToast.a(BaseApplication.getContext(), 2131367413, 0).b(i);
      return;
    }
    if (PressToSpeakPanel.a(jdField_a_of_type_ComTencentMobileqqActivityAioAudiopanelPressToSpeakPanel).g())
    {
      QQToast.a(BaseApplication.getContext(), "请稍后单击", 0).b(i);
      return;
    }
    if (PressToSpeakPanel.a(jdField_a_of_type_ComTencentMobileqqActivityAioAudiopanelPressToSpeakPanel).d())
    {
      QQToast.a(BaseApplication.getContext(), 2131367775, 0).b(i);
      return;
    }
    if (AudioHelper.b(1))
    {
      ChatActivityUtils.a(PressToSpeakPanel.a(jdField_a_of_type_ComTencentMobileqqActivityAioAudiopanelPressToSpeakPanel).a());
      return;
    }
    PressToSpeakPanel.a(jdField_a_of_type_ComTencentMobileqqActivityAioAudiopanelPressToSpeakPanel).setStatus(2);
    jdField_a_of_type_ComTencentMobileqqActivityAioAudiopanelPressToSpeakPanel.a(jdField_a_of_type_AndroidViewMotionEvent);
    PressToSpeakPanel.a(jdField_a_of_type_ComTencentMobileqqActivityAioAudiopanelPressToSpeakPanel).f(0);
    PressToSpeakPanel.a(jdField_a_of_type_ComTencentMobileqqActivityAioAudiopanelPressToSpeakPanel).a(jdField_a_of_type_ComTencentMobileqqActivityAioAudiopanelPressToSpeakPanel, true, (QQRecorder.RecorderParam)localObject);
    PressToSpeakPanel.a(jdField_a_of_type_ComTencentMobileqqActivityAioAudiopanelPressToSpeakPanel).setBackgroundResource(2130842462);
    jdField_a_of_type_ComTencentMobileqqActivityAioAudiopanelPressToSpeakPanel.g();
    localObject = new Rect();
    jdField_a_of_type_ComTencentMobileqqActivityAioAudiopanelPressToSpeakPanel.getWindowVisibleDisplayFrame((Rect)localObject);
    Rect localRect = new Rect();
    PressToSpeakPanel.b(jdField_a_of_type_ComTencentMobileqqActivityAioAudiopanelPressToSpeakPanel).getGlobalVisibleRect(localRect);
    localRect = new Rect();
    jdField_a_of_type_ComTencentMobileqqActivityAioAudiopanelPressToSpeakPanel.a.getGlobalVisibleRect(localRect);
    int j = bottom;
    i = j;
    if (Build.MODEL.startsWith("Coolpad"))
    {
      i = j;
      if (VersionUtils.h()) {
        i = j - top;
      }
    }
    PressToSpeakPanel.a(jdField_a_of_type_ComTencentMobileqqActivityAioAudiopanelPressToSpeakPanel, AudioPanel.a(PressToSpeakPanel.a(jdField_a_of_type_ComTencentMobileqqActivityAioAudiopanelPressToSpeakPanel).a(), right, bottom, i, jdField_a_of_type_ComTencentMobileqqActivityAioAudiopanelPressToSpeakPanel, 0, 0, 0));
    PressToSpeakPanel.a(jdField_a_of_type_ComTencentMobileqqActivityAioAudiopanelPressToSpeakPanel, AudioPanel.a(PressToSpeakPanel.a(jdField_a_of_type_ComTencentMobileqqActivityAioAudiopanelPressToSpeakPanel).a(), PressToSpeakPanel.b(jdField_a_of_type_ComTencentMobileqqActivityAioAudiopanelPressToSpeakPanel), jdField_a_of_type_ComTencentMobileqqActivityAioAudiopanelPressToSpeakPanel.a));
  }
}
