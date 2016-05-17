import android.widget.ImageView;
import com.tencent.mobileqq.activity.aio.audiopanel.PressToChangeVoicePanel;
import com.tencent.mobileqq.hotpatch.NotVerifyClass;

public class ktk
  implements Runnable
{
  public ktk(PressToChangeVoicePanel paramPressToChangeVoicePanel)
  {
    boolean bool = NotVerifyClass.DO_VERIFY_CLASS;
  }
  
  public void run()
  {
    PressToChangeVoicePanel.a(a).sendAccessibilityEvent(128);
  }
}
