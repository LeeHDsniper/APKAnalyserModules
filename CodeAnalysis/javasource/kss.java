import android.widget.TextView;
import com.tencent.mobileqq.activity.aio.audiopanel.AudioPanel;
import com.tencent.mobileqq.activity.aio.audiopanel.CommonRecordSoundPanel;
import com.tencent.mobileqq.hotpatch.NotVerifyClass;

public class kss
  implements Runnable
{
  public kss(CommonRecordSoundPanel paramCommonRecordSoundPanel, int paramInt, double paramDouble)
  {
    boolean bool = NotVerifyClass.DO_VERIFY_CLASS;
  }
  
  public void run()
  {
    int i = AudioPanel.a(jdField_a_of_type_Int);
    jdField_a_of_type_ComTencentMobileqqActivityAioAudiopanelCommonRecordSoundPanel.c(i);
    CommonRecordSoundPanel.a(jdField_a_of_type_ComTencentMobileqqActivityAioAudiopanelCommonRecordSoundPanel).setText(AudioPanel.a(jdField_a_of_type_Double));
    jdField_a_of_type_ComTencentMobileqqActivityAioAudiopanelCommonRecordSoundPanel.jdField_a_of_type_Double = jdField_a_of_type_Double;
  }
}
