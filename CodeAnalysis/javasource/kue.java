import android.widget.TextView;
import com.tencent.mobileqq.activity.aio.audiopanel.AudioPanel;
import com.tencent.mobileqq.activity.aio.audiopanel.PressToSpeakPanel;
import com.tencent.mobileqq.hotpatch.NotVerifyClass;

public class kue
  implements Runnable
{
  public kue(PressToSpeakPanel paramPressToSpeakPanel, int paramInt, double paramDouble)
  {
    boolean bool = NotVerifyClass.DO_VERIFY_CLASS;
  }
  
  public void run()
  {
    if (jdField_a_of_type_ComTencentMobileqqActivityAioAudiopanelPressToSpeakPanel.b())
    {
      int i = AudioPanel.a(jdField_a_of_type_Int);
      jdField_a_of_type_ComTencentMobileqqActivityAioAudiopanelPressToSpeakPanel.b(i);
    }
    if (PressToSpeakPanel.c(jdField_a_of_type_ComTencentMobileqqActivityAioAudiopanelPressToSpeakPanel) == 1)
    {
      PressToSpeakPanel.a(jdField_a_of_type_ComTencentMobileqqActivityAioAudiopanelPressToSpeakPanel).setText("松手试听");
      return;
    }
    if (PressToSpeakPanel.c(jdField_a_of_type_ComTencentMobileqqActivityAioAudiopanelPressToSpeakPanel) == 2)
    {
      PressToSpeakPanel.a(jdField_a_of_type_ComTencentMobileqqActivityAioAudiopanelPressToSpeakPanel).setText("松手取消发送");
      return;
    }
    PressToSpeakPanel.a(jdField_a_of_type_ComTencentMobileqqActivityAioAudiopanelPressToSpeakPanel).setText(AudioPanel.a(jdField_a_of_type_Double));
  }
}
