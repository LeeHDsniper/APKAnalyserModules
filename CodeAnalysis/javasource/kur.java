import android.view.ViewGroup;
import com.tencent.mobileqq.activity.BaseChatPie;
import com.tencent.mobileqq.activity.aio.audiopanel.AudioPanel;
import com.tencent.mobileqq.activity.aio.audiopanel.ListenPanel;
import com.tencent.mobileqq.activity.aio.audiopanel.RecordSoundPanel;
import com.tencent.mobileqq.hotpatch.NotVerifyClass;
import com.tencent.mobileqq.utils.QQRecorder.RecorderParam;

public class kur
  implements Runnable
{
  public kur(RecordSoundPanel paramRecordSoundPanel, String paramString, QQRecorder.RecorderParam paramRecorderParam)
  {
    boolean bool = NotVerifyClass.DO_VERIFY_CLASS;
  }
  
  public void run()
  {
    jdField_a_of_type_ComTencentMobileqqActivityAioAudiopanelRecordSoundPanel.jdField_a_of_type_ComTencentMobileqqActivityBaseChatPie.a(jdField_a_of_type_JavaLangString, jdField_a_of_type_ComTencentMobileqqUtilsQQRecorder$RecorderParam);
    ListenPanel localListenPanel = (ListenPanel)jdField_a_of_type_ComTencentMobileqqActivityAioAudiopanelRecordSoundPanel.f.findViewById(2131299331);
    localListenPanel.setVisibility(0);
    localListenPanel.setAudioPath(jdField_a_of_type_JavaLangString, jdField_a_of_type_ComTencentMobileqqActivityAioAudiopanelRecordSoundPanel.jdField_a_of_type_Double, jdField_a_of_type_ComTencentMobileqqUtilsQQRecorder$RecorderParam);
    localListenPanel.setJumpSource(ListenPanel.d);
    jdField_a_of_type_ComTencentMobileqqActivityAioAudiopanelRecordSoundPanel.jdField_a_of_type_ComTencentMobileqqActivityAioAudiopanelAudioPanel.setStatus(4);
    jdField_a_of_type_ComTencentMobileqqActivityAioAudiopanelRecordSoundPanel.setVisibility(8);
    jdField_a_of_type_ComTencentMobileqqActivityAioAudiopanelRecordSoundPanel.setClickable(true);
  }
}
