import android.view.ViewGroup;
import com.tencent.mobileqq.activity.BaseChatPie;
import com.tencent.mobileqq.activity.aio.audiopanel.AudioPanel;
import com.tencent.mobileqq.activity.aio.audiopanel.ListenPanel;
import com.tencent.mobileqq.activity.aio.audiopanel.PressToSpeakPanel;
import com.tencent.mobileqq.hotpatch.NotVerifyClass;
import com.tencent.mobileqq.utils.QQRecorder.RecorderParam;

public class ktv
  implements Runnable
{
  public ktv(PressToSpeakPanel paramPressToSpeakPanel, String paramString, QQRecorder.RecorderParam paramRecorderParam)
  {
    boolean bool = NotVerifyClass.DO_VERIFY_CLASS;
  }
  
  public void run()
  {
    PressToSpeakPanel.a(jdField_a_of_type_ComTencentMobileqqActivityAioAudiopanelPressToSpeakPanel).a(jdField_a_of_type_JavaLangString, jdField_a_of_type_ComTencentMobileqqUtilsQQRecorder$RecorderParam);
    ListenPanel localListenPanel = (ListenPanel)PressToSpeakPanel.a(jdField_a_of_type_ComTencentMobileqqActivityAioAudiopanelPressToSpeakPanel).findViewById(2131299331);
    localListenPanel.setVisibility(0);
    localListenPanel.setAudioPath(jdField_a_of_type_JavaLangString, PressToSpeakPanel.a(jdField_a_of_type_ComTencentMobileqqActivityAioAudiopanelPressToSpeakPanel), jdField_a_of_type_ComTencentMobileqqUtilsQQRecorder$RecorderParam);
    localListenPanel.setJumpSource(ListenPanel.c);
    PressToSpeakPanel.a(jdField_a_of_type_ComTencentMobileqqActivityAioAudiopanelPressToSpeakPanel).setStatus(4);
    jdField_a_of_type_ComTencentMobileqqActivityAioAudiopanelPressToSpeakPanel.setVisibility(8);
  }
}
