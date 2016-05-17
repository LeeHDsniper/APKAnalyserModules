import android.widget.TextView;
import com.tencent.mobileqq.activity.aio.audiopanel.AudioPanel;
import com.tencent.mobileqq.activity.aio.audiopanel.RecordSoundPanel;
import com.tencent.mobileqq.hotpatch.NotVerifyClass;

public class kun
  implements Runnable
{
  public kun(RecordSoundPanel paramRecordSoundPanel, int paramInt, double paramDouble)
  {
    boolean bool = NotVerifyClass.DO_VERIFY_CLASS;
  }
  
  public void run()
  {
    int i = AudioPanel.a(jdField_a_of_type_Int);
    jdField_a_of_type_ComTencentMobileqqActivityAioAudiopanelRecordSoundPanel.b(i);
    jdField_a_of_type_ComTencentMobileqqActivityAioAudiopanelRecordSoundPanel.b.setText(AudioPanel.a(jdField_a_of_type_Double));
  }
}
