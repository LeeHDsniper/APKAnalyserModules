import android.widget.TextView;
import com.tencent.mobileqq.activity.aio.audiopanel.AudioPanel;
import com.tencent.mobileqq.activity.aio.audiopanel.PressToChangeVoicePanel;
import com.tencent.mobileqq.hotpatch.NotVerifyClass;

public class kti
  implements Runnable
{
  public kti(PressToChangeVoicePanel paramPressToChangeVoicePanel, int paramInt, double paramDouble)
  {
    boolean bool = NotVerifyClass.DO_VERIFY_CLASS;
  }
  
  public void run()
  {
    int i = AudioPanel.a(jdField_a_of_type_Int);
    jdField_a_of_type_ComTencentMobileqqActivityAioAudiopanelPressToChangeVoicePanel.b(i);
    PressToChangeVoicePanel.a(jdField_a_of_type_ComTencentMobileqqActivityAioAudiopanelPressToChangeVoicePanel).setText(AudioPanel.a(jdField_a_of_type_Double));
  }
}
